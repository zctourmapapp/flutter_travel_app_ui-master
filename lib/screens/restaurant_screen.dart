import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/restaurant_model.dart';
import '../widgets/custom_header.dart';
import 'restaurant_details_screen.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Restaurant> restaurant = Restaurant.restaurants;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Restaurants'),
          _HotelMasonryGrid(
            width: width,
            restaurants: restaurant,
          ),
        ],
      ),
    );
  }
}

class _HotelMasonryGrid extends StatelessWidget {
  const _HotelMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
    required this.restaurants,
  }) : super(key: key);

  final List<double> masonryCardHeights;
  final double width;
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: 9,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Restaurant restaurant = restaurants [index];
        return _buildActivityCard(
          context,
          restaurant,
          index,
        );
      },
    );
  }

  InkWell _buildActivityCard(
      BuildContext context,
      Restaurant restaurant,
      int index,
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(restaurant: restaurant),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: '${restaurant.id}_${restaurant.title}',
            child: Container(
              height: masonryCardHeights[index % 3],
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.title,
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
