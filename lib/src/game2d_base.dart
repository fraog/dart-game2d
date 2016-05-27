// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

class Game {

  static double startTime;
  static double gameTicks;

  static Duration updateInterval = new Duration(milliseconds: 100);
  static Timer timer;

  static void start() {
    if (timer != null) return;
    print("starting game loop.");
    timer = new Timer.periodic(updateInterval, Game.update);
  }

  static void update(Timer t) {
      //Do stuff, update all game entities.
      gameTicks++;
      //print("ticks:"+gameTicks);
      print("boop");
  }

}
