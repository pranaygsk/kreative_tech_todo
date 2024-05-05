import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo_model.dart';

class FirebaseServices {
  var db = FirebaseFirestore.instance;

  Stream<List<Todo>> readTodos() => db.collection('todos').snapshots().map((snapshot) => snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());

  createTodo(String title,String description) async {
    final todoRef = db.collection('todos').doc();
    final todo = Todo(id: todoRef.id,title: title,description: description);

    await todoRef.set(todo.toJson());
  }

  toggleTodo(bool isCompleted,String id){
    db.collection('todos').doc(id).update({
      'isCompleted' : isCompleted
    });
  }

}
