import 'dart:developer';

import 'package:canvas/model/affirmation.model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:canvas/providers/affirmations.provider.dart';
import 'package:flutter/material.dart';

class NewAffirmation extends StatefulWidget {
  @override
  _NewAffirmationState createState() => _NewAffirmationState();
}

class _NewAffirmationState extends State<NewAffirmation> {
  final _form = GlobalKey<FormState>();

  String affirmationText;
  String affirmationTitle;

  void _submitNewAffirmation() {
    final affirmationsProvider =
        Provider.of<AffirmationsProvider>(context, listen: false);
    this._form.currentState.save();
    final timestamp = DateFormat.yMMMd().format(DateTime.now());
    final newAffirmation = new Affirmation(
      timestamp: timestamp,
      text: this.affirmationText,
      title: this.affirmationTitle,
    );
    affirmationsProvider.addNewAffirmation(newAffirmation);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.all(32),
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Affirmation",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Title...',
                  ),
                  onSaved: (newValue) {
                    setState(() {
                      this.affirmationTitle = newValue;
                    });
                  },
                ),
                TextFormField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: 'Body...',
                  ),
                  onSaved: (newValue) {
                    setState(() {
                      this.affirmationText = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
            child: InkWell(
              splashColor: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              onTap: () => _submitNewAffirmation(),
            ),
          )
        ],
      ),
    );
  }
}
