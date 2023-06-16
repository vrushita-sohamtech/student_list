import 'package:flutter/material.dart';
import 'package:student_list/detail.dart';
import 'package:student_list/studentDetails.dart';
import 'database.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> myData = [];

  bool _isLoading = true;
  void _refreshData() async {
    final data = await DatabaseHelper.getData();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  Future<void> insert() async {
    await DatabaseHelper.insert(
        idController.text,
        nameController.text,
        dobController.text,
        emailController.text,
        mobileController.text);
    _refreshData();
  }

  Future<dynamic> updateItem() async {
    await DatabaseHelper.update(
      idController.text,
      nameController.text,
      dobController.text,
      emailController.text,
      mobileController.text,);
    _refreshData();
  }
  void showMyForm(int? id) async {
    if (id != null) {
      final existingData =
      myData.firstWhere((element) => element['id'] == id);
      idController.text = existingData['id'].toString();
      nameController.text = existingData['name'];
      dobController.text = existingData['dob'];
      emailController.text = existingData['email'];
      mobileController.text = existingData['mobile'].toString();
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: ' Enter id',
                  labelText: 'id'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: 'Enter name',
                  labelText: 'name'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: 'Enter dob',
                  labelText: 'dob'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: 'Enter email',
                  labelText: 'email'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: 'Enter mobile',
                  labelText: 'mobile'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  insert();
                    await updateItem();
                  idController.text = '';
                  nameController.text = '';
                  dobController.text = '';
                  emailController.text = '';
                  mobileController.text = '';

                  Navigator.pop(context);
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ));
  }


  void deleteItem(int id) async {
     DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted!'),
        backgroundColor:Colors.grey
    ));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) =>
                Dismissible(
                  key: UniqueKey(),
                  background: const Icon(Icons.edit),
                  secondaryBackground: const Icon(Icons.delete),
                  confirmDismiss: (direction) async{
                    if(direction == DismissDirection.startToEnd){
                      showMyForm(myData[index]['id']);
                    }else{
                      if(direction == DismissDirection.endToStart){
                        deleteItem(myData[index]['id']);
                      }
                    }
                  },
                  child: Card(
          color:index%2==0?Colors.grey: Colors.grey[400],
          margin: const EdgeInsets.all(15),
            child:ListTile(
              title: Text(myData[index]['id'].toString(),
                style: const TextStyle(fontSize: 20),),
              subtitle: Text('Name:' +myData[index]['name']),
              textColor: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => detail(student: StudentDetails(
                        id: myData[index]['id'],
                        name:myData[index]['name'],
                        dob: myData[index]['dob'],
                        email: myData[index]['email'],
                        mobile: myData[index]['mobile'].toString(),
                    ),
                    ),
                ),
                );
              },
            ),
        ),
                ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showMyForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}