Given a segmentation model, [Universal Adversarial Perturbations Against Semantic Image
Segmentation](https://arxiv.org/abs/1704.05712) by Metzen et al. describes how
to find a universal perturbation such that adding this perturbation to any image
in the Cityscapes data set causes the segmentation model to fail to detect
pedestrians.

This repo reproduces this result on a subset of the Coco 2017 data set on a
smaller segmentation model.
