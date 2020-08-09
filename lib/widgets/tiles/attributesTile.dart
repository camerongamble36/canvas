import 'package:canvas/providers/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttributesTile extends StatefulWidget {
  final bool isActive;

  AttributesTile(this.isActive);

  @override
  _AttributesTileState createState() => _AttributesTileState();
}

class _AttributesTileState extends State<AttributesTile> {
  List<String> attributes = [];
  TextEditingController attributeController = TextEditingController();

  final _form = GlobalKey<FormState>();
  void startAddAttribute(BuildContext context) {
    void addAttribute(String value) {
      setState(() {
        this.attributes.add(value);
      });
    }

    void addToUserAttributes() {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.newAttributesList = this.attributes;
      authProvider.addAttribute();
      Navigator.of(context).pop();
    }

    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Form(
            key: _form,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: this
                        .attributes
                        .map((element) => Container(
                              margin: EdgeInsets.fromLTRB(32, 32, 32, 0),
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                element,
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList()),
                Container(
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: attributeController,
                    decoration: InputDecoration(
                      hintText: "Attribute",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => {
                          addAttribute(this.attributeController.text),
                          this.attributeController.clear()
                        },
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      this.attributeController.text = value;
                    },
                  ),
                ),
                Center(
                  child: Text(
                    this.attributeController.value.text,
                    style: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      addToUserAttributes();
                    });
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userAttributes = authProvider.currentUser.attributes;

    return userAttributes == null || userAttributes.length <= 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Attributes'),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Add Attribute'),
                  onPressed: () {
                    startAddAttribute(context);
                  },
                )
              ],
            ),
          )
        : Column(
            children: [
              Container(
                height: 400,
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Center(
                          child: Text(
                            userAttributes[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: userAttributes.length,
                ),
              ),
              Text("Test")
            ],
          );
  }
}
