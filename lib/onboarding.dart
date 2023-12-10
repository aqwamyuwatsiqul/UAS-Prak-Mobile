import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:project_uas/login.dart';
import 'utils.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Material(
      child: Container(
        width: double.infinity,
        child: Container(
          // onboardingHnD (31:4)
          padding: EdgeInsets.fromLTRB(12 * fem, 163 * fem, 12 * fem, 16 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffd646),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 37.26 * fem),
                width: 330 * fem,
                height: 236.74 * fem,
                child: Image.asset(
                  'images/onboarding.png',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 322 * fem,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: SafeGoogleFont(
                        'Work Sans',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.4285714286 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: 'Feast Your Senses with ',
                          style: SafeGoogleFont(
                            'Work Sans',
                            fontSize: 28 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.4285714286 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        TextSpan(
                          text: 'Our Quick Delivery!',
                          style: SafeGoogleFont(
                            'Work Sans',
                            fontSize: 28 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.4285714286 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                // homedeliveryandonlinereservati (34:10)
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 0 * fem, 104.5 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 306 * fem,
                  ),
                  child: Text(
                    'home delivery and online reservation \nsystem for restaurants & cafe',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Work Sans',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w300,
                      height: 2.2222222222 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  // autogroupgbstGZb (6u5QPd51QBnFRTUj4zGbsT)
                  width: double.infinity,
                  height: 65 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Let’s Explore',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.4285714286 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
