import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _form = GlobalKey<FormState>();

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  bool matchingPasswords = false;

  bool isLoading = false;

  void _navToLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return LoginScreen();
      }),
    );
  }

  void _submit() async {
    setState(() {
      isLoading = true;
    });
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (this._form.currentState.validate()) {
      return;
    }
    this._form.currentState.save();

    await authProvider
        .signup(
          this.emailTextController.value.text,
          this.passwordTextController.value.text,
        )
        .then((_) => {
              setState(() {
                isLoading = false;
              }),
              Navigator.of(context).pushReplacementNamed('/home'),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(32),
          elevation: 6,
          child: Form(
            key: this._form,
            child: Container(
              width: 325,
              height: 400,
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Canvas',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Can you keep a secret?'),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (newValue) {
                      this.emailTextController.text = newValue;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (newValue) {
                      this.passwordTextController.text = newValue;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value != passwordTextController.text) {
                        return 'Passwords don\'t match';
                      }
                    },
                    onSaved: (newValue) {
                      this.passwordTextController.text = newValue;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  this.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Login',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  onTap: () => _navToLoginScreen(context),
                                )
                              ],
                            ),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Text('Signup'),
                              onPressed: () => _submit(),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
