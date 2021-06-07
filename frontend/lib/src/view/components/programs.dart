import 'package:flutter/material.dart';

import 'package:portfolio/src/view/components/window.dart';
import 'package:portfolio/src/view/contact_app/app_list.dart';
import 'package:portfolio/src/view/contact_app/app_save.dart';
import 'package:portfolio/src/view/contact_app/model/contact_model.dart';
import 'package:portfolio/src/view/shared/program.dart';
import 'dart:html' as html;

class Programs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Program(
          titleColor: Colors.white,
          onTap: () {
            return Window(
              context: context,
              body: Row(
                children: [
                  Program(
                    titleColor: Colors.black,
                    title: "Star Wars App",
                    onTap: () {
                      String url = "https://github.com/matheusc3m/starwars";
                      html.window.open(url, 'new tab');
                    },
                    image: "assets/starwars.png",
                  ),
                  Program(
                    titleColor: Colors.black,
                    title: "Music Player",
                    onTap: () {
                      String url = "https://github.com/matheusc3m/musicplayer";
                      html.window.open(url, 'new tab');
                    },
                    image: "assets/music.png",
                  ),
                ],
              ),
            );
          },
          title: "Meu Portfólio",
          image: "assets/folder.png",
        ),
        Program(
          titleColor: Colors.white,
          onTap: () {
            String url = "https://www.linkedin.com/in/matheus3m/";
            html.window.open(url, 'new tab');
          },
          title: "Linkedin",
          image: "assets/linkedin.png",
        ),
        Program(
          titleColor: Colors.white,
          title: "Github",
          onTap: () {
            String url = "https://github.com/matheusc3m";
            html.window.open(url, 'new tab');
          },
          image: "assets/github.png",
        ),
        Program(
          titleColor: Colors.white,
          title: "Contatos",
          onTap: () {
            return Window(
              context: context,
              body: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.task)),
                        Tab(icon: Icon(Icons.add)),
                      ],
                    ),
                    title: Text('Lista de Contatos Mongo DB'),
                  ),
                  body: TabBarView(
                    children: [
                      AppList(),
                      AppSave(),
                    ],
                  ),
                ),
              ),
            );
          },
          image: "assets/contact.png",
        )
      ],
    );
  }
}
