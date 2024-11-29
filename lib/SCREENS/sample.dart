import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({super.key, this.donarname, this.number}) {
    DonorName.text = donarname ?? '';
    DonorNumber.text = number ?? '';
  }

  final donarname;
  final number;
  final BloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;

  final TextEditingController DonorName = TextEditingController();
  final TextEditingController DonorNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments from Navigator.pushNamed
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      DonorName.text = args['donarname'] ?? '';
      DonorNumber.text = args['number'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Donors",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
                decoration: InputDecoration(label: Text("Select Blood Group")),
                items: BloodGroups.map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    )).toList(),
                onChanged: (val) {
                  selectedGroup = val;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: ContinuousRectangleBorder(),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.red,
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
