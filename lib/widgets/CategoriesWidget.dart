import 'package:flutter/material.dart';
import 'package:project_uas/categories.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            CategoryItem(image: "images/minum.png", name: "Minuman"),
            CategoryItem(image: "images/makanan.png", name: "Makanan"),
            CategoryItem(image: "images/jajan.png", name: "Jajanan"),
            CategoryItem(image: "images/burger.png", name: "Cepat Saji"),
            CategoryItem(image: "images/kopi.png", name: "Kopi"),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String name;

  const CategoryItem({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Categories(ListCategory: name),
              ));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Column(
            children: [
              Image.asset(
                image,
                width: 50,
                height: 50,
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
