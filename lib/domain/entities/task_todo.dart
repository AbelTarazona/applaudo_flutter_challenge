class TaskToDo {
  final String title;
  final String date;
  bool isComplete;
  TaskToDo({required this.title, required this.date, required this.isComplete});

  TaskToDo copyWith({
    String? title,
    String? date,
    bool? isComplete,
  }) {
    return TaskToDo(
      title: title ?? this.title,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
