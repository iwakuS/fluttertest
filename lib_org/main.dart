import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'counter_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Widgetツリーの上層で、StateNotifierProviderを作成すれば、
      // その子Widgetであればどこでも、CounterStateNotifierを取得することができます。
      // ChangeNotifierを使った場合、Consumer等を挟まなくてはいけなかったのですが、
      // state_notifierの場合スッキリ書けます。
      home: StateNotifierProvider<CounterStateNotifier, CounterState>(
        create: (_) => CounterStateNotifier(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('state_notifier sample'),
      ),
      body: Center(
        child: Text(
          // CounterStateNotifierを取得したい場合、以下のようにすれば、取得できます。
          // context.readとcontext.selectには、以下の違いがあります。
          //
          //* `context.read<CounterStateNotifier>()`
          //  * State更新時リビルドしない
          //  * StateNotifierのメソッドを使いたいときに使う
          //* `context.select<CounterState, int>()`
          //  * State更新時リビルドする
          //  * 状態が変わったときに画面に反映したい場合に使う
          context.select<CounterState, int>((state) => state.count).toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<CounterStateNotifier>().increment(),
        label: Text('1'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
