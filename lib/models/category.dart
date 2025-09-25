class DamageCategory {
  final int id;
  final String code;
  final String name;
  final String unitType;
  final num defaultPrice;

  DamageCategory({required this.id, required this.code, required this.name, required this.unitType, required this.defaultPrice});

  factory DamageCategory.fromJson(Map<String,dynamic> j) => DamageCategory(
    id: j['id'],
    code: j['code'],
    name: j['name'],
    unitType: j['unit_type'],
    defaultPrice: j['default_price'] ?? 0,
  );
}
