eyesdetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');
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
    
    bboxes = eyesdetector.step(videoFrame);
    % Places box over where eyes are detected
    
    if isempty(bboxes)
        return
    end
    % Bringing in the sunglasses and person photos
    videodouble = im2double(videoFrame);
    x = zeros(size(videodouble));
    image(videodouble);
    hearts = im2double(imread('hearts.png'));

    % Resize sunglasses image. Set sunglasses to detected eye box location
    hold on
    hearts = imresize(hearts, [(bboxes(4) + 1) (bboxes(3) + 1)]);
    x(bboxes(2):bboxes(2) + bboxes(4), bboxes(1):bboxes(1) + bboxes(3), :) = hearts;
    
    % Transparency & Overlay of Sunglasses on Person
    im = image(x);
    im.AlphaData = max(x, [], 3);
    hold off

    
    % Display the annotated video frame using the video player object.
  
    step(videoPlayer, x);
        
    runLoop = isOpen(videoPlayer);
    release(videoPlayer);
    release(eyesdetector);
end
clear cam;