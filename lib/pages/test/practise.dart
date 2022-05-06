import 'package:flutter/material.dart';

import 'answer.dart';

class TestPrac extends StatefulWidget {
  const TestPrac({Key? key}) : super(key: key);

  @override
  State<TestPrac> createState() => _TestPracState();
}

class _TestPracState extends State<TestPrac> {
  List<Icon> _scoreTracker = [
    // Icon(
    //   Icons.check_circle,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.clear,
    //   color: Colors.red,
    // ),
  ];
  int questionIndex = 0;
  int totalScore = 0;
  bool answerWasSelected = false;
  bool endOfTest = false;
  bool correctAnswerSelected = false;
  void questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;
      if (answerScore) {
        totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      if (questionIndex == _questions.length - 1) {
        endOfTest = true;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (questionIndex >= _questions.length) {
      goBackHome();
    }
  }

  void goBackHome() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Zilzila APP'))
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                children: [
                  if (endOfTest)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFE8F6FF),
                        border: Border.all(
                          color: Color.fromARGB(255, 25, 161, 245),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Test tugadi,\nUmumiy baho: ${totalScore.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Color(0xFF313131)),
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        _questions[questionIndex]['question'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ..._questions[questionIndex]['answers'].map(
                    (answer) => Answer(
                      answerText: answer['answerText'],
                      answerColor: answerWasSelected
                          ? answer['score']
                              ? Colors.green
                              : Colors.red
                          : Colors.white,
                      answerTap: () {
                        if (answerWasSelected) {
                          return;
                        }
                        questionAnswered(answer['score']);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40)),
                    onPressed: () {
                      if (!answerWasSelected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Iltimos javobni tanlang')));
                        return;
                      }
                      nextQuestion();
                    },
                    child: Text(
                      endOfTest ? "Yuborish" : "Keyingisi",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      '${totalScore.toString()}/${_questions.length.toString()}',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (answerWasSelected && !endOfTest)
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: correctAnswerSelected ? Colors.green : Colors.red,
                      child: Center(
                        child: Text(
                          correctAnswerSelected
                              ? "Javob to'g'ri"
                              : "Javob noto'g'ri",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List _questions = const [
  {
    'question':
        'Favqulodda vaziyatga olib keluvchi geologik xavfli hodisalarni ko\'rsating?',
    'answers': [
      {
        'answerText': 'Zilzila, yer ko\'chkisi va tog\' o\'pirilishlari.',
        'score': true
      },
      {'answerText': 'Zilzila, yer  va qor ko\'chkilari.', 'score': false},
      {'answerText': 'Yer ko\'chkisi, qor ko\'chkisi, sunami', 'score': false},
      {'answerText': 'Zilzila, sunami, yer ko\'chkisi', 'score': false},
    ],
  },
  {
    'question': 'Zilzila nima?',
    'answers': [
      {
        'answerText':
            'Yer ichki harakatlari natijasida uning yuzasida paydo bo\'ladigan tebranma harakat',
        'score': true
      },
      {'answerText': 'Yer osti zarbasi yuzaga kelgan joy', 'score': false},
      {'answerText': 'Qayta-qayta takrorlanuvchi tebranishlar', 'score': false},
      {'answerText': 'Tabiat hodisasi', 'score': false},
    ],
  },
  {
    'question':
        'Yer qobig\'ining tebranishlarini o\'rganadigan fan qanday nomlanadi?',
    'answers': [
      {'answerText': 'Etologiya', 'score': false},
      {'answerText': 'Sotsiologiya', 'score': false},
      {'answerText': 'Ekologiya', 'score': false},
      {'answerText': 'Seysmologiya', 'score': true},
    ],
  },
  {
    'question':
        'Yer yuzasi tebranishlarini yozish uchun mo\'ljallangan qurilma qanday nomlanadi?',
    'answers': [
      {'answerText': 'Etnograf', 'score': false},
      {'answerText': 'Seysmograf', 'score': true},
      {'answerText': 'Xronograf', 'score': false},
      {'answerText': 'Sotsiograf', 'score': false},
    ],
  },
  {
    'question':
        'MSK-64 seysmik shkalasi qachon tavsiya etilgan va qaysi olimlar tomonidan takomillashtirish asosida tuzilgan?',
    'answers': [
      {
        'answerText':
            '1964 yilda Parijda o\'tkazilgan YUNESKO yig\'ilishida, S.Medvedev (SSSR), V.Shponxoyyer (Germaniya), V.Karnik (Chexoslovakiya)',
        'score': true
      },
      {'answerText': 'Nyuton V., Lomonosov V.', 'score': false},
      {'answerText': 'Abdulabekov Q., Mavlonov N.', 'score': false},
      {'answerText': 'Kobe, Shidu', 'score': false},
    ],
  },
  {
    'question':
        'Zilzilalar kelib chiqish sabablariga ko\'ra qanaqa turlarga bo\'linadi?',
    'answers': [
      {'answerText': 'Tektonik, vulqon va o\'pirilish', 'score': true},
      {'answerText': 'Kuchki, Sunami', 'score': false},
      {'answerText': 'Sel, Suv toshqini', 'score': false},
      {'answerText': 'Vulkon, Kuchki', 'score': false},
    ],
  },
  {
    'question':
        'Zilzilaning tayyorgarlik jarayoni geofizik modeli kim tomonidan ishlab chiqilgan?',
    'answers': [
      {'answerText': 'Abdullabekov', 'score': true},
      {'answerText': 'Qari-Niyaziy', 'score': false},
      {'answerText': 'Mavlonov', 'score': false},
      {'answerText': 'Ibragimov Sh.', 'score': false},
    ],
  },
  {
    'question': 'Seysmik rayonlashtirish xaritasini tuzishdan maqsad nima?',
    'answers': [
      {'answerText': 'Qurilish meyorlarini belgilash uchun', 'score': true},
      {'answerText': 'Xavfsizlikga ega', 'score': false},
      {'answerText': 'Chiroyli bulishi uchun', 'score': false},
      {'answerText': 'Geografiyadan dars berishi uchun', 'score': false},
    ],
  },
  {
    'question':
        'Dunyoda birinchi seysmoskop qachon va kim tomonidan yaratilgan?',
    'answers': [
      {
        'answerText': '132 yilda Xitoy olimi Chjen Xen tomonidan',
        'score': true
      },
      {'answerText': 'Abdulabekov Q.N.', 'score': false},
      {'answerText': 'Mavlonov ', 'score': false},
      {'answerText': 'Golitsin B.', 'score': false},
    ],
  },
  {
    'question':
        'Uyda yolg\'iz o\'tirgan vaqtingizda birdaniga qandil va deraza oynalari zirillay boshladi, javonlardagi idishlar pastga otildi. Sizning harakatingiz?',
    'answers': [
      {'answerText': 'Eshik oralig\'iga turib olish', 'score': true},
      {
        'answerText':
            'Qarindoshlaringizga voqea to\'g\'risida qo\'ng\'iroq qilish',
        'score': false
      },
      {'answerText': 'Derazadan pastga sakrash', 'score': false},
      {'answerText': 'Baland ovozda yordamga chaqirish', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila vaqtida bino ichida berkinish uchun eng qulay joy qayerda?',
    'answers': [
      {
        'answerText':
            'Mahkam turgan stol osti, krovatlar yoni, tayanch ichki devorlar oralig\'i, tayanch devorlar hosil qilgan burchaklar, eshik oraliqlari',
        'score': true
      },
      {'answerText': 'Deraza tokchasi osti, shkaflar ichi', 'score': false},
      {
        'answerText':
            'Shamollatish shaxtalari, ko\'p ќavatli uylarning ayvonlari',
        'score': false
      },
      {'answerText': 'Lift va zinalar', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila yuz bergan vaqtda shahar ko\'chasida bo\'lsangiz qanday harakat qilasiz?',
    'answers': [
      {'answerText': 'Biror bir harakat qilish shart emas', 'score': false},
      {'answerText': 'Xohlagan binoda berkinish', 'score': false},
      {
        'answerText':
            'Uylardan uzoqroqqa, xiyobon va keng ko\'chalar tomon yo\'l olish ',
        'score': true
      },
      {
        'answerText': 'Panajoyi mavjud korxona, zavodlar tomon yo\'l olish',
        'score': false
      },
    ],
  },
  {
    'question': 'Zilzilaga tayyorgarlik kurish uchun qanday reja tuziladi?',
    'answers': [
      {
        'answerText': 'Zilziladan oldin, Zilzila paytida, zilziladan so\'ng',
        'score': true
      },
      {'answerText': 'Evakuatsiya yullarni belgilash', 'score': false},
      {'answerText': 'Ochiq joylarni belgilash', 'score': false},
      {'answerText': 'Zaxira suv tayyorlash.', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila vaqtida bino ichida berkinish uchun eng qulay joy qayerda??',
    'answers': [
      {
        'answerText':
            'Mahkam turgan stol osti, karovatlar yoni, tayanch ichki devorlar oralig\'i, tayanch devorlar hosil qilgan burchaklar, eshik oraliqlari.',
        'score': true
      },
      {'answerText': 'Deraza tokchasi osti, shkaflar ichi', 'score': false},
      {
        'answerText':
            'Shamollatish shaxtalari, ko\'p qavatli uylarning ayvonlari.',
        'score': false
      },
      {'answerText': 'Lift va zinalar.', 'score': false},
    ],
  },
  {
    'question': 'Zilzila nima?',
    'answers': [
      {
        'answerText':
            'Yer ichki harakatlari natijasida uning yuzasida paydo bo\'ladigan tebranma harakat',
        'score': true
      },
      {'answerText': 'Yer osti zarbasi yuzaga kelgan joy.', 'score': false},
      {
        'answerText':
            'Namgarchilik tufayli og\'irlik kuchi ta’sirida tog\' jinslarining yonbag\'ir bo\'ylab pastga tomon siljishi.',
        'score': false
      },
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila vaqtida ahvoli og\'irlashgan odamga 1-yordam kursatish nimadan boshlanadi?',
    'answers': [
      {'answerText': 'Yerga yotkizishdan', 'score': false},
      {'answerText': 'Vaziyatni baxolashdan ', 'score': true},
      {'answerText': 'Xushiga keltirishdan', 'score': false},
      {'answerText': 'Tez yordam chakirishdan', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila vaqtida jarohatlangan odamga qon to\'xtatuvchi bog\'lam (jgut) qancha muddatga qo\'yiladi?',
    'answers': [
      {'answerText': '2 soatga', 'score': false},
      {'answerText': '1,5 soatga.', 'score': false},
      {'answerText': '2 - 2,5 soatga.', 'score': false},
      {'answerText': '1 soatga', 'score': true},
    ],
  },
  {
    'question': 'Sirena xabar berish signali nima ma’noni anglatadi?',
    'answers': [
      {'answerText': '“Diqqat barchaga!”', 'score': true},
      {'answerText': '“Suv toshqini!”', 'score': false},
      {'answerText': '“Kimyoviy zaharlanish xavfi!”', 'score': false},
      {'answerText': '“Radiatsiyaviy zaharlanish xavfi!”', 'score': false},
    ],
  },
  {
    'question':
        'Zilzila bilan bog\'liq favqulodda vaziyat hududida jabrlanuvchilarni qutqarish va ularga birinchi tibbiy yordam ko\'rsatish ishlari kim tomonidan olib boriladi?',
    'answers': [
      {
        'answerText':
            'Favqulodda vaziyat hududiga jalb etilgan tibbiy xodimlar va qutqaruvchilar tomonidan.',
        'score': false
      },
      {'answerText': 'Tibbiyot xodimlari tomonidan.', 'score': false},
      {'answerText': 'Qutqaruvchilar tomonidan.', 'score': false},
      {
        'answerText':
            'Favqulodda vaziyat hududiga jalb etilgan tibbiy xodimlar, qutqaruvchilar, tuzilmalar, ishchi-xizmatchilar, talabalar va aholi tomonidan.',
        'score': true
      },
    ],
  },
  {
    'question': 'Stress nima?',
    'answers': [
      {
        'answerText': 'Insonni shodu-xurramlikka tushiruvchi holat.',
        'score': false
      },
      {
        'answerText':
            'Hayvon va inson organizmida turli noxush omillar (stressorlar) ta’siriga javoban yuzaga keluvchi fiziologik himoya reaksiyalari majmui',
        'score': true
      },
      {'answerText': 'Xavf-xatarni sezish, xavfsirash holati.', 'score': false},
      {'answerText': 'Nazoratdan chiqib ketgan qo\'rquv.', 'score': false},
    ],
  },
  {
    'question':
        'Geologik xavfli hodisalarga qaysi favqulodda vaziyatlar turlari kiradi?',
    'answers': [
      {'answerText': 'Zilzila, sunami, yer ko\'chkisi.', 'score': false},
      {'answerText': 'Zilzila, yer  va qor ko\'chkilari.', 'score': false},
      {
        'answerText': 'Yer ko\'chkisi, qor ko\'chkisi, tog\' o\'pirilishlari.',
        'score': false
      },
      {
        'answerText': 'Zilzila, yer ko\'chkisi va tog\' o\'pirilishlari.',
        'score': true
      },
    ],
  },
  {
    'question':
        'Uyda yolg\'iz o\'tirgan vaqtingizda birdaniga qandil va deraza oynalari zirillay boshladi, javonlardagi idishlar pastga otildi. Siz tezlikda?',
    'answers': [
      {'answerText': 'Eshik oralig\'iga turib olasiz.', 'score': true},
      {
        'answerText':
            'Qarindoshlaringizga voqea to\'g\'risida qo\'ng\'iroq qila boshlaysiz.',
        'score': false
      },
      {'answerText': 'Derazadan pastga sakraysiz.', 'score': false},
      {
        'answerText': 'Baland ovozda yordamga chaqira boshlaysiz.',
        'score': false
      },
    ],
  },
  {
    'question':
        'Insonni tabiiy ofatlardan muhofaza qiluvchi qanday usullar mavjud?',
    'answers': [
      {
        'answerText':
            'Tabiiy ofat to\'g\'risida o\'z vaqtida ishonchli va haqqoniy axborot berish',
        'score': true
      },
      {'answerText': 'Maxsus kiyim-kechak bilan ta’minlash', 'score': false},
      {'answerText': 'Qutqaruv asbob-anjomlari sotib olish.', 'score': false},
      {
        'answerText': 'Tabiiy ofatdan muhofaza qilib bo\'lmaydi.',
        'score': false
      },
    ],
  },
  {
    'question': 'Zilzila sabablaridan birini ko\'rsating:',
    'answers': [
      {
        'answerText': 'Yer qobig\'i plitalarining o\'zaro ta’sirlashuvi.',
        'score': true
      },
      {
        'answerText': 'Tog\' jinslaridagi to\'lqin tebranishlari.',
        'score': false
      },
      {
        'answerText':
            'Tektonik yoriqlar zonasida tozalash inshootlarini qurish.',
        'score': false
      },
      {'answerText': 'Ob-havo injiqliklari.', 'score': false},
    ],
  },
  {
    'question': 'Yaqinlashib kelayotgan zilzila darakchilaridan biri?',
    'answers': [
      {
        'answerText':
            'Yaqin atrofdagi elektr simlarining nurlanishi, avval kuzatilmagan joylarda gaz hidining sezilishi.',
        'score': true
      },
      {'answerText': 'Ob-havoning keskin o\'zgarishi.', 'score': false},
      {'answerText': 'Elektr tarmog\'idagi qisqa tutashuv.', 'score': false},
      {'answerText': 'Ќandillarning tebranishi.', 'score': false},
    ],
  },
  {
    'question':
        'Agar zilzilaning birinchi  silkinishlari yuz bergan damda maktabda bo\'lsangiz, qanday harakat qilish kerak?',
    'answers': [
      {'answerText': 'Darslardan qochish kerak.', 'score': false},
      {'answerText': 'Ko\'chaga qochib chiqish kerak.', 'score': false},
      {
        'answerText': 'O\'qituvchining ko\'rsatmasini kutish kerak.',
        'score': true
      },
      {
        'answerText': 'Televideniye orqali beriladigan xabarni kutish kerak.',
        'score': false
      },
    ],
  },
  {
    'question':
        'Zilzila yuz bergan vaqtda shahar ko\'chasida bo\'lsangiz qanday harakat qilasiz?',
    'answers': [
      {'answerText': 'Biror bir harakat qilish kerak emas.', 'score': false},
      {'answerText': 'Xohlagan binoda berkinish mumkin.', 'score': false},
      {
        'answerText':
            'Uylardan uzoqroqqa, xiyobon va keng ko\'chalar tomon yo\'l olish kerak.',
        'score': true
      },
      {
        'answerText':
            'Panajoyi mavjud korxona, zavodlar tomon yo\'l olish kerak.',
        'score': false
      },
    ],
  },
  {
    'question':
        'Yer qobig\'ining tebranishlarini o\'rganadigan fan qanday nomlanadi?',
    'answers': [
      {'answerText': 'Etologiya.', 'score': false},
      {'answerText': 'Sotsiologiya', 'score': false},
      {'answerText': 'Ekologiya', 'score': false},
      {'answerText': 'Seysmologiya', 'score': true},
    ],
  },
  {
    'question':
        'Yer yuzasi tebranishlarini yozish uchun mo\'ljallangan qurilma qanday nomlanadi?',
    'answers': [
      {'answerText': 'Etnograf', 'score': false},
      {'answerText': 'Seysmograf', 'score': true},
      {'answerText': 'Xronograf', 'score': false},
      {'answerText': 'Sotsiograf', 'score': false},
    ],
  },
  {
    'question':
        'Nima deb o\'ylaysiz zilzila yuz berganda birinchi silkinishlardan so\'ng qayta silkinishlar bo\'lishi mumkinmi?',
    'answers': [
      {'answerText': 'Ha.', 'score': true},
      {'answerText': 'Yo\'q.', 'score': false},
      {'answerText': 'Bu to\'g\'risida o\'ylab ko\'rmaganman.', 'score': false},
      {'answerText': 'Bilmayman.', 'score': false},
    ],
  },
  {
    'question':
        'Vayron bo\'lgan bino bo\'laklari ostida qolsangiz o\'zingizni qanday tutishingiz kerak?',
    'answers': [
      {'answerText': 'Shaxsan biror nima qilish kerak emas.', 'score': false},
      {'answerText': 'Qo\'rquvga yengilish kerak emas.', 'score': false},
      {'answerText': 'Yordam kelishiga ishonish kerak emas.', 'score': false},
      {'answerText': 'Baqirish va yordamga chaqirish kerak.', 'score': true},
    ],
  },
  {
    'question':
        'Aholiga xabar berish qaysi aloqa va xabar berish vositalar orqali amalga oshiriladi?',
    'answers': [
      {
        'answerText': 'Simli va simsiz aloqa vositalari orqali.',
        'score': false
      },
      {'answerText': 'Telefon va uyali telefonlar orqali.', 'score': false},
      {'answerText': 'Televideniye va radio kanallari orqali.', 'score': false},
      {
        'answerText':
            'Telefon, radiotelefonlar, televideniye va radiokanallari orqali.',
        'score': true
      },
    ],
  },
  {
    'question':
        'Zilzila vaqtida aholini evakuatsiya qilishni rejalashtirish, tashkil qilish va o\'tkazish kimga yuklatilgan?',
    'answers': [
      {'answerText': 'Tibbiy organlarga.', 'score': false},
      {'answerText': 'Evakuatsiya organlariga', 'score': true},
      {'answerText': 'Mahalla qo\'mitasiga.', 'score': false},
      {'answerText': 'Jamoat tartibini saqlash organlariga', 'score': false},
    ],
  },
  {
    'question':
        'Tabiiy tusdagi favqulodda vaziyatlar qaysi guruhlarga ajratiladi?',
    'answers': [
      {
        'answerText':
            'Geologik xavfli hodisalar, gidrometeorologik xavfli hodisalar, favqulodda epidemiologik, epizootik va epifitotik vaziyatlar.',
        'score': true
      },
      {
        'answerText':
            'Geologik xavfli hodisalar, gidrometeorologik xavfli hodisalar.',
        'score': false
      },
      {
        'answerText':
            'Quruqlik va gidrosfera holatining o\'zgarishi bilan bog\'liq vaziyatlar.',
        'score': false
      },
      {
        'answerText':
            'Gidrometeorologik xavfli hodisalar, gidrosfera holatining o\'zgarishi bilan bog\'liq vaziyatlar.',
        'score': false
      },
    ],
  },
  {
    'question': 'Zilzila sodir bo\'lgan joy qanday nomlanadi?',
    'answers': [
      {'answerText': 'Gipotsentr', 'score': false},
      {'answerText': 'Zilzila o\'chog\'i', 'score': false},
      {'answerText': 'Epitsentr', 'score': false},
      {'answerText': 'to\'g\'ri javoblar A va B', 'score': true},
    ],
  },
  {
    'question': 'Zilzila epitsentri nima?',
    'answers': [
      {
        'answerText': 'Gipotsentrning yer yuzasidagi proyeksiyasi',
        'score': true
      },
      {'answerText': 'Zilzila o\'chog\'i', 'score': false},
      {
        'answerText': 'Epitsentr va gipotsentr orasidagi masofa',
        'score': false
      },
      {'answerText': 'Barcha javoblar to\'g\'ri', 'score': false},
    ],
  },
  {
    'question': 'Zilzilaning chuqurligi nima?',
    'answers': [
      {
        'answerText': 'Gipotsentrning yer yuzasidagi proyeksiyasi',
        'score': false
      },
      {'answerText': 'Zilzila o\'chog\'i', 'score': true},
      {
        'answerText': 'Epitsentr va gipotsentr orasidagi masofa',
        'score': false
      },
      {'answerText': 'Barcha javoblar to\'g\'ri', 'score': false},
    ],
  },
  {
    'question': 'Yer qatlamlarini sanab bering?',
    'answers': [
      {'answerText': 'Qobiq, mantiya va yadro', 'score': true},
      {'answerText': 'Atmosfera, Litosfera', 'score': false},
      {'answerText': 'Gidrosfera, Ionasfera', 'score': false},
      {'answerText': 'Barcha javoblar to\'g\'ri', 'score': false},
    ],
  },
  {
    'question': 'Tabiatda necha turdagi zilzilalar mavjud?',
    'answers': [
      {
        'answerText': 'Uch turdagi: tektonik, vulkanik va o\'pirilma.',
        'score': true
      },
      {'answerText': 'Ikki turdagi: Mobilistik va fiksistik.', 'score': false},
      {'answerText': 'Ikki turdagi: tektonik, vulkanik', 'score': false},
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
  {
    'question': 'Yer sharidagi seysmik kamarlarni sanab bering?',
    'answers': [
      {
        'answerText':
            'Uchta: Tinch okeani, O\'rta yer dengizi-Osiyo, Atlantika okeanining o\'rtasida joylashgan suv osti tog\' tizmalari seysmik kamarlari.',
        'score': true
      },
      {
        'answerText': 'Ikkita: Tinch okeani, O\'rta yer dengizi',
        'score': false
      },
      {'answerText': 'Bitta: Tinch okeani.', 'score': false},
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
  {
    'question':
        'O\'zbekistonda zilzila kuchini o\'lchash shkalalarini sanab bering.',
    'answers': [
      {
        'answerText': 'Rixter, Medvedeyev-Shpanxoyer-Karnik (MSHK-64).',
        'score': true
      },
      {'answerText': 'Mobilistik va fiksistik.', 'score': false},
      {'answerText': 'Tektonik, vulkanik', 'score': false},
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
  {
    'question':
        'Zilzilalar sodir bo\'lish chuqurliklariga ko\'ra qanday turlarga bo\'linadi?',
    'answers': [
      {'answerText': 'Qobiq, qobiq osti, chuqur fokusli.', 'score': true},
      {'answerText': 'tektonik, vulkanik, o\'pirilish.', 'score': false},
      {'answerText': 'Mantiya, chuqur fokusli, qobiq osti.', 'score': false},
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
  {
    'question':
        'Rixter shkalasining o\'lchov birligi qaysi javobda to\'g\'ri ko\'rsatilgan',
    'answers': [
      {'answerText': 'Magnituda', 'score': true},
      {'answerText': 'Ball', 'score': false},
      {'answerText': 'Nyuton', 'score': false},
      {'answerText': 'To\'g\'ri javob B.', 'score': false},
    ],
  },
];
