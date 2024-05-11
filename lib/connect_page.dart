import 'package:flutter/cupertino.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/connect page.jpg"))),));
  }
}