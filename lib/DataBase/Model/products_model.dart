// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_const

class Product {
  final String images;
  final int price;
  final String name;

  Product({this.images, this.price, this.name});

  static List<Product> laggage = [
    Product(
        images:
            'https://images.unsplash.com/photo-1595475349262-88ba1e1eecaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bHVnZ2FnZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
    Product(
        images:
            'https://images.unsplash.com/photo-1515622472995-1a06094d2224?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bHVnZ2FnZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
    Product(
        images:
            'https://images.unsplash.com/photo-1553531768-88af16561c0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bHVnZ2FnZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
    Product(
        images:
            'https://images.unsplash.com/photo-1567755997194-f92b5dc9106f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3VpdGNhc2V8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
    Product(
        images:
            'https://images.unsplash.com/photo-1587533421909-c695540fbaac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bHVnZ2FnZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
    Product(
        images:
            'https://images.unsplash.com/photo-1562870152-e9b679706659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bHVnZ2FnZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 800,
        name: "Suitcase"),
  ];

  static List<Product> menClothes = [
    Product(
        images:
            "https://images.unsplash.com/photo-1446214814726-e6074845b4ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVuJTIwY2xvdGhlc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Blazer"),
    Product(
        images:
            "https://images.unsplash.com/photo-1593030103066-0093718efeb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWVuJTIwY2xvdGhlc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Suit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1593032457866-e5557a37f5f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbiUyMGNsb3RoZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 800,
        name: "Suit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1636016954413-44070ee44f8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fG1lbiUyMGNsb3RoZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 300,
        name: "Denim jacket"),
    Product(
        images:
            "https://images.unsplash.com/photo-1617952236317-0bd127407984?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQxfHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 200,
        name: "Shots"),
    Product(
        images:
            "https://images.unsplash.com/photo-1649485124861-1802bfd7c75c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE0fHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 450,
        name: "Shirt"),
  ];
  static List<Product> menShoes = [
    Product(
        images:
            "https://images.unsplash.com/photo-1643581278958-413530f40933?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTczfHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Sneakers"),
    Product(
        images:
            "https://images.unsplash.com/photo-1608666634759-4376010f863d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjQxfHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Sneakers"),
    Product(
        images:
            "https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVuJTIwY2xvdGhlc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Shoes"),
    Product(
        images:
            "https://images.unsplash.com/photo-1624005340901-e6cffc4e3a32?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fG1lbiUyMGNsb3RoZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Sneakers"),
    Product(
        images:
            "https://images.unsplash.com/photo-1616696038562-574c18066055?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fG1lbiUyMGNsb3RoZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "PartyWear"),
    Product(
        images:
            "https://images.unsplash.com/photo-1518894781321-630e638d0742?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTB8fG1lbiUyMGNsb3RoZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Sneakers"),
  ];
  static List<Product> menAccessories = [
    Product(
        images:
            "https://images.unsplash.com/photo-1549385117-ba4f57c7144f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU2fHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 5000,
        name: "Accessories"),
    Product(
        images:
            "https://images.unsplash.com/photo-1589988599196-6bacb4f694b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc4fHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 1000,
        name: "Watch"),
    Product(
        images:
            "https://images.unsplash.com/photo-1650462740584-a64b6788eaf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTg1fHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Perfume"),
    Product(
        images:
            "https://images.unsplash.com/photo-1629788388012-b460c4d520b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTg4fHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Perfume"),
    Product(
        images:
            "https://images.unsplash.com/photo-1632168844625-b22d7b1053c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjAxfHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 300,
        name: "Googles"),
    Product(
        images:
            "https://images.unsplash.com/photo-1601612628452-9e99ced43524?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjMyfHxtZW4lMjBjbG90aGVzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 800,
        name: "Shaving Kit"),
  ];

  static List<Product> womenClothes = [
    Product(
        images:
            "https://images.unsplash.com/photo-1590159983013-d4ff5fc71c1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 800,
        name: "Top"),
    Product(
        images:
            "https://images.unsplash.com/photo-1589810635657-232948472d98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 1000,
        name: "One Piece"),
    Product(
        images:
            "https://images.unsplash.com/photo-1523983254932-c7e6571c9d60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Top"),
    Product(
        images:
            "https://images.unsplash.com/photo-1578420631372-cfd597e5dcec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Dress"),
    Product(
        images:
            "https://images.unsplash.com/photo-1648618971192-5ebf72fa0cc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjA5fHx3b21lbiUyMHNob2VzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 949,
        name: "One Piece"),
    Product(
        images:
            "https://images.unsplash.com/photo-1588189408846-30ad110a0f4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjg2fHx3b21lbiUyMHNob2VzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 4000,
        name: "Blazer"),
  ];

  static List<Product> womenShoes = [
    Product(
        images:
            "https://images.unsplash.com/photo-1543163521-1bf539c55dd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 1000,
        name: "Hills"),
    Product(
        images:
            "https://images.unsplash.com/photo-1499013819532-e4ff41b00669?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 800,
        name: "Sneakers"),
    Product(
        images:
            "https://images.unsplash.com/photo-1491898487514-29e95d92e3f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 1200,
        name: "Sandal"),
    Product(
        images:
            "https://images.unsplash.com/photo-1581101767113-1677fc2beaa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 900,
        name: "Hills"),
    Product(
        images:
            "https://images.unsplash.com/photo-1518563222397-1875011bbf5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 700,
        name: "Shoes"),
    Product(
        images:
            "https://images.unsplash.com/photo-1581017316696-709bf1da2ed5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 800,
        name: "Sneakers"),
  ];

  static List<Product> womenAccessories = [
    Product(
        images:
            "https://images.unsplash.com/photo-1591348278999-ee1d0c06ed7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjg1fHx3b21lbiUyMHNob2VzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 1100,
        name: "Purse"),
    Product(
        images:
            "https://images.unsplash.com/photo-1645633333760-491d7412db64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjI2fHx3b21lbiUyMHNob2VzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 900,
        name: "Beauty"),
    Product(
        images:
            "https://images.unsplash.com/photo-1649544144796-687d506ddcd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjIxfHx3b21lbiUyMHNob2VzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 900,
        name: "Purse"),
    Product(
        images:
            "https://images.unsplash.com/photo-1598528738936-c50861cc75a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTl8fGZhc2hpb258ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 1500,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1589820933732-5594c9d89076?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d29tZW4lMjBzaG9lc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 600,
        name: "Perfume"),
    Product(
        images:
            "https://images.unsplash.com/photo-1633354512431-af1d3348d4d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fHdvbWVuJTIwc2hvZXN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 300,
        name: "GymBottle"),
  ];

  static List<Product> electronicsss = [
    Product(
        images:
            "https://images.unsplash.com/photo-1577375729078-820d5283031c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZWxlY3Ryb25pY3N8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 9000,
        name: "LaptopSet"),
    Product(
        images:
            "https://images.unsplash.com/photo-1595941069915-4ebc5197c14a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZWxlY3Ryb25pY3N8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 30000,
        name: "Mobile"),
    Product(
        images:
            "https://images.unsplash.com/photo-1570841398833-43e352b440ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTd8fGVsZWN0cm9uaWNzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 8000,
        name: "Headphone"),
    Product(
        images:
            "https://images.unsplash.com/photo-1594091134613-b997347b7817?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE1fHxlbGVjdHJvbmljc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 2000,
        name: "Game"),
    Product(
        images:
            "https://images.unsplash.com/photo-1637806583099-10ca71eb8761?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY1fHxlbGVjdHJvbmljc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 56000,
        name: "Iphone"),
    Product(
        images:
            "https://images.unsplash.com/photo-1588872444495-f4f0a04dcced?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc1fHxlbGVjdHJvbmljc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 3500,
        name: "Airbuds"),
  ];

  static List<Product> beauty = [
    Product(
        images:
            "https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXR5fGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1525373612132-b3e820b87cea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVhdXR5fGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1598528738936-c50861cc75a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhdXR5fGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1567169102475-a4a93aa6d71a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmVhdXR5fGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1598452963314-b09f397a5c48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmVhdXR5fGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
    Product(
        images:
            "https://images.unsplash.com/photo-1570797820424-c3e537ac20d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJlYXV0eXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 999,
        name: "MakeupKit"),
  ];

  static List<Product> kitchen = [
    Product(
        images:
            "https://images.unsplash.com/photo-1603889780684-f77d5fff19a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGtpdGNoZW4lMjBhcHBsaWFuY2VzfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 1200,
        name: "JuiceMaker"),
    Product(
        images:
            "https://images.unsplash.com/photo-1570222094114-d054a817e56b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8a2l0Y2hlbiUyMGFwcGxpYW5jZXN8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 0170,
        name: "Mixture"),
    Product(
        images:
            "https://images.unsplash.com/photo-1638129284529-bed6d6f588e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE2fHxraXRjaGVuJTIwYXBwbGlhbmNlc3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 500,
        name: "Pot"),
    Product(
        images:
            "https://images.unsplash.com/photo-1484632105053-8662f3194e7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY5fHxraXRjaGVuJTIwYXBwbGlhbmNlc3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 300,
        name: "Plate"),
    Product(
        images:
            "https://images.unsplash.com/photo-1643114786355-ff9e52736eab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjM4fHxraXRjaGVuJTIwYXBwbGlhbmNlc3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 4100,
        name: "Kettle"),
    Product(
        images:
            "https://images.unsplash.com/photo-1638792958866-9b3f787ec709?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjUxfHxraXRjaGVuJTIwYXBwbGlhbmNlc3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
        price: 2500,
        name: "CakeMachine"),
  ];
}
