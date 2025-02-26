import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  const ResponsiveContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Center(
        child: SizedBox(
          width: width > 600 ? 600 : width,
          child: child,
        ),
      ),
    );
  }
}
