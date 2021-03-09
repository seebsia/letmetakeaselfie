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

    videodouble = im2double(videoFrame);
    x = zeros(size(videodouble));
    image(videodouble);
    gradcap = im2double(imread('grad_cap_neon.png'));

    % Resize gradcap image.
    hold on
    gradcap = imresize(gradcap,[bboxes(2) (bboxes(3) + 1)]);
    x(1:bboxes(2),bboxes(1):bboxes(1) + bboxes(3), :) = gradcap;
    im = image(x);
    im.AlphaData = max(x, [], 3);
    hold off

    % Display the annotated video frame using the video player object.
  
    step(videoPlayer, x);
        
    runLoop = isOpen(videoPlayer);
    release(videoPlayer);
    release(facedetector);
    
end
clear cam;

