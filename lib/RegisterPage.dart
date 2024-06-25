import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Controllers for text fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Variables for sliders
  double _weight = 50.0;
  double _height = 150.0;

  // Variables for chip choices
  List<String> _selectedChips = [];

  // Variable for radio buttons
  String _selectedLanguage = 'Thai';

  // Variable for checkbox
  bool _agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CircleAvatar
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text("Name"),
            SizedBox(height: 10),

            // RoundTextFields
            RoundTextField(
              controller: _nameController,
              labelText: 'Name',
            ),

            SizedBox(height: 10),
            Text("Username"),
            SizedBox(height: 10),
            RoundTextField(
              controller: _usernameController,
              labelText: 'Username',
            ),
            SizedBox(height: 10),
            Text("Password"),
            SizedBox(height: 10),
            RoundTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Sliders
            Slider(
              value: _weight,
              min: 0,
              max: 100,
              divisions: 100,
              label: 'Weight: $_weight kg',
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            Slider(
              value: _height,
              min: 100,
              max: 200,
              divisions: 100,
              label: 'Height: $_height cm',
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Chips
            Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: Text('Computer Science'),
                  selected: _selectedChips.contains('Computer Science'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedChips.add('Computer Science');
                      } else {
                        _selectedChips.remove('Computer Science');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Information Technology'),
                  selected: _selectedChips.contains('Information Technology'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedChips.add('Information Technology');
                      } else {
                        _selectedChips.remove('Information Technology');
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Radio buttons
            ListTile(
              title: Text('Language'),
            ),
            RadioListTile(
              title: Text('Thai'),
              value: 'Thai',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('English'),
              value: 'English',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('Chinese'),
              value: 'Chinese',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value as String;
                });
              },
            ),
            SizedBox(height: 20),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: _agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeTerms = value!;
                    });
                  },
                ),
                Text('Agree to Terms and Conditions'),
              ],
            ),
            SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: _agreeTerms ? _submitForm : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    // Implement your registration logic here
    print('Form submitted successfully');
  }
}

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const RoundTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
