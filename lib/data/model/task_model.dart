
//TODO: For testing purpose I just use one file for all classes.

class TaskModel {
  TaskModel({
    this.documents,
  });

  List<DocumentModel?>? documents;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        documents: json["documents"] == null
            ? []
            : List<DocumentModel?>.from(
                json["documents"]!.map((x) => DocumentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x!.toJson())),
      };
}

class DocumentModel {
  DocumentModel({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });

  String? name;
  FieldsModel? fields;
  DateTime? createTime;
  DateTime? updateTime;

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        name: json["name"],
        fields: FieldsModel.fromJson(json["fields"]),
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields!.toJson(),
        "createTime": createTime?.toIso8601String(),
        "updateTime": updateTime?.toIso8601String(),
      };
}

class FieldsModel {
  FieldsModel({
    this.categoryId,
    this.date,
    this.isCompleted,
    this.name,
  });

  CategoryIdModel? categoryId;
  DateModel? date;
  IsCompletedModel? isCompleted;
  CategoryIdModel? name;

  factory FieldsModel.fromJson(Map<String, dynamic> json) => FieldsModel(
        categoryId: CategoryIdModel.fromJson(json["categoryId"]),
        date: DateModel.fromJson(json["date"]),
        isCompleted: IsCompletedModel.fromJson(json["isCompleted"]),
        name: CategoryIdModel.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId!.toJson(),
        "date": date!.toJson(),
        "isCompleted": isCompleted!.toJson(),
        "name": name!.toJson(),
      };
}

class CategoryIdModel {
  CategoryIdModel({
    this.stringValue,
  });

  String? stringValue;

  factory CategoryIdModel.fromJson(Map<String, dynamic> json) =>
      CategoryIdModel(
        stringValue: json["stringValue"],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
      };
}

class DateModel {
  DateModel({
    this.integerValue,
  });

  String? integerValue;

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        integerValue: json["integerValue"],
      );

  Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
      };
}

class IsCompletedModel {
  IsCompletedModel({
    this.booleanValue,
  });

  bool? booleanValue;

  factory IsCompletedModel.fromJson(Map<String, dynamic> json) =>
      IsCompletedModel(
        booleanValue: json["booleanValue"],
      );

  Map<String, dynamic> toJson() => {
        "booleanValue": booleanValue,
      };
}
