%was an initial attempt to use the negative filter with a webcam but
%ultimately we put it inside the webcam_color filter and changed the way we made a negative image
facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
numPts = 0;
frameCount = 0;

while runLoop && frameCount < 1000
    [1, b] = size(I);
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