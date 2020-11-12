import 'package:flutter/material.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

import 'sub_pages/single_item_story_page.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _storyWidget(),
            SizedBox(height: 10.0),
            _recentTextWidget(),
            SizedBox(height: 10.0),
            _listStories(),
          ],
        ),
      ),
      floatingActionButton: _floatingButtons(),
    );
  }

  Widget _storyWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 15.0,
        right: 20.0,
      ),
      child: Row(
        children: [
          Container(
            height: 55.0,
            width: 55.0,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset('assets/profile_default.png'),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          offset: Offset(0.0, 0.50),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Status',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.0),
              Text('Tap to add status update'),
            ],
          )
        ],
      ),
    );
  }

  Widget _floatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(
              Icons.edit,
              color: Colors.blueGrey,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 60.0,
          width: 60.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: primaryColor,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _recentTextWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Text(
        'Viewed updates',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _listStories() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (_, index) {
        return SingleItemStoryPage();
      },
      separatorBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 75.0,
            right: 10.0,
          ),
          child: Divider(thickness: 1.5),
        );
      },
    );
  }
}
