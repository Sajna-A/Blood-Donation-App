import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AdduserState();
}

class _AdduserState extends State<AddUser> {
  final BloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Add Donors",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Donor name")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone number")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration:
                      InputDecoration(label: Text("Select Blood Group")),
                  items: BloodGroups.map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      )).toList(),
                  onChanged: (val) {
                    selectedGroup = val;
                  }),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(),
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.red),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
