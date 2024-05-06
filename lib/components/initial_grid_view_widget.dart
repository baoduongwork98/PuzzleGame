import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'initial_grid_view_model.dart';
export 'initial_grid_view_model.dart';

class InitialGridViewWidget extends StatefulWidget {
  const InitialGridViewWidget({super.key});

  @override
  State<InitialGridViewWidget> createState() => _InitialGridViewWidgetState();
}

class _InitialGridViewWidgetState extends State<InitialGridViewWidget> {
  late InitialGridViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialGridViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          final initNumList = functions.initBoard()?.toList() ?? [];
          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: initNumList.length,
            itemBuilder: (context, initNumListIndex) {
              final initNumListItem = initNumList[initNumListIndex];
              return FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: initNumListItem.toString(),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF9991FF),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
