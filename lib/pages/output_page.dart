

import 'package:material_ui/material_ui.dart';

class OutputPage extends StatelessWidget {

  // Variables
  final String firstName;
  final String lastName;
  final String gender;
  final String department;

  const OutputPage({
    super.key,
    required this.firstName, 
    required this.lastName, 
    required this.gender, 
    required this.department, 
    }
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Output Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "First Name: $firstName",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "Last Name: $lastName",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "Department: $department",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),
          ],
        )
      )
    );
  }
}