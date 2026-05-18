import '/components/drawer_component/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assistant_widget.dart' show AssistantWidget;
import 'package:flutter/material.dart';

class AssistantModel extends FlutterFlowModel<AssistantWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to GeminiChatbot] action in GenUIChatWidget widget.
  String? aiResponse;
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
