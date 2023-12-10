import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/firestore_service.dart';
import 'package:project_uas/login.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidget();
}

class _DrawerWidget extends State<DrawerWidget> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth _authService = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirestoreService _firestoreService = FirestoreService();

  late User? users;
  String username = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    users = _authService.currentUser;
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (users != null) {
      try {
        DocumentSnapshot userSnapshot =
            await _firestore.collection("users").doc(users!.uid).get();
        if (userSnapshot.exists) {
          setState(() {
            username = userSnapshot.get("username") ?? "";
            email = userSnapshot.get("email") ?? "";
            phone = userSnapshot.get("phone") ?? "";
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            List userList = snapshot.data!.docs;
            if (userList.isEmpty) {
              return Text('No user data available');
            }

            Map<String, dynamic> data =
                userList.first.data() as Map<String, dynamic>;

            return Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: const Color(0xffffd646),
                      ),
                      accountName: Text(
                        data['name'] ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        data['email'] ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: const AssetImage("images/aku.jpg"),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      CupertinoIcons.phone,
                      color: Colors.orangeAccent,
                    ),
                    title: Text(
                      data['phone'] ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.orangeAccent,
                      ),
                      title: Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }
}



// ListTile(
                          //   leading: Icon(
                          //     CupertinoIcons.person_alt,
                          //     color: Colors.orangeAccent,
                          //   ),
                          //   title: Text(
                          //     "My Account",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
// ListTile(
                          //   leading: Icon(
                          //     CupertinoIcons.cart_fill,
                          //     color: Colors.orangeAccent,
                          //   ),
                          //   title: Text(
                          //     "My Orders",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          // ListTile(
                          //   leading: Icon(
                          //     CupertinoIcons.heart_fill,
                          //     color: Colors.orangeAccent,
                          //   ),
                          //   title: Text(
                          //     "My Wish List",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          // ListTile(
                          //   leading: Icon(
                          //     CupertinoIcons.settings_solid,
                          //     color: Colors.orangeAccent,
                          //   ),
                          //   title: Text(
                          //     "Settings",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          
