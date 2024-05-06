import '/flutter_flow/flutter_flow_util.dart';
import 'donate_page_widget.dart' show DonatePageWidget;
import 'package:flutter/material.dart';

class DonatePageModel extends FlutterFlowModel<DonatePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
