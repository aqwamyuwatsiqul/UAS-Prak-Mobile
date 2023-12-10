import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_uas/Page/NewestPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas/firestore_service.dart';

class NewestWidget extends StatefulWidget {
  const NewestWidget({Key? key}) : super(key: key);

  @override
  State<NewestWidget> createState() => _NewestWidget();
}

class _NewestWidget extends State<NewestWidget> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestoreService.getTerbaru(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                List userList = snapshot.data!.docs;
                return Column(
                  children: userList.map((document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewestPage(
                                      title: data['nama'],
                                      harga: data['harga'],
                                      image: data['image'],
                                      ket: data['ket'],
                                      desc: data['deskripsi'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  data['image'],
                                  height: 120,
                                  width: 150,
                                ),
                              ),
                            ),
                            Container(
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data['ket'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1.0,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 18,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Color(0xffffd646),
                                    ),
                                    onRatingUpdate: (index) {},
                                  ),
                                  Text(
                                    "Rp ${data['harga']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                    size: 26,
                                  ),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.red,
                                    size: 26,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
