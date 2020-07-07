# myapp

使用插件需要现在`pubspec.yaml`中导入插件
```yaml
# ...
dependencies
  flutter_swiper : ^1.1.6
# ...
```


移除异形屏的安全距离
```dart
MediaQuery.removePadding(
  context: context,
  removeTop: true,  // 移除上面
  removeBottom: true,  // 移除下面
  removeLeft: true,  // 移除左面
  removeRight: true,  // 移除右面
  child: Widget
)
```

监听滚动
```dart
NotificationListener(
  // 监听滚动
  onNotification: (scrollNotification) {
    if(scrollNotification is ScrollUpdateNotification) {
      // 即使滚动是0，也会触发，所有判断下
      
    } else if(scrollNotification.depth == 0) {
      // 有可能会监听到内部轮播图的滚动被触发，这里就判断第0个元素发生滚动才触发
    }
  },
  child: Widget
)
```

浮动
```dart
// 底部的Widget，浮动上一个Widget
// 就是children[1]会浮动在children[0]上面
Stack(
  children: []
)
```