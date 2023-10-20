class Berita {
  final String kategori;
  final String image;
  final String judul;
  final String profil;
  final String nama;
  final String tanggal;
  final String teks;

  Berita(this.kategori, this.image, this.judul, this.profil, this.nama, this.tanggal, this.teks);
}

List<Berita> berita = [
  Berita(
    'Informasi',
    'assets/images/berita/rapat.jpeg',
    'Rapat Kepala Desa dengan Camat Bangilan',
    'assets/images/profil/1.jpeg',
    'Imam Tobroni',
    '2023/10/22',
    'Kepala Desa Kedungmulyo, bersama dengan Camat Bangilan, mengadakan sebuah rapat penting yang membahas berbagai isu dan perkembangan terkini di wilayah mereka. Rapat ini menjadi sebuah platform yang sangat relevan untuk mendiskusikan berbagai program dan proyek pembangunan, serta untuk membahas tantangan dan peluang yang dihadapi oleh masyarakat dan pemerintah setempat. Dalam rapat ini, mereka berusaha mencapai pemahaman yang mendalam tentang kebutuhan masyarakat dan bagaimana mengatasi masalah-masalah yang mungkin muncul di masa depan.\n\nRapat ini juga menjadi kesempatan untuk meningkatkan kolaborasi antara kepala desa dan camat dalam upaya meningkatkan kualitas hidup masyarakat. Mereka bekerjasama dalam merencanakan langkah-langkah konkrit untuk memajukan wilayah mereka, termasuk pemberian layanan yang lebih baik, pembangunan infrastruktur yang dibutuhkan, dan upaya untuk memastikan kesejahteraan sosial masyarakat setempat. Dalam rangkaian rapat ini, mereka juga mengajak partisipasi aktif dari masyarakat untuk bersama-sama mencapai tujuan pembangunan dan kesejahteraan yang lebih baik di Desa Kedungmulyo dan wilayah sekitarnya.'
  ),
  Berita(
    'Informasi',
    'assets/images/berita/kunjungan.jpeg',
    'Kunjungan Bupati Tuban di Desa Kedungmulyo',
    'assets/images/profil/2.jpeg',
    'Abu Hasan',
    '2023/10/01',
    'Kunjungan Bupati Tuban ke Desa Kedungmulyo merupakan sebuah momen istimewa yang sangat dinanti-nanti oleh warga desa. Dalam kunjungan ini, Bupati Tuban memiliki kesempatan untuk bertemu langsung dengan masyarakat desa dan mendengarkan aspirasi serta kebutuhan mereka. Bupati juga memanfaatkan kesempatan ini untuk memberikan informasi mengenai program-program pemerintah yang sedang berjalan dan rencana pembangunan di wilayah tersebut. Kehadiran Bupati menjadi tanda dukungan kuat dari pemerintah kabupaten terhadap kemajuan Desa Kedungmulyo.\n\nSelain itu, kunjungan Bupati Tuban juga membawa berbagai manfaat konkret, seperti peninjauan proyek-proyek pembangunan yang sedang berlangsung, penyaluran bantuan sosial, dan pengembangan kolaborasi antara pemerintah kabupaten dan pemerintah desa. Ini adalah momen yang memperkuat kerja sama yang erat antara pemerintah daerah dan pemerintah desa dalam upaya mencapai pembangunan yang berkelanjutan dan peningkatan kesejahteraan bagi masyarakat Desa Kedungmulyo. Kesempatan untuk bertemu dan berinteraksi langsung dengan Bupati juga memberikan semangat dan dorongan positif bagi warga desa dalam mengatasi berbagai tantangan yang dihadapi.'
  ),
  Berita(
    'Infrastruktur',
    'assets/images/berita/jalan.jpeg',
    'Pembangunan Jl.Kali kening depan Warung Mak Par',
    'assets/images/profil/3.jpeg',
    'Siti Musyawarah',
    '2023/10/09',
    'Pembangunan Jl. Kali Kening depan Warung Mak Par adalah sebuah inisiatif pembangunan yang sangat dinanti oleh masyarakat setempat. Jalan ini memiliki peran yang sangat penting dalam memfasilitasi mobilitas penduduk, serta mendukung pertumbuhan ekonomi di sekitarnya. Dalam proyek pembangunan ini, pemerintah setempat berkomitmen untuk meningkatkan kualitas jalan tersebut agar dapat digunakan dengan lebih baik, terutama dalam mengatasi masalah-masalah seperti genangan air saat hujan, dan kerusakan yang mengganggu lalu lintas.\n\nSelain manfaat langsung bagi mobilitas dan ekonomi, pembangunan Jl. Kali Kening depan Warung Mak Par juga mencerminkan perhatian pemerintah terhadap kesejahteraan masyarakat setempat. Masyarakat melihat pembangunan ini sebagai tanda bahwa pemerintah mendengarkan kebutuhan mereka dan berusaha untuk memastikan lingkungan mereka menjadi lebih baik. Proyek ini juga membawa peluang pekerjaan sementara bagi warga sekitar yang terlibat dalam pekerjaan konstruksi. Pembangunan jalan ini menjadi contoh nyata tentang bagaimana investasi dalam infrastruktur dapat meningkatkan kualitas hidup masyarakat setempat serta mendorong pertumbuhan ekonomi di wilayah tersebut.'
  ),
  Berita(
    'Informasi',
    'assets/images/berita/hut.jpeg',
    'Perayaan HUT RI di depan Mushola Al-Ikhlas',
    'assets/images/profil/4.jpeg',
    'Maryam',
    '2023/10/24',
    'Perayaan Hari Ulang Tahun Republik Indonesia (HUT RI) adalah salah satu momen paling bersejarah dan meriah yang dirayakan di seluruh tanah air. Di depan Mushola Al-Ikhlas, perayaan HUT RI menjadi saat yang sangat istimewa dan sarat makna bagi warga sekitar. Perayaan ini selalu diisi dengan berbagai acara seru dan penuh semangat, mencerminkan rasa patriotisme yang mendalam serta rasa cinta terhadap negara.\n\nDalam rangka memperingati HUT RI, berbagai kegiatan komunitas dan perlombaan digelar di depan Mushola Al-Ikhlas. Acara ini menghadirkan atraksi budaya, seperti tari daerah, pertunjukan musik, dan parade kostum tradisional. Selain itu, warga juga berpartisipasi dalam lomba-lomba tradisional, seperti lomba makan kerupuk, tarik tambang, dan panjat pinang. Semua kegiatan tersebut menciptakan semangat persatuan dan kesatuan yang erat di antara warga, serta memupuk rasa cinta pada negara dan nasionalisme yang kuat.\n\nSalah satu momen puncak dalam perayaan HUT RI adalah upacara bendera yang dihadiri oleh masyarakat setempat, termasuk anak-anak sekolah dan pemuda-pemudi. Mereka mengibarkan bendera merah putih dengan penuh kebanggaan, sambil menyanyikan lagu kebangsaan. Perasaan haru dan kebersamaan yang dirasakan selama upacara bendera ini menjadi pengingat kuat akan makna kemerdekaan dan pentingnya menjaga keutuhan negara. Perayaan HUT RI di depan Mushola Al-Ikhlas adalah momen yang selalu dinantikan, yang mengingatkan semua orang akan arti pentingnya mempertahankan dan memajukan negara ini.'
  ),
  Berita(
    'Informasi',
    'assets/images/berita/ngaji.jpeg',
    'Rutinan Pengajian Warna RT01/RW02',
    'assets/images/profil/5.jpeg',
    'Sukiyem',
    '2023/10/14',
    'Setiap pekan, warga dari RT01/RW02 berkumpul dengan penuh kekhusyukan dalam rutinan pengajian yang diadakan di lingkungan mereka. Pengajian ini menjadi ajang untuk meningkatkan spiritualitas dan kebersamaan di antara warga setempat. Dalam suasana yang penuh kehangatan, mereka bersama-sama membaca ayat suci Al-Quran, mendengarkan ceramah agama, dan berdoa bersama. Pengajian ini telah menjadi bagian penting dalam kehidupan sehari-hari mereka, menciptakan ikatan sosial dan spiritual yang erat di antara anggota komunitas, serta mengingatkan mereka akan pentingnya nilai-nilai keagamaan dalam menjalani kehidupan sehari-hari.'
  ),
  Berita(
    'Layanan',
    'assets/images/berita/layanan_a.jpeg',
    'Pengajuan Surat di Tutup Sementara',
    'assets/images/profil/1.jpeg',
    'Bob Marley',
    '2023/10/14',
    'Pengajuan surat tutup sementara adalah prosedur yang biasanya ditempuh oleh individu atau perusahaan yang perlu menghentikan sementara aktivitas atau layanan tertentu. Alasan untuk mengajukan surat ini dapat bervariasi, seperti renovasi gedung, libur panjang, perbaikan peralatan, atau keadaan darurat. Surat ini berfungsi sebagai pemberitahuan kepada pihak terkait, seperti pelanggan, pihak berwenang, atau pihak terkait lainnya, mengenai rencana penutupan sementara tersebut. Biasanya, surat tutup sementara harus mencakup informasi mengenai tanggal mulai dan berakhirnya penutupan, alasan penutupan, dan langkah-langkah yang akan diambil selama ini\n\nProsedur pengajuan surat tutup sementara dapat bervariasi tergantung pada aturan dan regulasi yang berlaku di masing-masing negara atau wilayah. Pihak yang mengajukan surat ini harus memastikan bahwa semua pihak terkait telah diberitahu dengan cukup waktu dan mendapat pemahaman yang jelas mengenai rencana penutupan sementara. Ini adalah langkah yang penting dalam menjaga transparansi, kepatuhan hukum, serta menjaga hubungan baik dengan pelanggan atau pihak lain yang mungkin terkena dampak penutupan sementara tersebut.'
  ),
  Berita(
    'Layanan',
    'assets/images/berita/layanan_b.jpeg',
    'Perpanjang Surat KTP dan KK',
    'assets/images/profil/4.jpeg',
    'Sandy',
    '2023/10/14',
    'Perpanjang Surat KTP (Kartu Tanda Penduduk) dan KK (Kartu Keluarga) adalah suatu kewajiban penting yang harus dilakukan oleh setiap warga negara. Surat KTP adalah identitas resmi yang menunjukkan bahwa seseorang adalah warga negara Indonesia dan memberikan hak dan kewajiban tertentu. KK, di sisi lain, mencatat data dan informasi keluarga serta hubungan antaranggota keluarga. Masa berlaku Surat KTP umumnya berlangsung selama 5 tahun, sementara KK tidak memiliki masa berlaku yang tetap. Oleh karena itu, perpanjangan keduanya perlu dilakukan secara berkala.\n\nProses perpanjangan Surat KTP melibatkan kunjungan ke kantor Dinas Kependudukan dan Catatan Sipil setempat. Warga harus membawa dokumen asli, seperti Surat KTP lama dan KK, serta berbagai persyaratan yang mungkin berbeda di tiap daerah. Setelah proses administratif selesai, warga akan diberikan Surat KTP yang diperpanjang dengan masa berlaku baru. Demikian pula, perpanjangan KK juga melibatkan kunjungan ke kantor Dinas Kependudukan dan Catatan Sipil. Proses ini dapat mencakup pemutakhiran data keluarga dan informasi terbaru. Penting untuk diingat bahwa kedua surat ini sangat penting dan perpanjangannya harus dilakukan tepat waktu. Dengan Surat KTP yang valid dan KK yang terkini, warga akan dapat mengakses berbagai layanan dan fasilitas pemerintah serta mengikuti berbagai program yang disediakan oleh pemerintah. Oleh karena itu, menjaga Surat KTP dan KK tetap aktif adalah tindakan yang penting untuk kepentingan pribadi dan keluarga.'
  ),
  Berita(
    'Kecelakaan',
    'assets/images/berita/kecelakaan_a.jpeg',
    'Tabrak Lari di Jalan Kali Kening 01',
    'assets/images/profil/2.jpeg',
    'Miss',
    '2023/10/14',
    'Kejadian tabrak lari di Jalan Kali Kening 01 merupakan suatu insiden yang memerlukan perhatian serius dari pihak berwenang. Kejadian ini terjadi ketika kendaraan seorang pengemudi menabrak kendaraan lain atau pejalan kaki di Jalan Kali Kening 01 dan kemudian melarikan diri dari tempat kejadian. Tabrak lari adalah tindakan ilegal dan berbahaya yang harus ditangani dengan serius, karena dapat mengakibatkan cedera atau bahkan kematian bagi korban. Pihak berwenang, seperti kepolisian, biasanya akan melakukan penyelidikan untuk mengidentifikasi pelaku tabrak lari dan menegakkan hukum sesuai dengan aturan yang berlaku. Kejadian ini juga menyoroti pentingnya keselamatan lalu lintas dan kesadaran hukum dalam berkendara, serta perlunya tindakan preventif untuk mencegah kejadian serupa di masa depan.'
  ),
  Berita(
    'Kecelakaan',
    'assets/images/berita/kecelakaan_b.jpeg',
    'Benturan Mobil Sedan dengan Truk Pengangkut Pasir',
    'assets/images/profil/5.jpeg',
    'Kukoh',
    '2023/10/14',
    'Benturan antara mobil sedan dan truk pengangkut pasir adalah insiden serius yang dapat mengakibatkan kerusakan berat pada kedua kendaraan dan potensi cedera serius bagi pengemudi dan penumpang. Kecelakaan semacam ini seringkali terjadi di jalan-jalan raya dan dapat disebabkan oleh berbagai faktor, termasuk pelanggaran aturan lalu lintas, kondisi jalan yang buruk, atau kurangnya kesadaran akan bahaya di jalan. Dalam kejadian seperti ini, penting untuk segera mendapatkan bantuan medis jika ada korban yang terluka, serta melibatkan pihak berwenang seperti polisi untuk menyelidiki penyebab kecelakaan dan menentukan tanggung jawab hukum yang sesuai. Keselamatan di jalan adalah prioritas utama, dan kejadian semacam ini menjadi pengingat akan pentingnya berlalu lintas dengan hati-hati dan mematuhi aturan lalu lintas yang berlaku.'
  ),
];
