import 'package:flutter/material.dart';

import 'home.dart';

class ProfileCompletionPage extends StatefulWidget {
  @override
  _ProfileCompletionPageState createState() => _ProfileCompletionPageState();
}

class _ProfileCompletionPageState extends State<ProfileCompletionPage> {
  String userType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildUserTypeSelection(),
        
              SizedBox(height: 500.0),
        
              ElevatedButton(
                onPressed: () {
                  if (userType.isNotEmpty) {
                    print('User type selected: $userType');
        
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    print('Please select your user type');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Are you a property owner or a home seeker?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 20.0),
        // User Type RadioButtons with Icons
        buildUserTypeRadioButton('Property Owner', Icons.home),
        buildUserTypeRadioButton('Home Seeker', Icons.search),
      ],
    );
  }

  Widget buildUserTypeRadioButton(String value, IconData icon) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: userType,
          onChanged: (String? newValue) {
            setState(() {
              userType = newValue!;
            });
          },
        ),
        Icon(icon, size: 30),
        SizedBox(width: 12.0),
        Text(value, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
