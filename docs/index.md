---
title: GeoAI
layout: splash
date: '2025-02-26 13:00:00 +0100'
header:
  overlay_color: "#000"
  overlay_filter: 0.6
  overlay_image: "/assets/images/title.png"
  caption: 'Image: [solar.empire via flickr.com](https://www.flickr.com/photos/solar-empire/23815961328/) [CC BY-NC 2.0 DEED](https://creativecommons.org/licenses/by-nc/2.0/)'
  cta_label: go to course units
  cta_url: "/units.html"
excerpt: Advanced geospatial analyses with AI.
feature_row_intro:
- excerpt: Master level course at the Department of Geography at the University of Marburg.
feature_row_ilos:
- image_path: "/assets/images/envobs_ilos.jpg"
  alt: PC monitor laying in the garden of the institute.
  title: Intended learning outcomes
  excerpt: "Template..."
---

{% include feature_row id="feature_row_intro" type="center" %}

## Motivation
“Everything is related to everything else, but near things are more related than distant things” [(Tobler, 1970)](https://www.tandfonline.com/doi/abs/10.2307/143141). With this sentence, Waldo R. Tobler made geographic history, although his main concern was to reduce the complexity of his population simulation model so that it could be calculated at all on the IT infrastructure of the 1970s.
Fifty years later, society is facing other major challenges. Environmental and climate change is leading to species loss rates comparable only to the great mass extinctions. Ecosystem functionality will change, with consequences for ecosystem services such as food production, climate regulation, or recreation.
Understanding environmental change and assessing consequences requires spatial information from landscapes. The crucial question is not whether a landscape contains forest, meadow, field, and river, but how they relate to each other spatially. Simply put, if a strip of forest separates the river from the cropland, the forest acts as an important barrier to the input of nutrients from the cropland into the river. If a clearing is present in the forest, habitat complexity increases, increasing the likelihood of biodiversity and resilience to environmental change. 
When collecting spatial information in the field, a tradeoff must be made between level of detail, scale, and temporal repetition. Selected processes can either be studied in detail at a very limited number of observation sites or estimated at a generalized scale for a landscape. The constraints loosen when linking local surveys with area-wide remote sensing observations and predicting the locally collected information in space with artificial intelligence methods.


## Learning objectives
The participants will be able to:

* select, adapt, and apply deep learning methods to solve spatial problems in human-environment research;

* design, use, and evaluate training/testing strategies for reliable error and validity estimation;

* select and create appropriate representations for visual analysis and presentation of results;

* work together in teams in an agile manner;

* document procedures and results in a comprehensible and transparent manner and critically evaluate results.


# Setting

This course will take place in a hybrid synchronous setting in presence in room F 14 | 00A19 and online. 
In addition, there will be regular meetings with a tutor. 
Details on the additional tutor sessions will be provided in the first regular session, which will take place on **Wednesday 22.10.2025 at 9:15 am** (German time) in room F 14 | 00A19. 
The virtual room for online participants must be accessed via [ILIAS](https://ilias.uni-marburg.de/ilias.php?baseClass=ilrepositorygui&ref_id=4407825). 
Note that the tutor sessions are voluntary.
{: .notice--info}


# Syllabus
The course covers 4 units:

| Session | Date | Topic | Content |
|---------|------|-------|---------|
||| **01 Big questions are spatial** |
| 01 | 22.10.2025 | People in space | The importance of spatial composition and configuration of landscapes exemplified by the IPBES Nature's Contributions to People framework. |
| 02 | 29.10.2025 | Setting up the computational environment | Introduction to the setup of a computational working environment. Install and configure TensorFlow and Keras for spatial data analysis applications. |
||| **02 Remote Sensing 101** |
| 03 | 05.11.2025 | Remote sensing and data formats | Discuss foundational concepts in remote sensing, including data acquisition, key features, and distinctions between spatial data formats (e.g., raster, vector). |
| 04 | 12.11.2025 | Digitizing training areas | Use open-source GIS software to manually digitize training areas, building skills in data preprocessing and preparation for model training. |
||| **03 Deep Learning** |
| 05 | 19.11.2025 | Deeply good | Introduction to deep learning principles and applications for spatial pattern recognition. Discuss workflow steps, mask creation, and model training principles.
| 06 | 26.11.2025 | U-Net | Explore data augmentation techniques, then train a U-Net model for spatial image segmentation. |
| 07 | 03.12.2025 | Model performance and prediction | Techniques for evaluating model performance and interpreting spatial predictions. |
||| **04 Final team project: spatial prediction** |
| 08 | 10.12.2025 | Research questions | Define project scope and goals, establish project teams, and discuss initial ideas. |
| 09 | 17.12.2025 | built in hold |  |
| 10 | 14.01.2026 | Research presentation | Present project outlines to peers for constructive feedback. |
| 11 | 21.01.2026 | Research project |Conduct comprehensive project work, including data collection, model training, and spatial prediction tasks. Write your final team project. |
| 12 | 28.01.2026 | Research project |Conduct comprehensive project work, including data collection, model training, and spatial prediction tasks. Write your final team project. |
| 13 | 04.02.2026 | Research project | Conduct comprehensive project work, including data collection, model training, and spatial prediction tasks. Write your final team project. |
| 14 | 11.02.2026 | Wrap up | Time for questions and feedback, goodbye |




<!--
| Unit | Topic | Learning Content |
|-------------|-------|-------------|
|**01**| **Big questions are spatial** |On the invalidity of the first law of geography in heterogeneous spaces.|
|**02**| **Remote sensing 101** |A brief introduction to remote sensing using optical sensors as an example.|
|**03**| **Deep learning** |Deep-learning and spatial patterns.|
|**04**| **Final team project: spatial prediction** |From curiosity to research question and project planning.|
-->


Also check our additional material for teaching basic R skills, 
which can be found [here](https://geomoer.github.io/moer-base-r/){:target="_blank"}.
{: .notice--success}




## Team

{% for author in site.data.authors %}
  {% include author-profile.html %}
 <br />
{% endfor %}
