%initially created by Maliya to put the hat on the head. Hasiba created the
%code used to add transparency to the hat iamge so it appeared more
%natural. 
facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='../images/white_man.png';
outfilename = websave(filename,url);
I = imread('../images/white_man.png');
bboxes = facedetector(I);
gradcap = imread('../images/grad_cap_neon.png');

 
guy = im2double(imread('../images/white_man.png'));
x = zeros(size(guy));
image(guy)
gradcap = im2double(imread('../images/grad_cap_neon.png'));

hold on
gradcap = imresize(gradcap,[(bboxes(4)) - 233 (bboxes(3)) + 1]);
x(1:bboxes(2),bboxes(1):bboxes(1) + bboxes(3), :) = gradcap;
im = image(x);
im.AlphaData = max(x, [], 3);
hold off


axis image; axis off;
