import 'package:flutter/material.dart';

class Helpers {
  static Future<dynamic> customModalBottomSheet(
    BuildContext context, {
    bool isDismissible = true,
    bool? showDrag,
    double? height,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      showDragHandle: showDrag ?? false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0 * 2),
          topRight: Radius.circular(12.0 * 2),
        ),
      ),
      builder: (context) => SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.75,
        child: child,
      ),
    );
  }
}