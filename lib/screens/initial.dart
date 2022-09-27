import 'package:challenge/components/banner.dart';
import 'package:challenge/components/category_list.dart';
import 'package:challenge/components/video_card.dart';
import 'package:challenge/data/video_dao.dart';
import 'package:challenge/model/video_model.dart';
import 'package:challenge/screens/sign_up.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        title: Text(
          'MOBFLIX', // adicionar tipografia do NETFLIX
          style: TextStyle(
            fontSize: 32,
            color: Color.fromARGB(255, 36, 120, 223),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 26, 26, 26),
      ),
      body: Column(
        children: [
          TopBanner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryList(),
          ),
          FutureBuilder<List<VideoModel>>(
              future: VideoDao().findAll(),
              builder: (context, snapshot) {
                List<VideoModel>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // TODO: Handle this case.
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return Flexible(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final VideoModel video = items[index];
                              return VideoCard(
                                video: video,
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // não implementado em vídeo por descuido meu, desculpem.
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // essa linha de layout deixa o conteudo totalmente centralizado.
                        children: const [
                          Icon(
                            Icons.video_call_sharp,
                            size: 128,
                            color: Color.fromARGB(255, 123, 97, 255),
                          ),
                          Text(
                            'Adicione um vídeo!',
                            style: TextStyle(
                                fontSize: 32,
                                color: Color.fromARGB(255, 123, 97, 255)),
                          ),
                        ],
                      ));
                    }
                    return const Text('Erro ao carregar tarefas');
                }
              }),
          const SizedBox(height: 30,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextTwo) => SignUpForm()),
          ).then((value) => setState((){}));
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
        backgroundColor: Color.fromARGB(255, 123, 97, 255),
      ),
    );
  }
}
