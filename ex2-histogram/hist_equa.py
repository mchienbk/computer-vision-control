# =========================================================================
# Filename:     hist_aqua.py
#               Histograms Equalization 
# Name:         Tran Minh Chien - ID: 1870324
# Subject:      Computer Vision and Control - Exercise 2
# Date:         2019.09.03
# =========================================================================

import cv2
import numpy as np
from matplotlib import pyplot as plt

def main():
    # Load the image
    img = cv2.imread('D:/sample.jpg')
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    cv2.imshow('gray',gray)
    # Calculate Histogram
    plt.hist(img.ravel(),256,[0,256]); plt.show()

    # creating a Histograms Equalization 
    equ = cv2.equalizeHist(gray) 

    # show image input vs output 
    cv2.imshow('image', equ)


if __name__ == '__main__':
    main()
    cv2.waitKey(0)


