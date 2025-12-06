import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class RecentClipCard extends StatelessWidget {
  final IconData sourceIcon;
  final String sourceName;
  final String clipText;
  final String folderTag;

  const RecentClipCard({
    super.key,
    required this.sourceIcon,
    required this.sourceName,
    required this.clipText,
    required this.folderTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.creamyOffWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.deepIndigo.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepIndigo.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Source App Icon
                  Icon(sourceIcon, size: 18, color: AppColors.deepIndigo),
                  const SizedBox(width: 8),
                  Text(
                    sourceName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.softCharcoal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // Folder Tag
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.lightNeonGreen.withOpacity(0.2), // Use quirk color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  folderTag,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.deepIndigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
         Divider(height: 20, color: AppColors.deepIndigo),
          // The Highlighted Text
          Text(
            clipText,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.deepIndigo,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}