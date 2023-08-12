import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName = '/detais';
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact detais page'),
      ),
    );
  }
}
