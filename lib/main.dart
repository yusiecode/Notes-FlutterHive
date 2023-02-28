import 'package:flutter/material.dart';
import 'package:flutter_hive/home_screen.dart';
import 'package:flutter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //to create directories, create directory on local phone storage
  var directory = await getApplicationDocumentsDirectory();
  //Hive database get this path, and hive database create files on that directory
  Hive.init(directory.path);

  Hive.registerAdapter(NotesModelAdapter());

  await Hive.openBox<NotesModel>('notes');

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

