import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurant {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final LatLng? location;

  const Restaurant({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    this.location,

  });

  static const List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      title: 'Alavar Restaurant',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/qFMPFgh/alavar.jpg',
      price: 1499,
      rating: 4,
      location: LatLng(6.9006, 122.0614),
    ),
    Restaurant(
      id: '2',
      title: 'Chinitos',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/PQN4nQG/chinitos.jpg',
      price: 0,
      rating: 4,
    ),
    Restaurant(
      id: '3',
      title: '23rd Park',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/HT1yrPx/23rd-park.jpg',
      price: 180,
      rating: 4,
    ),
    Restaurant(
      id: '4',
      title: 'Village Restaurant',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/B4gKhqV/village.jpg',
      price: 0,
      rating: 4,
    ),
    Restaurant(
      id: '5',
      title: 'Mano Mano',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/mqN9xpb/green-fields-mano-mano.jpg',
      price: 1800,
      rating: 5,
    ),
    Restaurant(
      id: '6',
      title: 'Ole Ole',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/4sw59rt/ole-ole.jpg',
      price: 1000,
      rating: 4,
    ),
    Restaurant(
      id: '7',
      title: 'Barcode',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/thkSfZr/barcode.jpg',
      price: 5862,
      rating: 4,
    ),
    Restaurant(
      id: '8',
      title: 'Bay Tal Mal',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/qDyYrwJ/bay-tal-mal.jpg',
      price: 1200,
      rating: 4,
    ),
    Restaurant(
      id: '9',
      title: 'Abalone',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      imageUrl:
          'https://i.ibb.co/8bf2vvG/abalone.jpg',
      price: 500,
      rating: 4,
    ),
  ];
}
