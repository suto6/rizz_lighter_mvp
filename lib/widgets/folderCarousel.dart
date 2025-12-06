import 'package:flutter/material.dart';

import 'folderCard.dart';

class FolderCarousel extends StatelessWidget {
  const FolderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          // Add New Folder Card
          FolderCard(
            isNew: true,
            folderName: "New Folder",
            count: 0,
          ),
          SizedBox(width: 15),
          // Example Folder 1
          FolderCard(
            isNew: false,
            folderName: "Inbox",
            count: 3,
          ),
          SizedBox(width: 15),
          // Example Folder 2
          FolderCard(
            isNew: false,
            folderName: "Recipes",
            count: 1,
          ),
          SizedBox(width: 15),
          // Example Folder 3
          FolderCard(
            isNew: false,
            folderName: "Dev",
            count: 5,
          ),
        ],
      ),
    );
  }
}