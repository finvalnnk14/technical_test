import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _emailEmptyError = false;
  bool _passwordEmptyError = false;
  bool _showEmptyFieldsError = false;
  bool _emailNotRegisteredError = false;
  bool _passwordLengthError = false;

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    setState(() {
      _emailEmptyError = email.isEmpty;
      _passwordEmptyError = password.isEmpty;
      _showEmptyFieldsError = _emailEmptyError || _passwordEmptyError;
      _emailNotRegisteredError = false;
      _passwordLengthError = false;
    });

    if (!_showEmptyFieldsError) {
      if (email != 'fina@gmail.com') {
        setState(() {
          _emailNotRegisteredError = true;
        });
      } else if (password.length < 8) {
        setState(() {
          _passwordLengthError = true;
        });
      } else if (password != '123456789') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password salah')),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      }
    }
  }

  OutlineInputBorder _buildBorder(bool isError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isError ? Colors.red : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool emailError = _emailEmptyError || _emailNotRegisteredError;
    bool passwordError = _passwordEmptyError || _passwordLengthError;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  'images/Header.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Cth. contoh@gmail.com',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: emailError ? Colors.red : Colors.grey,
                  ),
                  border: _buildBorder(emailError),
                  enabledBorder: _buildBorder(emailError),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: emailError ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
              if (_emailNotRegisteredError)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                  child: Text(
                    'Email not registered',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              SizedBox(height: 16),
              Text(
                'Password',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: passwordError ? Colors.red : Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: passwordError ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: _buildBorder(passwordError),
                  enabledBorder: _buildBorder(passwordError),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: passwordError ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
              if (_passwordLengthError)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                  child: Text(
                    'The password must be 8 characters',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              if (_showEmptyFieldsError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Please fill in all these fields',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot Password action
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _login,
                  child: Text(
                    'Enter',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
