clear
close
clc

I = [0 0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
0 0 1 1 1 0 0 0 0 0 0
0 0 1 1 1 0 0 1 1 1 0
0 1 1 1 1 1 1 1 1 1 0
0 1 1 0 1 0 0 1 1 1 0
0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0];

SE = strel('square',3);

J1 = imerode(I,SE);
J2 = imdilate(J1,SE);

figure; imshow(I)
figure; imshow(J1)
figure; imshow(J2)


% % Opening
% original = imread('snowflakes.png');
% figure, imshow(original);
% se = strel('disk',5);
% afterOpening = imopen(original,se);
% figure, imshow(afterOpening,[]);


%%% Hit-miss
% bw = [0 0 0 0 0 0
%       0 0 1 1 0 0
%       0 1 1 1 1 0
%       0 1 1 1 1 0
%       0 0 1 1 0 0
%       0 0 1 0 0 0]
% 
% interval = [0 -1 -1
%             1  1 -1
%             0  1  0];
% 
% bw2 = bwhitmiss(bw,interval)