import 'dart:ui';

abstract class ContentDrawer {
  void paint(Canvas canvas, Size size);
}

class DrawerBuilder {
  List<ContentDrawer> drawers = [];

  DrawerBuilder add(ContentDrawer drawer) {
    drawers.add(drawer);
    return this;
  }

  double getScale() {
    return window.devicePixelRatio;
  }

  Future<Image> build(Size size) {
    final recorder = new PictureRecorder();
    final pageSize = Rect.fromLTWH(0, 0, size.width, size.height);
    final canvas = Canvas(recorder, pageSize);
    double dpr = getScale();
    canvas.scale(dpr, dpr);

    drawers.forEach((drawer) {
      canvas.save();
      drawer.paint(canvas, size);
      canvas.restore();
    });

    final picture = recorder.endRecording();
    return picture.toImage(
        (pageSize.width * dpr).ceil(), (pageSize.height * dpr).ceil());
  }
}
