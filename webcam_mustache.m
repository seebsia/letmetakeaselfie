%Created by Alexis. We are using the eyes detector since it is the most
    % accurate and its size is comparable to the distance between nose and
    % mouth for the mustache. 
function webcam_mustache();
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'EyePairBig');

% Create the webcam object.
cam = webcam();

% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
%numPts = 0;
frameCount = 0;
%runLoop &&
while frameCount < 1000
    
    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;
    % Detection mode using eyes detector.
    bbox = faceDetector.step(videoFrame);
    
    % Display the annotated video frame using the video player object.
    %   step(videoPlayer, videoFrame);
    %hold on    
    if ~isempty(bbox)
        videodouble = im2double(videoFrame);
        x = zeros(size(videodouble));
        image(videodouble);
        mustache = im2double(imread('images/moustache.png'));
        % Resize mustache image. Set mustache to halfway down face.
        hold on
        mustache = imresize(mustache, [(bbox(4) + 1) (bbox(3) + 1)]);
        x(bbox(2)+bbox(4)*2:bbox(2) + bbox(4)*3, bbox(1):bbox(1) + bbox(3), :) = mustache;
        % Transparency & Overlay of Mustache on Image
        im = image(x);
        im.AlphaData = max(x, [], 3);
        hold off

    end   
      pause(.1);
        % Check whether the video player window has been closed.
      %  runLoop = isOpen(videoPlayer);
    end
    % Clean up.
    clear cam;
    release(videoPlayer);
    release(faceDetector);
    end
