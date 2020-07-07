import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPage createState() => _TravelPage();
}

class _TravelPage extends State<TravelPage>{
  final PageController _controller = PageController(
    initialPage: 0
  );
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('旅拍')
      ),
    );
  }
}
