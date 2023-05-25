
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
    required this.mobile});

   StudentDetails.fromMap(Map<String, dynamic>res) :
      id = res['id'],
      name = res['email'],
      dob = res['dob'],
      email = res['email'],
      mobile = res['mobile'];



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