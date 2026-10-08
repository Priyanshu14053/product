import 'package:flutter/material.dart';
import 'package:mart/presentation/widgets/profile_item/profile_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // Profile Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [

                  // Profile Image
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // User Details
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Priyanshu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'pakade@gmail.com',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Edit
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // My Orders
            ProfileItem(
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              subtitle: 'View your order history',
              onTap: () {},
            ),

            // Addresses
            ProfileItem(
              icon: Icons.location_on_outlined,
              title: 'My Addresses',
              subtitle: 'Manage your delivery addresses',
              onTap: () {},
            ),

            // Wishlist
            ProfileItem(
              icon: Icons.favorite_border,
              title: 'Wishlist',
              subtitle: 'View your saved products',
              onTap: () {},
            ),

            const SizedBox(height: 24),

            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Notifications
            ProfileItem(
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              subtitle: 'Manage notifications',
              onTap: () {},
            ),

            // Privacy
            ProfileItem(
              icon: Icons.lock_outline,
              title: 'Privacy & Security',
              subtitle: 'Manage your privacy settings',
              onTap: () {},
            ),

            // Help
            ProfileItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get help with your account',
              onTap: () {},
            ),

            const SizedBox(height: 24),

            // Logout
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  debugPrint('Logout clicked');
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.red.shade200,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

