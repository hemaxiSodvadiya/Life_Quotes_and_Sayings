import 'package:demo_project/helpers/show_data_helper.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../global/global.dart';
import '../model/model.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "quotes.db";
  final String colId = "id";
  final String colQuotes = "quote";
  final String colAuthor = "author";
  final String colImage = "image";
  String colFavorite = "favorite";

  Database? db;

  Future<void> initDB({required String tableName}) async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(path, version: 1, onCreate: (db, version) {});

    await db?.execute(
        "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT,  $colFavorite TEXT,$colQuotes TEXT,$colAuthor TEXT, $colImage BLOB)");
  }

  insertRecordData({required String tableName}) async {
    await initDB(tableName: tableName);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;

    if (isInserted == false) {
      List<Quotes>? res = await QuotesDataShow.quotesDataShow
          .fetchQuotesData(tableName: tableName);

      for (int i = 0; i < res!.length; i++) {
        String query =
            "INSERT INTO $tableName($colQuotes, $colAuthor, $colImage,$colFavorite) VALUES(?, ?, ?)";
        List args = [res[i].quot, res[i].author, res[i].image, res[i].favorite];

        await db?.rawInsert(query, args);
      }
      prefs.setBool(tableName, true);
    }
  }

  Future<List<QuotesDataBase>> fetchAllRecords(
      {required String tableName}) async {
    await insertRecordData(tableName: tableName);
    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QuotesDataBase> quotes =
        allQuotes.map((e) => QuotesDataBase.fromJSON(e)).toList();

    Global.isAuthor = false;

    return quotes;
  }
}
