import 'dart:html';
import 'package:physics2d/physics2d.dart';
import 'package:game2d/game2d.dart';

void main() {
  //Setup the renderer with an html5 canvas and make full window.
  Renderer.canvas = querySelector('#canvas');
  Renderer.canvas.width = window.innerWidth;
  Renderer.canvas.height = window.innerHeight;
  Renderer.context = Renderer.canvas.getContext('2d');

  //Create test world
  Entity wall = new Entity("wall");
  wall.rigidbody = new RigidBody2D(Renderer.canvas.width/2.0, Renderer.canvas.height/2.0, 100, 100);
  wall.rigidbody.rotation = 0.5;
  wall.rigidbody.mass = 20.0;
  wall.graphic = new GraphicRigidBody(wall.rigidbody);

  num size = 50;

  //Above the wall.
  Entity test = new Entity("test");
  test.rigidbody = new RigidBody2D(wall.rigidbody.x, wall.rigidbody.y-350, size, size);
  test.graphic = new GraphicRigidBody(test.rigidbody);
  test.rigidbody.velocity = new Vector2D(0.0, 0.5);

  //Below the wall
  Entity test1 = new Entity("test1");
  test1.rigidbody = new RigidBody2D(wall.rigidbody.x, wall.rigidbody.y+350, size, size);
  test1.graphic = new GraphicRigidBody(test1.rigidbody);
  test1.rigidbody.velocity = new Vector2D(0.0, -0.7);

  //To the left of it
  Entity test2 = new Entity("test2");
  test2.rigidbody = new RigidBody2D(wall.rigidbody.x-350, wall.rigidbody.y, size, size);
  test2.graphic = new GraphicRigidBody(test2.rigidbody);
  test2.rigidbody.velocity = new Vector2D(0.4, 0.0);
  test2.rigidbody.rotation = -0.5;

  //To the right of it
  Entity test3 = new Entity("test3");
  test3.rigidbody = new RigidBody2D(wall.rigidbody.x+350, wall.rigidbody.y, size, size);
  test3.graphic = new GraphicRigidBody(test3.rigidbody);
  test3.rigidbody.velocity = new Vector2D(-1.0, 0.0);
  
  //Start
  Game.start();
}
