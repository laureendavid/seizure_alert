import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WearersRecord extends FirestoreRecord {
  WearersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wearerId" field.
  String? _wearerId;
  String get wearerId => _wearerId ?? '';
  bool hasWearerId() => _wearerId != null;

  // "wearerName" field.
  String? _wearerName;
  String get wearerName => _wearerName ?? '';
  bool hasWearerName() => _wearerName != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _wearerId = snapshotData['wearerId'] as String?;
    _wearerName = snapshotData['wearerName'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wearers');

  static Stream<WearersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WearersRecord.fromSnapshot(s));

  static Future<WearersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WearersRecord.fromSnapshot(s));

  static WearersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WearersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WearersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WearersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WearersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WearersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWearersRecordData({
  String? wearerId,
  String? wearerName,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wearerId': wearerId,
      'wearerName': wearerName,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class WearersRecordDocumentEquality implements Equality<WearersRecord> {
  const WearersRecordDocumentEquality();

  @override
  bool equals(WearersRecord? e1, WearersRecord? e2) {
    return e1?.wearerId == e2?.wearerId &&
        e1?.wearerName == e2?.wearerName &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(WearersRecord? e) =>
      const ListEquality().hash([e?.wearerId, e?.wearerName, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is WearersRecord;
}
