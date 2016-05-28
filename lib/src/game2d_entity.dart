import 'dart:collection';
import 'package:game2d/game2d.dart';
import 'package:rigidbody2d/rigidbody2d.dart';

class Entity {

  static HashMap<String, Entity> Cache = new HashMap<String, Entity>();

  String name;
  RigidBody2D rigidbody = null;
  Graphic graphic = null;

  Entity(String name) {
    int count = 0;
    while (Cache.containsKey(name)) {
      name = name+count.toString();
    }
    this.name = name;
    Cache[name] = this;
  }
}
