import 'service_locator.dart' as di;

class AppServices {
  static initialServices() async {
    await di.setup();
  }
}
