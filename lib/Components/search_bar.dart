import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  final onChanged;
  final onSummited;
  const SearchBar({super.key, this.onChanged, this.onSummited});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: CupertinoSearchTextField(
        onChanged: (value) => onChanged(value),
        onSubmitted: (value) => onSummited(value),
      ),
    ),);
  }
}
