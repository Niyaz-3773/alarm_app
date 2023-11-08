class AlarmModel {   
   String medName;
   String dosage;
   String unit;
   DateTime time;
   int cabinetID;
   bool medTaken;
   int rescheduleHour;
   int rescheduleMin;

  AlarmModel({
    required this.medName,
    required this.dosage,
    required this.unit,
    required this.time,
    required this.cabinetID,
    required this.medTaken,
    required this.rescheduleHour,
    required this.rescheduleMin,
  });
}
