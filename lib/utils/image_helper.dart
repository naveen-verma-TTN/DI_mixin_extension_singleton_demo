import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageHelper {
  // function to get the image with placeholder as optional
  Widget getImageWithPlaceHolder(
          {required String url, bool requiredPlaceHolder = false}) =>
      CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        placeholder: (context, url) => requiredPlaceHolder
            ? const CircularProgressIndicator()
            : const SizedBox.shrink(),
        errorWidget: (context, url, error) => requiredPlaceHolder
            ? const Icon(
                Icons.error,
                size: 50.0,
              )
            : const SizedBox.shrink(),
      );
}
