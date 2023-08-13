import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName = '/detais';
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  late ContactModel contactModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact detais page'),
      ),
    );
  }
}
