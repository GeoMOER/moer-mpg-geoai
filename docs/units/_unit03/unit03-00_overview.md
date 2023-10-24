---
title: Overview
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Streuobstwiese"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---

Besides traditional machine learning methods like Random Forest, Convolutional Neural Networks (CNN) as part of Deep Learning are nowadays a default algorithm for many perceptual tasks like computer vision or speech recognition.
These CNNs are particularly suitable for such tasks because (spatial) patterns can be recognized at different hierachy levels. According to the properties of CNNs, they can also be adapted for the field of remote sensing.


<!--more-->

## Recap
The previous exercise gave you an initial impression of the different datasets that we will use for spatial predictions in R. You created your first simple random forest model that predicts the presence of buildings in Marburg. To build the model, you relied on classical methods of machine learning, such as k-fold cross-validation. In the second part, you performed improved upon the first spatial prediction by using advanced techniques, such as forward feature selection and leave-location-out cross-validation.

## This session
We will now delve a little deeper into the field of spatial prediction and use CNNs to still detect buildings in Marburg.
First, some concepts and ideas of CNN will be explained, whereby these theoretical basics only give a first outlook on the wide field of Deep Learning. Subsequently, you will be shown a relatively simple example 
how CNN can be built up and used in remote sensing. For this, it is necessary to perform a different form of data preparation, which is no longer based on a single data frame but on many smaller images of the remote sensing image.
Once the data preparation is done, the actual model training is shown in the second section. Lastly, two approaches are shown on how such a model can be evaluated and make spatial predictions.

## Learning objectives
At the end of this unit you should be able to

- understand the basic concept of Convolutional Neural Networks especially the U-Net architecture 
- prepare your data in R to use it for our modelling framework TensorFlow
- get your first U-Net up and running 
- use it to recognize some spatial structures

{% include video id="3WcUTMWa9fU" provider="youtube" %}