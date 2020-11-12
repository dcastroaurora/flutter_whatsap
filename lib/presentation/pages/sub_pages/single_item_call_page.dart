import 'package:flutter/material.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

class SingleItemCallPage extends StatelessWidget {
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
                  Row(
                    children: [
                      Icon(
                        Icons.call_received,
                        color: Colors.red,
                        size: 20.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Yesterday, 8:30 in the evening',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Icon(
                Icons.videocam_rounded,
                color: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
