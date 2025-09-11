import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/Provider/ThemeProvider.dart';
import '../../Provider/StopwatchProvider.dart';
import '../Elements/CustomContainer.dart';
import '../Elements/CustomText.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _formatTime(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    final micro = (d.inMicroseconds % 1000000).toString().padLeft(6, '0');
    return "$hours:$minutes:$seconds.$micro";
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(gradient: themeProvider.backgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyText(
                        text: "Smooth Stopwatch",
                        size: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: themeProvider.titleColor,
                      ),
        
                      Consumer<ThemeProvider>(
                        builder: (context, theme, _) {
                          return IconButton(
                            icon: MyIconContainer(
                              icon: themeProvider.isNightMode ? Icons.wb_sunny : Icons.nights_stay,
                              iconColor: themeProvider.isNightMode ? Colors.green : Colors.red ,
                              iconSize: 28,
                            ),
                            onPressed: () => theme.toggleTheme(),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  Consumer<StopwatchProvider>(
                    builder: (context, stopwatch, _) {
                      return MyText(
                        text: _formatTime(stopwatch.elapsed),
                        color: themeProvider.primaryTextColor,
                        size: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  MyText(
                    text: "Hours : Minutes : Seconds : µs",
                    size: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: themeProvider.primaryTextColor,
                  ),
                ],
              ),
        
              const SizedBox(height: 100),
              // Control Buttons
              Consumer<StopwatchProvider>(
                builder: (context, stopwatch, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 🔹 Start/Stop Toggle
                      _buildButton(
                        stopwatch.timerOn ? "Stop" : "Start",
                        stopwatch.timerOn ? Colors.red : Colors.green,
                        stopwatch.timerOn ? Icons.stop : Icons.play_arrow,
                        stopwatch.timerOn ? stopwatch.stop : stopwatch.start,
                      ),
        
                      // 🔹 Reset Button (disabled when running)
                      _buildButton(
                        "Reset",
                        stopwatch.timerOn ? Colors.grey : Colors.orange,
                        Icons.refresh,
                        stopwatch.timerOn
                            ? null
                            : stopwatch.reset, // disabled if running
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String text,
    Color color,
    IconData icon,
    VoidCallback? onPressed,
  ) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        elevation: 10,
        shadowColor: color.withOpacity(0.5),
      ),
      onPressed: onPressed,
      icon: MyIconContainer(icon: icon, iconColor: Colors.white, iconSize: 30),
      label: MyText(
        text: text,
        size: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
