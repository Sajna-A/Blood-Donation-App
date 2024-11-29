import 'package:blood_donation/SCREENS/adduser.dart';
import 'package:blood_donation/SCREENS/sample.dart';
import 'package:blood_donation/SCREENS/update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donor1 =
      FirebaseFirestore.instance.collection('donor');
  void DeleteDonor(docId) {
    donor1.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Blood Donation App",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddUser(),
          ));
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: StreamBuilder(
        stream: donor1.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 216, 213, 213),
                              blurRadius: 10,
                              spreadRadius: 15)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 30,
                              child: Text(
                                donorSnap['group'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              donorSnap['name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              donorSnap['phone'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/update',
                                    arguments: {
                                      'name': donorSnap['name'],
                                      'phone': donorSnap['phone'].toString(),
                                      'group': donorSnap['group'],
                                      'id': donorSnap.id,
                                    });
                              },
                              icon: Icon(Icons.edit),
                              iconSize: 30,
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: () {
                                DeleteDonor(donorSnap.id);
                              },
                              icon: Icon(Icons.delete),
                              iconSize: 30,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
