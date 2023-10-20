---
title: EX | Predicting using U-Net
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Streuobstwiesen"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---

Now that we have the prepared data, we can make a prediction on each of the individual prepared images and then reassemble them to a prediction map. Therefore we firstly need a function to rebuilding our images.

```r
# function to rebuild your image
rebuild_img <-
   function(pred_subsets,
            out_path,
            target_rst,
            model_name) {
      subset_pixels_x <- ncol(pred_subsets[1, , , ])
      subset_pixels_y <- nrow(pred_subsets[1, , , ])
      tiles_rows <- nrow(target_rst) / subset_pixels_y
      tiles_cols <- ncol(target_rst) / subset_pixels_x
      
      # load target image to determine dimensions
      target_stars <- st_as_stars(target_rst, proxy = F)
      #prepare subfolder for output
      result_folder <- paste0(out_path, model_name)
      if (dir.exists(result_folder)) {
         unlink(result_folder, recursive = T)
      }
      dir.create(path = result_folder)
      
      # for each tile, create a stars from corresponding predictions,
      # assign dimensions using original/target image, and save as tif:
      for (crow in 1:tiles_rows) {
         for (ccol in 1:tiles_cols) {
            i <- (crow - 1) * tiles_cols + (ccol - 1) + 1
            
            dimx <-
               c(((ccol - 1) * subset_pixels_x + 1), (ccol * subset_pixels_x))
            dimy <-
               c(((crow - 1) * subset_pixels_y + 1), (crow * subset_pixels_y))
            cstars <- st_as_stars(t(pred_subsets[i, , , 1]))
            attr(cstars, "dimensions")[[2]]$delta = -1
            #set dimensions using original raster
            st_dimensions(cstars) <-
               st_dimensions(target_stars[, dimx[1]:dimx[2], dimy[1]:dimy[2]])[1:2]
            
            write_stars(cstars, dsn = paste0(result_folder, "/_out_", i, ".tif"))
         }
      }
      
      starstiles <-
         as.vector(list.files(result_folder, full.names = T), mode = "character")
      sf::gdal_utils(
         util = "buildvrt",
         source = starstiles,
         destination = paste0(result_folder, "/mosaic.vrt")
      )
      
      sf::gdal_utils(
         util = "warp",
         source = paste0(result_folder, "/mosaic.vrt"),
         destination = paste0(result_folder, "/mosaic.tif")
      )
   }


```
Now we can load the target raster and predict:

```r

target_rst <- rast(file.path(envrmt$path_model_testing_data, "marburg_mask_test_target.tif"))

# make the actual prediction
pred_subsets <- predict(object = unet_model, x = prediction_dataset)

 
```
The corresponding prediction map can be found within the folder below (with the name mosaic.tif) and might look something like the map below.

```r
# name your output path
model_name <- "unet_abc"

# rebuild .tif from each patch
rebuild_img(
   pred_subsets = pred_subsets,
   out_path = envrmt$path_prediction,
   target_rst = target_rst,
   model_name = model_name
)

```
{% include media4 url="assets/images/unit04/marburg_prediction_unet.html" %} [Full screen version of the map]({{ site.baseurl }}assets/images/unit04/marburg_prediction_unet.html){:target="_blank"}

## Comments?
You can leave comments under this Issue if you have questions or remarks about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 
 

<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_04_EX_Predicting_using_Unet"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
