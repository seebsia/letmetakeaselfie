eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='white_man.png';
outfilename = websave(filename,url);
I = imread('white_man.png');
bboxes = eyesdetector(I);
%the numbers in the vector represent [x y width height] from the upper-left
%corner

Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Ieyes)
title('Detected Eyes');

sunglasses = imread('sunglasses.png');
sunglasses = imresize(sunglasses, [bboxes(4) bboxes(3)]);
guy = imread('white_man.png');
guy_sunglasses = guy;
 
rowshift = bboxes(2);
colshift = bboxes(1);
 

guy_sunglasses((1:size(sunglasses, 1))+rowshift, (1:size(sunglasses,2))+colshift,:) = sunglasses;
close all 
imshow(guy_sunglasses)

axis image; axis off;
