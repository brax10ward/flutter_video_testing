import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BasicPlayerPage extends StatefulWidget {
  @override
  _BasicPlayerPageState createState() => _BasicPlayerPageState();
}

class _BasicPlayerPageState extends State<BasicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic player"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Basic player created with the simplest factory method. Shows video from URL.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            BetterPlayer.network(
              'https://videodelivery.net/de9244957b5d11e84aac2eed1d026c44/manifest/video.m3u8',
              betterPlayerConfiguration:
                  BetterPlayerConfiguration(aspectRatio: 9 / 16),
            ),
          ],
        ),
      ),
    );
  }
}
