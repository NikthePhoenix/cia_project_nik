import 'dart:convert';
import 'dart:io';
import 'package:seproject/hive/hive.dart';

import 'package:http/http.dart';


const baseUrl = "castelinos.com";


class ApiRequester {
  static const baseUrl = "localhost:3000";
  static String buildUrl(String filename) {
    return "http://$baseUrl/uploads/$filename";
  }

  static Future<bool> validateOrganizers(String email, String password) async {
    Response resp = await post(Uri.http(baseUrl, "organizers/"),
        body: {"email": email, "password": password});
    switch (resp.statusCode) {
      case 200:
        return true;
      case 422:
        print("Password not entered");
        return false;
      default:
        return false;
    }
  }

  /*
  List of organizers with keys
  {orgId, orgName, orgDept, orgEmail}
   */
  static Future<dynamic> getAllOrganizers() async {
    Response resp = await get(Uri.http(baseUrl, "organizers/getAll"));
    final myBox = HiveManager.myBox;
    final data  = myBox.get("OrgAll");
    switch (resp.statusCode) {
      case 200:
        if(data == null){
          myBox.put("OrgAll" , JsonDecoder().convert(resp.body.toString()));
        }
        return JsonDecoder().convert(resp.body.toString());
      case 404:
        print("No data found");
      case 500:
        print("Shit");
        return null;
    }
  }

  /* Single organizer with above key format */
  static Future<dynamic> getOrganizer(String email) async {
    Response resp = await get(Uri.http(baseUrl, "organizers/$email"));
    switch (resp.statusCode) {
      case 200:
        return JsonDecoder().convert(resp.body.toString());
      case 404:
        print("No data found");
        return null;
      case 500:
        print("Shit");
        return null;
    }
  }

  static Future<bool> addEvent(Map<String, dynamic> data) async {
    Response resp = await post(Uri.http(baseUrl, "events/"), body: data);
    switch (resp.statusCode) {
      case 201:
        return true;
      default:
        return false;
    }
  }

  // you will have to parse the eventDateTime to indian time using intl package
  /*
    List of objects with keys
    {
    eventId,
    orgId,
    tagId,
    eventName,
    eventDateTime,
    eventVenue,
    maxCapacity,
    eccPoints,
    description,
    collaborator1,
    collaborator2,
    url,
  }
  */
  static Future<dynamic> getAllEvents() async {
    Response resp = await get(Uri.http(baseUrl, "events/"));
    switch (resp.statusCode) {
      case 200:
        return JsonDecoder().convert(resp.body.toString());
      case 404:
        print("No data found");
      case 500:
        print("Shit");
        return null;
    }
  }

  //same as above
  static Future<dynamic> getEventbyDept(String dept) async {
    Response resp = await get(Uri.http(baseUrl, "events/bydept/$dept"));
    switch (resp.statusCode) {
      case 200:
        return JsonDecoder().convert(resp.body.toString());
      case 404:
        print("No data found");
      case 500:
        print("Shit");
        return null;
    }
  }

  // Same as above
  static Future<dynamic> getEventbyName(String name) async {
    Response resp = await get(Uri.http(baseUrl, "events/byevent/$name"));
    switch (resp.statusCode) {
      case 200:
        return JsonDecoder().convert(resp.body.toString());
      case 404:
        print("No data found");
      case 500:
        print("Shit");
        return null;
    }
  }

  /* List with keys
  eventId: data.eventId,
      uid: data.uid,
  */
  static Future<dynamic> getBookedTickets(int uid) async {
    Response resp = await get(Uri.http(baseUrl, "bookedEvents/$uid"));
    switch (resp.statusCode) {
      case 200:
        return JsonDecoder().convert(resp.body.toString());
      case 422:
        print("No data found");
      case 500:
        print("Shit");
        return null;
    }
  }

  static Future<bool> addBookedTicket(int uid, int eventId) async {
    Response resp = await post(Uri.http(baseUrl, "bookedEvents/"),
        body: {"uid": uid.toString(), "eventId": eventId.toString()});
    switch (resp.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }

  static Future<String?> uploadImage(String filepath) async {
    // var bytes = file.readAsBytesSync();
    var request = MultipartRequest('POST', Uri.http(baseUrl, "uploads/"));
    request.files.add(await MultipartFile.fromPath('image', filepath));

    var strResponse = await request.send();
    Response response = await Response.fromStream(strResponse);
    switch (response.statusCode) {
      case 201:
        return response.body;
      default:
        return null;
    }
  }
}

// void main() async {
// dynamic data = await ApiRequester.getAllEvents();
// print(data);

// dynamic data = await ApiRequester.getAllOrganizers();
// (data as List<dynamic>).forEach((element) {
//   var dta = (element as Map<String, dynamic>).values;
//   print(dta);
// });

// dynamic data = await ApiRequester.getOrganizer("Jamarcus19@gmail.com");
// print(data!["orgPass"]);

// dynamic data = await ApiRequester.getEventbyDept("Murray, Corwin and Wilkinson");
// print(data);

// dynamic data = await ApiRequester.getEventbyName("dcascs");
// print(data);

// await ApiRequester.addBookedTicket(221059, 2);
// await ApiRequester.addBookedTicket(221059, 1);
// await ApiRequester.addBookedTicket(214535, 1);
// await ApiRequester.addBookedTicket(214535, 2);
// await ApiRequester.addBookedTicket(215789, 3);
// await ApiRequester.addBookedTicket(215789, 2);

// dynamic data = await ApiRequester.getBookedTickets(214535);
// print(data);
// }
