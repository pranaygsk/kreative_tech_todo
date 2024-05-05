import 'package:flutter/material.dart';
import 'package:kreative_tech_todo/pages/add_todo_page.dart';
import 'package:kreative_tech_todo/services/firebase_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ),
          );
        },
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SizedBox(
        width: w,
        height: h,
        child: StreamBuilder(
          stream: firebaseServices.readTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else {
              final docs = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(docs[index].title),
                    subtitle: Text(docs[index].description),
                    value: docs[index].isCompleted,
                    onChanged: (bool? value) {
                      firebaseServices.toggleTodo(value!, docs[index].id);
                    },
                    secondary: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Are you sure?'),
                            content: const Text("This cannot be undone"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    firebaseServices.deleteTodo(docs[index].id);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes')),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
                itemCount: docs.length,
              );
            }
          },
        ),
      ),
    );
  }
}
