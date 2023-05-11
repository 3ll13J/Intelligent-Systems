%Loading the face detector
faceDetector = vision.CascadeObjectDetector();
%Creating a video reader object
videoFile = 'face.mov';
videoReader = vision.VideoFileReader(videoFile);
%Creating a video player object
videoPlayer = vision.VideoPlayer('Position', [100 100 [640, 480]+30]);

while ~isDone(videoReader)
    %Read a frame from the video
    frame = step(videoReader);

    %Detect faces within the frame
    Box = step(faceDetector, frame);

    %Draw a box around each frame
    for i = 1:size(Box, 1)
        frame = insertShape(frame, 'Rectangle', Box(i,:), 'LineWidth', 2, 'Color', 'red');
    end
    %Display the frame with the face boxes
    step(videoPlayer, frame);
end

%Release resources
release(videoReader);
release(videoPlayer);
