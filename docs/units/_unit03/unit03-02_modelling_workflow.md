---
title: LM | Modelling workflow
toc: true
header:
  image: /assets/images/unit04/streuobst.jpg
  image_description: "Streuobstwiesen"
  caption: "Image: ulrichstill [CC BY-SA 2.0 DE] via [wikimedia.org](https://commons.wikimedia.org/wiki/File:Tuebingen_Streuobstwiese.jpg)"
---


In the following exercises, we want to use a deep neural network, specifically U-Net, to predict the presence of buildings in the southern part of Marburg. For this, we will use a DOP of Marburg as well as a vector file containing the outlines of the buildings for the extent of the DOP. The DOP file can be downloaded [here](http://85.214.102.111/geo_data/).

![image](../assets/images/unit04/workflow.png)
*Image: An exemplary workflow for creating a U-Net model for buildings in Marburg.*

In the first exercise, we will create masks and split the data. Then, we will prepare the data for the actual U-Net and complete a step called augmentation. In the next session we will apply the actual U-Net model and calculate performance metrics. Finally, we will use the U-Net to make spatial predictions that we can then compare with the random forest models from the previous unit.

This entire example is based on the tutorial [Introduction to Deep Learning in R for the Analysis of UAV-based Remote Sensing Data]( https://av.tib.eu/media/49550) [CC BY 3.0 DE] by Christian Knoth. The scripts from this tutorial are available [here]( https://dachro.github.io/ogh_summer_school_2020/Tutorial_DL_UAV.html#introduction).


<script src="https://utteranc.es/client.js"
        repo="GeoMOER/geoAI"
        issue-term="GeoAI_2021_unit_04_LM_Modelling_Workflow"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
