import 'package:flutter/material.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class Skeleton extends StatelessWidget {
  final double? height, width;

  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class NewCardSkeleton extends StatelessWidget {
  const NewCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton(height: 80.0, width: 80.0),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 100.0),
              const SizedBox(height: 5.0),
              const Skeleton(width: 220.0),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Skeleton(width: 100.0),
                  SizedBox(width: 10.0),
                  Skeleton(width: 20.0),
                  SizedBox(width: 10.0),
                  Skeleton(width: 70.0),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
