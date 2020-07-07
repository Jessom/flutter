import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage>{
  final PageController _controller = PageController(
    initialPage: 0
  );
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('搜索')
      ),
    );
  }
}
