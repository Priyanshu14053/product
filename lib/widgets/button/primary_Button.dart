import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;
  final IconData? icon;

  const PrimaryButton({super.key,
    required this.label,
    required this.isLoading,
    this.onPressed,
    this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,

      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child:
          isLoading? SizedBox(
            height: 50,
            width: 50,
              child:CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
          ):
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(icon != null)...[
                    Icon(icon, size: 20,),
                    const SizedBox(width: 8,),
              ],
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
      ),
    );
  }
}
