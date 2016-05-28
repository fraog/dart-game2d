import 'dart:html';
import 'package:game2d/game2d.dart';

class Renderer {

  static CanvasElement canvas;
  static CanvasRenderingContext2D context;

  static void clear() {
    context.fillStyle = "white";
    context.fillRect(0, 0, canvas.width, canvas.height);
  }

  static void render(Graphic g) {
    g.draw(context);
  }
}
