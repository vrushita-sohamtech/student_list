
class StudentDetails{
  late final int id;
  late final String name;
  late final String dob;
  late final String email;
  late final String mobile;
  final columns = ['id', 'name', 'dob', 'email', 'mobile'];
  StudentDetails({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.mobile,
  });

   StudentDetails.fromMap(Map<String, dynamic>map) :
      id = map['id'],
      name = map['email'],
      dob = map['dob'],
      email = map['email'],
      mobile = map['mobile'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'email': email,
      'mobile': mobile,
    };
  }
}