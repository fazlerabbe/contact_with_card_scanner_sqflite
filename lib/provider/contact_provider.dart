import 'package:flutter/material.dart';

import '../db/dbhelper.dart';
import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  Future<int> insertContact(ContactModel contactModel) async {
    final rowId = await DbHelper.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }

  Future<int> updateContact(int rowId, String column, dynamic value) async {
    final map = {column: value};
    final id = await DbHelper.updateContact(rowId, map);
    final contactModel =
        contactList.firstWhere((element) => element.id == rowId);
    contactModel.favorite = !contactModel.favorite;
    final index = contactList.indexOf(contactModel);
    contactList[index] = contactModel;
    notifyListeners();
    //getAllContacts();
    return id;
  }

  getAllContacts() async {
    contactList = await DbHelper.getAllContacts();
    notifyListeners();
  }
}
