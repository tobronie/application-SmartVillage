import 'package:flutter/material.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/utils/constans.dart';

class DetailBeritaComponent extends StatefulWidget {
  @override
  _DetailBeritaComponent createState() => _DetailBeritaComponent();
}

class _DetailBeritaComponent extends State<DetailBeritaComponent> {
  final _formKey = GlobalKey<FormState>();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreens.routeName);
                },
              ),
              SizedBox(width: 5),
              Text(
                'Detail Berita',
                style: mTitleStyleNameApps.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('assets/images/berita/rapat.jpeg'),
                Container(
                  margin: const EdgeInsets.only(top: 250),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Rapat Kepala Desa dengan Camat Bangilan',
                        style: mTitleStyle16.copyWith(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset(
                              'assets/images/profil/1.jpeg',
                              height: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Imam Tobroni',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                            child: Center(child: Text('-')),
                          ),
                          Text(
                            'Sabtu, 20 Oktober 2023',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Text(
                          'Rapat antara Kepala Desa dan Bupati merupakan sebuah forum yang memiliki signifikansi besar dalam mengoordinasikan upaya pembangunan dan pelayanan publik di tingkat desa. Pertemuan ini memberikan kesempatan bagi Kepala Desa untuk menyampaikan aspirasi, tantangan, dan kebutuhan masyarakat desa kepada Bupati, yang bertanggung jawab atas pemerintahan kabupaten atau wilayah yang lebih luas. Selain itu, dalam rapat ini, Bupati dapat memberikan arahan, sumber daya, dan dukungan yang dibutuhkan oleh desa untuk meningkatkan kualitas hidup penduduknya. Kerjasama yang efektif antara Kepala Desa dan Bupati adalah kunci kesuksesan dalam mewujudkan pembangunan yang berkelanjutan dan pelayanan yang efisien kepada masyarakat.\n\nSelain menjadi wadah untuk diskusi pembangunan, rapat antara Kepala Desa dan Bupati juga merupakan sarana untuk menciptakan sinergi antara pemerintah desa dan pemerintah kabupaten dalam menghadapi berbagai tantangan sosial, ekonomi, dan lingkungan. Dalam pertemuan ini, kedua belah pihak dapat merumuskan strategi bersama, merencanakan proyek-proyek kolaboratif, dan mengatasi masalah-masalah yang mungkin sulit diatasi secara terpisah. Hal ini memungkinkan pembangunan yang lebih terarah dan efisien, serta memperkuat koordinasi dalam pelayanan publik kepada masyarakat. Dengan demikian, rapat antara Kepala Desa dan Bupati memiliki peran sentral dalam memastikan bahwa pembangunan berjalan sejalan dengan kepentingan dan kebutuhan masyarakat di tingkat desa dan wilayah kabupaten.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                          maxLines: isExpanded ? null : 9,
                          overflow: isExpanded
                              ? TextOverflow.clip
                              : TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.comment),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.bookmark_border_outlined),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.share),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
