% enables Cv toolbox that detects eyes/initializing variables
eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
I = imread('white_man.png');
bboxes = eyesdetector(I);
% Places box over where eyes are detected
Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Ieyes)
% bringing in the photos
guy = im2double(imread('white_man.png'));
x = zeros(size(guy));
image(guy)
sunglasses = im2double(imread('glasses.png'))*255;
% this is supposed to make it transparent; has worked in tests before
hold on
sunglasses = imresize(sunglasses, [(bboxes(4) + 1) (bboxes(3) + 1)]);
x(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :) = sunglasses;

im = image(x);
im.AlphaData = max(x, [], 3);
hold off
% index to where eyes are detected and insert sunglasses

% guy = imread('white_man.png');
% guy_sunglasses = guy;
% guy_sunglasses(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :)= sunglasses;
% show final image

h = imshow(guy);
set(h, 'AlphaData', x);

imshow(x);
axis image; axis off;