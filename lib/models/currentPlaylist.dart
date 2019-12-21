import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class CurrentPlaylist with ChangeNotifier {
  List<Song> playlist = [];
  MusicFinder audioPlayer = MusicFinder();
  int _currentSong = 0;
  bool isPlaying = false;
  bool updatingPosition = false;
  Duration position = Duration(seconds: 0);
  Duration duration = Duration(seconds: 0);

  CurrentPlaylist();

  void prevSong() {
    if(_currentSong > 0) {
      _currentSong --;
      position = Duration(seconds: 0);
      duration = Duration(milliseconds: playlist[_currentSong].duration);
      // DO NOT call the stopSong and playSong methods, they invoke the notifyListeners method which rebuild many widgets
      audioPlayer.stop();
      if(isPlaying) audioPlayer.play(playlist[_currentSong].uri, isLocal: true);
      notifyListeners();
    }
  }

  void nextSong() {
    if(_currentSong < playlist.length  - 1) {
      _currentSong ++;
      position = Duration(seconds: 0);
      duration = Duration(milliseconds: playlist[_currentSong].duration);
      // DO NOT call the stopSong and playSong methods, they invoke the notifyListeners method which rebuild many widgets
      audioPlayer.stop();
      if(isPlaying) audioPlayer.play(playlist[_currentSong].uri, isLocal: true);
    } else {
      isPlaying = false;
    }
    notifyListeners();
  }

  Song currentSong() {
    if (playlist.isNotEmpty) return playlist[_currentSong];
    return null;
  }

  static String formatSecondsToString(int seconds) {
    String m = (seconds ~/ 60).toString().padLeft(2, '0');
    String s = (seconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  void findSongs() async{
    playlist = await MusicFinder.allSongs();
    _currentSong = 0;
    notifyListeners();
  }

  void playSong() {
    audioPlayer.play(playlist[_currentSong].uri, isLocal: true);
    isPlaying = true;
    audioPlayer.setDurationHandler((Duration d) {
      duration = d;
    });
    audioPlayer.setPositionHandler((Duration p) {
      if(!updatingPosition) position = p;
      notifyListeners();
    });
    audioPlayer.setCompletionHandler((){
      nextSong();
    });
    notifyListeners();
  }

  void pauseSong() {
    audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void stopSong() {
    audioPlayer.stop();
    isPlaying = false;
    notifyListeners();
  }

  void setPosition(newPosition) {
    audioPlayer.seek(newPosition);
    updatingPosition = false;
  }

}