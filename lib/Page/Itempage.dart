import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_uas/Widgets/ItemBottomBar.dart';

class ItemPage extends StatelessWidget {
  final String image;
  final String title;
  final String harga;
  final String desc;

  ItemPage({
    required this.title,
    required this.harga,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffd646),
        title: Text("Populer"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(1),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1.0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          onRatingUpdate: (index) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rp $harga",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                    child: Text(
                      desc,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ItemBottomBar(),
    );
  }
}
