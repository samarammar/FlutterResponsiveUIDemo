import 'package:flutter/material.dart';
import '../utils/ui_utils.dart';
import 'sizing_information.dart';


class BaseWidget extends StatelessWidget {

  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
//    var sizingInformation = SizingInformation();

    return LayoutBuilder(builder: (context,boxConstraints){
      var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    },);
  }
}