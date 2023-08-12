import 'package:contact_with_card_scanner/page/contact_details_page.dart';
import 'package:contact_with_card_scanner/page/contact_form_page.dart';
import 'package:contact_with_card_scanner/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FormPage.routeName: (context) => FormPage(),
        ContactDetails.routeName: (context) => ContactDetails(),
      },
    );
  }
}
