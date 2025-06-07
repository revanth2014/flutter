import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add the audioplayers package for music

void main() => runApp(const MJBoxApp());

class MJBoxApp extends StatelessWidget {
  const MJBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MJ Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple[900],
        colorScheme: ColorScheme.dark(
          secondary: Colors.tealAccent[400]!,
        ),
      ),
      home: const PlayerScreen(), // Home screen
    );
  }
}

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  // Function to play an audio file
  void _playAudio() async {
    await _audioPlayer.play(AssetSource('assets/music/test.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MJ Box'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _playAudio,
              child: const Text('Play Music'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose(); // Dispose of the audio player when not needed
  }
}
