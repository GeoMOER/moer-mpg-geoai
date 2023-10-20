---
title: EX | Spatial prediction
toc: true
header:
  image: /assets/images/unit03/streuobst.jpg
  image_description: "Apples under tree"
  caption: "Image: manfredrichter via [pixabay.com](https://pixabay.com/de/photos/%C3%A4pfel-streuobst-obstbaum-apfelbaum-3684775/)"
 
---

In this exercise, we will predict buildings in the southern part of Marburg once again. 
This time, however, it will be a spatial prediction done better -- which is to say that the results will be less spatially autocorrelated and much more robust! You can use the same dataset that we prepared and balanced in the previous exercise. 

You can import your extracted data in the same manner as before. In this case, we also need to define the column that contains information about which row belongs to which polygon (Polygon ID).

```r
training =  readRDS(file.path(envrmt$path_model_training_data, "extr_train.RDS")) 


# random forest
predictors = training[,3:9]
response = training[,"class"]
```

## Leave-Location-Out Cross-Validation
Use a Leave-Location-Out Cross-Validation as a spatial cross-validation technique. 
For this purpose, the function `CreateSpacetimeFolds` separates the pixels of every polygon into folds, based on their ID.

```r
# leave location out cross-validation
indices <- CreateSpacetimeFolds(training, 
                                spacevar = "OBJ_ID", 
                                k=10, 
                                class = "class")
```

The folds are then passed to the `trainControl` function as an index.

```r
set.seed(10)
ctrl <- trainControl(method="cv",
                     index = indices$index,
                     savePredictions=TRUE,
                     allowParallel = TRUE)
```


## Forward-Feature-Selection

Instead of using the `train` function from the `caret` package, we now use the function `ffs` from the [CAST package](https://cran.r-project.org/web/packages/CAST/index.html). 
We do not apply any model tuning, but you should expect that the prediction will take a long time to compute, since the many predictor variables all have to be trained with each other. 
Depending on the size of your training data, the calculations might take a few days.

You should also be aware that variable selection only makes sense if you have a decent number of variables to choose from. For a raster stack with only three layers, selection is not reasonable, but for one with 300 it is. The spatial variable selection with the FFS only works if it is executed with a spatial validation strategy!
```r
#Forward-Feature-Selection (FFS)
#no model tuning
tgrid <- expand.grid(mtry = 2,
                     splitrule = "gini",
                     min.node.size = 1)

#run ffs model with Leave-Location-out CV
#set.seed(10)

ffsmodel <- ffs(predictors,
                response,
                method = "ranger",
                trControl =ctrl,
                tuneGrid = tgrid,
                num.trees = 100,
                importance = "permutation")

ffsmodel
saveRDS(file.path(envrmt$path_models), "ffsmodel.RDS")
```


## Comments?
You can leave comments under this Issue if you have questions or remarks about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 

<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_03_EX_Spatial_prediction"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
