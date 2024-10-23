---
layout: distill
title: LambdaLoss
date: 2024-11-13 8:00:00+0800
description: LambdaLoss and LambdaLoss@K in Recommendation
tags: recommendation loss
categories: loss
featured: true
thumbnail: assets/img/blogs/2024-07-24-lambda-loss/117676101_p0.png
images:
  compare: true
  slider: true

authors:
  - name: Weiqin Yang
    url: "https://tiny-snow.github.io/"
    affiliations:
      name: Zhejiang University

bibliography: 2024-07-24-lambda-loss.bib

toc:
  - name: 1. Introduction
  - name: Bring on Something Cute!
---

## 1. Introduction

Most recommendation metrics are ranking-based, such as `NDCG` (Normalized Discounted Cumulative Gain), `MAP` (Mean Average Precision), `MRR` (Mean Reciprocal Rank), etc. To learn a recommendation model effectively, we need to design a loss function that can optimize these ranking metrics directly. However, these ranking metrics are non-smooth and non-convex, which makes them unsuitable for optimization.

At the very beginning, `LambdaRank` <d-cite key="burges2006learning"></d-cite> was proposed to highlight the importance of 

`LambdaLoss` <d-cite key="wang2018lambdaloss"></d-cite> is a powerful framework for designing ranking losses as metric surrogate losses. 






At the very beginning, 



---

## Bring on Something Cute!

<swiper-container keyboard="true" navigation="true" pagination="true" pagination-clickable="true" pagination-dynamic-bullets="true" rewind="true">
    <swiper-slide>{% include figure.liquid loading="eager" path="assets/img/blogs/2024-07-24-lambda-loss/117676101_p0.png" class="img-fluid rounded z-depth-1" %}</swiper-slide>
</swiper-container>
<figcaption class="figure-caption text-center">Ear Pinchy by @Polilla, https://www.pixiv.net/artworks/117676101</figcaption>
