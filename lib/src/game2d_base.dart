// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

class Game {

  static double startTime;
  static double gameTicks;

  static Timer timer;

  static void start() {
    if (timer != null) return;
    timer = new Timer.periodic(40, Game.update);
  }

  static void update() {
      //Do stuff, update all game entities.
      gameTicks++;
      print("ticks:"+gameTicks);
  }

}
