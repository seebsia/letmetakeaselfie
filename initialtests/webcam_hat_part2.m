    facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
frameCount = 0;


while runLoop && frameCount < 1000
        % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;
    
    bboxes = facedetector.step(videoFrame);

    gradcap = imread('grad_cap_neon.png');
    gradcap = imresize(gradcap, [360 640]);
    grad_cap_webcam = im2double(videoFrameGray);
    x = imoverlay(grad_cap_webcam,gradcap);
    figure
    imshow(x)
    
    step(videoPlayer, x);
        
    runLoop = isOpen(videoPlayer);
    release(videoPlayer);
    release(facedetector);
    
end
clear cam;