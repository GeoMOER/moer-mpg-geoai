--- 
title: EX | Install Tensorflow and keras for DL 
toc: true
header:
  image: /assets/images/01-splash.jpg
  image_description: "Dr. John Snow's map"
  caption: "Map: [**Dr. John Snow**](https://en.wikipedia.org/wiki/John_Snow) [Wellcome Library via wikimedia](https://w.wiki/QtV)"
---










Please note that while this course is primarily based on R, we also use the programming language Python to supplement R. This is primarily the case in Unit 4, which deals with Deep Learning (DL). 
```r
# install keras & miniconda
reticulate::install_miniconda()
keras::install_keras()
```

That being said, *the implementation is not seamless.* The first time that you run the `geoAI_setup.R` script, you will likely drink one or more cups of coffee as you receive many errors that need to be worked through. 
{: .notice--danger}

If the installation with the above described approach fails you may follow the following [hints](https://gist.github.com/envimar/79a7249aaced24fafd23149b4fb0a81f#gistcomment-3944383).
{: .notice--info}



## Comments?
You can leave comments under this gist if you have questions or comments about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2022_keras"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
