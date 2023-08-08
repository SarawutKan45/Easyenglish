import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserScoreModel {
  final String uid;
  final int score;
  final Timestamp time;
  UserScoreModel({
    this.uid,
    this.score,
    this.time,
  });

  UserScoreModel copyWith({
    String uid,
    int score,
    Timestamp time,
  }) {
    return UserScoreModel(
      uid: uid ?? this.uid,
      score: score ?? this.score,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'score': score,
      'time': time,
    };
  }

  factory UserScoreModel.fromMap(Map<String, dynamic> map) {

    if (map == null) return null;

    return UserScoreModel(
      uid:map['uid'],
      score: map['score'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserScoreModel.fromJson(String source) => UserScoreModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserScoreModel(uid: $uid, score: $score, time: $time)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserScoreModel &&
        o.uid == uid &&
        o.score == score &&
        o.time == time;
  }

  @override
  int get hashCode => uid.hashCode ^ score.hashCode^ time.hashCode;
}
