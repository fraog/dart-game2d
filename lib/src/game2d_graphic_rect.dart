import 'dart:html';
import 'package:rect2d/rect2d.dart';
import 'package:game2d/game2d.dart';

class GraphicRect implements Graphic {

  Rect2D rect;

  GraphicRect(this.rect);

  draw(CanvasRenderingContext2D ctx) {
    ctx.translate(this.rect.x, this.rect.y);
    //ctx.rotate(this.rect.angle);
    ctx.strokeRect(this.rect.left, this.rect.top, this.rect.w, this.rect.h);
  }
}
