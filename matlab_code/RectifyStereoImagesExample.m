%% Rectify Stereo Images
% Specify calibration images.

% Copyright 2015 The MathWorks, Inc.

imageDir = fullfile(toolboxdir('vision'),'visiondata','calibration','stereo');
leftImages = imageSet(fullfile(imageDir,'left'));
rightImages = imageSet(fullfile(imageDir,'right'));

%%
%Detect the checkerboards.
[imagePoints,boardSize] = detectCheckerboardPoints(leftImages.ImageLocation,...
    rightImages.ImageLocation);

%%
% Specify the world coordinates of checkerboard keypoints.
worldPoints = generateCheckerboardPoints(boardSize,108);

%%
% Calibrate the stereo camera system.
stereoParams = estimateCameraParameters(imagePoints,worldPoints);

%%
% Read in the images.
I1 = read(leftImages, 1);
I2 = read(rightImages, 1);
figure; imshow(I1);
figure; imshow(I2);
%%
% Rectify the images using the 'full' output view.
[J1_full,J2_full] = rectifyStereoImages(I1,I2, stereoParams,'OutputView','full');
figure; imshow(J1_full);
figure; imshow(J2_full);
return
%%
% Display the result.
figure;
imshowpair(J1_full,J2_full,'falsecolor','ColorChannels','red-cyan');
return
%%
% Rectify the images using the 'valid' output view
[J1_valid,J2_valid] = rectifyStereoImages(I1,I2,stereoParams,'OutputView','valid');

%%
% Display the result.
figure;
imshowpair(J1_valid,J2_valid,'falsecolor','ColorChannels','red-cyan');

