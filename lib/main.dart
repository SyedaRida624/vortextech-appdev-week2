import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VortexTech Week 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // State management: Dynamic list of map objects holding our tasks
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Review Flutter UI layout architecture', 'completed': true},
    {'title': 'Implement setState dynamic functionality', 'completed': false},
    {'title': 'Thoroughly test console bugs and edge cases', 'completed': false},
  ];

  // Controller to handle input text from user
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F0B1E), // Deep dark indigo
              Color(0xFF1A1235), // Smooth purple transition
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. App Header Layout Block
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VORTEXTECH",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "WEEK 2 • TASK MANAGER",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 11,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.task_alt_rounded,
                      size: 36,
                      color: Color(0xFF6C63FF),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. Add Task Input Section (Beautiful Custom Glassmorphic Row)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.06),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.09),
                          ),
                        ),
                        child: TextField(
                          controller: _textController,
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                          decoration: InputDecoration(
                            hintText: "Add a new task...",
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                            prefixIcon: Icon(Icons.add_task_rounded, color: Colors.white.withOpacity(0.5), size: 22),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        // Core functionality inline implementation
                        if (_textController.text.trim().isNotEmpty) {
                          setState(() {
                            _tasks.add({
                              'title': _textController.text.trim(),
                              'completed': false,
                            });
                            _textController.clear();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(18),
                        minimumSize: const Size(56, 56),
                        elevation: 4,
                        shadowColor: const Color(0xFF6C63FF).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Icon(Icons.send_rounded, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. Dynamic Task Counter Badge
                Text(
                  "Your Tasks (${_tasks.length})",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                // 4. Dynamic Tasks List Frame
                Expanded(
                  child: _tasks.isEmpty
                      ? Center(
                    child: Text(
                      "No tasks left! Great job.",
                      style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 15),
                    ),
                  )
                      : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: task['completed']
                                ? Colors.white.withOpacity(0.02)
                                : Colors.white.withOpacity(0.05),
                            border: Border.all(
                              color: task['completed']
                                  ? Colors.white.withOpacity(0.04)
                                  : Colors.white.withOpacity(0.08),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            // Requirement 7: Checkbox structure with tap callback toggling state
                            leading: Checkbox(
                              value: task['completed'],
                              activeColor: const Color(0xFF6C63FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              onChanged: (bool? newValue) {
                                setState(() {
                                  task['completed'] = newValue ?? false;
                                });
                              },
                            ),
                            // Requirement 8: Dynamic text styling using ternary rules
                            title: Text(
                              task['title'],
                              style: TextStyle(
                                color: task['completed'] ? Colors.white38 : Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: task['completed']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            // Requirement 9: Inline deletion option calling setState directly
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 22),
                              onPressed: () {
                                setState(() {
                                  _tasks.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}