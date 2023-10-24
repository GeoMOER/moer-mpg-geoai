--- 
title: EX | Setting up the course environment 
toc: true
header:
  image: /assets/images/01-splash.jpg
  image_description: "Dr. John Snow's map"
  caption: "Map: [**Dr. John Snow**](https://en.wikipedia.org/wiki/John_Snow) [Wellcome Library via wikimedia](https://w.wiki/QtV)"
---

To set up a working or project environment, (normally) the first steps are defining different folder paths and loading the necessary R packages as well as additional functions.

<!--more-->

If you also need to access additional software, like GIS, the appropriate binaries and software environments must be linked, too. Factoring in the major operating systems and the potentially multiple versions of software installed on a single system results in almost unlimited combinations of set ups.

## Flexible but reproducible setup

We value freedom of choice as an important good. But given our long-term experience as instructors of similar courses, there is **no freedom of choice** when it comes to the mandatory working environment for this course. The reason for this is simple: Assignments and chunks of code written on person A's laptop should run on person B's computer without requiring any changes. The greater the number of systems that should be able to run the code, the nastier this potential situation can become. So, let's save everyone's time and focus on the things that are really important. Once the course is finished, feel free to use any working environment structure you like.

## R project frameworks
Setting up a working or project environment requires us to define different folder paths and load necessary R packages and additional functions. If, in addition, external APIs (application programming interface) are to be integrated stably and without great effort, the associated paths and environment variables must also be defined correctly. 

There are several R packages, such as e.g. [tinyProject](https://github.com/FrancoisGuillem/tinyProject){:target="_blank"},  [workflowR](https://jdblischak.github.io/workflowr/){:target="_blank"} or [usethis](https://usethis.r-lib.org/){:target="_blank"}, that provide a wide range of functions for such issues. For this introduction to a structured organization of R-based development projects, we suggest a slimmed down version. 

## Introduction of the `envimaR` helper package 
It would be convenient if the *mandantory* folders were created and initialized automatically. For the needs of this course, we have written a small project management package called `envimaR` that takes care of these tasks. It is located on `github` and can be installed as follows.

```r
devtools::install_github("envima/envimaR")
```

Essentially, a project may be split at least in three categories of tasks:

- data 
- scripts
- documentation

The basis of the aforementioned categories is an adequate storage structure on a suitable permanent storage medium (hard disk, USB stick, cloud, etc.). We suggest a meaningful hierarchical directory structure. The root folder of a project is the basis of an organizational structure branched below.


First, I want to find out which folder structure can be used sensibly on my system. Using the so-called `H:` drive on the PCs in the university's computer labs is extremely problematic in this case due to the underlying `dfs//` network assignment. It should therefore be avoided. For an automatic query about which computer I am currently working on (and therefore which root directory I want to use), use the function `envimaR::alternativeEnvi`. 

```r
require(envimaR)
# define a project rootfolder
rootDir = "~/edu/geoAI"  # This is the mandantory rootfolder of the whole project 


              
# call the create function
envimaR::alternativeEnvi(root_folder = rootDir,       # if it exists this is the root dir 
                         alt_env_id = "COMPUTERNAME", # check the environment varialbe "COMPUTERNAME"
                         alt_env_value = "PCRZP",     # if it contains the string "PCRZP" (e.g. PUM-Pool-PC)
                         alt_env_root_folder = "F:/BEN/edu")  # use the alternative rootfolder
```

Provided that I want to create a project with the mandantory folder structure defined above, check the PC that I am working on, load all packages that I need and store all of the environment variables in a list for later use, I may use the `createEnvi` function. To do so, I first have to define a list of all packages that I want to load. 

```r
# list of packages to load
packagesToLoad = c("mapview", "raster", "rgdal", "sf", "keras", "reticulate")

# mandantory folder structure
projectDirList   = c("data/",               # data folders the following are obligatory but you may add more
                     "run/",                # folder for runtime data storage
                     "src/",                # source code
                     "tmp",                 # all temp stuff
                     "doc/")                # documentation  and markdown
					 
					 
# Automatically set root direcory, folder structure and load libraries
envrmt = envimaR::createEnvi(root_folder = rootDir,
                             folders = projectDirList,
                             path_prefix = "path_",        # prefix to all path variables that are created 
                             libs = packagesToLoad,        # list of R packages to be loaded
                             alt_env_id = "COMPUTERNAME",  # check the environment variable "COMPUTERNAME"
                             alt_env_value = "PCRZP", # check if it contains the string "PCRZP" (e.g. local PC pools)
                             alt_env_root_folder = "F:/BEN/edu") # use the alternative root folder
                         

```

I will receive something like the following messages. Note, even if they are red, they are not (always) error messages...


```bash
Loading required package: lidR
Loading required package: raster
Loading required package: sp
lidR 2.1.2 using 2 threads. Help on <gis.stackexchange.com>. Bug report on <github.com/Jean-Romain/lidR>.
Loading required package: link2GI
Loading required package: mapview
Loading required package: rgdal
rgdal: version: 1.4-7, (SVN revision 845)
 Geospatial Data Abstraction Library extensions to R successfully loaded
 Loaded GDAL runtime: GDAL 3.0.1, released 2019/06/28
 Path to GDAL shared files: 
 GDAL binary built with GEOS: TRUE 
 Loaded PROJ.4 runtime: Rel. 6.2.0, September 1st, 2019, [PJ_VERSION: 620]
 Path to PROJ.4 shared files: (autodetected)
 Linking to sp version: 1.3-1 
Loading required package: rlas
Loading required package: uavRst
```

## Wrap it up in a setup script

Finally, we should initiate some useful settings. It makes sense to have the current Github versions of the non-CRAN packages installed on our systems and to set an option for temporary actions in the `raster` package.


If we put everything together in one script, it looks like this:

<script src="https://gist.github.com/uilehre/42f8869864340e72e591dd6280ad54fc.js"></script>

Note that installing the listed packages for the first time needs some time for execution.
If you encounter errors during this installation process, try to install the packages separately for making troubleshooting more convenient.
{: .notice--info}

Please *check* the result by navigating to the directory using your favorite file manger. In addition please check the returned `envrmt` list. It contains all of the paths as character strings in a convenient list structure.

```r
str(envrmt)
```

Again - For the course it is **mandantory** to save this script in the `src` folder named `geoAI_setup.R` and **source it at the beginning** of each project start or at the start of an analysis or data processing script that is connected with this project. 
{: .notice--danger}

The easiest way to do this is to use the following template for creating each new script.


<script src="https://gist.github.com/uilehre/f9b367ec483e78a2c8a8d03bb9f0729d.js"></script>

Thus, the provided script:

- creates/initializes the mandatory basic folder structure 
- creates a list variable containing all paths as shortcuts  
- installs and initializes all packages and settings for the project


## Comments?
You can leave comments under this gist if you have questions or comments about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_01_EX_Setting_up_the_course_environment"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
