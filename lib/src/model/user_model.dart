import 'dart:io';

class UserModel {
  String uid;
  String docId;
  String name;
  String discription;
  String avatarUrl;
  String backgroundUrl;
  File avatarFile;
  File backgroundFile;
  DateTime lastLoginTime;
  DateTime createdTime;

  UserModel({
    this.uid,
    this.docId,
    this.name = "",
    this.discription = "",
    this.avatarUrl,
    this.backgroundUrl,
    this.lastLoginTime,
    this.createdTime,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          docId: user.docId,
          name: user.name,
          discription: user.discription,
          avatarUrl: user.avatarUrl,
          backgroundUrl: user.backgroundUrl,
          lastLoginTime: user.lastLoginTime,
          createdTime: user.createdTime,
        );

  void initImageFile() {
    avatarFile = null;
    backgroundFile = null;
  }

  UserModel.fromJson(Map<String, dynamic> json, String docId)
      : uid = json["uid"] as String,
        docId = docId,
        name = json["name"] as String,
        discription = json["discription"] as String,
        avatarUrl = json["avatar_url"] as String,
        backgroundUrl = json["background_url"] as String,
        lastLoginTime = json["last_login_time"].toDate(),
        createdTime = json["created_time"].toDate();

  Map<String, dynamic> toMap() {
    return {
      "uid": this.uid,
      "name": this.name,
      "discription": this.discription,
      "avatar_url": this.avatarUrl,
      "background_url": this.backgroundUrl,
      "last_login_time": this.lastLoginTime,
      "created_time": this.createdTime,
    };
  }
}
