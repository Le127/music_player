import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;

  Duration _songDuration = Duration(milliseconds: 0);
  Duration _current = Duration(milliseconds: 0);

  double get porcentaje => (this._songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);

  late AnimationController _controller;

//Controller
  set controller(AnimationController valor) {
    this._controller = valor;
  }

  AnimationController get controller => this._controller;

//Playing
  bool get playing => this._playing;

  set playing(bool valor) {
    this._playing = valor;
    notifyListeners();
  }

//SongDuration

  Duration get songDuration => this._songDuration;

  set songDuration(valor) {
    this._songDuration = valor;
  }

//Current
  Duration get current => this._current;

  set current(valor) {
    this._current = valor;
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }
}
