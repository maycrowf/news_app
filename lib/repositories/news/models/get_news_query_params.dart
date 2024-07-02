class GetNewsQueryParams {
  final String country;
  final String category;

  GetNewsQueryParams({
    required this.country,
    required this.category,
  });

  Map<String, String> toMap() => {
        "country": country,
        "category": category,
      };
}
