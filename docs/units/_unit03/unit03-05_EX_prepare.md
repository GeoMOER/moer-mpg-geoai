---
title: EX | Prepare your data
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Excerpt of predicted tree species groups in Rhineland-Palatinate"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---

In this exercise we will split our image and mask files into a training, a validation and a test dataset. The training dataset will be artificially enhanced by data augmentation.

<!--more-->

## Breaking down the data set
We will now split the data into two parts. To do this, we will again place the file paths to the images and their corresponding masks in a data.frame() and then use 80% of it for the training set, 20% to validate it.
```r
# list the files again
files <- data.frame(
   img = list.files(
      envrmt$path_model_training_data_dop,
      full.names = TRUE,
      pattern = "*.png"
   ),
   mask = list.files(
      envrmt$path_model_training_data_bui,
      full.names = TRUE,
      pattern = "*.png"
   )
)

# split randomly into training and validation (not testing!!) data sets
set.seed(7)
data <- initial_split(files, prop = 0.8)
```

## Data augmentation

Data augmentation is applied to the two datasets that are intended for training.
Data augmentation is a technique that allows to increase the number of training data in small datasets by changing the existing data, e.g. by rotating the input images, thus creating additional artificial training data that can also prevent overfitting of deep learning models [(Shorten & Khoshgoftaar)]( https://journalofbigdata.springeropen.com/track/pdf/10.1186/s40537-019-0197-0.pdf).

 Here we will use the function below to create some additional training data. It prepares the images for the U-Net and performs a total of three different data augmentations: 

**augmentation 1:**
The image as well as the mask will be rotated to the left and to the right

**augmentation 2:**
The image and the mask are rotated up and down

**augmentation 3:**
The image is rotated left and right and up and down. 

A spectral augmentation is also performed on the image at each step, randomly changing saturation, brightness and contrast. 



![image](../assets/images/unit04/augmentation.png)
Image: Data augmentation: Below are the original images and above after data augmentation (Hessische Verwaltung für Bodenmanagement und Geoinformation)


```r
# function to prepare your data set for all further processes
prepare_ds <-
   function(files = NULL,
            train,
            predict = FALSE,
            subsets_path = NULL,
            model_input_shape = c(256, 256),
            batch_size = batch_size,
            visual = FALSE) {
      if (!predict) {
         # function for random change of saturation,brightness and hue,
         # will be used as part of the augmentation
         
         spectral_augmentation <- function(img) {
            img <- tf$image$random_brightness(img, max_delta = 0.1)
            img <-
               tf$image$random_contrast(img, lower = 0.9, upper = 1.1)
            img <-
               tf$image$random_saturation(img, lower = 0.9, upper = 1.1)
            # make sure we still are between 0 and 1
            img <- tf$clip_by_value(img, 0, 1)
         }
         
         
         # create a tf_dataset from the input data.frame
         # right now still containing only paths to images
         dataset <- tensor_slices_dataset(files)
         
         # use dataset_map to apply function on each record of the dataset
         # (each record being a list with two items: img and mask), the
         # function is list_modify, which modifies the list items
         # 'img' and 'mask' by using the results of applying decode_png on the img and the mask
         # -> i.e. pngs are loaded and placed where the paths to the files were (for each record in dataset)
         dataset <-
            dataset_map(dataset, function(.x)
               list_modify(
                  .x,
                  img = tf$image$decode_png(tf$io$read_file(.x$img)),
                  mask = tf$image$decode_png(tf$io$read_file(.x$mask))
               ))
         
         # convert to float32:
         # for each record in dataset, both its list items are modified
         # by the result of applying convert_image_dtype to them
         dataset <-
            dataset_map(dataset, function(.x)
               list_modify(
                  .x,
                  img = tf$image$convert_image_dtype(.x$img, dtype = tf$float32),
                  mask = tf$image$convert_image_dtype(.x$mask, dtype = tf$float32)
               ))
         
         
         # data augmentation performed on training set only
         if (train) {
            # augmentation 1: flip left right, including random change of
            # saturation, brightness and contrast
            
            # for each record in dataset, only the img item is modified by the result
            # of applying spectral_augmentation to it
            augmentation <-
               dataset_map(dataset, function(.x)
                  list_modify(.x, img = spectral_augmentation(.x$img)))
            
            #...as opposed to this, flipping is applied to img and mask of each record
            augmentation <-
               dataset_map(augmentation, function(.x)
                  list_modify(
                     .x,
                     img = tf$image$flip_left_right(.x$img),
                     mask = tf$image$flip_left_right(.x$mask)
                  ))
            
            dataset_augmented <-
               dataset_concatenate(augmentation, dataset)
            
            # augmentation 2: flip up down,
            # including random change of saturation, brightness and contrast
            augmentation <-
               dataset_map(dataset, function(.x)
                  list_modify(.x, img = spectral_augmentation(.x$img)))
            
            augmentation <-
               dataset_map(augmentation, function(.x)
                  list_modify(
                     .x,
                     img = tf$image$flip_up_down(.x$img),
                     mask = tf$image$flip_up_down(.x$mask)
                  ))
            
            dataset_augmented <-
               dataset_concatenate(augmentation, dataset_augmented)
            
            # augmentation 3: flip left right AND up down,
            # including random change of saturation, brightness and contrast
            
            augmentation <-
               dataset_map(dataset, function(.x)
                  list_modify(.x, img = spectral_augmentation(.x$img)))
            
            augmentation <-
               dataset_map(augmentation, function(.x)
                  list_modify(
                     .x,
                     img = tf$image$flip_left_right(.x$img),
                     mask = tf$image$flip_left_right(.x$mask)
                  ))
            
            augmentation <-
               dataset_map(augmentation, function(.x)
                  list_modify(
                     .x,
                     img = tf$image$flip_up_down(.x$img),
                     mask = tf$image$flip_up_down(.x$mask)
                  ))
            
            dataset_augmented <-
               dataset_concatenate(augmentation, dataset_augmented)
            
         }
         
         # shuffling on training set only
         # unsauber
         if (!visual) {
            if (train) {
               dataset <-
                  dataset_shuffle(dataset_augmented, buffer_size = batch_size * 256)
            }
            
            # train in batches; batch size might need to be adapted depending on
            # available memory
            dataset <- dataset_batch(dataset, batch_size)
         }
         if (visual) {
            dataset <- dataset_augmented
         }
         
         # output needs to be unnamed
         dataset <-  dataset_map(dataset, unname)
         
      } else{
         # make sure subsets are read in in correct order
         # so that they can later be reassembled correctly
         # needs files to be named accordingly (only number)
         o <-
            order(as.numeric(tools::file_path_sans_ext(basename(
               list.files(subsets_path)
            ))))
         subset_list <- list.files(subsets_path, full.names = T)[o]
         
         dataset <- tensor_slices_dataset(subset_list)
         
         dataset <-
            dataset_map(dataset, function(.x)
               tf$image$decode_png(tf$io$read_file(.x)))
         
         dataset <-
            dataset_map(dataset, function(.x)
               tf$image$convert_image_dtype(.x, dtype = tf$float32))
         
         dataset <- dataset_batch(dataset, batch_size)
         dataset <-  dataset_map(dataset, unname)
         
      }
      
   }
```


## Prepare data for training

We will now apply the function for preparing the datasets to the training and validation data. The parameter train is always set to FALSE except for the training data, since the data augmentation is only performed there. You can also already prepare the testing data, but it is not necessary at this point.

```r
# one more parameter
batch_size = 8

# prepare data for training
training_dataset <-
   prepare_ds(
      training(data),
      train = TRUE,
      predict = FALSE,
      model_input_shape = model_input_shape,
      batch_size = batch_size
   )

# also prepare validation data

validation_dataset <-
   prepare_ds(
      testing(data),
      train = FALSE,
      predict = FALSE,
      model_input_shape = model_input_shape,
      batch_size = batch_size
   )
```

Now your data is prepared as a python iterator for TensorFlow it is a little bit difficult to visualize our preparation again.

```r 
# we first get a all our training data 
it <- as_iterator(training_dataset)
it <- iterate(it)
# head(it)

# we convert our data to an array and also subset our iterator e.g. 
# with the 4th batch ([[4]]) of the images ([[1]])
im <-as.array(it[[4]][[1]])
# then we subset just take the first image out of our batch
im <- im[1,,,]
# and plot it
plot(as.raster(im))

# and for the according mask it is almost the same
ma <-as.array(it[[4]][[2]])
ma <- ma[1,,,]
plot(as.raster(ma))
```





## Comments?
You can leave comments under this Issue if you have questions or remarks about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 


<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_04_EX_Prepare_your_data"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>

   
