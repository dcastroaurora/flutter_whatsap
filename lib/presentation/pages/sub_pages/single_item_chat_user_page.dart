import 'package:flutter/material.dart';

class SingleItemChatUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 55.0,
                width: 55.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  child: Image.asset('assets/profile_default.png'),
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Hi there I\'m using this app',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
              Spacer(),
              Text('12:47 AM'),
            ],
          ),
        ],
      ),
    );
  }
}
