# =========================================================================
# Filename:     power_trans.py
#               Image Power Transform
# Name:         Tran Minh Chien - ID: 1870324
# Subject:      Computer Vision and Control - Exercise 1
# Date:         2019.08.30
# =========================================================================

import numpy as np
import cv2

def main():
    # Load the image
    img = cv2.imread('D:/sample.jpg')
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    cv2.imshow('gray',gray)

    img2 = np.array(255*(gray/255)**0.4,dtype='uint8')
    # Display the images in subplots
    cv2.imshow('img2',img2)

if __name__ == '__main__':
    main()
   
    cv2.waitKey(0)
