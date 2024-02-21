0 - reloads the original image
1 - converts to grayscale (RGB avergae)
2 - increases contrast using cubic function centered at 255/2 (constrained to 0-255)
3 - blurs image using 3x3 Gaussian kernel
4 - applies image detection kernels Gx and Gy then combines using pythagoras thm
5 - sharpens the image using the sharpen kernel
6 - same as 3 but using 5x5 (extra credit)
7 - decreases contrast using inverse of the function in 2

Each image manipulation is applied onto a buffer of the image. The image is not reloaded until user releases '0' key. 
User can apply multiple manipulations to the same image.

I left several sample images in the data folder. To choose a different image change the "imgName" variable.