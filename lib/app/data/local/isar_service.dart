import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/app/data/models/task.dart';
export 'package:isar/isar.dart';
export 'package:isar_flutter_libs/isar_flutter_libs.dart';

class IsarService {
  late Isar isar;
  //must be initialized
  Future init() async {
    final Directory dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [
        TaskSchema,
      ], //inject all schema here
      directory: dir.path,
      inspector: true,
    );
  }
}
