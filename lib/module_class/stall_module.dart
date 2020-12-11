class StallModule{
  String stallName;
  String img;
  String description;
  String operatingHrs;
  List<FoodModule> menu;


  StallModule({
      this.stallName,
      this.img,
      this.description,
      this.operatingHrs,
      this.menu,});
}

class FoodModule{
  String name;
  double rating;
  String reviews;
  String description;
  String price;
  String img;
  bool status;

  FoodModule({this.name, this.rating, this.reviews, this.description,
      this.price, this.img, this.status});

}