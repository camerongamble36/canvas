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

  User _user = new User(
    id: "1",
    firstname: "Cameron",
    lastname: "Gamble",
    username: "stopitcam",
    affirmations: [],
    attributes: [],
    story: Story(
      text:
          "THis is the text that is going to be very long and generated using NLP techniques to create a story about the user based on the amount of people they come in contact with and write positive things about.",
      title: 'New Story',
      ownerUsername: "stopitcam",
      lastUpdated: "Idk",
      currentPage: 250,
      pages: 256,
    ),
    dob: "11/30/95",
  );

  get currentUser {
    // try {
    //   final url =
    //       'https://canvas-c6df5.firebaseio.com/users/$_userId.json?auth=$token';
    //   final response = await http.get(url);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   if (extractedData == null) return;
    //   final loadedUser = new User();
    //   extractedData.forEach((userId, userData) {
    //     loadedUser.id = userId;
    //     loadedUser.email = userData['email'];
    //     loadedUser.imageUrl = userData['imageUrl'];
    //     loadedUser.firstname = userData['firstname'];
    //     loadedUser.lastname = userData['lastname'];
    //     loadedUser.username = userData['username'];
    //     loadedUser.attributes = userData['attributes'];
    //     loadedUser.affirmations = userData['affirmations'];
    //   });
    //   this._user = loadedUser;
    // } catch (e) {
    //   throw (e);
    // }
    return this._user;
  }

  User get currentUser1 {}

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
    final url =
        'https://canvas-c6df5.firebaseio.com/users/$_userId/attributes.json';
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
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    final newUser = new User(
      id: _userId,
      email: email,
      imageUrl: "",
      username: "",
      firstname: "",
      lastname: "",
      affirmations: [],
      attributes: [],
      story: null,
      dob: "",
      tiles: ['starter', 'affirmations', 'attributes'],
    );

    this.setupNewUser(_userId, newUser).then((value) {
      print(newUser);
    });

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

  Future<void> updateUser(User user) async {
    // final userIndex = _
  }

  // Future<void> fetchAndSetStory() async {
  //   http.get(url);
  // }

  Future<void> setupNewUser(String id, User user) {
    final url = 'https://canvas-c6df5.firebaseio.com/users/$id.json';
    return http.post(
      url,
      body: json.encode({
        'imageUrl': user.imageUrl,
        'firstname': user.firstname,
        'lastname': user.lastname,
        'username': user.username,
        'email': user.email,
        'affirmations': user.affirmations,
        'attributes': user.attributes,
        'story': user.story,
        'dob': user.dob,
      }),
    );
  }
}
