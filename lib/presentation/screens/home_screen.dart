import 'package:flutter/material.dart';
import 'package:whatsap/presentation/pages/calls_page.dart';
import 'package:whatsap/presentation/pages/camera_page.dart';
import 'package:whatsap/presentation/pages/chat_page.dart';
import 'package:whatsap/presentation/pages/status_page.dart';
import 'package:whatsap/presentation/widgets/custom_tab_bar.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({Key key, this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> _pages = [
    CameraPage(),
    ChatPage(),
    StatusPage(),
    CallsPage(),
  ];

  _buildSearch() {
    return Container(
      height: 45.0,
      margin: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            offset: Offset(0.0, 0.50),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              automaticallyImplyLeading: false, // quita le flecha de ATRAS
              elevation: 0.0,
              backgroundColor: _isSearch ? Colors.transparent : primaryColor,
              title: _isSearch
                  ? Container(height: 0.0, width: 0.0)
                  : Text('WathsApp Clone'),
              flexibleSpace: _isSearch
                  ? _buildSearch()
                  : Container(height: 0.0, width: 0.0),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSearch = true;
                    });
                  },
                  child: Icon(Icons.search),
                ),
                SizedBox(width: 5.0),
                Icon(Icons.more_vert),
              ],
            )
          : null,
      body: Column(
        children: [
          _isSearch
              ? Container(
                  height: 0.0,
                  width: 0.0,
                )
              : _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
