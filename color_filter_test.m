url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='white_man.png';
outfilename = websave(filename,url);
I = imread('white_man.png');

%convert image to grayscale
grayimg = rgb2gray(I);
imshow(grayimg);

%apply red 'filter' to grayscale image
redimg = cat(3, grayimg, zeros(size(grayimg)), zeros(size(grayimg)));
imshow(redimg);

%apply green 'filter' to grayscale image
greenimg = cat(3, zeros(size(grayimg)), grayimg, zeros(size(grayimg)));
imshow(greenimg);

%apply blue 'filter' to grayscale image
blueimg = cat(3, zeros(size(grayimg)), zeros(size(grayimg)), grayimg); 
imshow(blueimg);