import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://bankapi.veegil.com/accounts/list'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        userList = List<Map<String, dynamic>>.from(data['data']);
      });
    } else {
      // Handle error
      print('Error fetching users: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Accounts'),
      ),
      body: userList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return ListTile(
                  title: Text(user['phoneNumber']),
                  subtitle: Text('Created: ${user['created']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserData(user: user),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class UserData extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserData({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime createdDateTime = DateTime.parse(user['created']);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone Number: ${user['phoneNumber']}'),
            Text('Balance: ${user['balance'] ?? 'N/A'}'),
            Text(
                'Date: ${createdDateTime.toLocal().toLocal().day}/${createdDateTime.toLocal().toLocal().month}/${createdDateTime.toLocal().toLocal().year}'),
            Text(
                'Time: ${createdDateTime.toLocal().toLocal().hour}:${createdDateTime.toLocal().toLocal().minute}:${createdDateTime.toLocal().toLocal().second}'),
          ],
        ),
      ),
    );
  }
}
