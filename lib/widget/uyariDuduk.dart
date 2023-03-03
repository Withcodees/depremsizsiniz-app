import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class UyariDuduk extends StatelessWidget {
  final audioPlayer = AudioPlayer();
  String url = "../assets/uyari.mp3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uyarı Duduk'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.deepPurple[200],
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset("assets/duduk.png"),
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.play(UrlSource(url));
                },
                icon: const Icon(Icons.sports),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
