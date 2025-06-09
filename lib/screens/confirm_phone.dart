import 'package:flutter/material.dart';

class ConfirmPhone extends StatefulWidget {
  const ConfirmPhone({super.key});

  @override
  State<ConfirmPhone> createState() => _ConfirmPhoneState();
}

class _ConfirmPhoneState extends State<ConfirmPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Confirm Phone Number', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(height: 16),
            Text(
              'We have sent a verification code to your phone number',
              style: TextStyle(
                fontSize: 16, color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
