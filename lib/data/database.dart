import 'package:challenge/data/video_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'mobflix2.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(VideoDao.tableSql);
    },
    version: 1,
  );
}
