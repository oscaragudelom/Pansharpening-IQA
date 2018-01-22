# Pansharpened-SS

This repository contains all the details and results of the subjective study of pan-sharpened images developed at Javeriana Cali University.  
## Evaluation dataset

The dataset is composed of 432 images, where half are images in true color and the other half images in pseudocolor. From these images, ten are pristine multi-spectral images, and 420 are fused images using six different techniques, three of multi-resolution analysis and three of principal component substitution. Two distortions (blur and awgn) are applied to five different scenes of the pristine Roma image from Digital Globe [1] with three intensity levels. In this way you have: 

* Five Scenes.
* Two color representation.
* Six fusion techniques.
* Two distortions (it only applies to the panchromatic image).
* Three distortion levels.

In order to prepare the subjects for the test, we generate two non-related test images (true color and pseudocolor).

## Image Distortion
Distorted images have three intensity levels as shown in the following table:

| Level   | Blur(σ) | AWGN(σ) |
| --------|---------|---------|
| 1       | 1       | 0.00250  |
| 2       | 2       | 0.01375  |
| 3       | 3       | 0.02500  |


## Image codification
 
Each image in the dataset has a coded name that specifies the applied process. The first part of the code indicates whether the representation of the image is true color (PSN) or pseudocolor (PSP). What follows is an encoding, where each number indicates the process applied according to the position. Each number is four digits composed of the following SFDL, where:
 
S: Scena 
F: Fusion 
D: Distortion 
L: Level 
 
The following tables are decodification maps for the image name code: 

| Code    | Fusion  | Distortion|
| --------|---------|---------|
| 0       | D/A     | D/A     |
| 1       | BDSD    | Blur    |
| 2       | PCA     | AWGN    |
| 3       | IHS     | D/A     |
| 4       | GS      | D/A     |
| 5       | Wavelet | D/A     |
| 6       | HPF     | D/A     | 

For example if an image have the following codification: I_PSN_3213. This refers to an image fused with PCA generated with scene three and with a blur distortion with intensity level three. 

## Study implementation

The study will take place during three sessions of 30 minutes each. In each session, 142 images will be evaluated with a time of visualization of the image to be evaluated of 10 seconds. 

## References
1. Digital Globe https://www.digitalglobe.com/
