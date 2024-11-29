import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  final BloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;
  final CollectionReference donor1 =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController DonorName = TextEditingController();
  TextEditingController DonorNumber = TextEditingController();
  void UppdateDonor(docId) {
    final data = {
      'name': DonorName.text,
      'phone': DonorNumber.text,
      'group': selectedGroup,
    };
    donor1.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
            {};
    DonorName.text = args['name'] ?? '';
    DonorNumber.text = args['phone'] ?? '';
    selectedGroup =
        args['group'] ?? BloodGroups.first; // Default to the first group
    final docId = args['id'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Update Donors",
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
                controller: DonorName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Donor name")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: DonorNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone number")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  value: selectedGroup,
                  decoration:
                      InputDecoration(label: Text("Select Blood Group")),
                  items: BloodGroups.map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      )).toList(),
                  onChanged: (val) {
                    selectedGroup = val as String?;
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  UppdateDonor(docId);
                },
                style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(),
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.red),
                child: Text(
                  "Update",
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
