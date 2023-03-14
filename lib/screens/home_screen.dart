import 'package:di_mixin_extension_demo/di/service_locator.dart';
import 'package:di_mixin_extension_demo/generated/l10n.dart';
import 'package:di_mixin_extension_demo/utils/image_helper.dart';
import 'package:flutter/material.dart';

class HomePageConstant {
  static const String imageUrl =
      'https://developers.google.com/static/learn/images/flutter/flutter_logo_2880.jpg';
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // dependency injected
    final imageHelper = SL.get<ImageHelper>();

    return MaterialApp(
      //intl
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.teal,
        ),
        body: Builder(builder: (context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // message from String file
                Text(
                  S.of(context).message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ).alignAtEnd(),

                // image from ImageHelper
                Expanded(
                  child: Center(
                    child: imageHelper.getImageWithPlaceHolder(
                      url: HomePageConstant.imageUrl,
                      requiredPlaceHolder: true,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// extension functions
extension AlignExtension on Widget {
  alignAtStart() {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: this,
    );
  }

  alignAtCenter() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: this,
    );
  }

  alignAtEnd() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: this,
    );
  }
}
