import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// 最大滚动距离
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  
  List _imageUrls = [
    'https://i0.hdslb.com/bfs/archive/7f417cadaca397fa6451a322a3c18a7235548db1.jpg@880w_388h_1c_95q',
    'https://i0.hdslb.com/bfs/sycp/creative_img/202007/314a3b343dfcf6c0cdad72e8c5d64787.jpg@880w_388h_1c_95q',
    'https://i0.hdslb.com/bfs/archive/5eeef3b549b90d0743bcdeff37fc828e70d2d715.jpg@880w_388h_1c_95q'
  ];

  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    } else if(alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
            context: context, 
            removeTop: true,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return null;
              },
              child: ListView(
                children: [
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      pagination: SwiperPagination(),
                      itemBuilder: (BuildContext context, int index){
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('嘻嘻'),
                    ),
                  )
                ],
              )
            )
          ),

          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '首页',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
