%% Use Morphological Closing to Fill Gaps in an Image
% 
%%
% Read a binary image into the workspace and display it.
originalBW = imread('circles.png');
imshow(originalBW);
%%
% Create a disk-shaped structuring element. Use a disk structuring element
% to preserve the circular nature of the object. Specify a radius of 10
% pixels so that the largest gap gets filled.
se = strel('disk',10);
%%
% Perform a morphological close operation on the image.
closeBW = imclose(originalBW,se);
figure, imshow(closeBW)
