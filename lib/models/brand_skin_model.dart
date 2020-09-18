import 'package:flutter/material.dart';

class BrandSkin {
  final String name;
  final int color;
  final String image;
  final Alignment center;

  BrandSkin({this.center, this.name, this.color, this.image});
}

final skins = <BrandSkin>[
  BrandSkin(
    name: 'Sunset Red',
    color: 0xFFE96B6A,
    image: 'assets/red.png',
    center: Alignment.bottomCenter
  ),
  BrandSkin(
    name: 'Sunrise Orange',
    color: 0xFFFF9968,
    image: 'assets/orange.png',
    center: Alignment.topCenter
  ),
  BrandSkin(
    name: 'Mellow Yellow',
    color: 0xFFFFD387,
    image: 'assets/yellow.png',
    center: Alignment.center
  ),
  BrandSkin(
    name: 'Seafoam Green',
    color: 0xFF6CE5B1,
    image: 'assets/green.png',
    
    center: Alignment.bottomLeft
  ),
  BrandSkin(
    name: 'Sky Blue',
    color: 0xFF7FE0EB,
    image: 'assets/blue.png',
    center: Alignment.centerLeft
  ),
  BrandSkin(
    name: 'Kind of Purple',
    color: 0xFF98A2DF,
    image: 'assets/purple.png',
    center: Alignment.center
  ),
  BrandSkin(
    name: 'Off Pink',
    color: 0xFFEBB9D2,
    image: 'assets/pink.png',
    center: Alignment.centerRight
  ),
  BrandSkin(
    name: 'Pastel Black',
    color: 0xFFD6D9D2,
    image: 'assets/black.png',
    center: Alignment.center
  ),
];
