import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class audioPlayerWidget extends StatefulWidget {
  const audioPlayerWidget({required this.audioPlayer, Key? key})
      : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  _audioPlayerWidgetState createState() => _audioPlayerWidgetState();
}

class _audioPlayerWidgetState extends State<audioPlayerWidget> {
  void onPlay() {
    // Add your code here
  }
  void onPause() {
    // Add your code here
  }
  void onStop() {
    // Add your code here
  }
  void onSliderChanged(double value) {
    // Add your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onPlay,
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () => onPause,
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => onStop,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
        value: 0, //_position.inSeconds.toDouble(),
        min: 0.0,
        max: 0, //_duration.inSeconds.toDouble(),
        onChanged: onSliderChanged);
  }
}
