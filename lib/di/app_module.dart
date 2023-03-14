import 'package:di_mixin_extension_demo/di/service_locator.dart';
import 'package:di_mixin_extension_demo/di/service_locator_impl.dart';
import 'package:di_mixin_extension_demo/utils/image_helper.dart';

class AppModule {
  final serviceLocator = ServiceLocator.tabServiceLocator;

  Future<void> initialise() async {
    // Initialise service provider
    ServiceLocatorImpl().initialise();

    // ImageHelper
    if (!serviceLocator.isRegistered<ImageHelper>()) {
      serviceLocator.registerSingleton(ImageHelper());
    }
  }
}
