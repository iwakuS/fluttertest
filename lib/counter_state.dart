import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'counter_state.freezed.dart';
part 'counter_state.g.dart';

@freezed
//CounterStateは、状態データの入れ物で、イミュータブルなデータクラスとして定義します。
//
//カウンターの値の状態変数として「int count」が定義されています。
//
//デフォルト値を設定するには「@Default(0) int count」のように記述します。
//
//「@freezed」アノテーションをつけることによって、copyWithメソッドが自動で生えます。copyWithメソッドは状態を更新する場合に、新しく状態を生成する(clone)ために使います。
//
//「CounterState.fromJson」メソッドは、今回のカウンターアプリでは使用しませんが、JSONからStateを生成する場合によく使うので記述しています。
abstract class CounterState with _$CounterState {
  const factory CounterState({
    @Default(0) int count,
  }) = _CounterState;
  factory CounterState.fromJson(Map<String, dynamic> json) =>
      _$CounterStateFromJson(json);
}

//CounterStateNotifierは、状態を操作するロジックを管理し、Widgetに状態の変更を通知します。
//
//MVVMモデルで解釈すると、「ViewModel」に相当します。
//
//「inclement」メソッドは、CouterStateのcountを1カウントアップした状態をcopyWithメソッドを使用して、新しく状態を作成し、更新しています。
class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(const CounterState()) {}
  increment() => state = state.copyWith(count: state.count + 1);
}
