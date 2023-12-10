import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/Page/CartPage.dart';

class ItemBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Color.fromARGB(255, 251, 228, 145),
        padding: EdgeInsets.symmetric(
          horizontal: 100,
        ),
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffffd646)),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
              ),
            ),
          ),
          icon: Icon(CupertinoIcons.cart),
          label: Text(
            "Add to Cart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
