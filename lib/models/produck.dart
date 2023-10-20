class Product {
  final String image;
  final String nama;
  final int harga;
  final String deskripsi;

  Product(this.image, this.nama, this.harga, this.deskripsi);
}

List<Product> products = [
  Product(
    'assets/images/product/panci.jpeg',
    'Panci Elektornik',
    75000,
    'Gratis Ongkir',
  ),
  Product(
    'assets/images/product/kipas_angin.jpeg',
    'Kipas Angin',
    130000,
    'Gratis Ongkir dan Menerima COD',
  ),
  Product(
    'assets/images/product/ember.jpeg',
    'Ember Plastik',
    18000,
    'Gratis Ongkir',
  ),
  Product(
    'assets/images/product/setrika.jpeg',
    'Seterika 100 W',
    80000,
    'bisa Bayar Lewat E-Money',
  ),
  Product(
    'assets/images/product/peralatan_tukang.jpg',
    'Peralatan Tukang',
    200000,
    'Menerima COD',
  ),
];
