import 'dart:convert';

import 'package:canvas/model/affirmation.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AffirmationsProvider with ChangeNotifier {
  final String authToken;

  List<Affirmation> affirmations = [];

  AffirmationsProvider(this.authToken, this.affirmations);

  get allAffirmations {
    return [...this.affirmations];
  }

  addNewAffirmation(Affirmation aff) {
    final url =
        'https://canvas-c6df5.firebaseio.com/affirmations.json?auth=$authToken';
    final timestamp = DateFormat.yMMMd().format(DateTime.now());
    http
        .post(
          url,
          body: json.encode({
            'title': aff.title,
            'body': aff.text,
            'timestamp': timestamp,
          }),
        )
        .then((_) => {
              this.affirmations.add(aff),
              print(
                  'Affirmation ' + aff.title.toString() + " has been added..."),
              notifyListeners(),
            });
  }

  Future<void> fetchAndSetAffirmations() async {
    try {
      final url =
          'https://canvas-c6df5.firebaseio.com/affirmations.json?auth=$authToken';
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) return;
      final List<Affirmation> loadedAffirmations = [];
      extractedData.forEach((elementId, elementData) => {
            loadedAffirmations.add(Affirmation(
              id: elementId,
              title: elementData['title'],
              timestamp: elementData['timestamp'],
              text: elementData['body'],
            )),
          });
      this.affirmations = loadedAffirmations;
      notifyListeners();
      print(this.affirmations);
    } catch (error) {
      throw (error);
    }
  }
}
