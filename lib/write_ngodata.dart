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
  String email;

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
    this.email = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'add1': add1,
        'add2': add2,
        'numcls1': numcls1,
        'numcls2': numcls2,
        'numcls3': numcls3,
        'numcls4': numcls4,
        'numcls5': numcls5,
        'hrto': hrto,
        'hrfrom': hrfrom,
        'selectedClass': selectedClass,
        'email': email,
      };

  static WriteNgoData fromJson(Map<String, dynamic> json) => WriteNgoData(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        add1: json['add1'],
        add2: json['add2'],
        numcls1: json['numcls1'],
        numcls2: json['numcls2'],
        numcls3: json['numcls3'],
        numcls4: json['numcls4'],
        numcls5: json['numcls5'],
        hrto: json['hrto'],
        hrfrom: json['hrfrom'],
        selectedClass: json['selectedClass'],
        email: json['email'],
      );

  Future createUserNgo(WriteNgoData user) async {
    final docUser = FirebaseFirestore.instance.collection('NgoUsers').doc();
    final user1 = WriteNgoData(
      id: docUser.id,
      name: user.name,
      phone: user.phone,
      add1: user.add1,
      add2: user.add2,
      numcls1: user.numcls1,
      numcls2: user.numcls2,
      numcls3: user.numcls3,
      numcls4: user.numcls4,
      numcls5: user.numcls5,
      hrto: user.hrto,
      hrfrom: user.hrfrom,
      selectedClass: user.selectedClass,
      email: user.email,
    );
    id = docUser.id;
    final json = user1.toJson();
    await docUser.set(json);
  }
}

class WriteMentorData {
  String id;
  int collegeStudent; //selected value
  String org;
  String name;
  String age;
  String ph;
  String? selectedClass;
  String? selectedSubject;
  String? selectedTopic;
  String email;

  WriteMentorData({
    this.id = '',
    this.collegeStudent = 0,
    this.org = '',
    this.name = '',
    this.ph = '',
    this.age = '',
    selectedClass = '',
    selectedSubject = '',
    selectedTopic = '',
    this.email = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'phone': ph,
        'collegeStudentOrNot': collegeStudent,
        'organisation': org,
        'selectedClass': selectedClass,
        'selectedSubject': selectedSubject,
        'selectedTopic': selectedTopic,
        'email': email,
      };

  static WriteMentorData fromJson(Map<String, dynamic> json) => WriteMentorData(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        ph: json['phone'],
        collegeStudent: json['collegeStudentOrNot'],
        org: json['organisation'],
        selectedClass: json['selectedClass'],
        selectedSubject: json['selectedSubject'],
        selectedTopic: json['selectedTopic'],
        email: json['email'],
      );

  Future createUserMentor(WriteMentorData user) async {
    final docUser = FirebaseFirestore.instance.collection('MentorUsers').doc();
    final user1 = WriteMentorData(
      id: docUser.id,
      name: user.name,
      age: user.age,
      ph: user.ph,
      collegeStudent: user.collegeStudent,
      org: user.org,
      selectedClass: user.selectedClass,
      selectedSubject: user.selectedSubject,
      selectedTopic: user.selectedTopic,
      email: user.email,
    );
    id = docUser.id;
    final json = user1.toJson();
    await docUser.set(json);
  }
}
