class UserModel{
  bool status;
  UserModel({required this.status});
  
  factory UserModel.getJson(Map json){
    return UserModel(status: json['status']);
  }
}