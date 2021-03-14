import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class MyLyrePage extends StatefulWidget {
  @override
  _MyLyrePageState createState() => _MyLyrePageState();
}

class _MyLyrePageState extends State<MyLyrePage> {
  static AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioPlayerCache = AudioCache(fixedPlayer: audioPlayer);

  bool isPlaying = false;
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      print("$state");
      if (state == AudioPlayerState.PLAYING) {
        setState(() {
          isPlaying = true;
        });
      } else {
        if (mounted) {
          setState(() {
            isPlaying = false;
          });
        }
      }
    });
  }

  @override
  void dispose() async {
    await audioPlayer.release();
    await audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _noteBar(noteSound: 1, barColor: Colors.red),
        _noteBar(noteSound: 2, barColor: Colors.orange),
        _noteBar(noteSound: 3, barColor: Colors.yellow),
        _noteBar(noteSound: 4, barColor: Colors.green),
        _noteBar(noteSound: 5, barColor: Colors.blue),
        _noteBar(noteSound: 6, barColor: Colors.indigo),
        _noteBar(noteSound: 7, barColor: Colors.purple),
      ],
    );
  }

  Expanded _noteBar({int noteSound, Color barColor}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _playSound(noteSound);
        },
        child: Container(
          decoration: BoxDecoration(
            color: barColor,
          ),
        ),
      ),
    );
  }

  void _playSound(int noteNumber) {
    // final player = AudioCache();
    // player.play('note$noteNumber.wav');
    audioPlayerCache.play('note$noteNumber.wav');
  }
}
