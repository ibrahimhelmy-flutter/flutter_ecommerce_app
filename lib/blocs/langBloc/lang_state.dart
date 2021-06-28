part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  const LangState();

  @override
  List<Object> get props => [];
}

class LangInitial extends LangState {
  @override
  List<Object> get props => [];
}

class LangLoaded extends LangState {
final  Locale locale;

  LangLoaded({this.locale=const Locale("en","") });
}

class LangError extends LangState {}
