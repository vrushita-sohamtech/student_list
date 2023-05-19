


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
  factory StudentDetails.fromMap(Map<String, dynamic>data) {
    return StudentDetails(
      id: 1,
      name: 'edf',
      dob: '23/07/2002',
      email: 'abc@gmail.com',
      mobile: '2345464',
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'dob': dob,
    'email': email,
    'mobile': mobile,
  };
}