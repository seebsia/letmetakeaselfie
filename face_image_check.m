faceDetector = vision.CascadeObjectDetector;
shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
I = imread('visionteam.jpg');
imshow(I);shg;
bbox = step(faceDetector, I);
% Draw boxes around detected faces and display results
I_faces = step(shapeInserter, I, int32(bbox));
imshow(I_faces), title('Detected faces');
%%
mouthDetector = vision.CascadeObjectDetector('ClassificationModel','Mouth');
% Draw boxes around detected mouths and display results
I_mouths = step(shapeInserter, I, int32(bbox));
imshow(I_mouths), title('Detected mouths');

%%
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='white_man.png';
outfilename = websave(filename,url);
I = imread('white_man.png');
imshow(I);shg;
bbox = step(mouthDetector, I);

mouthDetector = vision.CascadeObjectDetector('ClassificationModel','Mouth');
% Draw boxes around detected mouths and display results
I_mouths = step(shapeInserter, I, int32(bbox));
imshow(I_mouths), title('Detected mouths');

%%
url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='white_man.png';
outfilename = websave(filename,url);
I = imread('white_man.png');
imshow(I);shg;
bbox = step(mouthDetector, I);

mouthDetector = vision.CascadeObjectDetector('ClassificationModel','Nose');
% Draw boxes around detected mouths and display results
I_mouths = step(shapeInserter, I, int32(bbox));
imshow(I_mouths), title('Detected mouths');
