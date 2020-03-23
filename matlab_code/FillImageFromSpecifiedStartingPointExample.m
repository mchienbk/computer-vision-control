%% Fill Image from Specified Starting Point
%  

% Copyright 2015 The MathWorks, Inc.

BW1 = logical([1 0 0 0 0 0 0 0
               1 1 1 1 1 0 0 0
               1 0 0 0 1 0 1 0
               1 0 0 0 1 1 1 0
               1 1 1 1 0 1 1 1
               1 0 0 1 1 0 1 0
               1 0 0 0 1 0 1 0
               1 0 0 0 1 1 1 0]);
figure; imshow(BW1)

BW2 = imfill(BW1,[3 3],8);
figure; imshow(BW2)