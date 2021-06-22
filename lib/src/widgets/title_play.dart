import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:music_player/src/models/audioplayer_model.dart';

class TitlePlay extends StatefulWidget {
  @override
  _TitlePlayState createState() => _TitlePlayState();
}

class _TitlePlayState extends State<TitlePlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController playButtonAnimation;

  @override
  void initState() {
    playButtonAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    this.playButtonAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text("Far Away",
                  style: TextStyle(
                      fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text("-Breaking Benjamin-",
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.5)))
            ],
          ),
          Spacer(),

          //Play Button
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Color(0xffF8CB51),
              child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: playButtonAnimation),
              onPressed: () {
                final audioPlayerModel =
                    Provider.of<AudioPlayerModel>(context, listen: false);

                if (this.isPlaying) {
                  playButtonAnimation.reverse();
                  this.isPlaying = false;
                  audioPlayerModel.controller.stop();
                } else {
                  playButtonAnimation.forward();
                  this.isPlaying = true;
                  audioPlayerModel.controller.repeat();
                }
              }),
        ],
      ),
    );
  }
}
