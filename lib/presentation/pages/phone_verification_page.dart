import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsap/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(
                    'Verify your phone number',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: greenColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
                style: TextStyle(fontSize: 16.0),
              ),
              _pinCodeWidget(context),
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
                onPressed: _submitSmsCode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pinCodeWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PinCodeTextField(
            appContext: context,
            controller: _pinCodeController,
            length: 6,
            obscureText: true,
            backgroundColor: Colors.transparent,
            onChanged: (pinCode) {
              print(pinCode);
            },
          ),
          Text('Enter your 6 digit code')
        ],
      ),
    );
  }

  void _submitSmsCode() {
    if (_pinCodeController.text.isNotEmpty) {
      context
          .bloc<PhoneAuthCubit>()
          .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }
}
