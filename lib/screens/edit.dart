import 'package:challenge/data/video_dao.dart';
import 'package:challenge/model/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  const EditForm({required this.video, Key? key}) : super(key: key);
  final VideoModel video;

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  TextEditingController urlController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 26),
        appBar: AppBar(
          title: Text(
            'Editar o vídeo',
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
                  controller: urlController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    label: Text(
                      widget.video.url,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'URL anterior',
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
                    label: Text(
                      widget.video.category,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Categoria anterior',
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
                          id: widget.video.id,
                          url: urlController.text,
                          category: categoryController.text));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Alterando o vídeo!')));
                      Navigator.pop(context);
                    },
                    child: Text('Alterar'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(318, 48),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      VideoDao().delete(widget.video.id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Deletando o vídeo')));
                      Navigator.pop(context);
                    },
                    child: Text('Remover'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(318, 48),
                        backgroundColor: Color.fromARGB(255, 216, 45, 45)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
