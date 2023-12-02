import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: ListView(
        children: [
          CardWidget(
            'Head First Java',
            'Kathy Sierra & Bert Bates',
            '4.7',
            '\$500.99',
            "Head First Java offers a unique learning experience, transcending traditional manuals. Dive into puzzles, mysteries, and engaging interviews to quickly master Java's fundamentals, including lambdas, threading, and networking. Ideal for both beginners and experienced programmers, it introduces modern coding for a sleeker and more efficient Java.",
            'https://m.media-amazon.com/images/I/819DmGB3vhL.AC_UF350,350_QL50.jpg',
          ),
          CardWidget(
            'The Complete Reference Java',
            'Herbert Schildt',
            '4.5',
            '\$550',
            'A comprehensive guide to the Java programming language.',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwRWgmRs-Tx10p2IU43FniNdIrcoSBL6eXKQ&usqp=CAU',
          ),
          // Add more cards if needed
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String price;
  final String description;
  final String imageUrl;

  CardWidget(
      this.bookName,
      this.authorName,
      this.rating,
      this.price,
      this.description,
      this.imageUrl,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 120,
              child: Image.network(
                imageUrl, // Use the provided image URL
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Author: $authorName'),
                  SizedBox(height: 8),
                  Text('Rating: $rating'),
                  SizedBox(height: 8),
                  Text('Price: $price'),
                  SizedBox(height: 8),
                  Text('Description: $description'),
                ],
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(bookName, price, description, imageUrl),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String bookName;
  final String price;
  final String description;
  final String imageUrl;

  SecondPage(this.bookName, this.price, this.description, this.imageUrl);

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    return ['Paperback', 'Hardcover', 'E-book'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buy Now')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bookName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Container(
              width: 120, // Adjust the width to make it smaller
              height: 180, // Adjust the height to make it smaller
              margin: EdgeInsets.only(left: 20),  // Adjust the left margin
              child: Image.network(
                imageUrl, // Use the provided image URL
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text('Author: Herbert Schildt'),
            Text(description),
            Text('Price: $price'),
            DropdownButton<String>(
              items: buildDropdownMenuItems(),
              onChanged: (String? newValue) {
                // Handle dropdown selection
              },
              hint: Text('Select format'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}