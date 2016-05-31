import 'dart:async';
import 'package:physics2d/physics2d.dart';
import 'package:game2d/game2d.dart';

class Game {

  static num gameTicks = 0;
  static Duration updateInterval = new Duration(milliseconds: 100);
  static double DesiredFrameRate = 60.0;
  
  static Timer timer;

  static void start() {
    if (timer != null) return;
    print("starting game loop.");
    timer = new Timer.periodic(updateInterval, Game.update);
    //TODO: startTime

    Physics.TimeScale = DesiredFrameRate/(1000/Physics.updateInterval.inMilliseconds);
    Physics.start();
  }

  static void update(Timer t) {
      gameTicks++;

      //TODO: Timescale/framerate control
      //FIXME: START NAIVE
      Renderer.clear();
      for (Entity entity in Entity.Cache.values) {
        if (entity.graphic != null) Renderer.render(entity.graphic);
        if (entity.script != null) entity.script.update(entity);
      }
      //FIXME: END NAIVE
  }

}
