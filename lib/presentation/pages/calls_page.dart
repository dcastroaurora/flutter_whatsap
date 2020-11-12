import 'package:flutter/material.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

import 'sub_pages/single_item_call_page.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
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
      ),
      floatingActionButton: _floatingButtons(),
    );
  }

  Widget _floatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
