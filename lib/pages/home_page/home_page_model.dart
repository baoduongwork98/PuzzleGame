import '/components/initial_grid_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InitialGridView component.
  late InitialGridViewModel initialGridViewModel;

  @override
  void initState(BuildContext context) {
    initialGridViewModel = createModel(context, () => InitialGridViewModel());
  }

  @override
  void dispose() {
    initialGridViewModel.dispose();
  }
}
