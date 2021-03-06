facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='white_man.png';
outfilename = websave(filename,url);
I = imread('white_man.png');
bboxes = facedetector(I);
%the numbers in the vector represent [x y width height] from the upper-left
%corner

gradcap = imread('grad_cap.png');
gradcap = imresize(gradcap, [(bboxes(4) + 1) (bboxes(3))]);
guy_gradcap = guy;
 
guy = im2double(imread('white_man.png'));
x = zeros(size(guy));
image(guy)
gradcap = im2double(imread('grad_cap.png'));

hold on
gradcap = imresize(gradcap, [(bboxes(4) + 1) (bboxes(3) + 1)]);
m = size(gradcap);
guy_gradcap(1:bboxes(2),bboxes(1):bboxes(1) + bboxes(3), :) = gradcap;

im = image(x);
im.AlphaData = max(x, [], 3);
hold off



axis image; axis off;
