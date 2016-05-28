import 'dart:async';
import 'dart:collection';
import 'package:game2d/game2d.dart';

class Game {

  static double startTime;
  static num gameTicks = 0;

  static Duration updateInterval = new Duration(milliseconds: 100);
  static Timer timer;

  static void start() {
    if (timer != null) return;
    print("starting game loop.");
    timer = new Timer.periodic(updateInterval, Game.update);
    //TODO: startTime
  }

  static void update(Timer t) {
      gameTicks++;
      /*
       * Actually, there should ideally be three loops:
       * Physics, Logic, and Rendering operate at different intervals.
       *
       * The individual loop method also allows us to do more preprocessing and change the way we store the data.
       */
      //TODO: Timescale/framerate control

      //FIXME: START NAIVE
      Renderer.clear();

      Queue<Entity> moved = new Queue<Entity>();

      for (Entity entity in Entity.Cache.values) {

        if (entity.rigidbody != null) {
          if (Physics.update(entity.rigidbody)) {
            moved.add(entity);
          }

        }

        if (entity.graphic != null) {
          Renderer.render(entity.graphic);
        }

      }


      while (moved.length > 0) {
        Physics.ResolveCollisions(moved.removeFirst().rigidbody);
      }

      //FIXME: END NAIVE



  }

}
