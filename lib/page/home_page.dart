import 'package:contact_with_card_scanner/db/dbhelper.dart';
import 'package:contact_with_card_scanner/model/contact_model.dart';
import 'package:contact_with_card_scanner/page/contact_form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> contactLiat = [];
    DbHelper.getAllContacts().then((value) {
      contactLiat = value;
      print(contactLiat.length);
    });
    return Scaffold(
      appBar: AppBar(title: Text("contact List")),
      body: ListView.builder(
        itemCount: contactLiat.length,
        itemBuilder: (context, index) {
          final contact = contactLiat[index];
          return ListTile(
            title: Text(contact.name),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                    contact.favorite ? Icons.favorite : Icons.favorite_border)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
