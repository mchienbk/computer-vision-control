%% Reconstruct 3-D Scene from Disparity Map
%% Load the stereo parameters.

% Copyright 2015 The MathWorks, Inc.

load('webcamsSceneReconstruction.mat');
%% Read in the stereo pair of images.
I1 = imread('sceneReconstructionLeft.jpg');
I2 = imread('sceneReconstructionRight.jpg');
figure; imshow(I1)
figure; imshow(I2)
%% Rectify the images.
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
%% Display the images after rectification.
figure; imshow(cat(3, J1(:,:,1), J2(:,:,2:3)), 'InitialMagnification', 50);
%% Compute the disparity.
disparityMap = disparity(rgb2gray(J1), rgb2gray(J2));
figure; imshow(disparityMap, [0, 64], 'InitialMagnification', 50); 
%% Reconstruct the 3-D world coordinates of points corresponding to each pixel from the disparity map.
pointCloud = reconstructScene(disparityMap, stereoParams);
%% Segment out a person located between 3.2 and 3.7 meters away from the camera.
Z = pointCloud(:, :, 3);
mask = repmat(Z > 3200 & Z < 3700, [1, 1, 3]);
J1(~mask) = 0;
figure; imshow(J1, 'InitialMagnification', 50);