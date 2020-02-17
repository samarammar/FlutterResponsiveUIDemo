class LoginModel{
  final String userId;
  final int id;
  final String title;
  final String body;

  LoginModel({this.userId, this.id, this.title, this.body});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
  return LoginModel(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );
  }


  Map toMap() {
  var map = new Map<String, dynamic>();
  map["userId"] = userId;
  map["title"] = title;
  map["body"] = body;

  return map;
  }

}