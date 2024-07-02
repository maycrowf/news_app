import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news/features/news/bloc/news_bloc.dart';
import 'package:news/repositories/news/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsBloc = NewsBloc(GetIt.instance<NewsRepositoryInterface>());
  final _getNewsQueryParams = GetNewsQueryParams(
    country: "us",
    category: "business",
  );

  @override
  void initState() {
    super.initState();
    _newsBloc.add(LoadNews(
      getNewsQueryParams: _getNewsQueryParams,
    ));
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

          _newsBloc.add(LoadNews(
            getNewsQueryParams: _getNewsQueryParams,
          ));

          return completer.future;
        },
        child: BlocBuilder(
          bloc: _newsBloc,
          builder: (context, state) {
            if (state is NewsLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: state.newsList.length,
                  itemBuilder: (context, index) {
                    final news = state.newsList[index];
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: news.urlToImage != null ? Image.network(
                              news.urlToImage!,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                            ) : null,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(news.title ?? "Новость №$index}"),
                        const SizedBox(height: 6),
                        Text(news.description ?? ""),
                      ],
                    );
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
