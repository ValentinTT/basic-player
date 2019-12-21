import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/currentPlaylist.dart';

class ControlBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrentPlaylist _currentPlaylist =
        Provider.of<CurrentPlaylist>(context, listen: false);
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: _currentPlaylist.prevSong,
          child: Icon(
            Icons.skip_previous,
            size: 40.0,
            color: Colors.white,
          ),
          shape: CircleBorder(),
          padding: EdgeInsets.all(10.0),
          color: Colors.black54,
        ),
        Selector<CurrentPlaylist, bool>(
          selector: (_, _currentPlaylist) => _currentPlaylist.isPlaying,
          builder: (_, isPlaying, __) => RaisedButton(
            onPressed: isPlaying
                ? _currentPlaylist.pauseSong
                : _currentPlaylist.playSong,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 50.0,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0),
            color: Colors.black54,
          ),
        ),
        RaisedButton(
          onPressed: _currentPlaylist.nextSong,
          child: Icon(
            Icons.skip_next,
            size: 40.0,
            color: Colors.white,
          ),
          shape: CircleBorder(),
          padding: EdgeInsets.all(10.0),
          color: Colors.black54,
        )
      ],
    );
  }
}
