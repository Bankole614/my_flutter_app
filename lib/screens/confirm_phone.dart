import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:projects/screens/congratulations_screen.dart';
import 'signup_screen.dart';

class ConfirmPhone extends StatefulWidget {
  const ConfirmPhone({super.key});

  @override
  State<ConfirmPhone> createState() => _ConfirmPhoneState();
}

class _ConfirmPhoneState extends State<ConfirmPhone> {

  String currentText = "";
  final TextEditingController _otpController = TextEditingController();

  void _verifyCode() {
    // Your verification logic here
    print("Verifying: $currentText");
  }

  void _resendCode() {
    // Your resend logic here
    print("Resending code...");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Confirm your phone",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              "We sent a 6-digit code to +881 1720 84 57 57",
              style: TextStyle(
                fontSize: 16, color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            PinCodeTextField(
              length: 6,
              controller: _otpController,
              keyboardType: TextInputType.number,
              autoFocus: true,
              appContext: context,
              enableActiveFill: true,
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.grey.shade200,
                selectedFillColor: Colors.grey.shade100,
                inactiveFillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Didn't get a code? "),
                GestureDetector(
                  onTap: _resendCode,
                  child: Text(
                    "Resend",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: currentText.length == 6
                    ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 80,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Verify your phone number before we send the code",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text("Is +881 1720 84 57 57 correct? ", style: TextStyle(color: Colors.grey[800]), textAlign: TextAlign.center),
                            SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const CongratulationsScreen()),
                                  );
                                },
                                child: Text('Yes'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const RegisterScreen1()),
                                  );
                                },
                                child: Text('No'),
                              ),
                            ),
                          ]
                        ),
                      );
                    },
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentText.length == 6
                      ? Colors.black
                      : Colors.grey[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Verify Your Number",
                  style: TextStyle(color: currentText.length == 6 ? Colors.white : Colors.grey[800]),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
