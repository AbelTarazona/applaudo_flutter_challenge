//TODO: For testing purpose I just use one file for all classes.

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    required this.documents,
  });

  List<DocumentModel> documents;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        documents: List<DocumentModel>.from(
            json["documents"].map((x) => DocumentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class DocumentModel {
  DocumentModel({
    required this.name,
    required this.fields,
  });

  String name;
  FieldsModel fields;

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        name: json["name"],
        fields: FieldsModel.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields.toJson(),
      };
}

class FieldsModel {
  FieldsModel({
    required this.categoryId,
    required this.date,
    required this.isCompleted,
    required this.name,
  });

  CategoryIdModel categoryId;
  DateModel date;
  IsCompletedModel isCompleted;
  CategoryIdModel name;

  factory FieldsModel.fromJson(Map<String, dynamic> json) => FieldsModel(
        categoryId: CategoryIdModel.fromJson(json["categoryId"]),
        date: DateModel.fromJson(json["date"]),
        isCompleted: IsCompletedModel.fromJson(json["isCompleted"]),
        name: CategoryIdModel.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId.toJson(),
        "date": date.toJson(),
        "isCompleted": isCompleted.toJson(),
        "name": name.toJson(),
      };
}

class CategoryIdModel {
  CategoryIdModel({
    required this.stringValue,
  });

  String stringValue;

  factory CategoryIdModel.fromJson(Map<String, dynamic> json) => CategoryIdModel(
        stringValue: json["stringValue"],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
      };
}

class DateModel {
  DateModel({
    required this.integerValue,
  });

  String integerValue;

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        integerValue: json["integerValue"],
      );

  Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
      };
}

class IsCompletedModel {
  IsCompletedModel({
    required this.booleanValue,
  });

  bool booleanValue;

  factory IsCompletedModel.fromJson(Map<String, dynamic> json) => IsCompletedModel(
        booleanValue: json["booleanValue"],
      );

  Map<String, dynamic> toJson() => {
        "booleanValue": booleanValue,
      };
}
