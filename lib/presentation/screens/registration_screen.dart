import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsap/presentation/bloc/auth/auth_cubit.dart';
import 'package:whatsap/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsap/presentation/pages/phone_verification_page.dart';
import 'package:whatsap/presentation/pages/set_initial_profile_page.dart';
import 'package:whatsap/presentation/screens/home_screen.dart';
import '../widgets/theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("51");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;
  String _phoneNumber = "";
  TextEditingController _phoneAuthController = TextEditingController();

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            state.maybeMap(
              success: (_) => context.bloc<AuthCubit>().loggedIn(),
              failure: (_) => Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Something is wrong'),
                        Icon(Icons.error_outline),
                      ],
                    ),
                  ),
                ),
              ),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              success: (_) => BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return state.maybeMap(
                    authenticated: (state) => HomeScreen(uid: state.uid),
                    orElse: () => Container(),
                  );
                },
              ),
              smsCodeReceived: (_) => PhoneVerificationPage(
                phoneNumber: _phoneNumber,
              ),
              profileInfo: (_) => SetInitialProfilePage(
                phoneNumber: _phoneNumber,
              ),
              orElse: () => _bodyWidget(),
            );
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Container(
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
          SizedBox(height: 30.0),
          ListTile(
            onTap: _openFilteredCountryPickerDialog,
            title: _buildDialogItem(_selectedFilteredDialogCountry),
          ),
          Row(
            children: [
              Container(
                height: 42.0,
                width: 80.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.50, color: greenColor),
                  ),
                ),
                child: Text('${_selectedFilteredDialogCountry.phoneCode}'),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 40.0,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneAuthController,
                    decoration: InputDecoration(hintText: 'Phone Number'),
                  ),
                ),
              ),
            ],
          ),
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
            onPressed: _submitVerifyPhoneNumber,
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: greenColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(height: 8.0),
          Text('+${country.phoneCode}'),
          SizedBox(height: 8.0),
          Text('${country.name}'),
          Spacer(),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(primaryColor: primaryColor),
        child: CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.black,
          searchInputDecoration: InputDecoration(hintText: 'Search'),
          isSearchable: true,
          title: Text('Select your phone code'),
          onValuePicked: (Country country) {
            setState(() {
              _selectedFilteredDialogCountry = country;
              _countryCode = country.phoneCode;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneAuthController.text}";
      context
          .bloc<PhoneAuthCubit>()
          .submitVerifyPhoneNumber(phoneNumber: _phoneNumber);
    }
  }
}
