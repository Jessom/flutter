import 'package:flutter/material.dart';
import 'package:myapp/tabbar/HomePage.dart';
import 'package:myapp/tabbar/MinePage.dart';
import 'package:myapp/tabbar/SearchPage.dart';
import 'package:myapp/tabbar/TravelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigator createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator>{
  
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.red;

  int _currentIndex = 0;

  // 创建控制器，用于控制显示哪个页面
  final PageController _controller = PageController(
    initialPage: 0
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MinePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _activeColor),
            title: Text('首页', style: TextStyle(
              color: _currentIndex == 0 ? _activeColor : _defaultColor
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _defaultColor),
            activeIcon: Icon(Icons.search, color: _activeColor),
            title: Text('搜索', style: TextStyle(
              color: _currentIndex == 1 ? _activeColor : _defaultColor
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: _defaultColor),
            activeIcon: Icon(Icons.camera_alt, color: _activeColor),
            title: Text('旅拍', style: TextStyle(
              color: _currentIndex == 2 ? _activeColor : _defaultColor
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _defaultColor),
            activeIcon: Icon(Icons.account_circle, color: _activeColor),
            title: Text('我的', style: TextStyle(
              color: _currentIndex == 3 ? _activeColor : _defaultColor
            ))
          )]
      ),
    );
  }
}
