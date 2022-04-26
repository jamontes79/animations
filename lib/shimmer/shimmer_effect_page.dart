import 'package:animations/shimmer/colors/shimmer_gradient.dart';
import 'package:animations/shimmer/widgets/card_list_item.dart';
import 'package:animations/shimmer/widgets/circle_list_item.dart';
import 'package:animations/shimmer/widgets/shimmer.dart';
import 'package:animations/shimmer/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class ShimmerEffectPage extends StatefulWidget {
  const ShimmerEffectPage({Key? key}) : super(key: key);

  @override
  State<ShimmerEffectPage> createState() => _ShimmerEffectPageState();
}

class _ShimmerEffectPageState extends State<ShimmerEffectPage> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Effect'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Column(
          children: [
            _buildTopRowItems(),
            _buildListItem(),
          ],
        ),
      ),
    );
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }

  Row _buildTopRowItems() {
    return Row(
      children: [
        _buildTopRowItem(),
        _buildTopRowItem(),
        _buildTopRowItem(),
        _buildTopRowItem(),
        _buildTopRowItem(),
      ],
    );
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: const CircleListItem(),
    );
  }
}
