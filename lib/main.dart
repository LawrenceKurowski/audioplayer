import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'audio_player.dart';

AudioPlayer audioPlayer = AudioPlayer();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp(audioPlayer: audioPlayer));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.audioPlayer, super.key});

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: audioPlayerWidget(audioPlayer: audioPlayer),
    );
  }
}
