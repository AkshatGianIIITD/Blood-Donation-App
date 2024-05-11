import 'package:flutter/cupertino.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/request page.jpg"))),));
  }
}