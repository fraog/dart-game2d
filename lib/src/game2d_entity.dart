import 'dart:collection';
import 'package:physics2d/physics2d.dart';
import 'package:game2d/game2d.dart';

class Entity {

  static HashMap<String, Entity> Cache = new HashMap<String, Entity>();

  String name;
  RigidBody2D _rigidbody = null;
  Graphic graphic = null;
  Script script = null;

  Entity(String name) {
    int count = 0;
    while (Cache.containsKey(name)) {
      name = name+count.toString();
    }
    this.name = name;
    Cache[name] = this;
  }

  //Getter/Setter for rigidbody, automatically updates Physics.Cache.
  RigidBody2D get rigidbody => this._rigidbody;
  void set rigidbody(RigidBody2D b) {
    this._rigidbody = b;
    Physics.Cache[this.name] = this._rigidbody;

  }


}
