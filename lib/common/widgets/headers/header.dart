import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:nabeey/utils/constants/colors.dart';
import 'package:nabeey/data/models/category_model.dart';
import 'package:nabeey/common/widgets/images/rounded_image.dart';

import '../../../utils/constants/text_strings.dart';
import '../../../utils/local_storage/storage_utility.dart';

class ADHeader extends StatelessWidget {
  const ADHeader({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: RoundedImage(
        borderRadius: 20,
        fit: BoxFit.cover,
        isNetworkImage: true,
        applyImageRadius: true,
        width: double.infinity,
        height: double.infinity,
        imageUrl: category.image.filePath,
        padding: const EdgeInsets.all(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.7),
            Color.fromRGBO(0, 0, 0, 0.5),
            Color.fromRGBO(0, 0, 0, 0.3),
            Color.fromRGBO(0, 0, 0, 0.1),
            Color.fromRGBO(0, 0, 0, 0.0),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Back button
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    ADColors.black.withValues(alpha: .30),
                    ADColors.black.withValues(alpha: .25),
                    ADColors.black.withValues(alpha: .20),
                    ADColors.black.withValues(alpha: .15),
                    ADColors.black.withValues(alpha: .10),
                    ADColors.black.withValues(alpha: .05),
                    ADColors.black.withValues(alpha: .01),
                  ],
                ),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Iconsax.arrow_left, color: ADColors.white),
              ),
            ),

            /// Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Texts
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .apply(color: ADColors.white),
                      ),
                      Text(
                        category.description,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.apply(color: ADColors.white),
                      ),
                    ],
                  ),
                ),

                /// Check Knowledge Button
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed:
                        () =>
                            LocalStorage().readData('general', 'currentUser') !=
                                    null
                                ? Navigator.pushNamed(context, '/quiz')
                                : Navigator.pushNamed(context, '/signup'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      ADTexts.checkKnowledge,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: ADColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
