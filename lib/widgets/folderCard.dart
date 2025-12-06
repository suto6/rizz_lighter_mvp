import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class FolderCard extends StatelessWidget {
  final bool isNew;
  final String folderName;
  final int count;

  const FolderCard({
    super.key,
    required this.isNew,
    required this.folderName,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: isNew ? AppColors.creamyOffWhite : AppColors.brightCleanYellow,
        borderRadius: BorderRadius.circular(15),
        border: isNew
            ? Border.all(color: AppColors.deepIndigo, width: 2, style: BorderStyle.solid)
            : null,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isNew)
               Icon(Icons.add, size: 30, color: AppColors.deepIndigo)
            else
               Icon(Icons.folder, size: 30, color: AppColors.deepIndigo),
            const SizedBox(height: 5),
            Text(
              folderName,
              style: TextStyle(
                color: AppColors.deepIndigo,
                fontWeight: isNew ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (!isNew)
              Text(
                "($count)",
                style: const TextStyle(
                  color: AppColors.deepIndigo,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}