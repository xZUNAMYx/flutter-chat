import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/users.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(onLine: true, email: 'test1@gmail.com', name: 'Felipe', uid: '1'),
    User(onLine: false, email: 'test2@gmail.com', name: 'Elaina', uid: '2'),
    User(onLine: true, email: 'test3@gmail.com', name: 'Camila', uid: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nombre de Usuario',
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app_outlined, color: Colors.blue),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            // child: const Icon(Icons.check_box_outlined, color: Colors.blue)
            child: const Icon(Icons.offline_bolt_outlined, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: const WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue),
          waterDropColor: Colors.blue,
        ),
        child: _listViewUsers(),
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _userListTile(users[i]),
      separatorBuilder: (_, i) => const Divider(),
      itemCount: users.length,
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.onLine ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100),
          )),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
