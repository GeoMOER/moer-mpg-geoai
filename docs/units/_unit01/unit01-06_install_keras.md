--- 
title: EX | Install Tensorflow and keras for DL 
toc: true
header:
  image: /assets/images/01-splash.jpg
  image_description: "Dr. John Snow's map"
  caption: "Map: [**Dr. John Snow**](https://en.wikipedia.org/wiki/John_Snow) [Wellcome Library via wikimedia](https://w.wiki/QtV)"
---

Please note that while this course is primarily based on R, we also use the programming language Python to supplement R. This is primarily the case in [Unit 3](https://geomoer.github.io/moer-mpg-geoai//unit03/unit03-00_overview.html), which deals with Deep Learning (DL). 

Deep Learning involves building and training complex neural networks, which require powerful tools and libraries for efficient computation. Although R has strong capabilities for statistical computing and data analysis, the Python ecosystem offers advanced and highly-optimized libraries for deep learning. 

By combining R and Python, this course allows you to work in a familiar R environment while taking advantage of Python’s strengths for deep learning tasks. However, it can be a bit tricky to get all the different Python and R software packages to work together.

## What dependencies do we need?
* [TensorFlow](https://www.tensorflow.org/) (Python Package): TensorFlow is one of the most popular frameworks for machine learning and deep learning. It allows you to build and train neural networks efficiently.
* [Keras](https://keras.io/) (Python Package): Keras is a high-level API built on top of TensorFlow, making it easier to design, configure, and train deep learning models. TensorFlow is powerful but can be complex to use directly. Keras simplifies the process by providing intuitive commands for creating layers and configuring models.
* [micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html) When working with both R and Python, managing different software versions and dependencies can be challenging. Micromamba is a lightweight tool that helps you manage your Python environment. It ensures that you can install and run specific versions of Python packages, without conflicts, in isolated environments. This makes your development environment more stable and prevents errors caused by mismatched package versions.
* [reticulate](https://rstudio.github.io/reticulate/) (R Package): Reticulate bridges the gap between R and Python. It allows you to run Python code directly from R, so you can take advantage of Python’s deep learning libraries (like TensorFlow and Keras) without leaving the R environment. This seamless
* [tensorflow](https://tensorflow.rstudio.com/reference/tensorflow/) (R Package): This package is an R interface for TensorFlow, allowing you to use TensorFlow’s deep learning functionalities from within R. While TensorFlow is natively a Python library, this package makes it possible to build and train models in R by calling TensorFlow functions.
* [keras](https://tensorflow.rstudio.com/reference/keras/) (R Package): Similar to the R interface for TensorFlow, this package lets you use Keras from within R.

## Install the needed packages and dependencies
There are multiple ways to set up these tools for this course. Some installation methods are fully automated, but they may not always work perfectly across different systems due to variations in configurations.
Here, we will guide you through a *lightweight installation process*. We will use micromamba for managing dependencies in an isolated environment, and the reticulate package to bridge R with Python, ensuring both programming languages work together seamlessly for deep learning tasks:

### 1. micromamba
Please follow [this guide](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) to install micromamba on your system. If you don't know what to do, try with the "Automatic install" section.

Verify the installation in your command line.
```
micromamba --version
```

If version number is returned, you've installed micromamba successfully.

{% capture Assignment-1-1 %}

If you are having trouble installing micromamba on Windows you can try to:
- restart your shell as admin and/or restart your PC
- then run: 

```
micromamba shell init
```

{% endcapture %}
<div class="notice--success">
  {{ Assignment-1-1 | markdownify }}
</div> 


 



### 2. Python, TensorFlow, and Keras
With the following introduction we will set up **Python, TensorFlow, and Keras** using the micromamba environment. We will use micromamba instead of Miniconda because it's lightweight and much faster.

#### Create an environment with micromamba
First, create an isolated environment using micromamba. You can name this environment whatever you like by replacing my_env with your preferred name.
```
micromamba create --name my_env
```



Take note of where your environment is located, as you will need this path later during configuration. 
{: .notice--info}

#### Activate the environment
 Once your environment is created, activate it. Make sure this environment stays activated throughout the rest of the installation process.

```
micromamba activate my_env
```

#### Install TensorFlow
Now, install TensorFlow. This step will also automatically install Python and Keras, as they are required dependencies for TensorFlow. 

```
micromamba install tensorflow --channel conda-forge
```


#### Install additional dependencies
Besides TensorFlow, there are other libraries that provide essential functionalities for deep learning tasks. Install them as follows:

```
micromamba install tensorflow-hub tensorflow-datasets scipy requests Pillow h5py pandas pydot --channel conda-forge
```

#### Verify the installation.
Once everything is installed, you should verify that TensorFlow is working properly. Run the following command to ensure TensorFlow is functioning as expected:

```
python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
```

If a tensor is returned, you've installed TensorFlow successfully.

<!--
To set up Python, TensorFlow, and Keras read [this guide](https://www.tensorflow.org/install/pip) first. 
-->

### 3. R packages tensorflow, keras, and reticulate
If you also want to isolate your R as well,
you can install R and all R packages in the same environment.
Note that if you use RStudio, you may need to tell RStudio where to find this R.

This will install R, tensorflow, keras, and reticulate.
```
micromamba install r-keras --channel conda-forge
```

Now you can deactivate the environment and close the command line tool.

```
micromamba deactivate
```

Otherwise, you may just want to use the R you installed before. In R, this will install tensorflow, keras, and reticulate:
```r
install.packages("keras")
```

### 4. Tell R where to find Python
n R, communication with Python is handled by the reticulate package. Reticulate allows R to call Python functions.
<!--
The communication goes through reticulate.
However, there seems to be some issues unsolved.
Here is a workaround found in [this issue comment](https://github.com/rstudio/reticulate/issues/1460#issuecomment-1803762448).
-->

Now, specify the path to the Python interpreter within your micromamba environment. Be sure to replace the placeholder with the exact path to your Python environment that you noted earlier.
```r
assignInNamespace("is_conda_python", function(x){ return(FALSE) }, ns="reticulate")
reticulate::use_python("~/micromamba/envs/my_env/bin/python")
```
You will need to run these two lines of code every time you want to use this Python environment within R. Consider adding them to your script or session setup.

Verify the installation. To ensure everything is set up correctly, test the TensorFlow installation in R by running:
```r
tensorflow::tf$constant("Hello TensorFlow!")
```

If a tensor is returned: Congratulations! You did it!

## Comments?
You can leave comments if you have questions or comments about any of the code chunks. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2022_keras"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
