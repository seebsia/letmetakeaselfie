%worked on by everyone 
% enables CV toolbox that detects eyes/initializing variables
eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
I = imread('../images/white_man.png');
bboxes = eyesdetector(I);
% Places box over where eyes are detected
Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Ieyes)
% Bringing in the sunglasses and guy photos
guy = im2double(imread('../images/white_man.png'));
x = zeros(size(guy));
image(guy)
sunglasses = im2double(imread('../images/glasses.png'));
% Resize sunglasses image. Set sunglasses to detected eye box ocation
hold on
sunglasses = imresize(sunglasses, [(bboxes(4) + 1) (bboxes(3) + 1)]);
x(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :) = sunglasses;
% Transparency & Overlay of Sunglasses on Guy Image
im = image(x);
im.AlphaData = max(x, [], 3);
hold off