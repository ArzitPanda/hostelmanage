import 'package:flutter/material.dart';
import 'package:hostel_management/FireRepo/FireAuth.dart';
import 'package:hostel_management/Screens/home_screen.dart';
import 'package:hostel_management/Screens/login_screen.dart';
import 'package:hostel_management/entity/UserInput.dart';

import '../FireRepo/FirestoreImpl.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController RegdController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController CourseController = TextEditingController();
  TextEditingController HostelController = TextEditingController();
  TextEditingController RoomController = TextEditingController();
  static int activeIdx = 0;

  FireAuth  fire = FireAuth();



  void signup(BuildContext context)async
  {
    UserInput a = UserInput(nameController.text,passwordController.text, emailController.text, "9861314840", "754004", "cse", 2024, 1, 302);


    String s=  await fire.signup(a);
      print(s);

    FirebaseStoreImpl fires = FirebaseStoreImpl();
    String sa = await fires.addUser(a);
  fires.getUsers();


    showDialog(context: context, builder:(ctx)=>AboutDialog(children: [Text("added suceesfully")],));

    Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeScreen()));



  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    RegdController.dispose();
    yearController.dispose();
    CourseController.dispose();
    HostelController.dispose();
    RoomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steplist = [
      Step(
          state: activeIdx > 0 ? StepState.complete : StepState.editing,
          isActive: activeIdx >= 0,
          title: Text("basic"),
          content: Center(
            child: Container(
              child: SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "enter your name",
                            icon: Icon(Icons.account_circle_sharp)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "enter your email",
                            icon: Icon(Icons.email)),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "enter your password",
                            icon: Icon(Icons.key)),
                      ),
                      SizedBox(width: 20,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("already have account"),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                            
                          }, child: Text("Login",style: TextStyle(color: Colors.blueAccent),))
                        ],),
                      )
                    ],
                  )),
            ),
          )),
      Step(
          state: activeIdx > 1 ? StepState.complete : StepState.indexed,
          isActive: activeIdx >= 1,
          title: Text("college"),
          content: Center(
    child: Container(
    child: SizedBox(
    width: 350,
    child: Column(
    children: [
    TextFormField(
    controller: CourseController,
    decoration: InputDecoration(
    hintText: "enter your branch",
    icon: Icon(Icons.house_outlined)),
    ),
    SizedBox(
    height: 20,
    ),
    TextFormField(
    controller: yearController,
    decoration: InputDecoration(
    hintText: "enter your year",
    icon: Icon(Icons.email)),
    ),

    ],
    )),
    ),
    )),
      Step(
          state: activeIdx == 2 ? StepState.complete : StepState.indexed,
          isActive: activeIdx >= 2,
          title: Text("Hostel"),
          content:Center(
    child: Container(
    child: SizedBox(
    width: 350,
    child: Column(
    children: [
    TextFormField(
    controller: HostelController,
    decoration: InputDecoration(
    hintText: "enter your hostel name",
    icon: Icon(Icons.house_outlined)),
    ),
    SizedBox(
    height: 20,
    ),
    TextFormField(
    controller: RoomController,
    decoration: InputDecoration(
    hintText: "enter your room no",
    icon: Icon(Icons.room_preferences)),
    ),

    ],
    )),
    ),
    )),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("signup")),
      body: Stepper(
        onStepTapped: (idx){
          setState(() {
           activeIdx =idx;
          });
        },
          steps: steplist,
          currentStep: activeIdx,
          onStepContinue: () {

              if(activeIdx==2)
                {showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Confirm Your account"),
                    content: const Text("Do you want to create your account"),
                    actions: <Widget>[
                     MaterialButton(onPressed:(){
                        signup(context);

                     },child: Text("create")),
                      MaterialButton(onPressed:(){
                        Navigator.of(ctx).pop();
                      },child: Text("cancel")),
                    ],
                  ),
                );

                }

            setState(() {
              if (activeIdx == 2) {
                activeIdx = 0;
              } else {
                activeIdx = activeIdx + 1;
              }
            });
          },
          type: StepperType.horizontal,
          physics: ScrollPhysics()),
    );
  }

  @override
  void initState() {
    FirebaseStoreImpl fire = FirebaseStoreImpl();
    fire.getUsers();

    super.initState();
  }
}
