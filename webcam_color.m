function color()
%create the face detector object and webcam object
facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

%create a variable that takes a snapshot of each frame and gets its size
%creates a video player object
videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

%sets up the initializations for the while loop to continue increasing by
%one frame
runLoop = true;
frameCount = 0;
% Continue to ask which filter the user wants. 

disp('Available Color Filters: ');
disp('Red, Blue, Green Purple, Pink, Orange, Yellow, XRay, Gray XRay, None');
c = input('Please type the color filter you would like: \n', 's');

% This while loop does the color changing. 
while runLoop && frameCount < 1000

    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame); 
    frameCount = frameCount + 1;
    
    %condition statements that takes into account the users input and
    %displays the desired color filter
    if strcmpi(c, 'red')
        red = cat(3, videoFrameGray, zeros(size(videoFrameGray)), zeros(size(videoFrameGray)));
        step(videoPlayer, red);
    elseif strcmpi(c, 'blue')
        blueimg = cat(3, zeros(size(videoFrameGray)), zeros(size(videoFrameGray)), videoFrameGray);
        step(videoPlayer, blueimg);
    elseif strcmpi(c, 'green')
        greenimg = cat(3, zeros(size(videoFrameGray)), videoFrameGray, zeros(size(videoFrameGray)));
        step(videoPlayer, greenimg);
    elseif strcmpi(c, 'purple')
        purpleimg = cat(3, 0.7*videoFrameGray, 0.27*videoFrameGray, 1*videoFrameGray);
        step(videoPlayer, purpleimg);
    elseif strcmpi(c, 'pink')
        pinkimg = cat(3, 1.0*videoFrameGray, 0.0745*videoFrameGray, 0.6510*videoFrameGray);
        step(videoPlayer, pinkimg);
    elseif strcmpi(c, 'orange')
        orangeimg = cat(3, 1.0*videoFrameGray, 0.4118*videoFrameGray, 0.1608*videoFrameGray);
        step(videoPlayer, orangeimg);
    elseif strcmpi(c, 'yellow')
        yellowimg = cat(3, 1.0*videoFrameGray, 1.0*videoFrameGray, zeros(size(videoFrameGray)));
        step(videoPlayer, yellowimg); 
    elseif strcmpi(c, 'xray')
        negative = imcomplement(videoFrame);
        step(videoPlayer, negative);
    elseif strcmpi(c, 'gray xray')
        negativegray = imcomplement(videoFrameGray);
        step(videoPlayer, negativegray);
    else strcmpi(c, 'none');
        step(videoPlayer, videoFrame);
    end 
   
   %Checks for whether the videoplayer has closed or not
   runLoop = isOpen(videoPlayer);

end

%Clean everything up
clear cam;
release(videoPlayer);
release(facedetector);

end


