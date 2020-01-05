import 'package:tuple/tuple.dart';


class Store {

  int id;
  String country;
  String name;
  String desc;
  String address;
  Tuple2<double, double> coords;

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

  Store({ this.id, this.country, this.name, this.desc, this.address, this.coords });

}