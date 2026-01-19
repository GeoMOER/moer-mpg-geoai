---
title: S | Four channels
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Streuobstwiesen"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---

This page is a supplementary material for those who are interested in exploring more.

Did you wonder, whether it is possible to train a model with all four channels? Well, it is possible! However, we need to make some adaptations to our codes. We will only show some hints here, since most of the codes stay the same.

1. It is recommended to change your rootDir, so that you do not overwrite the files with three channels.
2. There is, of course, no need anymore to subset to three channels.
3. The mask files stay the same, since you have the same extent.
4. In our function spectral_augmentation(), the function tf$image$random_saturation() only accepts three channels. This can be seen in the [Python TensorFlow reference](https://www.tensorflow.org/api_docs/python/tf/image/random_saturation). For simplicity, let us just remove random_saturation from our function.
5. In our function get_unet_128(), change the input_shape to c(128, 128, 4).

That is it! Happy coding :)

If this raised your interest, you may also have a look into [this thesis on GitHub](https://github.com/AlexCYD/multi-band-CNN-for-individual-tree-crown-delineation), which also started from modifying codes in this course and is able to train images with any number of channels.

## Comments?
You can leave comments under this Issue if you have questions or remarks about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 

<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_04_EX_Predicting_using_Unet"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
