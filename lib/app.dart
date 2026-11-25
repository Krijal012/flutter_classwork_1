import 'package:classwork_1/pages/student_detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      home: StudentDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}