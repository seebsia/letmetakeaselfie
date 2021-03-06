eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
I = imread('woman_face.png');
bboxes = eyesdetector(I);
% Places box over where eyes are detected
Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Ieyes)
% Bringing in the sunglasses and guy photos
lady = im2double(imread('woman_face.png'));
x = zeros(size(lady));
image(lady)
sunglasses = im2double(imread('glasses.png'));
% Resize sunglasses image. Set sunglasses to detected eye box ocation
hold on
sunglasses = imresize(sunglasses, [(bboxes(4) + 1) (bboxes(3) + 1)]);
x(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :) = sunglasses;
% Transparency & Overlay of Sunglasses on Guy Image
im = image(x);
im.AlphaData = max(x, [], 3);
hold off

axis image; axis off;