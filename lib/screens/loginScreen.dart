import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final _form = GlobalKey<FormState>();

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  void _navToSignupScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SignupScreen();
      }),
    );
  }

  void _submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // if (this._form.currentState.validate()) {
    //   return;
    // }

    this._form.currentState.save();
    setState(() {
      this.isLoading = true;
    });
    await authProvider.login(
      this.emailTextController.value.text,
      this.passwordTextController.value.text,
    );
    setState(() {
      this.isLoading = false;
    });
    Navigator.of(context).pushReplacementNamed('/home');
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
              width: 300,
              height: 350,
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
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (newValue) {
                      this.emailTextController.text = newValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
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
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Signup',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  onTap: () => _navToSignupScreen(context),
                                )
                              ],
                            ),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Text('Login'),
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
