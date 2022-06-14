import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/features/dashboard/page/dashboard_drawer.dart';
import 'package:riverpod_sample/app/features/dashboard/provider/dashboard_provider.dart';

///Author-Pushkar Srivastava
///Date-14/06/22

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final submenu = ref.watch(subMenuProvider);
    final mainPage = ref.watch(pageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Title(
          child: Text(submenu.submenu.name),
          color: Colors.black,
        ),
      ),
      drawer: const DashboardDrawer(),
      body: mainPage,
    );
  }
}
