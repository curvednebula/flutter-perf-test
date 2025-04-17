import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() => runApp(GameWidget(game: MyGame()));

class MyGame extends FlameGame {
  final List<SpriteComponent> sprites = [];

  @override
  Future<void> onLoad() async {
    final rnd = Random();
    final image = await images.load('bunny.png');

    for (int i = 0; i < 10_000; i++) {
      final sprite = SpriteComponent(
        sprite: Sprite(image),
        position: Vector2(rnd.nextDouble() * size.x, rnd.nextDouble() * size.y),
        // size: Vector2(32, 32),
        anchor: Anchor(0.5, 0.5)
      );

      add(sprite);
      sprites.add(sprite);
    }

    add(FpsTextComponent(position: Vector2(10, 10)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    for (var spr in sprites) {
      spr.angle += 1 * dt;
    }
  }
}

