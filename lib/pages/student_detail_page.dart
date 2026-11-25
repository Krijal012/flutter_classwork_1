
import 'package:material_ui/material_ui.dart';
import 'output_page.dart';

class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage({super.key});

  @override
  State<StudentDetailPage> createState() =>
      _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {

  // Controllers
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();

  // Variables
  String? gender;
  String? department;

  final _globalkey = GlobalKey<FormState>();
  final _gap = const SizedBox(height: 8);

  // Validation
  String? validateString(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the required fields";
    }
    return null;
  }

  // Operations
  void displayDetails() {
    if (_globalkey.currentState!.validate()) {

      if (gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select gender"),
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputPage(
            firstName: firstController.text,
            lastName: lastController.text,
            gender: gender!,
            department: department!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(
        title: const Text("Student Detail Page"),
        centerTitle: true,
      ),

      body: Form(
        key: _globalkey,

        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: SingleChildScrollView(
            child: Column(
              children: [

                // First Name Field
                TextFormField(
                  controller: firstController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter the first name",
                  ),
                  validator: validateString,
                ),

                _gap,

                // Last Name Field
                TextFormField(
                  controller: lastController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter the last name",
                  ),
                  validator: validateString,
                ),

                _gap,

                // Gender
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Gender",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                _gap,

                RadioGroup<String>(
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  child: Column(
                    children: const [
                      RadioListTile<String>(
                        title: Text("Male"),
                        value: "Male",
                      ),

                      RadioListTile<String>(
                        title: Text("Female"),
                        value: "Female",
                      ),

                      RadioListTile<String>(
                        title: Text("Other"),
                        value: "Other",
                      ),
                    ],
                  ),
                ),

                _gap,

                // Department
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Select Department",
                    border: OutlineInputBorder(),
                  ),

                  initialValue: department,

                  items: const [
                    DropdownMenuItem(
                      value: "IT",
                      child: Text("IT"),
                    ),
                    DropdownMenuItem(
                      value: "SALES",
                      child: Text("SALES"),
                    ),
                    DropdownMenuItem(
                      value: "FINANCE",
                      child: Text("FINANCE"),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      department = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return "Please select department";
                    }
                    return null;
                  },
                ),

                _gap,

                // Display Details Button
                ElevatedButton(
                  onPressed: displayDetails,
                  child: const Text("Display Details"),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    lastController.dispose();
    super.dispose();
  }
}
