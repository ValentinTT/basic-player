import 'package:basic_player/models/currentPlaylist.dart';
import 'package:basic_player/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
        //TODO: Design a theme, and a dark theme
        primarySwatch: Colors.orange),
    title: "Music player",
    home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CurrentPlaylist>(
              create: (_) => CurrentPlaylist()
          )
        ],
        child: Wrapper()
    )
));
