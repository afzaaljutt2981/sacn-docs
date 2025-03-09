import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scan_docs/global/appConfigs/global_hive.dart';

class AppStartupConfiguration {
  static doConfigurations() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    preferences = await Hive.openBox('appBox');
  }
}
