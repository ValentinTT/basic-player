import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../models/currentPlaylist.dart';

class PlayerProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //TODO: Check because using Selector here might be unnecessary
      Selector<CurrentPlaylist, Tuple2<double, double>>(
        selector: (_, _currentPlaylist) => Tuple2(
            _currentPlaylist.position.inSeconds.toDouble(),
            _currentPlaylist.duration.inSeconds.toDouble()
        ),
        builder: (_, data, __) {
          double position = data.item1;
          double duration = data.item2;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(CurrentPlaylist.formatSecondsToString(position.toInt())),
              Container(
                  width: 250.0,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red,
                      inactiveTrackColor: Colors.black,
                      trackHeight: 3.0,
                      thumbColor: Colors.yellow,
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      overlayColor: Colors.purple.withAlpha(32),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 14.0),
                    ),
                    child: Slider(
                      value: position,
                      max: duration,
                      min: 0.0,
                      onChangeStart: (_) =>
                        Provider.of<CurrentPlaylist>(context, listen: false)
                            .updatingPosition = true,
                      onChanged: (double newValue) =>
                        Provider.of<CurrentPlaylist>(context, listen: false)
                            .position = Duration(seconds: newValue.toInt()),
                      onChangeEnd: (double newValue) =>
                        Provider.of<CurrentPlaylist>(context, listen: false)
                            .setPosition(newValue),
                    ),
                  )),
              Text(CurrentPlaylist.formatSecondsToString(duration.toInt())),
            ],
          );
        },
      );
  }
}
