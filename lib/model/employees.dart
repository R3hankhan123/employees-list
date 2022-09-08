import 'dart:convert';

Employees employeesFromJson(String str) => Employees.fromJson(json.decode(str));

String employeesToJson(Employees data) => json.encode(data.toJson());

class Employees {
  Employees({
    required this.empId,
    required this.name,
    required this.designation,
    required this.years,
  });

  String empId;
  String name;
  String designation;
  String years;

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        empId: json["Emp_ID"],
        name: json["Name"],
        designation: json["Designation"],
        years: json["Years"],
      );

  Map<String, dynamic> toJson() => {
        "Emp_ID": empId,
        "Name": name,
        "Designation": designation,
        "Years": years,
      };
}
