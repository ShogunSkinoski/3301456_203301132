// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$currentPageAtom =
      Atom(name: '_SplashViewModelBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$_SplashViewModelBaseActionController =
      ActionController(name: '_SplashViewModelBase', context: context);

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
