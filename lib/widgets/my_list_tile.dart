import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final bool isCompleted;
  final void Function(bool?)? togglePressed;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const MyListTile({super.key, required this.width, required this.height, required this.title, required this.description, this.onEditPressed, this.onDeletePressed, required this.isCompleted, this.togglePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      width: width,
      height: height / 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.deepPurpleAccent,width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: isCompleted, onChanged: togglePressed),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit,color: Colors.deepPurple,size: 24,),
                onPressed: onEditPressed,
              ),
              IconButton(
                icon: Icon(Icons.delete,color: Colors.red.shade400,size: 24,),
                onPressed: onDeletePressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
