
class Drink {

  int id;
  String category;
  String name;
  String desc;
  String info;
  String img;
  double price;

  //  normal constructor, as we've already seen

  //  Quote(String author, String text){
  //    this.text = text;
  //    this.author = author;
  //  }

  //  constructor with named parameters

  //  Quote({ String author, String text }){
  //    this.text = text;
  //    this.author = author;
  //  }

  // constructor with named parameters
  // & automatically assigns named arguments to class properties

  Drink({ this.id, this.category, this.name, this.desc, this.info, this.img, this.price});

}