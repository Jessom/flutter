import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePage createState() => _MinePage();
}

class _MinePage extends State<MinePage>{
  final PageController _controller = PageController(
    initialPage: 0
  );
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的')
      ),
    );
  }
}
