import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_sample/my_providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage6(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          child: const Text('Home Page'),
          color: Colors.redAccent,
        ),
      ),
      body: Center(
        /// consumer is Widget that provides a reference which can watch value of anyProvider here the valueProvider
        /// we can add Consumer Widget to the whole parent widget see HomePage2
        child: Consumer(
          builder: (context, ref, child) => Text(
            "Value is : ${ref.watch(valueProvider)}",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}

class MyHomePage2 extends ConsumerWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          "Value is :$value",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

/// using statefull widegt as ConsumerWidget

class MyHomePage3 extends ConsumerStatefulWidget {
  const MyHomePage3({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends ConsumerState<MyHomePage3> {
  @override
  void initState() {
    var val = ref.read(valueProvider);
    if (kDebugMode) {
      print('valus is : $val');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var val = (context as WidgetRef).watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value is :$val',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}

class MyHomePage4 extends ConsumerWidget {
  const MyHomePage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterStateProvider.state).state++;
        },
      ),
      body: Center(
        child: Text(
          "I have been pressed $count times.",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class MyHomePage5 extends ConsumerWidget {
  const MyHomePage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build called');
    var time = ref.watch(clockProvider);
    var formattedTime = DateFormat.Hms().format(time);
    return Scaffold(
      body: Center(
        child: Text(
          formattedTime,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}

class MyHomePage6 extends ConsumerWidget {
  const MyHomePage6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamAsyncData = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: streamAsyncData.when(
          data: (data) {
            return Text('$data');
          },
          error: (e, t) {
            return Text('Error: $e');
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
