import 'package:challenge/data/video_dao.dart';
import 'package:challenge/model/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController urlController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 26),
        appBar: AppBar(
          title: Text(
            'Cadastre um vídeo',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 26, 26, 26),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'URL.:',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: urlController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ex.: N3h5A0oAzsk',
                    fillColor: Color.fromARGB(255, 39, 95, 163),
                    filled: true,
                  ),
                ),
                Text(
                  'Categoria:',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile, Front-end...',
                    fillColor: Color.fromARGB(255, 39, 95, 163),
                    filled: true,
                  ),
                ),
                Text(
                  'Preview',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Container(
                  height: 180,
                  width: 358,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.white54,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://i.ytimg.com/vi/${urlController.text}/hqdefault.jpg',
                      errorBuilder: (context, exception, stackTrace) {
                        return Container();
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      VideoDao().save(VideoModel(
                          id: uuid.v4().toString(),
                          url: urlController.text,
                          category: categoryController.text));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Adicionando um novo vídeo!')));
                      Navigator.pop(context);
                    },
                    child: Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(318, 48)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
