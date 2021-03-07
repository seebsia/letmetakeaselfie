facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
numPts = 0;
frameCount = 0;
x = input('What color? \n', 's');
while runLoop && frameCount < 1000

    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame); 
    frameCount = frameCount + 1;
    
    if strcmpi(x, 'red')
        red = cat(3, videoFrameGray, zeros(size(videoFrameGray)), zeros(size(videoFrameGray)));
        step(videoPlayer, red);
    elseif strcmpi(x, 'blue')
        blueimg = cat(3, zeros(size(videoFrameGray)), zeros(size(videoFrameGray)), videoFrameGray);
        step(videoPlayer, blueimg);
    elseif strcmpi(x, 'green')
        greenimg = cat(3, zeros(size(videoFrameGray)), videoFrameGray, zeros(size(videoFrameGray)));
        step(videoPlayer, greenimg);
    elseif strcmpi(x, 'purple')
        purpleimg = cat(3, 0.7*videoFrameGray, 0.27*videoFrameGray, 1*videoFrameGray);
        step(videoPlayer, purpleimg);
    elseif strcmpi(x, 'pink')
        pinkimg = cat(3, 1.0*videoFrameGray, 0.0745*videoFrameGray, 0.6510*videoFrameGray);
        step(videoPlayer, pinkimg);
    elseif strcmpi(x, 'orange')
        orangeimg = cat(3, 1.0*videoFrameGray, 0.4118*videoFrameGray, 0.1608*videoFrameGray);
        step(videoPlayer, orangeimg);
    elseif strcmpi(x, 'yellow')
        yellowimg = cat(3, 1.0*videoFrameGray, 1.0*videoFrameGray, zeros(size(videoFrameGray)));
        step(videoPlayer, yellowimg); 
    elseif strcmpi(x, 'xray')
        negative = imcomplement(videoFrame);
        step(videoPlayer, negative);
    elseif strcmpi(x, 'gray xray')
        negativegray = imcomplement(videoFrameGray);
        step(videoPlayer, negativegray);
    else strcmpi(x, 'none');
        step(videoPlayer, videoFrame);
    end 
        
    runLoop = isOpen(videoPlayer);

end