import 'package:flutter/material.dart';
import 'package:whatsap/presentation/screens/registration_screen.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to WhatsApp Clone',
                style: TextStyle(
                  fontSize: 20.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 290.0,
                width: 290.0,
                child: Image.asset('assets/brand.png'),
              ),
              Column(
                children: [
                  Text(
                    "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 30.0),
                  MaterialButton(
                    color: greenColor,
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegistrationScreen(),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
