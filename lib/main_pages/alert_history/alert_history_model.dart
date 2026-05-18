import '/components/drawer_component/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alert_history_widget.dart' show AlertHistoryWidget;
import 'package:flutter/material.dart';

class AlertHistoryModel extends FlutterFlowModel<AlertHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for drawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    drawerComponentModel.dispose();
  }
}
