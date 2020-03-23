%% Find Corner Points Using the Harris-Stephens Algorithm
%% Read the image.

% Copyright 2015 The MathWorks, Inc.

I = checkerboard;
%% Find the corners.
corners = detectHarrisFeatures(I);
%% Display the results.
imshow(I); hold on;
plot(corners.selectStrongest(50)); 