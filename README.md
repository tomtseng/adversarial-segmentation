## Description

Given a segmentation model, [Universal Adversarial Perturbations Against Semantic Image
Segmentation](https://arxiv.org/abs/1704.05712) by Metzen et al. describes how
to find a universal perturbation such that adding this perturbation to any image
in the Cityscapes data set tends to make the model output a desired target
segmentation.

This repo attempts to reproduce this result on a subset of the COCO 2017 data set on a
small segmentation model.

In the table below, the first column shows a sample image and its segmentation.
The middle column applies a perturbation that is trained to cause the model to
output a particular static segmentation displaying the word "foo." The right
column applies a perturbation that is trained to cause the model to not segment
any people. 

<!-- make the widths of table columns 2 to 4 be equal so that image sizes match -->
<style>
table th:first-of-type {
    width: 19%;
}
table th:nth-of-type(2) {
    width: 27%;
}
table th:nth-of-type(3) {
    width: 27%;
}
table th:nth-of-type(4) {
    width: 27%;
}
</style>

| | Original image | Static target segmentation | People hidden |
|-|:-:|:-:|:-:|
| __Image__ | ![Sample image](/readme-files/sample-image.png) | ![Image with perturbation applied to match a static target segmentation](/readme-files/static-target.png) | ![Image with perturbation applied to hide people](/readme-files/hide-people.png) | 
| __Segmentation__ | ![Segmentation of sample image](/readme-files/sample-image-segmentation.png) | ![Segmentation of image with perturbation applied to match a static target segmentation](/readme-files/static-target-segmentation.png) | ![Segmentation of image with perturbation applied to hide people](/readme-files/hide-people-segmentation.png) |
| __Perturbation__| | ![Perturbation to match a static target segmentation](/readme-files/static-target-perturbation.png) | ![Perturbation to hide people](/readme-files/hide-people-perturbation.png) | 
| __Perturbation amplified 12.75x__| | ![Perturbation to match a static target segmentation, amplified](/readme-files/static-target-perturbation-amplified.png) | ![Perturbation to hide people, amplified](/readme-files/hide-people-perturbation-amplified.png) | 

The perturbation in the right column was not as successful as desired---in the
displayed image, ideally the segmentation would still segment the bicycle while
not segmenting the person. There weren't many recognized objects in the training
data, so the perturbation achieved good loss by making the model fail to segment
anything rather than making the model only fail to segment people. This can
probably be improved by fiddling with the loss function or data set more.

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
