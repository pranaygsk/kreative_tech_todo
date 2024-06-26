import 'package:flutter/material.dart';
import 'package:kreative_tech_todo/services/firebase_services.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final firebaseServices = FirebaseServices();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Add Todo",style: TextStyle(color: Colors.white),),
        centerTitle: true,

        backgroundColor: Colors.deepPurple,
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
                label: const Text('Title'),
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
                label: const Text('Description'),
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
                    firebaseServices.createTodo(
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
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
            /*Container(
              padding: const EdgeInsets.all(25),
              width: w,
              height: h / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.deepPurple)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          print("edit");
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          print("delete");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
