import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokokita/model/produk.dart';

class ProdukBloc {
  static const String baseUrl = "http://10.0.2.2:8080/produk";

  // GET semua produk
  static Future<List<Produk>> getProduk() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)["data"];
      return data.map((e) => Produk.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  // DELETE produk
  static Future<bool> deleteProduk({required int id}) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal menghapus");
    }
  }
}
