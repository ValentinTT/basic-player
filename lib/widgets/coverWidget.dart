import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:basic_player/models/currentPlaylist.dart';

class CoverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<CurrentPlaylist, Tuple2<String, String>>(
      selector: (_, _currentPlaylist) {
        if (_currentPlaylist.currentSong() == null)
          return Tuple2("Title", "Artist");
        return Tuple2(_currentPlaylist.currentSong().title,
            _currentPlaylist.currentSong().artist);
      },
      builder: (_, data, __) {
        String title = data.item1;
        String artist = data.item2;

        return Column(
          children: <Widget>[
            Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/img_aux/cover.jpg"),
                  ),
                )),
            SizedBox(height: 30.0),
            Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Marquee(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  animationDuration: Duration(seconds: title.split("").length~/10),
                  pauseDuration: Duration(seconds: 1),
                  directionMarguee: DirectionMarguee.oneDirection,
                )
            ),
            SizedBox(height: 10.0),
            Text(
              artist,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}
