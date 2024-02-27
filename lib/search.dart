import 'package:flutter/material.dart';
import 'package:seproject/other/api_calls.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
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

  bool checked = false;
  List<Map<String, dynamic>> allEvents = ApiRequester.getAllEvents() as List<Map<String, dynamic>>;
  List<Map<String, dynamic>> searchedEvents = [];

  @override
  initState() {
    searchedEvents = allEvents;
    super.initState();
  }

  // void searchEvents(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = allEvents;
  //   } else {
  //     results = allEvents
  //         .where((events) => events['eventName'].toLowerCase().contains(enteredKeyword.toLowerCase())
  //         .toList();
      
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                addEventsTag("Open Mic"),
                SizedBox(
                  width: 10,
                ),
                addEventsTag("LFL"),
                SizedBox(
                  width: 10,
                ),
                addEventsTag("Yoga Committee"),
                SizedBox(
                  width: 10,
                ),
                addEventsTag("Rewire your brain"),
                SizedBox(
                  width: 10,
                ),
              ]),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Browse Departments",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 200,

                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: false,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  checked = value!;
                                });
                              }),
                          Text(
                            "ECC",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          )
                        ]),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
