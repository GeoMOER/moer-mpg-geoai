--- 
title: EX | Install Tensorflow and keras for DL 
toc: true
header:
  image: /assets/images/01-splash.jpg
  image_description: "Dr. John Snow's map"
  caption: "Map: [**Dr. John Snow**](https://en.wikipedia.org/wiki/John_Snow) [Wellcome Library via wikimedia](https://w.wiki/QtV)"
---

Please note that while this course is primarily based on R, we also use the programming language Python to supplement R. This is primarily the case in Unit 3, which deals with Deep Learning (DL).

## Background information
* [TensorFlow](https://www.tensorflow.org/) is a Python package for creating machine learning models.
* [Keras](https://keras.io/) is a Python package that can help you more easily build models based on TensorFlow.
* [micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html) is a lightweight package manager that can isolate your developing environment and deal with package dependencies.
* [reticulate](https://rstudio.github.io/reticulate/) is a R package that allows you to use Python in R.
* [tensorflow](https://tensorflow.rstudio.com/reference/tensorflow/) is a R package that allows you to use TensorFlow in R.
* [keras](https://tensorflow.rstudio.com/reference/keras/) is a R package that allows you to use Keras in R.

## Installation
There are many ways to achieve this goal.
Some are fully automated, but may not always work.
Here we have a look under the hood what are actually done
and try with a lightweight solution.

### 1. micromamba
Please follow [this guide](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) to install micromamba on your system. If you don't know what to do, try with the "Automatic install" section.

Verify the installation in your command line.
```command-line
micromamba --version
```

If version number is returned, you've installed micromamba successfully.

### 2. Python, TensorFlow, and Keras
Read the requirements carefully in [this guide](https://www.tensorflow.org/install/pip). We only need the CPU-only build for the course, so you may want to just use tensorflow-cpu. We will use micromamba instead of Miniconda.

Create an environment with micromamba. You can replace my_env with any name you like.
```command-line
micromamba create --name my_env
```

Please take a note where your environment is located. You will need this later.

Activate the environment. Make sure it stays activated for the rest of the installation!
```command-line
micromamba activate my_env
```

Install TensorFlow. Python and Keras are also installed automatically in this step.
```command-line
micromamba install tensorflow-cpu --channel conda-forge
```

Also install additional dependencies.
```command-line
micromamba install tensorflow-hub tensorflow-datasets scipy requests Pillow h5py pandas pydot --channel conda-forge
```

Verify the installation.
```command-line
python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
```

If a tensor is returned, you've installed TensorFlow successfully.

### 3. (R), tensorflow, keras, and reticulate
If you also want to isolate your R as well,
you can install R and all R packages in the same environment.
Note that if you use RStudio, you may need to tell RStudio where to find this R.

This will install R, tensorflow, keras, and reticulate.
```command-line
micromamba install r-keras --channel conda-forge
```

Otherwise, you may must want to use the R you installed before. In R:
```r
install.packages("keras")
```

## 4. Tell R where to find Python
The communication goes through reticulate.
However, there seems to be some issues unsolved.
Here is a workaround found in [this issue comment](https://github.com/rstudio/reticulate/issues/1460#issuecomment-1803762448)

```r
assignInNamespace("is_conda_python", function(x){ return(FALSE) }, ns="reticulate")
reticulate::use_python("/home/alex/micromamba/envs/my_env/bin/python")
```
You would need to execute the above two lines every time you want to use
this Python environment with your R.

Verify the installation.
```r
tensorflow::tf$constant("Hello TensorFlow!")
```

If a tensor is returned: Congratulations! You did it!

## Comments?
You can leave comments under this gist if you have questions or comments about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2022_keras"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
