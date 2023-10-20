---
title: LM | Randomly good
toc: true
header:
  image: /assets/images/unit03/streuobst.jpg
  image_description: "Apples under tree"
  caption: "Image: manfredrichter via [pixabay.com](https://pixabay.com/de/photos/%C3%A4pfel-streuobst-obstbaum-apfelbaum-3684775/)"
 
---

In this lesson, we will predict spatial features with machine learning techniques and use random validation methods. Don't let the name fool you: The method is not randomly selected, rather the method uses randomized subsamples to cross-validate the accuracy of the machine learning technique. Our goal is to determine the presence or absence of buildings in the southern part of Marburg, Hesse. To accomplish this, we will use a machine learning approach together with a few data sources -- digital orthophotos (DOPs) as well as the digitized polygons that we created in Unit 1 (one class for buildings and another class for everything else).

<!--more-->

We want to create a model that can distinguish between pixels from a building and those that belong to their surroundings. To do this we need the bands of the DOP as well as several indices that are calculated based on them. You can simply use the ones we created in [Unit 1](http://127.0.0.1:4000/geoAI//unit01/unit01-05_warm-up-r-spatial.html#step-4---calculate-rgb-indices). 

Our area of interest (AOI):
{% include media4 url="assets/images/unit03/marburg_dop.html" %} [Full screen version of the map]({{ site.baseurl }}assets/images/unit03/marburg_dop.html){:target="_blank"}


## Random forest -- the basics
To accomplish this task, we will use a [random forest](https://en.wikipedia.org/wiki/Random_forest) machine learning approach. Random forests can be used for both regression or classification tasks, the latter of which is particularly relevant in environmental remote sensing. As is the case with every machine learning method, the random forest model learns to recognize patterns and structures in the data on its own.

<p align="center">
  <img src = "../assets/images/unit03/Random_forest_diagram_complete.png">
</p>
*Image: Simplification of how random forest classifies data during training. Venkata Jagannath [CC BY-SA 4.0] via [wikipedia.org](https://commons.wikimedia.org/wiki/File:Random_forest_diagram_complete.png)*

The random forest algorithm learns about the data by building many decision trees -- hence, the name "forest". For classification tasks, the algorithm takes an instance from the training dataset and each tree (again, there are many) classifies that instance into a class, as in the above diagram. Ultimately, the instance is assigned to the class that is the outcome of the most trees. Of course, this is an oversimplified description of how it really works. If you are interested in the theory and math behind how the algorithm truly works, please see the paper by Breiman (linked below).

Since the random forest algorithm requires training data, it is a supervised learning method. This means that we, as users, must tell the algorithm what it is supposed to predict. In our case, in order for the algorithm to classify building pixels correctly, the training data must include and be labeled with different categories or land cover classifications (i.e., field, building, forest, water).

<p align="center">
  <img src="../assets/images/unit03/machine_learning.jpg">
</p>
*Image: Machine Learning. Chitra Sancheti [CC BY-SA 4.0] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Artificial_Intelligence_in_E-Commerce.jpg)*


We also need a validation strategy that tells us how well the model performs. We will use one of the most popular methods for validating model quality: cross-validation. The goal is to test how well the model generalizes on an independent dataset. For example, if we perform a 5-fold cross-validation, the entire dataset available to the model is split five times (randomly) into a training and a validation dataset. Then the model is trained five times with each training dataset and its quality is determined with the randomly selected validation dataset.



{% include figure image_path="/assets/images/unit03/cross_validation.svg" alt="Leave-Location-Out Cross-validation" %}
*Image: Random cross-validation. Gufosowa [CC BY-SA 4.0] via [wikipedia.org](https://en.wikipedia.org/wiki/Cross-validation_(statistics)#/media/File:K-fold_cross_validation_EN.svg)*

{% include video id="Yh9KGcxT_O4" provider="youtube" %}

## Unit 3 slides
{% include pdf pdf="GeoAI-Unit03.pdf" %}

## Additional resources
Breiman, Leo (2001). "Random Forests". Machine Learning. 45 (1): 5-32. [https://doi.org/10.1023/A:1010933404324](https://doi.org/10.1023/A:1010933404324).

### Machine learning
Here are several videos that introduce the enormous field of machine learning, in general, as well as the specific algorithm that we will use in this course, random forest. In addition to these videos, we encourage you to do your own research, as there are many great tutorials on the Internet for all types of learners.


A Gentle Introduction to Machine Learning (12:44):
{% include video id="Gv9_4yMHFhI" provider="youtube" %}
Decision Trees (17:21):
{% include video id="7VeUPuFGJHk" provider="youtube" %}
Decision Trees Part 2 - Feature Selection and Missing Data (5:15):
{% include video id="wpNl-JwwplA" provider="youtube" %}
Random Forests Part 1 - Building, Using and Evaluating (9:53):
{% include video id="J4Wdy0Wc_xQ" provider="youtube" %}
Random Forests Part 2 - Missing data and clustering (11:52):
{% include video id="sQ870aTKqiM" provider="youtube" %}
Random Forests in R (15:09):
{% include video id="6EXPYzbfLCE" provider="youtube" %}
Machine Learning Fundamentals - Cross Validation (6:04):
{% include video id="fSytzGwwBVw" provider="youtube" %}
