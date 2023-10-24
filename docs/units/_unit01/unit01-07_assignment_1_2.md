--- 
title: A | Assignment unit 01-1
toc: true
header:
  image: /assets/images/01-splash.jpg
  image_description: "Dr. John Snow's map"
  caption: "Map: [**Dr. John Snow**](https://en.wikipedia.org/wiki/John_Snow) [Wellcome Library via wikimedia](https://w.wiki/QtV)"
---





{% capture Assignment-1-1 %}

Implement and check working environment setup

1. After reading the Learning Material (LM) answer the following three questions in maximal three concise sentences:
	* Why do we need artificial intelligence in geo science?
	* What is the difference between neighborhood, proximity and distance?
	* Give three examples of Nature's contributions to people (NCPs).
1. Set up and check the basic working environment as explained in the previous exercise.
1. Check if the installation of `tensorflow` and `keras` was successful. Copy the following script from the vignette "Getting Started with Keras" into the editor and execute it step by step. Compare the results with the vignette. 
<script src="https://gist.github.com/uilehre/7e70cba9f3a9fa4a57ea2ea2cfc6d616.js"></script>
1. If it fails, write and upload a short error report. Your report should include what you have done so far to attempt to solve the problem. Please include the output of `sessionInfo()` in your report as well. If everything works fine, just write this in the report.


{% endcapture %}
<div class="notice--success">
  {{ Assignment-1-1 | markdownify }}
</div> 

{% capture remarks %}
### Concluding remarks 
Please note!

Several errors are likely to pop up during this installation and setup process. As you will learn through this entire process of patching together different pieces of software, some error warnings are more descriptive than others. 

This procedure is typical and usually necessary. For complex tasks, external software libraries and tools often need to be loaded and connected. Even if most software developers try to facilitate this to make it easier, it is often associated with an interactive and step-by-step approach.

When in doubt (**and before asking your instructor ;-)**), ask Google! Not because we are too lazy to answer (we will answer you, of course) but because part of becoming a (data) scientist is learning how to solve these problems. We all learned (and continue to learn) this way as well and it is highly unlikely that you are the first person to ask whatever question you may have -- Especially [StackOverflow](https://stackoverflow.com/questions/tagged/r) is your friend!

{% endcapture %}
<div class="notice--info">
  {{ remarks | markdownify }}
</div> 


## Comments?
You can leave comments under this gist if you have questions or comments about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2022_unit_01_assignment_1_1"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>

