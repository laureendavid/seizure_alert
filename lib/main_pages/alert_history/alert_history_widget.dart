import '/backend/backend.dart';
import '/components/card_content_each/card_content_each_widget.dart';
import '/components/drawer_component/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_history_model.dart';
export 'alert_history_model.dart';

class AlertHistoryWidget extends StatefulWidget {
  const AlertHistoryWidget({super.key});

  static String routeName = 'AlertHistory';
  static String routePath = '/alertHistory';

  @override
  State<AlertHistoryWidget> createState() => _AlertHistoryWidgetState();
}

class _AlertHistoryWidgetState extends State<AlertHistoryWidget> {
  late AlertHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertHistoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            buttonSize: 101.5,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
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
                                  'Alert History',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                  'Review recent activity and historical events monitored by the system',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().selectedFilter = 'all';
                                            safeSetState(() {});
                                          },
                                          text: 'All',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color:
                                                FFAppState().selectedFilter ==
                                                        'all'
                                                    ? Color(0xFF2E6385)
                                                    : Color(0x00000000),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppState()
                                                              .selectedFilter ==
                                                          'all'
                                                      ? Color(0xFFF1F4F8)
                                                      : Color(0xFF14181B),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().selectedFilter =
                                                'seizure';
                                            safeSetState(() {});
                                          },
                                          text: 'Seizure',
                                          options: FFButtonOptions(
                                            width: 80.0,
                                            height: 40.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color:
                                                FFAppState().selectedFilter ==
                                                        'seizure'
                                                    ? Color(0xFF2E6385)
                                                    : Color(0x00000000),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppState()
                                                              .selectedFilter ==
                                                          'seizure'
                                                      ? Color(0xFFF1F4F8)
                                                      : Color(0xFF14181B),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().selectedFilter =
                                                'panic';
                                            safeSetState(() {});
                                          },
                                          text: 'Panic',
                                          options: FFButtonOptions(
                                            width: 80.0,
                                            height: 40.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color:
                                                FFAppState().selectedFilter ==
                                                        'panic'
                                                    ? Color(0xFF2E6385)
                                                    : Color(0x00000000),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppState()
                                                              .selectedFilter ==
                                                          'panic'
                                                      ? Color(0xFFF1F4F8)
                                                      : Color(0xFF14181B),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().selectedFilter =
                                                'acknowledged';
                                            safeSetState(() {});
                                          },
                                          text: 'Acknowledged',
                                          options: FFButtonOptions(
                                            width: 120.0,
                                            height: 40.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color:
                                                FFAppState().selectedFilter ==
                                                        'acknowledged'
                                                    ? Color(0xFF2E6385)
                                                    : Color(0x00000000),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppState()
                                                              .selectedFilter ==
                                                          'acknowledged'
                                                      ? Color(0xFFF1F4F8)
                                                      : Color(0xFF14181B),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (FFAppState().selectedFilter == 'all')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: StreamBuilder<List<AlertsRecord>>(
                                      stream: queryAlertsRecord(
                                        queryBuilder: (alertsRecord) =>
                                            alertsRecord
                                                .whereIn('type',
                                                    ['panic', 'seizure'])
                                                .where(
                                                  'status',
                                                  isNotEqualTo: 'acknowledged',
                                                )
                                                .orderBy('status',
                                                    descending: true)
                                                .orderBy('timestamp',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AlertsRecord>
                                            listViewAllAlertsRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listViewAllAlertsRecordList
                                              .length,
                                          itemBuilder:
                                              (context, listViewAllIndex) {
                                            final listViewAllAlertsRecord =
                                                listViewAllAlertsRecordList[
                                                    listViewAllIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: CardContentEachWidget(
                                                key: Key(
                                                    'Key1a4_${listViewAllIndex}_of_${listViewAllAlertsRecordList.length}'),
                                                title: listViewAllAlertsRecord
                                                    .title,
                                                type: listViewAllAlertsRecord
                                                    .type,
                                                timestamp:
                                                    listViewAllAlertsRecord
                                                        .timestamp,
                                                latitude:
                                                    listViewAllAlertsRecord
                                                        .latitude,
                                                longitude:
                                                    listViewAllAlertsRecord
                                                        .longitude,
                                                status: listViewAllAlertsRecord
                                                    .status,
                                                alertRef:
                                                    listViewAllAlertsRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().selectedFilter == 'seizure')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: StreamBuilder<List<AlertsRecord>>(
                                      stream: queryAlertsRecord(
                                        queryBuilder: (alertsRecord) =>
                                            alertsRecord
                                                .where(
                                                  'type',
                                                  isEqualTo: 'seizure',
                                                )
                                                .where(
                                                  'status',
                                                  isNotEqualTo: 'acknowledged',
                                                )
                                                .orderBy('status',
                                                    descending: true)
                                                .orderBy('timestamp',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AlertsRecord>
                                            listViewSeizureAlertsRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewSeizureAlertsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewSeizureIndex) {
                                            final listViewSeizureAlertsRecord =
                                                listViewSeizureAlertsRecordList[
                                                    listViewSeizureIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: CardContentEachWidget(
                                                key: Key(
                                                    'Keysbh_${listViewSeizureIndex}_of_${listViewSeizureAlertsRecordList.length}'),
                                                title:
                                                    listViewSeizureAlertsRecord
                                                        .title,
                                                type:
                                                    listViewSeizureAlertsRecord
                                                        .type,
                                                timestamp:
                                                    listViewSeizureAlertsRecord
                                                        .timestamp,
                                                latitude:
                                                    listViewSeizureAlertsRecord
                                                        .latitude,
                                                longitude:
                                                    listViewSeizureAlertsRecord
                                                        .longitude,
                                                status:
                                                    listViewSeizureAlertsRecord
                                                        .status,
                                                alertRef:
                                                    listViewSeizureAlertsRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().selectedFilter == 'panic')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: StreamBuilder<List<AlertsRecord>>(
                                      stream: queryAlertsRecord(
                                        queryBuilder: (alertsRecord) =>
                                            alertsRecord
                                                .where(
                                                  'type',
                                                  isEqualTo: 'panic',
                                                )
                                                .where(
                                                  'status',
                                                  isNotEqualTo: 'acknowledged',
                                                )
                                                .orderBy('status',
                                                    descending: true)
                                                .orderBy('timestamp',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AlertsRecord>
                                            listViewPanicAlertsRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewPanicAlertsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewPanicIndex) {
                                            final listViewPanicAlertsRecord =
                                                listViewPanicAlertsRecordList[
                                                    listViewPanicIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: CardContentEachWidget(
                                                key: Key(
                                                    'Key4i1_${listViewPanicIndex}_of_${listViewPanicAlertsRecordList.length}'),
                                                title: listViewPanicAlertsRecord
                                                    .title,
                                                type: listViewPanicAlertsRecord
                                                    .type,
                                                timestamp:
                                                    listViewPanicAlertsRecord
                                                        .timestamp,
                                                latitude:
                                                    listViewPanicAlertsRecord
                                                        .latitude,
                                                longitude:
                                                    listViewPanicAlertsRecord
                                                        .longitude,
                                                status:
                                                    listViewPanicAlertsRecord
                                                        .status,
                                                alertRef:
                                                    listViewPanicAlertsRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().selectedFilter ==
                                    'acknowledged')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: StreamBuilder<List<AlertsRecord>>(
                                      stream: queryAlertsRecord(
                                        queryBuilder: (alertsRecord) =>
                                            alertsRecord
                                                .where(
                                                  'status',
                                                  isEqualTo: 'acknowledged',
                                                )
                                                .orderBy('timestamp',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AlertsRecord>
                                            listViewAcknowledgedAlertsRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewAcknowledgedAlertsRecordList
                                                  .length,
                                          itemBuilder: (context,
                                              listViewAcknowledgedIndex) {
                                            final listViewAcknowledgedAlertsRecord =
                                                listViewAcknowledgedAlertsRecordList[
                                                    listViewAcknowledgedIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: CardContentEachWidget(
                                                key: Key(
                                                    'Key51s_${listViewAcknowledgedIndex}_of_${listViewAcknowledgedAlertsRecordList.length}'),
                                                title:
                                                    listViewAcknowledgedAlertsRecord
                                                        .title,
                                                type:
                                                    listViewAcknowledgedAlertsRecord
                                                        .type,
                                                timestamp:
                                                    listViewAcknowledgedAlertsRecord
                                                        .timestamp,
                                                latitude:
                                                    listViewAcknowledgedAlertsRecord
                                                        .latitude,
                                                longitude:
                                                    listViewAcknowledgedAlertsRecord
                                                        .longitude,
                                                status:
                                                    listViewAcknowledgedAlertsRecord
                                                        .status,
                                                alertRef:
                                                    listViewAcknowledgedAlertsRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ],
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
    );
  }
}
