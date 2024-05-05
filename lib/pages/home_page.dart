import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // List<Todos>

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List"),centerTitle: true,),
      body: SizedBox(
        width: w,
        height: h,
        child: ListView.builder(itemBuilder: )
      ),
    );
  }
}
