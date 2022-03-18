## Description

Given a segmentation model, [Universal Adversarial Perturbations Against Semantic Image
Segmentation](https://arxiv.org/abs/1704.05712) by Metzen et al. describes how
to find a universal perturbation such that adding this perturbation to any image
in the Cityscapes data set tends to make the model output a desired target
segmentation.

This repo attempts to reproduce this result on a subset of the COCO 2017 data set on a
smaller segmentation model.

In the table below, the first column shows a sample image and its segmentation.
The middle column applies a perturbation that is trained to cause the model to
not detect any people. The right column applies a perturbation that is trained
the cause the model to output a particular static segmentation that displays the
word "foo."

| | Original image | People hidden | Static target segmentation |
|-|:-:|:-:|:-:|
| __Image__ | ![Sample image](/readme-files/sample-image.png) | ![Image with perturbation applied to hide people](/readme-files/hide-people.png) | ![Image with perturbation applied to match a static target segmentation](/readme-files/static-target.png) |
| __Segmentation__ | ![Segmentation of sample image](/readme-files/sample-image-segmentation.png) | ![Segmentation of image with perturbation applied to hide people](/readme-files/hide-people-segmentation.png) | ![Segmentation of image with perturbation applied to match a static target segmentation](/readme-files/static-target-segmentation.png) |
| __Perturbation__| | ![Perturbation to hide people](/readme-files/hide-people-perturbation.png) | ![Perturbation to match a static target segmentation](/readme-files/static-target-perturbation.png)
| __Perturbation amplified 12.75x__| | ![Perturbation to hide people, amplified](/readme-files/hide-people-perturbation-amplified.png) | ![Perturbation to match a static target segmentation, amplified](/readme-files/static-target-perturbation-amplified.png)

In the middle column, the perturbation was not as successful as desired---ideally the
segmentation would still detect the bicycle while not detecting the person. I
would guess that this can be improved by fiddling with the loss function or data
set more.

## Running

Run
```sh
conda env create -f environment.yml && conda activate adversarial-segmentation
```
to set up the Conda environment, then run
```sh
jupyter lab
```
to launch JupyterLab.
