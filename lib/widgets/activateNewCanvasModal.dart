import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class ActivateNewCanvasModal extends StatefulWidget {
  @override
  _ActivateNewCanvasModalState createState() => _ActivateNewCanvasModalState();
}

class _ActivateNewCanvasModalState extends State<ActivateNewCanvasModal> {
  bool _supportsNFC = false;
  bool _reading = false;
  StreamSubscription<NDEFMessage> _stream;

  @override
  void initState() {
    super.initState();
    // Check if the device supports NFC reading
    NFC.isNDEFSupported.then((bool isSupported) {
      setState(() {
        _supportsNFC = isSupported;
        print('isSupported: ' + isSupported.toString());
        print('_supportsNFC: ' + _supportsNFC.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_supportsNFC) {
      return RaisedButton(
        child: const Text("You device does not support NFC"),
        onPressed: null,
      );
    } else {
      return Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 16,
              ),
              Text('Connecting to Canvas...'),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                child: Text(_reading ? "Stop reading" : "Start reading"),
                onPressed: () {
                  if (_reading) {
                    _stream?.cancel();
                    setState(() {
                      _reading = false;
                    });
                  } else {
                    setState(() {
                      _reading = true;
                      // Start reading using NFC.readNDEF()
                      _stream = NFC
                          .readNDEF(
                        once: true,
                        throwOnUserCancel: false,
                      )
                          .listen((NDEFMessage message) {
                        print("read NDEF message: ${message.payload}");
                      }, onError: (e) {
                        // Check error handling guide below
                        print(e);
                      });
                    });
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
