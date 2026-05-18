import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SensorDataRecord extends FirestoreRecord {
  SensorDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wearerId" field.
  String? _wearerId;
  String get wearerId => _wearerId ?? '';
  bool hasWearerId() => _wearerId != null;

  // "heartRate" field.
  int? _heartRate;
  int get heartRate => _heartRate ?? 0;
  bool hasHeartRate() => _heartRate != null;

  // "spo2" field.
  int? _spo2;
  int get spo2 => _spo2 ?? 0;
  bool hasSpo2() => _spo2 != null;

  // "motion" field.
  double? _motion;
  double get motion => _motion ?? 0.0;
  bool hasMotion() => _motion != null;

  // "emg" field.
  double? _emg;
  double get emg => _emg ?? 0.0;
  bool hasEmg() => _emg != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _wearerId = snapshotData['wearerId'] as String?;
    _heartRate = castToType<int>(snapshotData['heartRate']);
    _spo2 = castToType<int>(snapshotData['spo2']);
    _motion = castToType<double>(snapshotData['motion']);
    _emg = castToType<double>(snapshotData['emg']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sensor_data');

  static Stream<SensorDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SensorDataRecord.fromSnapshot(s));

  static Future<SensorDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SensorDataRecord.fromSnapshot(s));

  static SensorDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SensorDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SensorDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SensorDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SensorDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SensorDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSensorDataRecordData({
  String? wearerId,
  int? heartRate,
  int? spo2,
  double? motion,
  double? emg,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wearerId': wearerId,
      'heartRate': heartRate,
      'spo2': spo2,
      'motion': motion,
      'emg': emg,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SensorDataRecordDocumentEquality implements Equality<SensorDataRecord> {
  const SensorDataRecordDocumentEquality();

  @override
  bool equals(SensorDataRecord? e1, SensorDataRecord? e2) {
    return e1?.wearerId == e2?.wearerId &&
        e1?.heartRate == e2?.heartRate &&
        e1?.spo2 == e2?.spo2 &&
        e1?.motion == e2?.motion &&
        e1?.emg == e2?.emg &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(SensorDataRecord? e) => const ListEquality().hash(
      [e?.wearerId, e?.heartRate, e?.spo2, e?.motion, e?.emg, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is SensorDataRecord;
}
