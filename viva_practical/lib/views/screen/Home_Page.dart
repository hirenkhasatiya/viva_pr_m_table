import 'package:flutter/material.dart';
import 'package:viva_practical/Global/globals.dart';
import 'package:viva_practical/Utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map Number = {
    "number": 0,
    "n1": 0,
    "n2": 0,
    "n3": 0,
    "n4": 0,
    "n5": 0,
    "n6": 0,
    "n7": 0,
    "n8": 0,
    "n9": 0,
    "n10": 0,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff6A00AA),
          foregroundColor: Colors.white,
          title: const Text("Multiplication Table"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.PDF);
              },
              icon: Icon(Icons.history),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Number";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSaved: (val) {
                    setState(() {
                      Number["number"] = int.parse(val!);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff6A00AA)),
                        onPressed: () {
                          setState(
                            () {
                              bool validated = formKey.currentState!.validate();

                              if (validated) {
                                formKey.currentState!.save();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text("successfully validated"),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    margin: EdgeInsets.all(20),
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    action: SnackBarAction(
                                        label: 'Ok', onPressed: () {}),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Failed validate"),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    margin: EdgeInsets.all(20),
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    action: SnackBarAction(
                                        label: 'Ok', onPressed: () {}),
                                  ),
                                );
                              }
                              Globals.allNumber.add(Number);
                              Number["n1"] = (Number["number"] * 1);
                              Number["n2"] = (Number["number"] * 2);
                              Number["n3"] = (Number["number"] * 3);
                              Number["n4"] = (Number["number"] * 4);
                              Number["n5"] = (Number["number"] * 5);
                              Number["n6"] = (Number["number"] * 6);
                              Number["n7"] = (Number["number"] * 7);
                              Number["n8"] = (Number["number"] * 8);
                              Number["n9"] = (Number["number"] * 9);
                              Number["n10"] = (Number["number"] * 10);
                            },
                          );
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                Spacer(),
                Visibility(
                  visible: Number["number"] != 0,
                  child: Container(
                    height: 450,
                    padding: EdgeInsets.all(40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/564x/7a/b5/53/7ab553df4f8c1b1dc1508cfd394b64ca.jpg"),
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          10,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${Number["number"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${Number["n${index + 1}"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
