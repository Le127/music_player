import 'package:flutter/material.dart';

import 'package:music_player/src/widgets/cd_duration_line.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:music_player/src/widgets/lyrics.dart';
import 'package:music_player/src/widgets/title_play.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),
          Column(
            children: [
              CustomAppBar(),
              CdDurationLine(),
              TitlePlay(),
              Expanded(
                child: Lyrics(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//======Background======

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.center,
            colors: [Color(0xff33333E), Color(0xff201E28)],
          )),
    );
  }
}
