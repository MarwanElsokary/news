import 'package:api/apis/api_manager.dart';
import 'package:api/screens/categories.dart';
import 'package:api/screens/drawer_tab.dart';
import 'package:api/models/categoryModel.dart';
import 'package:api/tab_item.dart';
import 'package:flutter/material.dart';

import '../tab_bar.dart';

class HoomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HoomeScreen({super.key});

  @override
  State<HoomeScreen> createState() => _HoomeScreenState();
}

class _HoomeScreenState extends State<HoomeScreen> {
  int SelectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerTab(
          onClick: onDrawerClick,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "New's App",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          )),
        ),
        body: selectedCategory == null
            ? CategoriesTab(
                onClick: onCategorySelect,
              )
            : TabBarWidget(
                id: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory = null;

  onDrawerClick(id) {
    if (id == DrawerTab.CATEGORY_ID) {
      selectedCategory = null;
      Navigator.pop(context);
    } else if (id == DrawerTab.SETTINGS_ID) {}
    setState(() {});
  }

  onCategorySelect(cat) {
    selectedCategory = cat;
    setState(() {});
  }
}
