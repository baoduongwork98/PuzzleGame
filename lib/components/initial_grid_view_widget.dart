import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'initial_grid_view_model.dart';
export 'initial_grid_view_model.dart';

class InitialGridViewWidget extends StatefulWidget {
  const InitialGridViewWidget({
    super.key,
    required this.level,
  });

  final int? level;

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
          final initNumList =
              functions.initBoard(widget.level!)?.toList() ?? [];

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: valueOrDefault<int>(
                widget.level,
                3,
              ),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: initNumList.length,
            itemBuilder: (context, initNumListIndex) {
              final initNumListItem = initNumList[initNumListIndex];
              return Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: const Color(0x4CC3C0FF),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: AutoSizeText(
                  initNumListItem.toString(),
                  textAlign: TextAlign.center,
                  minFontSize: 20.0,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
