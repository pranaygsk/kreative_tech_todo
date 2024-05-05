import 'package:flutter/material.dart';
import 'package:kreative_tech_todo/services/firebase_services.dart';

class UpdateTodoPage extends StatelessWidget {
  UpdateTodoPage({super.key, required this.id, required this.title, required this.description});
  final String id;
  final String title;
  final String description;

  final firebaseServices = FirebaseServices();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    descriptionController.text = description;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    firebaseServices.updateTodo(
                      titleController.text,
                      descriptionController.text,
                      id,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
