import 'dart:ui';

abstract class ContentDrawer {
  void paint(Canvas canvas, Size size);
}

class DrawerBuilder {
  Size size;
  List<ContentDrawer> _drawers = [];
  final _recorder = new PictureRecorder();
  Canvas _canvas;

  DrawerBuilder(this.size) {
    final pageSize = Rect.fromLTWH(0, 0, size.width, size.height);
    _canvas = Canvas(_recorder, pageSize);
  }

  DrawerBuilder add(ContentDrawer drawer) {
    _drawers.add(drawer);
    return this;
  }

  double getScale() {
    return window.devicePixelRatio;
  }

  Future<Image> build() {
    double dpr = getScale();
    _canvas.scale(dpr, dpr);

    _drawers.forEach((drawer) {
      _canvas.save();
      drawer.paint(_canvas, size);
      _canvas.restore();
    });

    final picture = _recorder.endRecording();
    return picture.toImage(
        (size.width * dpr).ceil(), (size.height * dpr).ceil());
  }
}
