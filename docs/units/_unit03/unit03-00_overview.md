---
title: Overview
toc: true
header:
  image: /assets/images/unit03/streuobst.jpg
  image_description: "Fallen apples under a tree"
  caption: "Image: manfredrichter via [pixabay.com](https://pixabay.com/de/photos/%C3%A4pfel-streuobst-obstbaum-apfelbaum-3684775/)"
 
---

Machine learning algorithms, such as random forest, can be trained to find patterns in empirical data that are invisible to humans. Better yet, as long as the training data is representative, these patterns can be used to predict for spaces for which no data is present, which is the goal of this course. But being randomly correct is not the same as a prediction.

<!--more-->

## Recap
In the last unit, you became familiar with optical remote sensing systems and the characteristics that affect how satellite (or other airborne) sensors capture information about the real world and represent it digitally. We also investigated cases in which it is appropriate to pair remote sensing imagery with the naked eye, physical models and AI to answer questions about the environment.

## This session
In this unit, we will use remote sensing data as the basis for making spatial predictions. First, we will familiarize ourselves with random forest models and a simple cross-validation procedure for evaluating our models. Then we will use a simple application example to familiarize ourselves with the methods. In the second part of this unit, we will adapt the modeling and validation procedures in a way that explicitly addresses the spatial nature of the data. Here, we will use novel geoscience methods to select variables and cross-validate models in a spatial manner. The goal is to understand the methods in the example and then be able to apply them to other data on your own.

## Learning objectives
At the end of this unit you should be able to

* prepare your data for machine learning,
* use simple example data to train a random forest model with random cross-validation, 
* understand the concept of a forward feature selection (FFS) and leave-location-out (LLO) cross-validation, and
* adapt your model by performing FFS and LLO cross-validation to make your modeling workflow spatially robust.


{% include video id="B6Yn-U1Ff60" provider="youtube" %}
