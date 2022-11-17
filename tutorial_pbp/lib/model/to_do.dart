// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

ToDo toDoFromJson(String str) => ToDo.fromJson(json.decode(str));

String toDoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
    ToDo({
        required this.greeting,
        required this.instructions,
    });

    String greeting;
    List<Instruction> instructions;

    factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        greeting: json["greeting"],
        instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x.toJson())),
    };
}

class Instruction {
    Instruction({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    int userId;
    int id;
    String title;
    bool completed;

    factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
