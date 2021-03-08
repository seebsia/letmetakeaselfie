facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
numPts = 0;
frameCount = 0;
disp('Welcome to the Big Brain Senior Photo Booth!')
a = input('Would you like a color filter or an object filter? \n', 's');
if strcmpi(a, 'color filter') || strcmpi(a, 'color')
    disp('Available Color Filters: ');
    disp('Red, Blue, Green Purple, Pink, Orange, Yellow, XRay, Gray XRay, None');
    c = input('Please type the color filter you would like: \n', 's');
else strcmpi(a, 'object filter') || strcmpi(a, 'object');
    disp('Available Object Filters: ');
    disp('Glasses, Hat, Hearts');
    o = input('Please type the object filter you would like: \n', 's');
end

% % This while loop does the color changing. 
while runLoop && frameCount < 1000

    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame); 
    frameCount = frameCount + 1;
    
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
        
    runLoop = isOpen(videoPlayer);

end


% %  Insert while loop for glasses (use o for object filter answers)
% if strcmpi(o, 'glasses')
% end


% % Insert while loop for hat (use o for object filter answers)
% if strcmpi(o, 'hat')
% end


% % Insert while loop for hearts (use o for object filter answers)
% if strcmpi(o, 'hearts')
% end


