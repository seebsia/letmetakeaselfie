%created by Cassandra. Code from webcam_hat but was debugged to fix the
%transparency issue that was occuring with the gradcap iamge
%this function superimposes a hat onto the head of the user in the webcam
function webcam_hat_debugtest()
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');

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
        videodouble = im2double(videoFrame);
        x = zeros(size(videodouble));
        image(videodouble);
        gradcap = im2double(imread('images/grad_cap_neon.png'));
        % Resize sunglasses image. Set sunglasses to detected eye box ocation
        hold on
        gradcap = imresize(gradcap,[bbox(2) (bbox(3) + 1)]);
        x(1:bbox(2),bbox(1):bbox(1) + bbox(3), :) = gradcap;
        % Transparency & Overlay of Sunglasses on Guy Image
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
