%created by Maliya. Used hat_filter code made by everyone to check if the
%hat filter worked on different image. Found an issue in imresize and
%debugged it
facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceCART');
 url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/s79-mckinsey-0865-pai-1.jpg?w=1000&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=24d78e84b4998e89c0333110a4269a93';
in_img = url;
filename ='../images/woman_face.png';
outfilename = websave(filename,url); 

woman = imread('../images/woman_face.png');
bboxes = facedetector(woman);
gradcap = imread('../images/grad_cap_neon.png');
 

Iface = insertObjectAnnotation(I,'rectangle',bboxes,'Face');
figure
imshow(Iface)

lady = im2double(imread('../images/woman_face.png'));
x = zeros(size(lady));
image(lady)
gradcap = im2double(imread('../images/grad_cap_neon.png'));
 
hold on
gradcap = imresize(gradcap,[128 208]);
%so basically our problem is we have to resize our gradcap for every single
%new image
x(1:bboxes(2),bboxes(1):bboxes(1) + bboxes(3), :) = gradcap;
im = image(x);
im.AlphaData = max(x, [], 3);
hold off
 

axis image; axis off;