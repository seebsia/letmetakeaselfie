% enables Cv toolbox that detects eyes/initializing variables
eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
I = imread('white_man.png');
bboxes = eyesdetector(I);
% Places box over where eyes are detected
Ieyes = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Ieyes)
% bringing in the photos
guy = imread('white_man.png');
x = ones(size(guy));
image(guy)
sunglasses = imread('glasses.png');
% this is supposed to make it transparent; has worked in tests before
hold on
im = image(sunglasses);
im.AlphaData = max(sunglasses, [], 3);
hold off
% index to where eyes are detected and insert sunglasses
sunglasses = imresize(sunglasses, [(bboxes(4) + 1) (bboxes(3) + 1)]);
x(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :)= sunglasses;
% guy = imread('white_man.png');
% guy_sunglasses = guy;
% guy_sunglasses(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :)= sunglasses;
% show final image
imshow(x)
axis image; axis off;