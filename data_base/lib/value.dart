import 'package:hive/hive.dart';
 part 'value.g.dart';


@HiveType(typeId: 0)
class demo extends HiveObject
{


  @HiveField(0)
  String name;

  @HiveField(1)
  String cont;

  demo(this.name, this.cont);

  @override
  String toString() {
    return 'demo{name: $name, contect: $cont}';
  }
}