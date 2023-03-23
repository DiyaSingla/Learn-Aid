import 'package:learn_aid/ngo_first_page.dart'; 
import 'ngo_second_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirstPageState x = new FirstPageState();
//NextNGOPageState y = new NextNGOPageState();

class WriteNgoData {
  String id;
  String name;
  String phone;
  String add1;
  String add2;
  String numcls1;
  String numcls2;
  String numcls3;
  String numcls4;
  String numcls5;
  String hrto;
  String hrfrom;
  String? selectedClass;

  WriteNgoData({
    this.id = '',
    this.name = '',
    this.phone = '',
    this.add1 = '',
    this.add2 = '',
    this.numcls1 = '',
    this.numcls2 = '',
    this.numcls3 = '',
    this.numcls4 = '',
    this.numcls5 = '',
    this.hrto = '',
    this.hrfrom = '',
    this.selectedClass = '',
  }); 

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'add1' : add1,
    'add2' : add2,
    'numcls1': numcls1,
    'numcls2': numcls2,
    'numcls3': numcls3,
    'numcls4': numcls4,
    'numcls5': numcls5,
    'hrto': hrto,
    'hrfrom': hrfrom,
    'selectedClass' : selectedClass,
  };

  static WriteNgoData fromJson(Map<String, dynamic> json) => WriteNgoData(
        id: json['id'],
        name : json['name'],
        phone : json['phone'],
        add1: json['add1'],
        add2: json['add2'],
        numcls1: json['numcls1'],
        numcls2: json['numcls2'],
        numcls3: json['numcls3'],
        numcls4: json['numcls4'],
        numcls5: json['numcls5'],
        hrto: json['hrto'],
        hrfrom: json['hrfrom'],
        selectedClass : json['selectedClass'],
      );

  

}


