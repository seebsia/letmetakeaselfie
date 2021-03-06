facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

runLoop = true;
numPts = 0;
frameCount = 0;

while runLoop && frameCount < 1000
    