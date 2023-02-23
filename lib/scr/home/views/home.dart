import 'package:flutter/material.dart';
import 'widgets/bestseller_listview.dart';
import 'widgets/book_listview.dart';
import 'widgets/home_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HomeAppBar(),
                  FeaturedBooksListView(),
                  SizedBox(height: 40),
                  Text(
                    "Newset Books",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: NewsetListView(),
            ),
          )
        ],
      ),
    ));
  }
}
