import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Front End',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Color.fromARGB(255, 87, 129, 239),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Programação',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Color.fromARGB(255, 25, 148, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Mobile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Color.fromARGB(255, 216, 45, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Back End',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Gestão e Inovação',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
