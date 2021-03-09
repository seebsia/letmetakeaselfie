%worked on together by everyone to initially test putting sunglasses on an image. in this file, we are attempting to tell matlab to detect the eyes in the file white_man and
%attempting to index the sunglasses into the box where matlab detects the
%eyes
eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='../images/white_man.png';
outfilename = websave(filename,url);
I = imread('../images/white_man.png');
bboxes = eyesdetector(I);
%the numbers in the vector represent [x y width height] from the upper-left
%corner

%Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
%figure
%imshow(Ieyes)
%title('Detected Eyes'); %i actually dont think we need this
%this creates a box around the detected region and names it Eyes

sunglasses = imread('../images/glasses.png');
sunglasses = imresize(sunglasses, [(bboxes(4) + 1) (bboxes(3) + 1)]);
guy = imread('../images/white_man.png');
guy_sunglasses = guy;
 
%rowshift = bboxes(2); now unnecessary
%colshift = bboxes(1); now unnecessary 
%guy_sunglasses((1:size(sunglasses, 1))+rowshift, (1:size(sunglasses,2))+colshift,:) = sunglasses;

guy_sunglasses(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :)= sunglasses;

close all 
imshow(guy_sunglasses)

axis image; axis off;
