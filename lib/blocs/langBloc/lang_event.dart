part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object> get props => [];
}

class LangStart extends LangEvent {}

class LangChange extends LangEvent {
  final String lang;

  LangChange(this.lang);
}
