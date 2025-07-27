import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/news_cubit/news_cubit.dart';


class SearchTextBox extends StatelessWidget {

  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchTextBox({super.key,
    required this.controller,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
          onPressed: () {
            controller.clear();
            context.read<NewsCubit>().clearFilter();
          },
          icon: const Icon(Icons.clear),
        )
            : null,
        hintText: 'Search News..',
        filled: true,
        fillColor: Colors.white,
      ),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}