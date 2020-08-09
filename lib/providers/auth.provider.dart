import 'dart:convert';
import 'dart:io';

import 'package:canvas/model/story.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/user.model.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  final User _user = new User(
    id: '1',
    firstname: "Cameron",
    lastname: "Gamble",
    affirmations: [],
    attributes: [],
    story: Story(
      text:
          "THis is the text that is going to be very long and generated using NLP techniques to create a story about the user based on the amount of people they come in contact with and write positive things about.",
      title: 'New Story',
      ownerUsername: "stopitcam",
      lastUpdated: "Idk",
      currentPage: 8,
      pages: 256,
    ),
    dob: "11/30/95",
  );

  get currentUser {
    return this._user;
  }

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  set newAttributesList(List<String> newAttributes) {
    this.currentUser.attributes = newAttributes;
    print(this.currentUser.attributes);
  }

  addAttribute() {
    const url = 'https://canvas-c6df5.firebaseio.com/attributes.json';
    final timestamp = DateFormat.yMMMd().format(DateTime.now());
    http.post(
      url,
      body: json.encode({
        'attributes': this._user.attributes.toList().toString(),
      }),
    );
  }

  // _authentice(String email, String password, String urlSegment) {}

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBUJ29uSsai8xfJfs0xlcMhFfqRxs_6SlA';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    final newUser = User(
      // Might need to change ID
      id: responseData['localId'],
    );
    print(json.decode(response.body));
  }

  Future<void> login(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBUJ29uSsai8xfJfs0xlcMhFfqRxs_6SlA';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    print(json.decode(response.body));
  }

  updateUser(User user) {
    print(user.firstname);
    print(user.lastname);
    print(user.username);
    print(user.tiles);
  }

  // Future<void> fetchAndSetStory() async {
  //   http.get(url);
  // }
}
