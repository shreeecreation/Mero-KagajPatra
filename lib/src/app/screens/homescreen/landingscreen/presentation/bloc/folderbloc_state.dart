part of 'folderbloc_bloc.dart';

@immutable
abstract class FolderblocState {}

class FolderblocInitial extends FolderblocState {}

class FolderblocLoadingState extends FolderblocState {}

class FolderblocLoadedState extends FolderblocState {}

class FolderChangeFolderState extends FolderblocState {}
