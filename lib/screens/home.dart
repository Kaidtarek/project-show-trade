import 'package:flutter/material.dart';
import 'package:show_trade/backend/authenticationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          actions: [
            IconButton(
                onPressed: () {
                  Authenticationservice().signOut(context: context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Center(
            child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.mail),
              title: Text(Authenticationservice().getCurrentUser()?.email ??
                  'No email'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                  Authenticationservice().getCurrentUser()?.uid ?? 'No UID'),
            ),
            // Additional user info
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                  Authenticationservice().getCurrentUser()?.displayName ??
                      'No name'),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text(Authenticationservice().getCurrentUser()?.photoURL ??
                  'No photo URL'),
            ),
            if (Authenticationservice().getCurrentUser()?.phoneNumber != null)
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                    Authenticationservice().getCurrentUser()!.phoneNumber!),
              ),
            ListTile(
              leading: Icon(Icons.verified),
              title: Text(
                  'Email Verified: ${Authenticationservice().getCurrentUser()?.emailVerified ?? false}'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(
                  'Created: ${Authenticationservice().getCurrentUser()?.metadata.creationTime?.toString() ?? 'Unknown'}'),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text(
                  'Last Sign In: ${Authenticationservice().getCurrentUser()?.metadata.lastSignInTime?.toString() ?? 'Unknown'}'),
            ),
          ],
        )));
  }
}
