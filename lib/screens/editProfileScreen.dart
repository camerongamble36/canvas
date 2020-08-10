import 'package:canvas/model/user.model.dart';
import 'package:canvas/providers/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  // final String authToken;

  // EditProfileScreen(this.authToken);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _form = GlobalKey<FormState>();

  final tiles = <String>['Starter', 'Affirmations', 'Attributes'];

  final imageUrlController = TextEditingController();

  final firstnameTextController = TextEditingController();

  final lastnameTextController = TextEditingController();

  final usernameTextController = TextEditingController();

  final dobTextController = TextEditingController();

  String dropdownValueTile1 = 'Starter';

  String dropdownValueTile2 = 'Affirmations';

  String dropdownValueTile3 = 'Attributes';

  final firstnameFocusNode = FocusNode();

  final lastnameFocusNode = FocusNode();

  final usernameFocusNode = FocusNode();

  final dobFocusNode = FocusNode();

  void _submit() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    this._form.currentState.save();
    final newUser = new User(
      imageUrl: this.imageUrlController.text,
      firstname: this.firstnameTextController.text,
      lastname: this.lastnameTextController.text,
      username: this.usernameTextController.text,
      tiles: [
        this.dropdownValueTile1,
        this.dropdownValueTile2,
        this.dropdownValueTile3
      ],
      dob: this.dobTextController.text,
    );

    authProvider.updateUser(newUser);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Form(
        key: this._form,
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: this.imageUrlController.value.text.isEmpty
                          ? Center(
                              child: Icon(Icons.photo),
                            )
                          : FittedBox(
                              child: Image.network(
                                this.imageUrlController.value.text,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Image Url'),
                      onFieldSubmitted: (newValue) {
                        this.imageUrlController.text = newValue;
                        FocusScope.of(context)
                            .requestFocus(this.firstnameFocusNode);
                      },
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Firstname"),
                focusNode: this.firstnameFocusNode,
                keyboardType: TextInputType.text,
                onSaved: (newValue) {
                  this.dobTextController.text = newValue;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Lastname"),
                focusNode: this.lastnameFocusNode,
                keyboardType: TextInputType.text,
                onSaved: (newValue) {
                  this.dobTextController.text = newValue;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Username"),
                focusNode: this.usernameFocusNode,
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) {
                  this.dobTextController.text = newValue;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Dob"),
                focusNode: this.dobFocusNode,
                keyboardType: TextInputType.datetime,
                onSaved: (newValue) {
                  this.dobTextController.text = newValue;
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: EdgeInsets.all(16),
                      child: DropdownButton<String>(
                        value: dropdownValueTile1,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueTile1 = newValue;
                          });
                        },
                        items:
                            tiles.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(16),
                      child: DropdownButton<String>(
                        value: dropdownValueTile2,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueTile2 = newValue;
                          });
                        },
                        items:
                            tiles.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(16),
                      child: DropdownButton<String>(
                        value: dropdownValueTile3,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueTile3 = newValue;
                          });
                        },
                        items:
                            tiles.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => _submit(),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
