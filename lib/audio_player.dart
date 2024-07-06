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
  void onSliderChanged(double value) {
    // Add your code here
  }

  late Future<double> durationFuture;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    widget.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            slider(),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: () {
                    if (isPlaying) {
                      widget.audioPlayer.pause();
                    } else {
                      widget.audioPlayer.play(AssetSource("0.mp3"));
                    }
                    ;
                  }),
            ),
          ],
        ),
      ),
    );
  }

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatLabel(_position) {
    return "${_position.inSeconds.toString()}:${(_position.inMilliseconds / 100).toInt().toString()}";
  }

  Widget slider() {
    return Slider(
      value:
          position.inMilliseconds.toDouble(), //_position.inSeconds.toDouble(),
      min: 0.0,
      divisions: 100,
      max: duration.inMilliseconds.toDouble(),
      label: formatLabel(position),
      onChanged: (value) {
        setState(() {
          position = Duration(milliseconds: value.toInt());
        });
        widget.audioPlayer.seek(Duration(milliseconds: value.toInt()));
      },
    );
  }
}
