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
          code = snapshot.value['code'],
          driver_Id = snapshot.value['driver_Id'],
          adress = snapshot.value['adress'],
          hour = snapshot.value['hour'],
          phone = snapshot.value['phone'],
          status = snapshot.value['status'];

    toJson(){
        return {
            "code": code,
            "driver_Id": driver_Id,
            "adress": adress,
            "hour": hour,
            "phone": phone,
            "status": status,
        };
    }
}