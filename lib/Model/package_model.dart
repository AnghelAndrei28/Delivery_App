import 'package:firebase_database/firebase_database.dart';

class Package {
    String key;
    String code;
    String adress;
    int driver_Id;
    String hour;
    String phone;
    String status;

    Package(this.adress,this.code, this.driver_Id, this.hour, this.phone, this.status);

    Package.fromSnapshot(DataSnapshot snapshot) :
          key = snapshot.key,
          code = snapshot.value['Code'],
          driver_Id = snapshot.value['Deliver_Id'],
          adress = snapshot.value['Adress'],
          hour = snapshot.value['Hour'],
          phone = snapshot.value['Phone'],
          status = snapshot.value['Status'];
}