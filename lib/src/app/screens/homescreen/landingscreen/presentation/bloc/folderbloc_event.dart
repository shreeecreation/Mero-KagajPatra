part of 'folderbloc_bloc.dart';

@immutable
abstract class FolderblocEvent {}

class FolderChangeFolderEvent extends FolderblocEvent {}

class FolderLoadingEvent extends FolderblocEvent {}

class FolderLoadedEvent extends FolderblocEvent {}
