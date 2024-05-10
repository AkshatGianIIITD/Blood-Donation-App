import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BloodRequestPageViewWidget extends StatelessWidget {
  const BloodRequestPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).colorScheme.primary,
      ),
      child:Row(children: [],),
    );
  }
}