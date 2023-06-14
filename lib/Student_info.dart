import 'package:flutter/material.dart';
import 'package:student_list/studentDetails.dart';
import 'database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  void showMyForm(int? id) async {
    if (id != null) {

      final existingData =
      myData.firstWhere((element) => element['id'] == id);
      idController.text = existingData['id'];
      nameController.text = existingData['name'];
      dobController.text = existingData['dob'];
      emailController.text = existingData['email'];
      mobileController.text = existingData['mobile'];
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
              // ElevatedButton(
              //   onPressed: () async {
              //     // Save new data
              //     if (id == null) {
              //       await addItem();
              //     }
              //
              //     if (id != null) {
              //       await updateItem(id);
              //     }
              //
              //     idController.text = '';
              //     nameController.text = '';
              //     dobController.text = '';
              //     emailController.text = '';
              //     mobileController.text = '';
              //
              //     Navigator.of(context).pop();
              //   },
              //   child: Text(id == null ? 'Create New' : 'Update'),
              // )
            ],
          ),
        ));
  }

  // Future<dynamic> insert() async {
  //   await DatabaseHelper.insert(
  //       idController.text,
  //       nameController.text,
  //       dobController.text,
  //       emailController.text,
  //       mobileController.text);
  //   _refreshData();
  // }
  //
  // Future<dynamic> updateItem(int id) async {
  //   await DatabaseHelper.update(
  //     idController.text,
  //     nameController.text,
  //     dobController.text,
  //     emailController.text,
  //     mobileController.text,);
  //   _refreshData();
  // }
  //
  // void deleteItem(int id) async {
  //   await DatabaseHelper.deleteItem(id);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Successfully deleted!'),
  //       backgroundColor:Colors.green
  //   ));
  //   _refreshData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite CRUD'),
      ),
      body: _isLoading
          ? const Center(
           child: CircularProgressIndicator(),
      )
          : myData.isEmpty?const Center(child:  Text("No Data Available!!!")):  ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) => Card(
          color:index%2==0?Colors.green: Colors.green[200],
          margin: const EdgeInsets.all(15),
            child:ListTile(
              title: Text(myData[index]['id'].toString(), style: TextStyle(fontSize: 20),),
              subtitle: Text('Name:' +myData[index]['name'] +
                  ', Dob:' + myData[index]['dob'] +
                  ', email:' +myData[index]['email'] +
                  ', mobile:' +myData[index]['mobile'].toString()),
              textColor: Colors.white,
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => showMyForm(myData[index]['id']),
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.delete),
                    //   onPressed: () =>
                    //       deleteItem(myData[index]['id']),
                    // ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),
    );
  }
}