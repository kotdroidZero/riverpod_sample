import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Note: We should always use ref.read() rather than ref.watch() to access providers inside a callback
/// we should use ref.watch() method inside build method only and in

/// Provider
/// basic provider , from which we can only read value
final valueProvider = Provider<int>((ref) {
  return 789;
});

/// StateProvider
/// a provider which can update it's state according to our logic and can be read too
final counterStateProvider = StateProvider<int>((ref) {
  return 10;
});

/// StateNotifierProvider
/// Provider and StateProvider are sufficient for simple use cases like the counter example.
///But in more complex apps we often need to store some state along with some business logic outside our widget classes.
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

class Clock extends StateNotifier<DateTime> {
  late final Timer _timer;

  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

/// When we watch a FutureProvider or StreamProvider we get an AsyncValue<T>, a class used to safely manipulate asynchronous data.

///And then we can use the when() method to map the data, loading, and error states to different widgets:
///asyncValue.when(
//  data: (data) => Text('Value: $data'),
//  loading: () => CircularProgressIndicator(),
//  error: (e, st) => Text('Error: $e'),
//  )
///
final futureProvider = FutureProvider<int>((ref) {
  return Future.value(36);
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

/// Advanced Riverpod Features
/// The autoDispose modifier
// If we're working with FutureProvider or StreamProvider, we'll want to dispose of any listeners when our provider is no longer in use.
// This is easily done by adding an .autoDispose modifier to our provider:
final autoDisposestreamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

///If we're working with streams that come from Firebase, this is all we need.

// If we're working with streams that come from Firebase, this is all we need.
// Another use case is when we're using FutureProvider as a wrapper for an HTTP request that fires when the user enters a new screen. And we want to cancel the HTTP request if the user leaves the screen before the request is completed.
// In this scenario, we can use ref.onDispose() to perform some custom cancellation logic:
final myProvider = FutureProvider.autoDispose((ref) async {
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() => cancelToken.cancel());

  // Fetch our data and pass our `cancelToken` for cancellation to work
  final response = await Dio().get('path', cancelToken: cancelToken);
  // If the request completed successfully, keep the state
  ref.maintainState = true;
  return response;
});
//We can also set the maintainState flag to preserve the state so that the request does not fire again if the user leaves and re-enters the same screen.


