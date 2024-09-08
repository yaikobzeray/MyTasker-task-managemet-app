class TaskModel {
   String id;
   String title;
   String description;
   String dueDate;
   String status; // Updated to String: 'completed', 'pending', 'overdue'

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.status,
  });

  // Convert a TaskModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'status': status,  // Now a string with choices
    };
  }

  // Convert JSON to a TaskModel object
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['dueDate'],
      status: json['status'],  // Now expecting a string
    );
  }
}
