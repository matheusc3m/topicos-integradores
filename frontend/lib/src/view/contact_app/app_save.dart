import 'package:flutter/material.dart';
import 'package:portfolio/src/view/contact_app/model/contact_model.dart';
import 'package:portfolio/src/view/contact_app/repository/app_repository.dart';

class AppSave extends StatefulWidget {
  const AppSave({Key key}) : super(key: key);

  @override
  _AppSaveState createState() => _AppSaveState();
}

class _AppSaveState extends State<AppSave> {
  @override
  Widget build(BuildContext context) {
    final firstName = TextEditingController();
    final lastName = TextEditingController();
    final avatar = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();

    final repository = AppRepository();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: firstName,
            decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: 'Nome'),
          ),
          TextField(
            controller: lastName,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Sobrenome'),
          ),
          TextField(
            controller: phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Número'),
          ),
          TextField(
            controller: avatar,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Imagem Url'),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'E-mail'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  repository.postContacts(
                    ContactModel(
                      firstName: firstName.text,
                      avatar: avatar.text ?? '',
                      email: email.text,
                      lastName: lastName.text,
                      phone: phone.text,
                    ),
                  );
                });
              },
              child: Text("Salvar"),
            ),
          )
        ],
      ),
    );
  }
}
