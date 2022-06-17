import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../funcs/mybar.dart';
import 'answer.dart';

class TestPracRu extends StatefulWidget {
  const TestPracRu({Key? key}) : super(key: key);

  @override
  State<TestPracRu> createState() => _TestPracRuState();
}

class _TestPracRuState extends State<TestPracRu> {
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
      appBar: myBar(),
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
                            SnackBar(content: Text(AppLocalizations.of(context)!.test_didnt_answer)));
                        return;
                      }
                      nextQuestion();
                    },
                    child: Text(
                      endOfTest ? AppLocalizations.of(context)!.test_submit : AppLocalizations.of(context)!.test_next_answer,
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
                              ? AppLocalizations.of(context)!.test_correct_answer
                              : AppLocalizations.of(context)!.test_incorrect_answer,
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
    "question":
        "1. Назовите геологические опасности, приводящие к возникновению ЧС:",
    "answers": [
      {"answerText": "А. Землетрясение, оползень и сели", "score": true},
      {
        "answerText": "B. Землетрясение, оползень и снежная лавина",
        "score": false
      },
      {"answerText": "C. Оползень, снежная лавина, цунами", "score": false},
      {"answerText": "D. Землетрясение, цунами, оползень", "score": false},
    ],
  },
  {
    "question": "2. Что такое землетрясение?",
    "answers": [
      {
        "answerText":
            "A.Колебательные движения земной поверхности в результате ее внутренних движений",
        "score": true
      },
      {
        "answerText": "B. Место, где произошел подземный толчок",
        "score": false
      },
      {"answerText": "C. Повторяющиеся колебания", "score": false},
      {"answerText": "D. Природное явление", "score": false},
    ],
  },
  {
    "question": "3. Как называется наука, изучающая колебания земной коры?",
    "answers": [
      {"answerText": "А. Этология", "score": false},
      {"answerText": "B. Социология", "score": false},
      {"answerText": "С. Экология", "score": false},
      {"answerText": "D. Сейсмология", "score": true},
    ],
  },
  {
    "question":
        "4. Как называется прибор для регистрации колебаний земной поверхности?",
    "answers": [
      {"answerText": "А. Этнограф", "score": false},
      {"answerText": "B. Сейсмограф", "score": true},
      {"answerText": "С. Хронограф", "score": false},
      {"answerText": "D. Социограф", "score": false},
    ],
  },
  {
    "question":
        "5. Когда была рекомендована сейсмическая шкала МСК-64 и на основе совершенствования каких ученых она была разработана?",
    "answers": [
      {
        "answerText":
            "А. На собрании ЮНЕСКО в Париже в 1964 г., С. Медведев (СССР), В. Шпонхойер (Германия), Карник (Чехословакия)",
        "score": true
      },
      {"answerText": "B. Ньютон И., Ломоносов В.", "score": false},
      {"answerText": "C. Абдулабеков К., Мавлонов Н.", "score": false},
      {"answerText": "D. Кобе, Шиду", "score": false},
    ],
  },
  {
    "question": "6. На какие виды по происхождению делятся землетрясения?",
    "answers": [
      {
        "answerText": "A. Тектонические, вулканические и обвальные",
        "score": true
      },
      {"answerText": "B. Сель, Цунами", "score": false},
      {"answerText": "C. Сель, наводнение", "score": false},
      {"answerText": "D. Вулканические, сель", "score": false},
    ],
  },
  {
    "question":
        "7. Кем разработана геофизическая модель процесса подготовки землетрясений?",
    "answers": [
      {"answerText": "А. Абдуллабеков", "score": true},
      {"answerText": "B. Кари-Ниязий", "score": false},
      {"answerText": "С. Мавлонов", "score": false},
      {"answerText": "D. Ибрагимов Ш.", "score": false},
    ],
  },
  {
    "question": "8. Какова цель создания карты сейсмического районирования?",
    "answers": [
      {
        "answerText": "A. Для установки стандартов строительства",
        "score": true
      },
      {"answerText": "B. Для безопасности", "score": false},
      {"answerText": "C. Для красоты", "score": false},
      {"answerText": "D. Для ведения урока географии", "score": false},
    ],
  },
  {
    "question": "9. Когда и кем был создан первый в мире сейсмоскоп?",
    "answers": [
      {
        "answerText": "A. В 132 году китайским ученым Чжэнь Хен",
        "score": true
      },
      {"answerText": "B. Абдулабеков К.Н.", "score": false},
      {"answerText": "С. Мавлонов", "score": false},
      {"answerText": "D.Голицын Б.", "score": false},
    ],
  },
  {
    "question":
        "10. Вы сидите один в доме, вдруг люстры и окна начали дребезжать, а посуда на полках начинает падать вниз.  Ваши действия?",
    "answers": [
      {"answerText": "А. Встанете в дверном проёме", "score": true},
      {
        "answerText": "B. Позвоните своим родственникам о происшествии",
        "score": false
      },
      {"answerText": "C. Спрыгните из окна", "score": false},
      {"answerText": "D. Громко будете звать на помощь", "score": false},
    ],
  },
  {
    "question":
        "11. Где лучше всего спрятаться внутри здания во время землетрясения?",
    "answers": [
      {
        "answerText":
            "A. Под устойчиво установленным столом, под кроватями, около несущих внутренних стен, в углах опорных несущих стен, в дверном проёме",
        "score": true
      },
      {"answerText": "B. Под подоконником, внутри шкафов", "score": false},
      {
        "answerText":
            "C. В вентиляционных шахтах, подъездах многоквартирных домов",
        "score": false
      },
      {"answerText": "D. Лифты и лестницы", "score": false},
    ],
  },
  {
    "question":
        "12. Что бы вы сделали, если бы оказались на городской улице во время землетрясения?",
    "answers": [
      {"answerText": "А. Не нужно никаких действий", "score": false},
      {"answerText": "B. Спрятаться в любом здании", "score": false},
      {
        "answerText":
            "C. Уйти подальше от домов, найти путь к площади и широким улицам",
        "score": true
      },
      {
        "answerText": "D. Найти путь к предприятиям, заводам, имеющим убежище",
        "score": false
      },
    ],
  },
  {
    "question": "13. Какой составляют план подготовки к землетрясению?",
    "answers": [
      {
        "answerText":
            "А. Перед землетрясением, во время землетрясения, после землетрясения.",
        "score": true
      },
      {"answerText": "B. Определение путей эвакуации", "score": false},
      {"answerText": "C. Обозначение открытых пространств", "score": false},
      {"answerText": "D. Подготовка резервной воды.", "score": false},
    ],
  },
  {
    "question":
        "14. Где лучше всего спрятаться внутри здания во время землетрясения?",
    "answers": [
      {
        "answerText":
            "A. Под устойчиво установленным столом, под кроватями, около несущих внутренних стен, в углах опорных несущих стен, в дверном проёме",
        "score": true
      },
      {"answerText": "B. Под подоконником, внутри шкафов", "score": false},
      {
        "answerText":
            "C. В вентиляционных шахтах, подъездах многоквартирных домов",
        "score": false
      },
      {"answerText": "D. Лифты и лестницы", "score": false},
    ],
  },
  {
    "question": "15. Что такое землетрясение?",
    "answers": [
      {
        "answerText":
            "A.Колебательные движения земной поверхности в результате ее внутренних движений",
        "score": true
      },
      {
        "answerText": "B. Место, где произошел подземный толчок",
        "score": false
      },
      {
        "answerText":
            "C. Смещение горных пород вниз по склону под действием силы тяжести из-за намокания.",
        "score": false
      },
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
  {
    "question":
        "16. С чего начать оказание первой помощи человеку в критическом состоянии при землетрясении?",
    "answers": [
      {"answerText": "A. С положения на землю", "score": false},
      {"answerText": "B. С оценки ситуации", "score": true},
      {"answerText": "C. При обмороке", "score": false},
      {"answerText": "D. С вызова скорой помощи", "score": false},
    ],
  },
  {
    "question":
        "17. На какое время при землетрясении накладывается жгут для остановки кровотечения у пострадавшего?",
    "answers": [
      {"answerText": "А. 2 часа", "score": false},
      {"answerText": "B. 1,5 часа", "score": false},
      {"answerText": "C. от 2 до 2,5 часов", "score": false},
      {"answerText": "D. 1 час", "score": true},
    ],
  },
  {
    "question": "18. Что означает сигнал сирены?",
    "answers": [
      {"answerText": "А. «Внимание всем!»", "score": true},
      {"answerText": "B. «Наводнение!»", "score": false},
      {"answerText": "C. «Риск химического отравления!»", "score": false},
      {"answerText": "D. «Риск радиационного отравления!»", "score": false},
    ],
  },
  {
    "question":
        "19. Кем проводится работа по спасению пострадавших и оказанию им первой медицинской помощи в зоне чрезвычайной ситуации, связанной с землетрясением?",
    "answers": [
      {
        "answerText":
            "А. Медицинским персоналом и спасателями, задействованными в зоне ЧС.",
        "score": false
      },
      {"answerText": "B. Медицинским персоналом.", "score": false},
      {"answerText": "C. Спасателями.", "score": false},
      {
        "answerText":
            "D. Медицинским персоналом, спасателями, формированиями, рабочими-служащими, студентами и населением, привлекаемыми в район ЧС.",
        "score": true
      },
    ],
  },
  {
    "question": "20. Что такое стресс?",
    "answers": [
      {
        "answerText": "А. Состояние, приводящее человека в восторг.",
        "score": false
      },
      {
        "answerText":
            "B. Совокупность физиологических защитных реакций, протекающих в организме животного и человека в ответ на воздействие различных неблагоприятных факторов (стрессоров).",
        "score": true
      },
      {
        "answerText": "C. Чувство опасности, состояние опасения.",
        "score": false
      },
      {"answerText": "D. Неконтролируемый страх.", "score": false},
    ],
  },
  {
    "question":
        "21. Чрезвычайные ситуации какого типа относятся к геологическим опасностям?",
    "answers": [
      {"answerText": "A. Землетрясение, цунами, оползни.", "score": false},
      {
        "answerText": "B. Землетрясения, оползни и снежные лавины.",
        "score": true
      },
      {
        "answerText": "C. Оползни, снежные лавины, горные обвалы.",
        "score": false
      },
      {
        "answerText": "D. Землетрясения, оползни и горные обвалы.",
        "score": false
      },
    ],
  },
  {
    "question":
        "22. Когда землетрясения регистрируется как чрезвычайная ситуация?",
    "answers": [
      {"answerText": "A. М=2.", "score": false},
      {"answerText": "B. М=5.", "score": false},
      {"answerText": "C. М≥2.", "score": false},
      {"answerText": "D. М≥5.", "score": true},
    ],
  },
  {
    "question":
        "23. Какие существуют способы защиты людей от стихийных бедствий?",
    "answers": [
      {
        "answerText":
            "А. Предоставлять своевременную и достоверную информацию о стихийных бедствиях.",
        "score": true
      },
      {"answerText": "B. Предоставление специальной одежды.", "score": false},
      {"answerText": "C. Закупка спасательного оборудования.", "score": false},
      {"answerText": "D. Нет защиты от стихийных бедствий.", "score": false},
    ],
  },
  {
    "question": "24. Что является одной из причин землетрясения:",
    "answers": [
      {"answerText": "A. Взаимодействие плит земной коры.", "score": true},
      {"answerText": "B. Волновые колебания в горных породах.", "score": false},
      {
        "answerText":
            "C. Строительство очистных сооружений в зоне тектонических разломов.",
        "score": false
      },
      {"answerText": "D. Капризы погоды.", "score": false},
    ],
  },
  {
    "question":
        "25. Один из предупредительных признаков приближающегося землетрясения:",
    "answers": [
      {
        "answerText":
            "A. Излучение близлежащих электрических проводов, ощущение запаха газа в местах, которые ранее не наблюдались.",
        "score": true
      },
      {"answerText": "B. Резкая смена погоды.", "score": false},
      {"answerText": "C. Короткое замыкание в электросети.", "score": false},
      {"answerText": "D. Ḱ вибрация ветров.", "score": false},
    ],
  },
  {
    "question":
        "26. Что делать, если вы находитесь в школе во время первых толчков землетрясения?",
    "answers": [
      {"answerText": "A. Следует избегать занятий", "score": false},
      {"answerText": "B. Нужно убежать на улицу", "score": false},
      {"answerText": "C. Нужно дождаться указаний учителя", "score": true},
      {
        "answerText":
            "D. Необходимо дождаться сообщения, которое будет передано по телевидению.",
        "score": false
      },
    ],
  },
  {
    "question":
        "27. Как вы думаете, могут ли произойти повторные толчки после первых толчков при землетрясении?",
    "answers": [
      {"answerText": "А. Да", "score": true},
      {"answerText": "B. Нет", "score": false},
      {"answerText": "C. Я никогда не думал об этом.", "score": false},
      {"answerText": "D. Не знаю", "score": false},
    ],
  },
  {
    "question":
        "28. Как вести себя, если вы оказались под обломками разрушенного здания?",
    "answers": [
      {"answerText": "A. Лично что-то делать не надо.", "score": false},
      {"answerText": "B. Страх не должен быть побежден.", "score": false},
      {"answerText": "C. Не нужно верить, что помощь придет.", "score": false},
      {"answerText": "D. Нужно кричать и звать на помощь.", "score": true},
    ],
  },
  {
    "question":
        "29. Какие средства связи и оповещения используются для информирования населения?",
    "answers": [
      {
        "answerText": "А. Через проводные и беспроводные средства связи.",
        "score": false
      },
      {"answerText": "B. По телефону и сотовым телефонам.", "score": false},
      {"answerText": "C. По каналам телевидения и радио.", "score": false},
      {
        "answerText": "D. По телефону, радиотелефону, теле- и радиоканалам.",
        "score": true
      },
    ],
  },
  {
    "question":
        "30. На кого возлагается планирование, организация и проведение эвакуации населения при землетрясении?",
    "answers": [
      {"answerText": "A. на медицинские органы", "score": false},
      {"answerText": "B. на органы эвакуации", "score": true},
      {"answerText": "C. на махаллинский комитет", "score": false},
      {
        "answerText": "D. на органы охраны общественного порядка",
        "score": false
      },
    ],
  },
  {
    "question":
        "31. Какие бывают группы подразделяются чрезвычайные ситуации природного характера?",
    "answers": [
      {
        "answerText":
            "А.Геологические опасности, гидрометеорологические опасности, чрезвычайные эпидемиологические, эпизоотические и эпифитотические ситуации.",
        "score": true
      },
      {
        "answerText":
            "B. Геологические опасности, гидрометеорологические опасности.",
        "score": false
      },
      {
        "answerText":
            "C. Условия, связанные с изменением состояния суши и гидросферы.",
        "score": false
      },
      {
        "answerText":
            "D. Гидрометеорологические опасности, изменения состояния гидросферы.",
        "score": false
      },
    ],
  },
  {
    "question": "32. Как называется место, где произошло землетрясение?",
    "answers": [
      {"answerText": "А. Гипоцентр", "score": false},
      {"answerText": "B. Очаг землетрясения", "score": false},
      {"answerText": "C. Эпицентр", "score": true},
      {"answerText": "D. Правильные ответы A и B", "score": false},
    ],
  },
  {
    "question": "33. Что такое эпицентр землетрясения?",
    "answers": [
      {
        "answerText": "А. Проекция гипоцентра на поверхность земли",
        "score": true
      },
      {"answerText": "B. Эпицентр землетрясения", "score": false},
      {
        "answerText": "C. Расстояние между эпицентром и гипоцентром",
        "score": false
      },
      {"answerText": "D. Все ответы правильные", "score": false},
    ],
  },
  {
    "question": "34. Что такое глубина землетрясения?",
    "answers": [
      {
        "answerText": "А. Проекция гипоцентра на поверхность земли",
        "score": true
      },
      {"answerText": "B. Очаг землетрясения", "score": false},
      {
        "answerText": "C. Расстояние между эпицентром и гипоцентром",
        "score": false
      },
      {"answerText": "D. Все ответы правильные", "score": false},
    ],
  },
  {
    "question": "35. Перечислите слои земли",
    "answers": [
      {"answerText": "А. Оболочка, мантия и ядро", "score": true},
      {"answerText": "B. Атмосфера, литосфера", "score": false},
      {"answerText": "C. Гидросфера, Ионосфера", "score": false},
      {"answerText": "D. Все ответы правильные", "score": false},
    ],
  },
  {
    "question": "36. Сколько видов землетрясений существует в природе?",
    "answers": [
      {
        "answerText": "A. Три типа: тектонические, вулканические и обвальные",
        "score": true
      },
      {
        "answerText": "B. Два типа: мобилистический и фиксистический",
        "score": false
      },
      {
        "answerText": "C. Два типа: тектонические, вулканические",
        "score": false
      },
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
  {
    "question": "37. Перечислите сейсмические пояса на земном шаре",
    "answers": [
      {
        "answerText":
            "A. Три: Тихоокеанский, Средиземноморско-Азиатский, сейсмические пояса подводных горных хребтов, расположенных в середине Атлантического океана",
        "score": true
      },
      {
        "answerText": "B. Два: Тихоокеанский, Средиземноморский",
        "score": false
      },
      {"answerText": "C. Один: Тихоокеанский", "score": false},
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
  {
    "question":
        "38. Перечислите шкалы измерения силы землетрясений в Узбекистане.",
    "answers": [
      {
        "answerText": "А. Рихтер, Медведев-Шпанхойер-Карник (МШК-64)",
        "score": true
      },
      {"answerText": "B. Мобилистический и фиксистический", "score": false},
      {"answerText": "C. Тектонический, вулканический", "score": false},
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
  {
    "question":
        "39. На какие типы подразделяются землетрясения по глубине их возникновения?",
    "answers": [
      {
        "answerText": "А. Оболочковые, подоболочковые, глубоко фокусные",
        "score": true
      },
      {
        "answerText": "B. тектонические, вулканические, обвальные",
        "score": false
      },
      {
        "answerText": "C. Мантийные, глубокоочаговый, подкорковый",
        "score": false
      },
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
  {
    "question":
        "40. Что из следующего является правильной единицей измерения для шкалы Рихтера?",
    "answers": [
      {"answerText": "А. Магнитуда", "score": true},
      {"answerText": "B. Балл", "score": false},
      {"answerText": "C. Ньютон", "score": false},
      {"answerText": "D. Правильный ответ В", "score": false},
    ],
  },
];
