import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    Key? key,
    required this.linearGradient,
    this.child,
  }) : super(key: key);

  final LinearGradient linearGradient;
  final Widget? child;

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  @override
  State<Shimmer> createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  Listenable get shimmerChanges => _shimmerController;
  Gradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );
  bool get isSized =>
      context.findRenderObject() != null &&
      (context.findRenderObject()! as RenderBox).hasSize;
  Size get size => (context.findRenderObject()! as RenderBox).size;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );

    _shimmerController.addListener(() {
      debugPrint('${_shimmerController.value}');
    });
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject()! as RenderBox;
    return descendant.localToGlobal(
      offset,
      ancestor: shimmerBox,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * slidePercent,
      0,
      0,
    );
  }
}
