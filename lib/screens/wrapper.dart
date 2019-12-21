import 'package:basic_player/models/currentPlaylist.dart';
import 'package:basic_player/screens/player/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> popUpOptions = ["Refresh", "Stop"];

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrentPlaylist _currentPlaylist = Provider.of<CurrentPlaylist>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        //TODO: Decide if the app bar should have the song's name and singer, provably using provider
        title: Text("Playlist"),
        centerTitle: true,
        leading: RaisedButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => print("Back"),// SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          color: Colors.transparent,
          elevation: 0.0,
          shape: CircleBorder(),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
              initialValue: popUpOptions[0],
              tooltip: "Options",
              itemBuilder: (BuildContext context) => popUpOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onSelected: (String option) {
                switch(option) {
                  case "Refresh":{
                    _currentPlaylist.findSongs();
                  }break;
                  case "Stop": {
                    _currentPlaylist.stopSong();
                  }break;
                }
              },
            ),
        ],
      ),
      body: Player(),
    );
  }
}