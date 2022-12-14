// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  // total de figurinhas no album
  final int totalAlbum;
  // total de figurinhas que eu tenho no album
  final int totalStickers;
  // total de figurinhas duplicadas
  final int totalDuplicates;
  // total de figurinhas que faltam para completar o album
  final int totalComplete;
  final int totalCompletPercent;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.totalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletPercent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'totalStickers': totalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletPercent': totalCompletPercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      totalAlbum: map['total_album'] as int,
      totalStickers: map['total_stickers'] as int,
      totalDuplicates: map['total_duplicates'] as int,
      totalComplete: map['total_complete'] as int,
      totalCompletPercent: map['total_complete_percent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
