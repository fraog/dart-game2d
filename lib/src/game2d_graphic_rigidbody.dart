import 'dart:html';
import 'package:rigidbody2d/rigidbody2d.dart';
import 'package:game2d/game2d.dart';

class GraphicRigidBody implements Graphic {

  RigidBody2D body;

  GraphicRigidBody(this.body);

  draw(CanvasRenderingContext2D ctx) {
    ctx.translate(this.body.x, this.body.y);
    ctx.rotate(this.body.rotation);
    ctx.strokeRect(this.body.left, this.body.top, this.body.w, this.body.h);
  }
}
