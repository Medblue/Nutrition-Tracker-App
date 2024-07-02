import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id;
  final String babyName;
  final String motherName;
  final String dob;
  final String gender;
  final String weight;

  User({
    this.id = 0,
    required this.babyName,
    required this.motherName,
    required this.dob,
    required this.gender,
    required this.weight,
  });
}
