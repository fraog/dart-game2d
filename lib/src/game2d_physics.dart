import 'package:game2d/game2d.dart';
import 'package:rigidbody2d/rigidbody2d.dart';

class Physics {

  static double TimeScale = 1.0;

  static void update(RigidBody2D body) {
    body.x += body.vel_x * TimeScale;
    body.y += body.vel_y * TimeScale;
  }



}
