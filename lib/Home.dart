import 'package:appning_assignment/Services/PostApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameComtroller = TextEditingController();
  final jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users POST API"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: nameComtroller,
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter Your Full Name"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                labelText: "Job",
                hintText: "Enter Your Job title"
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              postApi();
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  postApi(){
    final service = ApiServices();
    service.postCall(
      {
        "name":nameComtroller.text,
        "job":jobController.text
      },
    ).then((value){
      if(value.error!=null){
        print("Post Data >>>>"+value.error!);
      }else{
        print(value.token!);
      }
    });
  }
}
