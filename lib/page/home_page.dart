import 'package:contact_with_card_scanner/page/contact_details_page.dart';
import 'package:contact_with_card_scanner/page/contact_form_page.dart';
import 'package:contact_with_card_scanner/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contact_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    contactProvider.getAllContacts();
    return Scaffold(
      appBar: AppBar(
          title: Text("contact List${contactProvider.contactList.length}")),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = provider.contactList[index];
            return ListTile(
              onTap: () => Navigator.pushNamed(
                context,
                ContactDetails.routeName,
                arguments: contact,
              ),
              title: Text(contact.name),
              trailing: IconButton(
                  onPressed: () {
                    final value = contact.favorite ? 0 : 1;
                    provider.updateContact(
                        contact.id, tblContactColFavorite, value);
                  },
                  icon: Icon(contact.favorite
                      ? Icons.favorite
                      : Icons.favorite_border)),
            );
          },
        ),
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
