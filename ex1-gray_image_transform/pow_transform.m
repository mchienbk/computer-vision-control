% =========================================================================
% Filename:     power_transorm.m
% Name:         Tran Minh Chien - ID: 1870324
% Subject:      Computer Vision and Control - Exercise 1
% Date:         2019.08.30
% =========================================================================
clc; clear all; close all;
im=imread('sample.jpg');
g=rgb2gray(im);
c=input('Enter the constant value, c = ');
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                r=g(x,y);
                r=double(r);
                s(x,y)=c*log10(1+r);
                if (s(x,y) > 255)
                    s(x,y) = 255;
                end
            end
        end
s = mat2gray(s);
imshow(g), figure, imshow(s);

clc; clear all; close all;
im=imread('sample.jpg');
g=rgb2gray(im);
c=input('Enter the constant value, c = ');
h=input('Enter the constant value, h = ');
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                r=g(x,y);
                r=double(r);
                s(x,y)=c*(r)^h;
                if (s(x,y) > 255)
                    s(x,y) = 255;
                end
            end
        end
s = mat2gray(s);
imshow(g), figure, imshow(s);
