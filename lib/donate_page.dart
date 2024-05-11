import 'package:flutter/cupertino.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/donate page.jpg"))),));
  }
}