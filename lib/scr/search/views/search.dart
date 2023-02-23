// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookly/scr/home/views/widgets/bestseller_listview.dart';
import 'package:flutter/material.dart';
import 'widgets/search_textfield.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              SearchTextField(),
              SizedBox(height: 16),
              Text(
                "Search Result",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              NewsetListView(),
            ],
          ),
        ),
      )),
    );
  }
}
