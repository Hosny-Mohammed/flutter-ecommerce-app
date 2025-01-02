class ProductsModel{
  bool status;
  List<dynamic> data;

  ProductsModel({required this.status, required this.data});

  factory ProductsModel.getJson(Map json){
    return ProductsModel(status: json['status'], data: json['data']['products']);
  }
}