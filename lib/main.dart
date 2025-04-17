import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() => runApp(GameWidget(game: MyGame()));

class MyGame extends FlameGame {
  late SpriteBatch spriteBatch;

  @override
  Future<void> onLoad() async {
    final image = await images.load('spritesheet.png');
    spriteBatch = SpriteBatch(image);

    // Add sprites to the batch
    final spriteSize = Vector2(32, 32);
    for (int i = 0; i < 10; i++) {
      spriteBatch.add(
        source: Rect.fromLTWH(0, 0, 32, 32),
        offset: Vector2(50.0 * i, 100),
        scale: 1.0,
      );
    }
  }

  @override
  void render(Canvas canvas) {
    spriteBatch.render(canvas);
  }
}
