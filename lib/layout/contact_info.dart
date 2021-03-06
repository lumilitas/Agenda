import 'package:agenda/database/agenda_database.dart';
import 'package:agenda/widgets/my_contact_info_container.dart';
import 'package:agenda/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

Widget getTelephones(String number) {
  return Text(number);
}

deleteContact(int id) async {
  var result = await DBProvider.db.deleteContact(id);
  return result;
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(selectedContact.name),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.edit), 
              onPressed: () {
                Navigator.pushNamed(context, '/change');
              }),
            IconButton(
              icon: Icon(Icons.clear), 
              onPressed: () {
                deleteContact(selectedContact.id);
                Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (r) => false);
              })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: MyContactInfoContainer(
              contact: selectedContact,
            ),
            width: double.infinity,
          ),
        ));
  }
}
