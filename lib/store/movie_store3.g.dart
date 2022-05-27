// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store3.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore3 on _MovieStore, Store {
  late final _$isDataFatchedAtom =
      Atom(name: '_MovieStore.isDataFatched', context: context);

  @override
  bool get isDataFatched {
    _$isDataFatchedAtom.reportRead();
    return super.isDataFatched;
  }

  @override
  set isDataFatched(bool value) {
    _$isDataFatchedAtom.reportWrite(value, super.isDataFatched, () {
      super.isDataFatched = value;
    });
  }

  late final _$rateListFutureAtom =
      Atom(name: '_MovieStore.rateListFuture', context: context);

  @override
  ObservableFuture<dynamic>? get rateListFuture {
    _$rateListFutureAtom.reportRead();
    return super.rateListFuture;
  }

  @override
  set rateListFuture(ObservableFuture<dynamic>? value) {
    _$rateListFutureAtom.reportWrite(value, super.rateListFuture, () {
      super.rateListFuture = value;
    });
  }

  late final _$deleteRateFutureAtom =
      Atom(name: '_MovieStore.deleteRateFuture', context: context);

  @override
  ObservableFuture<dynamic>? get deleteRateFuture {
    _$deleteRateFutureAtom.reportRead();
    return super.deleteRateFuture;
  }

  @override
  set deleteRateFuture(ObservableFuture<dynamic>? value) {
    _$deleteRateFutureAtom.reportWrite(value, super.deleteRateFuture, () {
      super.deleteRateFuture = value;
    });
  }

  late final _$pageAtom = Atom(name: '_MovieStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$fetchMovieAsyncAction =
      AsyncAction('_MovieStore.fetchMovie', context: context);

  @override
  Future<dynamic> fetchMovie() {
    return _$fetchMovieAsyncAction.run(() => super.fetchMovie());
  }

  late final _$fetchTheMovieAsyncAction =
      AsyncAction('_MovieStore.fetchTheMovie', context: context);

  @override
  Future<dynamic> fetchTheMovie() {
    return _$fetchTheMovieAsyncAction.run(() => super.fetchTheMovie());
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  Future<dynamic> submitRate(double rating, int id) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.submitRate');
    try {
      return super.submitRate(rating, id);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> delRate(int id) {
    final _$actionInfo =
        _$_MovieStoreActionController.startAction(name: '_MovieStore.delRate');
    try {
      return super.delRate(id);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDataFatched: ${isDataFatched},
rateListFuture: ${rateListFuture},
deleteRateFuture: ${deleteRateFuture},
page: ${page}
    ''';
  }
}
