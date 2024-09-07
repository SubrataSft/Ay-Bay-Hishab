import 'package:ay_bay_app/category_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AyBayHishab());
}

class AyBayHishab extends StatelessWidget {
  const AyBayHishab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      )),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ayTEController = TextEditingController();
  final bayTEController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<AyBayModel> ayBaylist = [];

  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ay Bay Hishab"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ayTEController,
                      decoration: const InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: bayTEController,
                      decoration: const InputDecoration(
                        labelText: "Bay",
                        isDense: true,
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        ayBaylist.add(AyBayModel(
                          ay: ayTEController.text.trim(),
                          bay: bayTEController.text.trim(),
                          date: time.toString(),
                        ));
                        ayTEController.clear();
                        bayTEController.clear();
                        setState(() {});
                      },
                      child: const Text(
                        "Add",
                      ))),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryWidget(
                    title: 'Ay',
                    color: Colors.green,
                  ),
                  CategoryWidget(
                    title: 'date',
                    color: Colors.blue,
                  ),
                  CategoryWidget(
                    title: 'bay',
                    color: Colors.brown,
                  ),
                  CategoryWidget(
                    title: 'more',
                    color: Colors.pink,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.deepPurple.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ayBaylist.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: 80,
                                child: Text(
                                  ayBaylist[index].ay,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            const SizedBox(width: 10,),
                            SizedBox(
                                height: 30,
                                width: 100,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                    child: Center(
                                        child: Text(ayBaylist[index].date)))),
                            const SizedBox(width: 10,),
                            SizedBox(
                                width: 80,
                                child: Text(
                                  ayBaylist[index].bay,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            const Spacer(),
                               InkWell(
                                  onTap: () {
                                    ayBaylist.remove(ayBaylist[index]);
                                  },
                                  child: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AyBayModel {
  final String ay, bay, date;

  AyBayModel({required this.date, required this.ay, required this.bay});
}
