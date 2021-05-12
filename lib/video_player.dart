import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

const CORRECT_VIDEO = '';
const PYVOTT_VIDEO =
    'https://videodelivery.net/47cb0f4335f30d79984f383af0ed6f12/manifest/video.m3u8';

// 'https://videodelivery.net/86deac884f73cc701b5e51a737b42576/manifest/video.m3u8';
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://videodelivery.net/de9244957b5d11e84aac2eed1d026c44/manifest/video.m3u8',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        print('Aspect ratio: ${_controller.value.aspectRatio}');
        print('Aspect height: ${_controller.value.size.height}');
        print('Aspect width: ${_controller.value.size.width}');
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
