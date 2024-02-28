import 'package:flutter/material.dart';
import 'package:seproject/other/api_calls.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  late Future<dynamic> matchedEvents;
  late String searchTerm = "";
  Widget addEventsTag(departmentName) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, "/department_list");
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              departmentName,
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }

  // bool checked = false;
  // List<Map<String, dynamic>> allEvents = ApiRequester.getAllEvents() as List<Map<String, dynamic>>;
  // List<Map<String, dynamic>> searchedEvents = [];

  // @override
  // void initState() {
  //   searchedEvents = allEvents;
  //   super.initState();
  // }

  //   final List<Map<String, dynamic>> _allUsers = [
  //   {"id": 1, "name": "Andy", "age": 29},
  //   {"id": 2, "name": "Aragon", "age": 40},
  //   {"id": 3, "name": "Bob", "age": 5},
  //   {"id": 4, "name": "Barbara", "age": 35},
  //   {"id": 5, "name": "Candy", "age": 21},
  //   {"id": 6, "name": "Colin", "age": 55},
  //   {"id": 7, "name": "Audra", "age": 30},
  //   {"id": 8, "name": "Banana", "age": 14},
  //   {"id": 9, "name": "Caversky", "age": 100},
  //   {"id": 10, "name": "Becky", "age": 32},
  // ];

  // // This list holds the data for the list view
  // List<Map<String, dynamic>> _foundUsers = [];

  // // This function is called whenever the text field changes
  // void _runFilter(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = _allUsers;
  //   } else {
  //     results = _allUsers
  //         .where((user) =>
  //         user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextFormField(
                onFieldSubmitted: (value) async {
                  print("Submitted $value");
                  print(await ApiRequester.getEventbyName(value));
                },
                // onChanged: (value) => searchEvents(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.amber[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search))),
            // SearchBar(
            //   hintText: "Search for an event or department",
            //   leading: Icon(Icons.search),
            // ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Search History",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 5,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(children: [
            //     addEventsTag("Open Mic"),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     addEventsTag("LFL"),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     addEventsTag("Yoga Committee"),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     addEventsTag("Rewire your brain"),
            //     SizedBox(
            //       width: 10,
            //     ),
            //   ]),
            // ),
            // SizedBox(height: 15),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text("Browse Departments",
            //       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: InkWell(
            //       onTap: () {},
            //       child: Container(
            //         width: 200,

            //         decoration: BoxDecoration(
            //           border: Border.all(width: 2),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    // child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Checkbox(
                    //           value: false,
                    //           shape: CircleBorder(),
                    //           onChanged: (bool? value) {
                    //             setState(() {
                    //               // checked = value!;
                    //             });
                    //           }),
                    //       Text(
                    //         "ECC",
                    //         style: TextStyle(
                    //             fontSize: 25, fontWeight: FontWeight.w400),
                    //       )
                        // ]),
                  // )),
            // ),
            //
          ]),
        ),
      ),
    );
  }
}
