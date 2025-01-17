%created by Maliya. Was initially made to try and detect and change skin
%color. Did not complete for final version of project
facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='../images/white_man.png';
outfilename = websave(filename,url);
I = imread('../images/white_man.png');
bboxes = facedetector(I);
%the numbers in the vector represent [x y width height] from the upper-left
%corner

Iface = insertObjectAnnotation(I,'rectangle',bboxes,'Eyes');
figure
imshow(Iface)

%in the detected box
%extract color channels that correspond to skin colors
%replace by indexing with different skin colors