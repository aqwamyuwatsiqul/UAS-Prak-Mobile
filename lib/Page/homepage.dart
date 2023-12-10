import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/Page/CartPage.dart';
import '../Widgets/AppBarWidget.dart';
import '../Widgets/DrawerWidget.dart';
import '../Widgets/NewestWidget.dart';
import '../Widgets/CategoriesWidget.dart';
import '../Widgets/PopularWidget.dart';
import '../utils.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: ListView(
        children: [
          AppBarWidget(),
          Container(
            margin: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 10 * fem),
            constraints: BoxConstraints(
              maxWidth: 322 * fem,
            ),
            child: RichText(
              text: TextSpan(
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 28 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.4285714286 * ffem / fem,
                  color: Color(0xff070707),
                ),
                children: [
                  TextSpan(
                    text: 'Feast Your Senses with ',
                    style: SafeGoogleFont(
                      'Work Sans',
                      fontSize: 28 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.4285714286 * ffem / fem,
                      color: Color(0xff070707),
                    ),
                  ),
                  TextSpan(
                    text: 'Our Quick Delivery!',
                    style: SafeGoogleFont(
                      'Work Sans',
                      fontSize: 28 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.4285714286 * ffem / fem,
                      color: Color(0xffffd646),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Text(
              "kategori",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          CategoriesWidget(),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Text(
              "Populer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          PopularWidget(),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Text(
              "Terbaru",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          NewestWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "cartPage");
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
