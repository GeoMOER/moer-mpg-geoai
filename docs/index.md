---
title: GeoAI
layout: splash
date: '2018-02-06 13:00:00 +0100'
header:
  overlay_color: "#000"
  overlay_filter: 0.6
  overlay_image: "/assets/images/title.png"
  caption: 'Image: [solar.empire via flickr.com](https://www.flickr.com/photos/solar-empire/23815961328/) [CC BY-NC 2.0 DEED](https://creativecommons.org/licenses/by-nc/2.0/)'
  cta_label: go to course units
  cta_url: "/units.html"
excerpt: Advanced geospatial analyses with AI.
feature_row_intro:
- excerpt: This Module is part of Honors Degree Program "AI and Entrepreneurship" - a contribution of [Environmental Informatics Lab of Philipps-University of Marburg](https://www.uni-marburg.de/de/fb19/disciplines/physisch/umweltinformatik) to [hessian.AI - The Hessian Center for Artificial Intelligence](https://hessian.ai/), co-funded by the German Federal Ministry of Education and Research.
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

This course will take place in a hybrid setting in presence in room F 14 | 00A19 Wednesdays 09:15 - 11:45 and online in room [to be defined](to be defined).
<!---In addition, there will be regular meetings with a tutor. 
The tutor sessions are Fridays 14:00 - 15:00 in room 00A12.
Note that the tutor sessions are voluntary. -->
{: .notice--info}


# Syllabus
The course covers 4 units:

| Unit | Topic | Learning Content |
|-------------|-------|-------------|
|**01**| **Big questions are spatial** |On the invalidity of the first law of geography in heterogeneous spaces.|
|**02**| **Remote sensing 101** |A brief introduction to remote sensing using optical sensors as an example.|
|**03**| **Deep learning** |Deep-learning and spatial patterns.|
|**04**| **Final team project: spatial prediction** |From curiosity to research question and project planning.|



Also check our additional material for teaching basic R skills, 
which can be found [here](https://geomoer.github.io/moer-base-r/){:target="_blank"}.
{: .notice--success}




## Team

{% for author in site.data.authors %}
  {% include author-profile.html %}
 <br />
{% endfor %}
