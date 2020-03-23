%% Fill Holes in a Binary Image
%  
%%
% Read image into workspace.
I = imread('coins.png');
figure
imshow(I)
title('Original Image')
%%
% Convert image to binary image.
BW = imbinarize(I);
figure
imshow(BW)
title('Original Image Converted to Binary Image')
%%
% File holes in the binary image and display the result.
BW2 = imfill(BW,'holes');
figure
imshow(BW2)
title('Filled Image')