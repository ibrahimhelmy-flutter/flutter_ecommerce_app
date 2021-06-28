import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial());

  @override
  Stream<LangState> mapEventToState(LangEvent event) async* {
    if (event is LangStart) {
         yield LangInitial();
      try {
        yield LangLoaded();
      } catch (e) {}
    } else if (event is LangChange) {
      yield LangInitial();
      try {
        yield LangLoaded(locale: Locale(event.lang, ""));
      } catch (e) {}
    }
  }
}
