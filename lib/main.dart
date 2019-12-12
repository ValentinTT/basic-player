import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MusicFinder audioPlayer = new MusicFinder();

  List<Song> _songs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () async {
                _songs;
                try {
                  _songs = await MusicFinder.allSongs();
                } catch (e) {
                  print(e.toString());
                }
                for (Song s in _songs) {
                  print(s.title);
                }
              },
              child: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.white,
              ),
              shape: CircleBorder(),
              padding: EdgeInsets.all(8.0),
              color: Colors.black,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: playSong,
                child: Icon(
                  Icons.play_arrow,
                  size: 30.0,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
                padding: EdgeInsets.all(8.0),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: pauseSong,
                child: Icon(
                  Icons.pause,
                  size: 30.0,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
                padding: EdgeInsets.all(8.0),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: stopSong,
                child: Icon(
                  Icons.stop,
                  size: 30.0,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
                padding: EdgeInsets.all(8.0),
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }

  void playSong() async {
    final result = audioPlayer.play(_songs[0].uri, isLocal: true);
  }

  void pauseSong() async {
    final result = audioPlayer.pause();
  }

  void stopSong() async {
    final result = audioPlayer.stop();
  }
}
