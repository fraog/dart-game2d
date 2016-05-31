import 'dart:html';
import 'package:physics2d/physics2d.dart';
import 'package:game2d/game2d.dart';

class GraphicRigidBody implements Graphic {

  RigidBody2D body;

  GraphicRigidBody(this.body);

  draw(CanvasRenderingContext2D ctx) {
    ctx.translate(this.body.x, this.body.y);
    ctx.rotate(this.body.rotation);
    ctx.strokeRect(-this.body.hw, -this.body.hh, this.body.w, this.body.h);
    ctx.rotate(-this.body.rotation);
    ctx.translate(-this.body.x, -this.body.y);

    /*
    //DEBUG: Show points

    if (this.body.overlaps != null && this.body.overlaps.length > 0) {
      var c = 0;
      for (Vector2D overlap in this.body.overlaps) {
          ctx.translate(this.body.x, this.body.y);
          ctx.rotate(this.body.rotation);
          var saved = ctx.strokeStyle;
          if (c < 4) {
            ctx.strokeStyle="#FF0000";
          } else if (c < 8) {
            ctx.strokeStyle="#0000FF";
          } else {
            ctx.strokeStyle="#33cc33";
          }
          ctx.beginPath();
          ctx.moveTo(0, 0);
          ctx.lineTo(overlap.x, overlap.y);
          ctx.stroke();
          ctx.strokeStyle = saved;
          ctx.rotate(-this.body.rotation);
          ctx.translate(-this.body.x, -this.body.y);
          c++;
      }
    }
    */
  }


}
