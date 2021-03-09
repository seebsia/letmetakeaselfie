url='https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=600&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=41f875a9595720f2637f9c3d11f7307d';
in_img = url;
filename ='../images/white_man.png';
outfilename = websave(filename,url);
I = imread('../images/white_man.png');


% Change Image to Negative (Color)

[a, b] = size(I);
for x = 1:a
  for c = 1:b
      neg(x, c) = 255 - I(x, c);
  end
end


figure
image(neg)
axis image
axis off 
title 'Color Negative'

% Change Image to Negative (Gray)

[a, b] = size(I);
for x = 1:a
  for c = 1:b
      neg(x, c) = 255 - I(x, c);
  end
end

figure
image(neg)
colormap(gray(256));
axis image
axis off 
title 'Grayscale Negative'