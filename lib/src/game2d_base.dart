// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';


class Vector2D {

  num x;
  num y;

  Vector2D(num x, num y) {
    this.x = x;
    this.y = y;
  }

}

num magnitude(num x, num y) {
  return sqrt(x*x + y*y);
}
