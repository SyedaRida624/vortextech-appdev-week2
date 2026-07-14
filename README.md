# VortexTech - Dynamic Task Manager App

A responsive and interactive **To-Do List application** built with Flutter for the **App Development Internship Track (Week 2)**. This project demonstrates local state management using Flutter's native `StatefulWidget` and `setState` to handle full CRUD (Create, Read, Update, Delete) interactions for tasks.

---

## 📸 App Preview

## Initial Task List      
<img width="1038" height="625" alt="v2 1" src="https://github.com/user-attachments/assets/2ff83bf1-5300-46fd-97a3-784b1c8866fe" />

## Adding New Task
<img width="1043" height="605" alt="v2 2" src="https://github.com/user-attachments/assets/943714d9-c876-4148-b8d3-be63a7e7fcdc" />

## All Tasks Completed
<img width="1039" height="611" alt="v2 3" src="https://github.com/user-attachments/assets/6b4df663-d610-43b1-940c-293f233f70eb" />

## Empty State View 
<img width="1053" height="626" alt="v2 4" src="https://github.com/user-attachments/assets/9782b589-7bbd-4046-8029-34f2454e0f0d" />

---

## ✨ Features & Interactivity

- **Task Creation:** Input field with an action button to dynamically append new tasks to the list.
- **Completion Toggle:** Interactive checkboxes to mark tasks as completed, featuring visual feedback via strikethrough styling and dimmed opacity.
- **Task Deletion:** Quick-action trash icon on each item to remove specific tasks from memory.
- **Dynamic Counter:** Real-time task counter updating automatically as items are added or removed.
- **Empty State Indicator:** Friendly visual feedback ("No tasks left! Great job.") when all tasks are cleared.
- **Input Cleanup:** Auto-clears the input text field upon task submission.

---

## 🛠️ State Management & Technical Highlights

- **`StatefulWidget` & `setState`:** Used to track and trigger UI re-renders on list mutations.
- **`TextEditingController`:** Captures and manages user input in the task creation field.
- **Custom Data Model / Map Structure:** Stores each task with `title` (String) and `isCompleted` (bool) attributes.
- **`ListView.builder`**: Efficiently renders task items dynamically.
- **Clean Dark Theme**: Designed using consistent typography, rounded borders, and custom primary accents matching the **VortexTech** design language.

---
