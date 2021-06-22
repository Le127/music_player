import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:music_player/src/models/audioplayer_model.dart';

class CdDurationLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: [
          ImageCD(),
          SizedBox(width: 20),
          ProgressLine(),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}

//======PROGRESS LINE======
class ProgressLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white.withOpacity(0.4));

    return Container(
      child: Column(
        children: [
          Text("04:23", style: textStyle),
          SizedBox(height: 7),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 100,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Text("00:00", style: textStyle),
        ],
      ),
    );
  }
}

//===============================

//
//======IMAGE CD======
class ImageCD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //
            //CD Image
            SpinPerfect(
              duration: Duration(seconds: 10),
              animate: false,
              infinite: true,
              manualTrigger: true,
              controller: (animationController) =>
                  audioPlayerModel.controller = animationController,
              child: Image(image: AssetImage('assets/aurora.jpg')),
            ),

            //CircleCD
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),

            //CircleCDExternal
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Color(0xff1C1C25),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}
//===============================
