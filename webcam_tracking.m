facedetector = vision.CascadeObjectDetector('ClassificationModel', 'FrontalFaceLBP');
cam = webcam();
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)}+30]);