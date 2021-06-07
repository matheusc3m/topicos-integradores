import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portfolio/src/view/contact_app/model/contact_model.dart';

class AppRepository {
  var dio = Dio();

  Future<List<ContactModel>> getContacts() async {
    final response = await dio.get('http://127.0.0.1:3001/api/contacts');
    // Await the http get response, then decode the json-formatted response.

    print(response.data);
    return (response.data['docs'] as List)
        .map((p) => ContactModel.fromJson(p))
        .toList();
  }

  Future<void> postContacts(ContactModel contact) async {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://127.0.0.1:3001/api",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    final dioClient = Dio(options);
    var params = {
      "firstName": contact.firstName,
      "lastName": contact.lastName,
      "email": contact.email,
      "phone": contact.phone,
      "avatar": contact.avatar ?? '',
    };
    try {
      final response = await dioClient.post(
        "/contacts",
        data: jsonEncode(params),
      );
      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteContacts(String id) async {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://127.0.0.1:3001/api",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    final dioClient = Dio(options);

    try {
      final response = await dioClient.delete(
        "/contacts/$id",
      );
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
