import 'package:animations/shimmer/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);
  final bool isLoading;
  final Widget child;
  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _shimmerChanges?.removeListener(_onShimmerChange);
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinSimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject()! as RenderBox,
    );
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTRB(
          -offsetWithinSimmer.dx,
          -offsetWithinSimmer.dy,
          shimmerSize.width,
          shimmerSize.height,
        ),
      ),
      child: widget.child,
    );
  }
}
