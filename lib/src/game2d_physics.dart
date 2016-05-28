import 'package:game2d/game2d.dart';
import 'package:vector2d/vector2d.dart';
import 'package:rigidbody2d/rigidbody2d.dart';

/*
 *
 *  This whole thing will change.
 *  It will have its own loop at its own timescale (with a desired fps in mind).
 *  We will have a unique storage structure that faciilitates quick collision checking with neighbors.
 *
 */
class Physics {

  static double TimeScale = 1.0;

  static bool update(RigidBody2D body) {
    if (body.velocity.x != 0 || body.velocity.y != 0 || body.angularVelocity != 0) {
      body.add(body.velocity*TimeScale);
      body.rotation += body.angularVelocity;
      if (body.rotation > 6.283) body.rotation -= 6.283;
      return true;
    }
    return false;
  }

  static bool CollisionBroadPhase(RigidBody2D body, RigidBody2D other) {
    /*
     * Get bounds and check.
     *
     * If we make one rigidbody relative to the other, we can then rotate those vectors.
     * It would be nice if we didn't do any rotation though.
     *
     * What if we checked a sphere represnting the max size of a side.
     * In other words, are our bounding spheres overlapping.
     * This would almost always be true for a long skinny bounding box.
     *
     */
    Vector2D diff = body - other;
    diff.positive();
    num maxdist = body.maxr+other.maxr;
    return (diff.x < maxdist && diff.y < maxdist);
  }

  static bool CollisionNarrowPhase(RigidBody2D body, RigidBody2D other) {
    /**
     * TODO: Implement separating axis theorem.
     */
    return true;
  }

  static void ResolveCollisions(RigidBody2D body) {
    /*
     * We will definitely not be going through the entity cache to do this.
     */
     for (Entity other in Entity.Cache.values) {
       if (body == other.rigidbody) continue;
       if (CollisionBroadPhase(body, other.rigidbody) && CollisionNarrowPhase(body, other.rigidbody)) {
         /**
          * TODO: Resolve the collision, apply force based on impact. moment of inertia yadda
          */
          //TEMP
          body.velocity.x = 0;
          body.velocity.y = 0;
          other.rigidbody.velocity.x = 0;
          other.rigidbody.velocity.y = 0;
       }
     }

  }



}
