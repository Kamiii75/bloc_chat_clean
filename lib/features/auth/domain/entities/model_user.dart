class ModelUser {
  String? name;

  String? email;
  String? password;
  String? phone;
  String? imgUrl;
  int? status;
  bool? isAdmin;

  String? uid;

  ModelUser({
    this.email,
    this.password,
    this.phone,
    this.status,
    this.imgUrl,
    this.name,
    this.uid,
    this.isAdmin,
  });

  ModelUser.fromJson(Map<String, dynamic> json, idx) {
    email = json['email'];

    name = json['name'];
    phone = json['phone'];
    status = json['status'];
    imgUrl = json['imgUrl'];
    uid = json['uid'];
    isAdmin = json['isAdmin'];
  }

  ModelUser.fromMap(Map<String, dynamic> json) {
    email = json['email'];

    name = json['name'];
    phone = json['phone'];
    status = json['status'];
    imgUrl = json['imgUrl'];
    uid = json['uid'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;

    data['name'] = name;
    data['phone'] = phone;
    data['status'] = status;
    data['imgUrl'] = imgUrl;
    data['uid'] = uid;
    data['isAdmin'] = isAdmin;

    return data;
  }

  ModelUser copyWith({
    String? email,
    String? imgUrl,
    String? phone,
    String? password,
    String? name,
    int? status,
    String? uid,
    bool? isAdmin,
  }) {
    return ModelUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      imgUrl: imgUrl ?? this.imgUrl,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      name: name ?? this.name,
      status: status ?? this.status,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
