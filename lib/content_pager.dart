import 'package:flutter/material.dart';
import 'package:wechat_book/custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  // 构造方法
  const ContentPager({Key, key, this.onPageChanged, this.contentPagerController})
        /** 初始化列表 **/
        : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
    viewportFraction: 0.8
  );
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];
  @override
  void initState () {
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // appBar
        CustomAppBar(),
        Expanded(
          // 高度撑开，否则在Column中没有高度会报错
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapperItem(0),
              _wrapperItem(1),
              _wrapperItem(2),
              _wrapperItem(3),
            ],
          ),
        )
      ],
    );
  }
  Widget _wrapperItem (int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(decoration: BoxDecoration(color: _colors[index]),),
    );
  }
}

// 内容区域控制器
class ContentPagerController {
  PageController _pageController;
  void jumpToPage (int page) {
    // dart 变成技巧：安全调用
    _pageController?.jumpToPage(page);
  }
}
