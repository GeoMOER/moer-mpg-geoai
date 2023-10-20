---
title: A | Assignment unit 04-2
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Excerpt of predicted tree species groups in Rhineland-Palatinate"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---





{% capture Assignment-04 %}



Follow all the exercises in unit 04: 
1.  Create a map of the prediction according to the exemplary workflow described in the unit.
Now we would like to modifie the training data:
2.  Use the same mask and DOP as before.
3. 	Modify the `remove_files` function in a way that your final training data includes not only masks with fore- and background (pngs with buildings(0) and no building(1)) but also pngs with just background information (no building(0))
4.  Train a new model with the new data.
5.	Create a map of the prediction with your new model.
6.	Compare both maps of predictions in three sentences.

Again put your code and results in an ´Rmarkdown´ file and compile it to a PDF document for upload on ILIAS.

{% endcapture %}
<div class="notice--success">
  {{ Assignment-04 | markdownify }}
</div>











## Comments?
You can leave comments under this gist if you have questions or comments about any of the code chunks that are not included as gist. Please copy the corresponding line into your comment to make it easier to answer the question. 



<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2022_unit_04_assignment_4_2"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
