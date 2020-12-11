
class StallOwnerModule{
  String stallID;
  String password;
  String stallName;
  String gender;
  String phoneNum;
  String email;
  String registerDate;
  String location;

  StallOwnerModule(
      this.stallID,
      this.password,
      this.stallName,
      this.gender,
      this.phoneNum,
      this.email,
      this.registerDate,
      this.location,
      );
}

class storeOwnerOrderDetails{
  String stallName;
  String foodName;
  String foodImg;
  int orderQty;
  String tableNum;
  String totalPrice;
  String status;
  String orderTime;

  storeOwnerOrderDetails({
    this.stallName,
    this.foodName,
    this.foodImg,
    this.orderQty,
    this.tableNum,
    this.totalPrice,
    this.status,
    this.orderTime,
  });
}