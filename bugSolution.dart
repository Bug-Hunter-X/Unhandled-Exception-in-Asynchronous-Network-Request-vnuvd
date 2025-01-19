```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //Instead of throwing an exception, return null or a specific error object.
      print('Error: API request failed with status code ${response.statusCode}');
      return null; //or  return {"error":"API request failed"};
    }
  } catch (e) {
    print('Error: $e');
    //Consider implementing retry logic here.
    return null; //or return {"error":"Network error"};
  }
}

void main() async {
  final data = await fetchData();
  if(data != null){
    print(data);
  } else {
    print("Failed to fetch data.");
  }
}
```