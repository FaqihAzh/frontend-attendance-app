class AttendanceModel {
  final String id;
  final DateTime checkInTime;
  final DateTime? checkOutTime;
  final String status; // 'checked_in', 'checked_out'
  final String location;

  AttendanceModel({
    required this.id,
    required this.checkInTime,
    this.checkOutTime,
    required this.status,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'checkInTime': checkInTime.toIso8601String(),
      'checkOutTime': checkOutTime?.toIso8601String(),
      'status': status,
      'location': location,
    };
  }

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'],
      checkInTime: DateTime.parse(json['checkInTime']),
      checkOutTime: json['checkOutTime'] != null
          ? DateTime.parse(json['checkOutTime'])
          : null,
      status: json['status'],
      location: json['location'],
    );
  }
}