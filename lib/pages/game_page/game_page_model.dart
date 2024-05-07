import '/flutter_flow/flutter_flow_util.dart';
import 'game_page_widget.dart' show GamePageWidget;
import 'package:flutter/material.dart';

class GamePageModel extends FlutterFlowModel<GamePageWidget> {
  ///  Local state fields for this page.

  List<int> boardNumbers = [];
  void addToBoardNumbers(int item) => boardNumbers.add(item);
  void removeFromBoardNumbers(int item) => boardNumbers.remove(item);
  void removeAtIndexFromBoardNumbers(int index) => boardNumbers.removeAt(index);
  void insertAtIndexInBoardNumbers(int index, int item) =>
      boardNumbers.insert(index, item);
  void updateBoardNumbersAtIndex(int index, Function(int) updateFn) =>
      boardNumbers[index] = updateFn(boardNumbers[index]);

  int? moves = 0;

  bool isStarted = false;

  int? lastScore = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - shuffleBoard] action in Button widget.
  List<int>? shuffledNumList;
  // Stores action output result for [Custom Action - onClick] action in Container widget.
  dynamic listMovesMap;
  // Stores action output result for [Custom Action - isSolved] action in Container widget.
  bool? isSolved;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
