import 'package:flutter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';

class Boxes
{
  static Box<NotesModel> getData()
  {
    //returns a previously opened box of name: notes
    return Hive.box<NotesModel>('notes');
  }
}