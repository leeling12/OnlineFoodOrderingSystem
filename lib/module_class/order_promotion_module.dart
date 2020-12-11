class OrderDetails{
  String stallName;
  String foodName;
  int qty;
  String price;
  String imgURL;

  OrderDetails({this.stallName, this.foodName, this.qty, this.price, this.imgURL});
}

class Promote{
  String stallName;
  String foodName;
  String originalPrice;
  String promotePrice;
  String imgURL;

  Promote({this.stallName, this.foodName, this.originalPrice, this.promotePrice, this.imgURL});
}