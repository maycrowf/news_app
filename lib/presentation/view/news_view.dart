import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news/domain/entities/news/news_entity.dart';
import 'package:news/domain/usecases/export_usecases.dart';
import 'package:news/presentation/_widgets/widgets.dart';
import 'package:news/presentation/bloc/news/news_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsBloc = NewsBloc(GetIt.instance<NewsUsecases>());

  final String _country = "us";
  final String _category = "business";

  void _loadNews([Completer? completer]) {
    _newsBloc.add(LoadNews(
      country: _country,
      category: _category,
      completer: completer,
    ));
  }

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Новости"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          final completer = Completer();

          _loadNews(completer);

          return completer.future;
        },
        child: BlocBuilder(
          bloc: _newsBloc,
          builder: (context, state) {
            if (state is NewsLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: state.newsList.length,
                  itemBuilder: (context, index) {
                    return NewsItem(news: state.newsList[index]);
                  },
                ),
              );
            }

            if (state is NewsLoadingFailure) {
              return Container();
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
