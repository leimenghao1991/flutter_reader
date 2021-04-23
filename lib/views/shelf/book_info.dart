import 'package:flutter/material.dart';

import '../../bean/book.dart';

/// 显示书籍封面和书籍名称
class BookCoverWidget extends StatelessWidget {
  final Book book;

  const BookCoverWidget({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Colors.grey,
            margin: EdgeInsets.only(bottom: 15),
          ),
          Align(
            child: Container(
              child: Text(
                book.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              color: Colors.red,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
            ),
            alignment: Alignment.topCenter,
            //
          )
        ],
      ),
    );
  }
}

/// 显示书籍阅读进度
class ReadProgressWidget extends StatelessWidget {
  final num progress;

  const ReadProgressWidget({Key key, this.progress = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomPaint(
            child: Container(),
            painter: _ProgressPainter(progress: progress),
          ),
        ),
        Container(
          child: Text(
            progress.toStringAsFixed(2),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          margin: EdgeInsets.only(left: 5),
        )
      ],
    );
  }
}

/// 10个点表示总进度，深色点表示进度
/// 如下，* 表示深色点; .表示浅色点，下图表示进度 40%-50%
/// * * * * . . . . . .
/// [progress] 表示进度，100表示100%
class _ProgressPainter extends CustomPainter {
  double progress;
  double indicateRadius;
  Color positionColor;
  Color durationColor;
  final Paint _paint = Paint();

  _ProgressPainter(
      {this.progress = 0,
      this.indicateRadius = 1,
      this.positionColor = Colors.black,
      this.durationColor = Colors.grey}) {
    _paint
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..invertColors = false;
  }

  int get position {
    int result = 0;
    if (progress == 0) {
      result = 0;
    } else if (progress < 10) {
      result = 1;
    } else {
      result = progress ~/ 10;
    }
    return result;
  }

  double calculateSpace(num width) {
    return (width - indicateRadius * 2 * 10) / 9;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("size is: [${size.width}, ${size.height}]");
    int pos = position;
    num indicateSpace = calculateSpace(size.width);

    num yCenter = size.height / 2;

    // 绘制进度
    int drawIndex = 0;
    while (drawIndex < 10) {
      _paint.color = drawIndex < pos ? positionColor : durationColor;
      num xCenter =
          drawIndex * (2 * indicateRadius + indicateSpace) + indicateRadius;
      canvas.drawCircle(Offset(xCenter, yCenter), indicateRadius, _paint);
      drawIndex++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 书架的书籍视图，包含[BookCoverWidget]和[ReadProgressWidget]
class ShelfBookWidget extends StatelessWidget {
  final Book book;
  final ReadInfo readInfo;

  ShelfBookWidget({this.book, this.readInfo});

  num get progress {
    print("readInfo $readInfo; book size: ${book.size}");
    return readInfo.readPosition / book.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookCoverWidget(
          book: book,
        ),
        ReadProgressWidget(
          progress: progress,
        )
      ],
    );
  }
}
