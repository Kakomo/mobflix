

import 'package:challenge/data/database.dart';
import 'package:challenge/model/video_model.dart';
import 'package:sqflite/sqflite.dart';

class VideoDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id TEXT, '
      '$_url TEXT, '
      '$_category TEXT)';

  static const String _tableName = 'mobflixTable';
  static const String _id = 'uuid';
  static const String _url = 'link';
  static const String _category = 'categoria';

  save(VideoModel video) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(video.id);
    Map<String, dynamic> videoMap = toMap(video);
    if (itemExists.isEmpty) {
      print('o vídeo não Existia.');
      return await bancoDeDados.insert(_tableName, videoMap);
    } else {
      print('o vídeo existia!');
      return await bancoDeDados.update(
        _tableName,
        videoMap,
        where: '$_id = ?',
        whereArgs: [video.id],
      );
    }
  }

  Map<String, dynamic> toMap(VideoModel video) {
    print('Convertendo to Map: ');
    final Map<String, dynamic> mapaDeVideos = Map();
    mapaDeVideos[_id] = video.id;
    mapaDeVideos[_url] = video.url;
    mapaDeVideos[_category] = video.category;
    print('Mapa de Videos: $mapaDeVideos');
    return mapaDeVideos;
  }

  Future<List<VideoModel>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tableName);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<VideoModel> toList(List<Map<String, dynamic>> mapaDeVideos) {
    print('Convertendo to List:');
    final List<VideoModel> videos = [];
    for (Map<String, dynamic> linha in mapaDeVideos) {
      final VideoModel video = VideoModel(id: linha[_id],
        url: linha[_url],
        category: linha[_category],

      );
      videos.add(video);
    }
    print('Lista de Videos: ${videos.toString()}');
    return videos;
  }

  Future<List<VideoModel>> find(String idDoVideo) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    print('Procurando video com ID: ${idDoVideo}');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_id = ?', whereArgs: [idDoVideo]);
    print('Video encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String idDoVideo) async {
    print('Deletando video: $idDoVideo');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [idDoVideo],
    );
  }

}