import 'package:basic_player/widgets/coverWidget.dart';
import 'package:basic_player/widgets/playerProgressBar.dart';
import 'package:basic_player/widgets/controlBar.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          CoverWidget(),
          SizedBox(height: 40.0),
          PlayerProgressBar(),
          ControlBar()
        ],
      ),
    );
  }
}

