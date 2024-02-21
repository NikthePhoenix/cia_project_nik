// import 'package:b/create_event.dart';
import 'package:flutter/material.dart';
import 'package:seproject/organizers/create_event.dart';
import 'package:seproject/other/routes.dart';

class OrganizerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: MyCardList(),
        ),
      ),
    );
  }
}

class MyCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //circle
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://media.istockphoto.com/id/165746829/vector/dancer-silhouette.jpg?s=612x612&w=0&k=20&c=3D0BA_SO51RUJQ0TFAWg3sOwrWxIV081ZJ47r-Gj_uE=',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "WPA Music",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            SizedBox(height: 20.0),

            Text(
              "What would you like to do?",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20.0),
            CardItem(
              title: 'Create Event',
              icon: Icons.calendar_month,
              onTap: () {
                Navigator.pushNamed(context, Routes.createEvent);
              },
            ),
            SizedBox(height: 20.0),
            CardItem(
              title: 'Edit Event',
              icon: Icons.edit_square,
              onTap: () {
                Navigator.pushNamed(context, Routes.editEvents);
              },
            ),
            SizedBox(height: 20.0),
            CardItem(
              title: 'Delete Event',
              icon: Icons.delete,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
            CardItem(
              title: 'Past Event',
              icon: Icons.history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  CardItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black, width: 1.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0,
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comming soon'),
      ),
      body: Center(
        child: Text('Under construction'),
      ),
    );
  }
}
