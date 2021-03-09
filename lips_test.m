%Created by Alexis. Note: The Mouth detector is quite poor and frequently detects
%eyes or circles in the background.
function lips_test();
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'Mouth');

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
    % Detection mode.
    bbox = faceDetector.step(videoFrameGray);
    
    
      % Display the annotated video frame using the video player object.
    %   step(videoPlayer, videoFrame);
    %hold on    
    if ~isempty(bbox)
        bbox = bbox(1,:);
        videodouble = im2double(videoFrame);
        x = zeros(size(videodouble));
        image(videodouble);
        lips = im2double(imread('../images/lips.png'));
        % Resize lips image. Set lips to detected lips box location
        hold on
        lips = imresize(lips,[bbox(4) (bbox(3) + 1)]);
        x(bbox(2)+1:bbox(2)+bbox(4),bbox(1):bbox(1) + bbox(3), :) = lips;
        % Transparency & Overlay of Lips on Image
        im = image(x);
        im.AlphaData = max(x, [], 3);
        hold off

    end   
      pause(.1);
      % Check whether the video player window has been closed.
      % runLoop = isOpen(videoPlayer);
    end
    % Clean up.
    clear cam;
    release(videoPlayer);
    release(faceDetector);
