import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth/login.dart';

class WelcomeOneScreen extends StatefulWidget {
  const WelcomeOneScreen({super.key});

  @override
  State<WelcomeOneScreen> createState() => _WelcomeOneScreenState();
}

class _WelcomeOneScreenState extends State<WelcomeOneScreen> {
  int currentPage = 0;
  
  final List<Map<String, String>> content = [
    {
      'description': 'Monitor your daily habits and see your improvement over time. Build consistency and achieve your goals with visual progress tracking.',
    },
    {
      'description': 'Create positive habits that stick. Our smart reminders and streak tracking help you maintain consistency in your daily routine.',
    },
    {
      'description': 'Get personalized insights and motivational content to keep you inspired on your journey to becoming your best self.',
    },
  ];

  void nextPage() {
    if (currentPage < 2) {
      setState(() {
        currentPage++;
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void closePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8C5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Top Navigation Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Arrow (only show after first content)
                  currentPage > 0
                      ? GestureDetector(
                          onTap: previousPage,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        )
                      : const SizedBox(width: 40),
                  
                  // Progress Bars
                  Row(
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        width: 50,
                        height: 6,
                        decoration: BoxDecoration(
                          color: index == currentPage 
                              ? Colors.black 
                              : Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                  
                  // Close Button
                  GestureDetector(
                    onTap: closePage,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 60),
              
              // Content Area
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Big Number
                    Text(
                      '0${currentPage + 1}',
                      style: GoogleFonts.albertSans(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.1),
                        height: 0.8,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        content[currentPage]['description']!,
                        style: GoogleFonts.albertSans(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Bottom Arrow Button
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  onTap: nextPage,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}