import 'package:flutter/material.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

import 'sub_pages/single_item_chat_user_page.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40.0,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Start chat with your friends and family,\n on WhatsApp Clone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
    );
  }

  Widget _myChatList() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (_, index) {
        return SingleItemChatUserPage();
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
