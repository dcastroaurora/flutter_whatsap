import 'package:flutter/material.dart';
import 'package:whatsap/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetInitialProfilePage extends StatefulWidget {
  final String phoneNumber;

  const SetInitialProfilePage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _SetInitialProfilePageState createState() => _SetInitialProfilePageState();
}

class _SetInitialProfilePageState extends State<SetInitialProfilePage> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Text(
                'Profile Info',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Please provide your name and an optional Profile photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30.0),
              _rowWidget(),
              Spacer(),
              MaterialButton(
                color: greenColor,
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: _submitProfileInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.insert_emoticon),
          )
        ],
      ),
    );
  }

  void _submitProfileInfo() {
    if (_nameController.text.isNotEmpty) {
      context.bloc<PhoneAuthCubit>().submitProfileInfo(
            profileUrl: "",
            phoneNumber: _phoneNumber,
            name: _nameController.text,
          );
    }
  }
}
