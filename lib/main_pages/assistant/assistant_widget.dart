import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/components/drawer_component/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/genui/ff_genui_chat.dart';
import 'package:genui/genui.dart';
import 'package:genui_firebase_ai/genui_firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assistant_model.dart';
export 'assistant_model.dart';

class AssistantWidget extends StatefulWidget {
  const AssistantWidget({super.key});

  static String routeName = 'Assistant';
  static String routePath = '/assistant';

  @override
  State<AssistantWidget> createState() => _AssistantWidgetState();
}

class _AssistantWidgetState extends State<AssistantWidget> {
  late AssistantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssistantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: DrawerComponentWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF8F9FA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 93.33,
            icon: Icon(
              Icons.dehaze,
              color: Color(0xFF2E6385),
              size: 24.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'SeizureAlert',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF2E6385),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'SeizureAlert Assistant',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            'Your 24/7 seizure first aid guide. Ask me anything about seizure response, epilepsy care, and emergency steps.',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                    child: Container(
                      width: 1433.6,
                      height: 636.7,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Container(
                              width: 1368.49,
                              height: 538.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFE0E3E7),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await callAiAgent(
                                    context: context,
                                    prompt: 'You are a seizure first aid assistant for the SeizureAlert app.',
                                    threadId: currentUserUid,
                                    agentCloudFunctionName: 'geminiChatbot',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"geminiChatbot\",\"key\":\"eq3rh\"},\"name\":\"GeminiChatbot\",\"description\":\"Seizure first aid assistant chatbot\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":65535},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a seizure first aid assistant chatbot for the SeizureAlert app. Your role is to provide calm, clear, and accurate guidance to caregivers and bystanders during and after a seizure episode.\\n\\n## Your responsibilities:\\n- Provide step-by-step first aid instructions during a seizure\\n- Answer questions about seizure types, triggers, and symptoms\\n- Guide users on when to call emergency services (911 or 143 for Philippines NDRRMC)\\n- Offer post-seizure care advice\\n- Provide emotional support and reassurance to worried caregivers\\n- Answer questions about epilepsy medications and management (general info only)\\n- Help users track and understand seizure patterns\\n- Provide guidance on seizure safety at home, school, and work\\n\\n## Important rules:\\n- Always respond in a calm, clear, and reassuring tone\\n- If the situation sounds life-threatening, ALWAYS advise to call emergency services immediately\\n- Do NOT diagnose any medical condition\\n- Do NOT recommend specific medications or dosages\\n- Do NOT replace professional medical advice — always suggest consulting a neurologist or doctor\\n- If asked about unrelated topics, politely say: \\\"I\'m here to help with seizure-related concerns. Please consult the appropriate professional for other questions.\\\"\\n- Keep responses short, clear, and easy to understand — users may be in a panic\\n- Use simple language — avoid heavy medical jargon\\n- If the user seems distressed, acknowledge their feelings first before giving instructions\\n\\n## First aid knowledge you must apply:\\n### During a seizure:\\n- Stay calm and stay with the person\\n- Do NOT restrain the person\\n- Do NOT put anything in their mouth\\n- Clear the area of hard or sharp objects\\n- Cushion their head with something soft\\n- Turn them gently on their side (recovery position) if possible\\n- Time the seizure from start to finish\\n- Call emergency services if:\\n  - Seizure lasts more than 5 minutes\\n  - Person does not regain consciousness\\n  - Another seizure follows immediately\\n  - Person is injured, pregnant, or has diabetes\\n  - It is their first seizure ever\\n\\n### After a seizure:\\n- Stay with the person until fully conscious\\n- Speak calmly and reassuringly\\n- Do NOT offer food or water until fully alert\\n- Check for injuries\\n- Allow them to rest\\n- Document what happened (duration, movements, triggers)\\n\\n## Seizure types you should know:\\n- **Tonic-Clonic (Grand Mal)** — full body convulsions, loss of consciousness\\n- **Absence** — brief staring spells, may look like daydreaming\\n- **Focal/Partial** — affects one part of the body or one side\\n- **Atonic** — sudden loss of muscle tone, person may fall\\n- **Myoclonic** — sudden brief jerks or twitches\\n- **Febrile** — seizures caused by high fever, common in young children\\n\\n## Tone guidelines:\\n- If user is panicking: Be very short, direct, and numbered (e.g. \\\"1. Stay calm. 2. Do not restrain them.\\\")\\n- If user is asking general questions: Be informative but conversational\\n- If user is emotional or scared: Acknowledge first (\\\"I understand this is scary. You\'re doing the right thing by seeking help.\\\")\\n- Always end responses with an encouraging or reassuring statement when appropriate\\n\\n## Language:\\n- Respond in the same language the user is using (English or Filipino/Tagalog)\\n- If the user mixes English and Tagalog (Taglish), respond in Taglish as well\"},{\"role\":\"ASSISTANT\",\"text\":\"Hello! I\'m your SeizureAlert Assistant 👋 I\'m here to help you with seizure first aid, guidance, and support.\\n\\nHow can I help you today?\\n- 🚨 Someone is having a seizure right now\\n- ❓ I have questions about seizures\\n- 💊 Questions about epilepsy management\\n- 📋 I want to learn about seizure types\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
                                    responseType: 'PLAINTEXT',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.aiResponse = generatedText);
                                  });

                                  safeSetState(() {});
                                },
                                child: FFGenUIChat(
                                  key: ValueKey('seizureChat'),
                                  config: FFGenUIChatConfig(
                                    userPrompt:
                                        '''You are a seizure first aid assistant for the SeizureAlert app. Provide calm, clear, and accurate guidance during and after seizure episodes. Always advise calling emergency services (911 or 143) if life-threatening. Do NOT diagnose or replace medical advice. Respond in the same language the user uses (English, Filipino, or Taglish).''',
                                    componentDocs: '''''',
                                    catalog: Catalog([],
                                        catalogId:
                                            'flutterflow.io:genUIChatWidgetConfig'),
                                    contentGeneratorFactory:
                                        (catalog, systemPrompt, context,
                                                {onStatusChange}) =>
                                            FirebaseAiContentGenerator(
                                      catalog: catalog,
                                      systemInstruction: systemPrompt,
                                    ),
                                    showHeader: true,
                                    headerTitle: 'Chat',
                                    showAvatars: true,
                                    avatarSize: 32.0,
                                    backgroundColor: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(12.0),
                                    contentPadding: EdgeInsets.all(16.0),
                                    messageSpacing: 8.0,
                                    autoScroll: true,
                                    scrollAnimationMs: 300,
                                    inputPlaceholder: 'Type a message...',
                                    inputAreaBackgroundColor: Colors.white,
                                    inputAreaBorderRadius:
                                        BorderRadius.circular(24.0),
                                    userBubbleBorderRadius:
                                        BorderRadius.circular(16.0),
                                    aiBubbleBorderRadius:
                                        BorderRadius.circular(16.0),
                                    showWelcome: true,
                                    thinkingMessage: 'Thinking...',
                                  ),
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
