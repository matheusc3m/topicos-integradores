import 'package:flutter/material.dart';
import 'package:portfolio/src/view/contact_app/model/contact_model.dart';
import 'package:portfolio/src/view/contact_app/repository/app_repository.dart';

class AppList extends StatefulWidget {
  const AppList({Key key}) : super(key: key);

  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {
    final repository = AppRepository();
    var contacts = List<ContactModel>();
    return FutureBuilder(
        future: repository.getContacts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  strokeWidth: 5.0,
                ),
              );
            default:
              contacts = snapshot.data;
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(contacts.length, (index) {
                  return Card(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            contacts[index].avatar != ""
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(contacts[index].avatar),
                                  )
                                : CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${contacts[index].firstName}  ${contacts[index].lastName}",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "${contacts[index].phone}",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),
                        Flexible(
                          child: Text(
                            "${contacts[index].email}",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              label: Text("Editar"),
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                              onPressed: () {
                                setState(() {
                                  repository
                                      .deleteContacts(contacts[index].sId);
                                });
                              },
                              icon: Icon(Icons.delete),
                              label: Text("Apagar"),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
                }),
              );
          }
        });
  }
}
