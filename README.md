# Pansharpened-SS

This repository contains all the details and results of the subjective study of pan-sharpened images developed at Pontificia Universidad Javeriana Cali, Colombia.
## Evaluation dataset

The dataset is composed of 432 images, where half are images in true color and the other half images in pseudocolor. True color images are composed of the red (R), green (G) and blue (B) bands, that constitute the visible spectrum. The pseudocolor images are composed of near infrared (NIR), R, G bands.    

From these images, ten are pristine multi-spectral images, and 420 are fused images using six different fusion techniques, three of multi-resolution analysis and three of principal component substitution. Two distortions (blur and additive white gaussian noise (awgn)) are applied to five different scenes of the pristine Roma image from Digital Globe [1] with three intensity levels. In  total, there are:

* Five Scenes.
* Two color planes.
* Six fusion techniques.
* Two distortions that are only applied to the panchromatic image.
* Three distortion levels.

In order to prepare the subjects for the test, we developed an introduction manual icluded in the repository with the distortions presented in the study. We also implement a image study test with different distortions and color representation to acquaint the subject.

## Image Codification
 
Each image in the dataset has a tagged name that specifies the applied process. The image tag have the following order representation:

The first part of the tag indicates whether the representation of the image is true color (TC) or pseudocolor (PC), As shown below.

 ![Color Tag](Tag_Color.png)

The second part is a scene tag, as shown below.

 ![Scenes Tag](Tag_Scenes.png)

The third part is a fusion technique tag. The following table shows the acronyms of the fusion techniques.

| Acronym    | Fusion Technique                                                                                   |
|------------|----------------------------------------------------------------------------------------------------|
| REF        | Not fused MS image                                                                                 |
| EXP        | MS image interpolation, using polinomial kernel with 23 coefficients [2]                           |
| BDSD       | Band-Dependent Spatial-Detail with local parameter estimator [3]                                   |
| PCA        | Principal Component Analysis [4]                                                                   |
| IHS        | Fast Intensity-Hue-Saturation (GIHS) image fusion [5]                                              |
| MTF-GLP-CBD| Generalized Laplacian Pyramid [2] with MTF-matched filter [6] and multiplicative injection mode [7]|
| ATWT-M2    | A Trous Wavelet Transform with Mode 2 [8]                                                          |
| HPF        | High-Pass Filtering with 5x5 box filter for 1:4 fusion [4]                                         |

The fourth part is a distortion tag. The following table shows the acronyms of the distortions.

| Acronym| Distortion                   |
|--------|------------------------------|
| UD     | Undistorted                  |
| Blr    | Blur                         |
| AWGN   | Additive White Gaussian Noise|

The final part is a intensity level for distorted images as shown in the following table.

| Level   | Blur(σ) | AWGN(σ) |
| --------|---------|---------|
| 1       | 3       | 0.05    |
| 2       | 5       | 0.10    |
| 3       | 7       | 0.15    |

The following image shows the diferent distortions with diferent intensity levels.

 ![Color Tag](Tag_Distortion.png)

For example if an image have the following tag: PC_Coliseum_MTF-GLP-CBD_AWGN_Level-2. This refers to an pseudocolor image of Coliseum scene fused by generalized laplacian pyramid with MTF-matched filter and multiplicative injection mode, distorted with additive white gausion noise using σ = 0.10.

## Study Procedure
The session routines are developed in Matlab and the PsychToolbox [9]. The procedure follows the recommendations mentioned in [10], where the subjects indicated the quality of the video on a continuous scale between [0, 100], in which each original image is included in the experiment but not identified as such. The test will be performed with a 18.5" monitor to observe the images, and the screen resolution set to 1366 x 768 @ 60 Hz, at a viewing distance that will be between 45cm and 55cm. The stimulus images will be displayed at their native resolution to prevent distortions due to scaling operations. Areas outside the images are set to mid gray. 

The study will take place during three sessions of 25 minutes each with 40 voluntaries. In each session, 142 images will be evaluated  for a total of 432 images. The sequence will start displaying a single stimulus image for 7 seconds as depicted in the following image.

![Image to evaluate](ScoreImage.png)

Then a subject will rate the image using a continuous sliding quality bar with labels "Bad", "Poor", "Fair", "Good", or "Excellent", as shown below. 

![Score Bar](ScoreBar.png)

Finally the subject select the more relevant distortion doing a keyboard selection.

![Relevant Distortion](ScoreType.png)

In addition, we will calibrate and measure the display and room illumination and color levels during the tests using an Spyder5 PRO calibrator [11].
## References
1. Digital Globe https://www.digitalglobe.com/.
2. Aiazzi, Bruno, et al. "Context-driven fusion of high spatial and spectral resolution images based on oversampled multiresolution analysis." IEEE Transactions on geoscience and remote sensing 40.10 (2002): 2300-2312.
3. Garzelli, Andrea, Filippo Nencini, and Luca Capobianco. "Optimal MMSE pan sharpening of very high resolution multispectral images." IEEE Transactions on Geoscience and Remote Sensing 46.1 (2008): 228-236.
4. Chavez, Pats, Stuart C. Sides, and Jeffrey A. Anderson. "Comparison of three different methods to merge multiresolution and multispectral data- Landsat TM and SPOT panchromatic." Photogrammetric Engineering and remote sensing 57.3 (1991): 295-303.
5. Tu, Te-Ming, et al. "A new look at IHS-like image fusion methods." Information fusion 2.3 (2001): 177-186.
6. Aiazzi, B., et al. "MTF-tailored multiscale fusion of high-resolution MS and Pan imagery." Photogrammetric Engineering & Remote Sensing 72.5 (2006): 591-596.
7. Aiazzi, B., et al. "An MTF-based spectral distortion minimizing model for pan-sharpening of very high resolution multispectral images of urban areas." Remote Sensing and Data Fusion over Urban Areas, 2003. 2nd GRSS/ISPRS Joint Workshop on. IEEE, 2003.
8. Ranchin, Thierry, and Lucien Wald. "Fusion of high spatial and spectral resolution images: the ARSIS concept and its implementation." Photogrammetric Engineering and Remote Sensing 66.1 (2000): 49-61.
9. Brainard, David H., and Spatial Vision. "The psychophysics toolbox." Spatial vision 10 (1997): 433-436.
10. Seshadrinathan, Kalpana, et al. "Study of subjective and objective quality assessment of video." IEEE transactions on image processing 19.6 (2010): 1427-1441..
11. Spyder5 PRO Datacolor http://www.datacolor.com/photography-design/product-overview/spyder5-family/#spyder5pro.

