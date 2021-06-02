import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:funvas/funvas.dart';

class TwentyFive extends Funvas {
  static const _n = 32;

  @override
  void u(double t) {
    final d = s2q(750).width;
    c.drawColor(Color(0xff000000), BlendMode.srcOver);
    c.translate(d / 2, d / 2);
    t %= 8;
    drawFrames(t, d);
  }

  void drawFrames(double t, double d) {
    const blurLag = 0.01, bn = 10;
    for (var i = 0; i < bn; i++) {
      drawFrame(t - blurLag / bn * (i - bn), d, 1 / bn);
    }

    drawFrame(t, d, 1);
  }

  void drawFrame(double t, double d, double alpha) {
    final n = _n * sin(t * pi / 4) + _n;
    for (var i = 0; i < n; i++) {
      c.drawCircle(
        Offset(cos(pi * t + 2 * pi / n * i),
                sin(pi / 4 * t + pi * t + 2 * pi / n * i)) *
            d /
            3,
        10,
        Paint()
          ..color = HSVColor.fromAHSV(
            alpha,
            360 / n * i,
            3 / 4,
            3 / 4,
          ).toColor(),
      );
    }
  }
}
