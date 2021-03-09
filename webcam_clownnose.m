% Created by Cassandra
% In this function we use nose detector to superimpose a clown nose image
% onto the detected nose. 
function webcam_clownnose()
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector('ClassificationModel', 'Nose');

% Create the webcam object.
cam = webcam();

% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
frameCount = 0;
H = figure;
while runLoop && frameCount < 1000
    
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
        clown_nose = im2double(imread('images/clown_nose.png'));
        % Resize clown nose image. Set clown nose to halfway down face.
        hold on
        clown_nose = imresize(clown_nose, [(bbox(4) + 1) (bbox(3) + 1)]);
        x(bbox(2):bbox(2) + bbox(4), bbox(1):bbox(1) + bbox(3), :) = clown_nose;
        % Transparency & Overlay of Clown Nose on Image
        im = image(x);
        im.AlphaData = max(x, [], 3);
        hold off
        
    end
    pause(.1);
    % Check whether the figure window has been closed.
    runLoop = isgraphics(H);
end

% Clean up.
clear cam;
release(videoPlayer);
release(faceDetector);

end