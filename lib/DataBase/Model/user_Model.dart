// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names
class UserModel {
  // String? user_id;
  String user_name;
  String email;
  String mobile;
  String age;
  String password;
  // String? img_url;

  UserModel(/*this.user_id,*/ this.user_name, this.email, this.mobile, this.age,
      this.password, /*this.img_url*/);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // 'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'mobile': mobile,
      'age': age,
      'password': password,
     // 'img_url':img_url
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    // user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    mobile = map['mobile'];
    age = map['age'];
    password = map['password'];
   // img_url = map['img_url'];
  }
}
