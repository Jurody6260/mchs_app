import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../funcs/mybar.dart';
import 'answer.dart';

class TestPracEn extends StatefulWidget {
  const TestPracEn({Key? key}) : super(key: key);

  @override
  State<TestPracEn> createState() => _TestPracEnState();
}

class _TestPracEnState extends State<TestPracEn> {
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
    "question": "1. Name the geologic hazards that lead to earthquakes:",
    "answers": [
      {"answerText": "А. Earthquake, landslide and mudslide", "score": true},
      {"answerText": "B. Earthquake, landslide and avalanche", "score": false},
      {"answerText": "C. Landslide, avalanche, tsunami", "score": false},
      {"answerText": "D. Earthquake, tsunami, landslide", "score": false},
    ],
  },
  {
    "question": "2. What is an earthquake?",
    "answers": [
      {
        "answerText":
            "A.Fluctuating movements of the earth's surface due to internal movements",
        "score": true
      },
      {
        "answerText": "B. The place where an underground tremor occurred",
        "score": false
      },
      {"answerText": "C. Repeated oscillations", "score": false},
      {"answerText": "D. Natural phenomenon", "score": false},
    ],
  },
  {
    "question":
        "3. What is the name of the science that studies the vibrations of the Earth's crust?",
    "answers": [
      {"answerText": "А. Ethology", "score": false},
      {"answerText": "B. Sociology", "score": false},
      {"answerText": "С. Ecology", "score": false},
      {"answerText": "D. Seismology", "score": true},
    ],
  },
  {
    "question":
        "4. What is the name of an instrument for recording fluctuations in the earth's surface?",
    "answers": [
      {"answerText": "А. Ethnograph", "score": false},
      {"answerText": "B. Seismograph", "score": true},
      {"answerText": "С. Chronograph", "score": false},
      {"answerText": "D. Sociograph", "score": false},
    ],
  },
  {
    "question":
        "5. When was the MSC-64 seismic scale recommended and based on the improvement of which scientists was it developed?",
    "answers": [
      {
        "answerText":
            "А. At a UNESCO meeting in Paris in 1964, S. Medvedev (USSR), W. Sponheuer (Germany), Karnik (Czechoslovakia)",
        "score": true
      },
      {"answerText": "B. Newton I., Lomonosov V.", "score": false},
      {"answerText": "C. K. Abdulabekov, N. Mavlonov", "score": false},
      {"answerText": "D. Kobe, Shidu", "score": false},
    ],
  },
  {
    "question":
        "6. What types are earthquakes divided into according to their origin?",
    "answers": [
      {
        "answerText": "A. Tectonic, volcanic, and landslide earthquakes.",
        "score": true
      },
      {"answerText": "B. Sel, Tsunami", "score": false},
      {"answerText": "C. Mudflows, floods", "score": false},
      {"answerText": "D. Volcanic, mudflow", "score": false},
    ],
  },
  {
    "question":
        "7. Who developed the geophysical model of the earthquake preparation process?",
    "answers": [
      {"answerText": "А. Abdullabekov", "score": true},
      {"answerText": "B. Kari-Niyazi", "score": false},
      {"answerText": "С. Mavlonov", "score": false},
      {"answerText": "D. Ibrahimov Sh.", "score": false},
    ],
  },
  {
    "question": "8. What is the purpose of the seismic zoning map?",
    "answers": [
      {"answerText": "A. To set building standards", "score": true},
      {"answerText": "B. For safety", "score": false},
      {"answerText": "C. For beauty", "score": false},
      {"answerText": "D. For conducting a geography lesson", "score": false},
    ],
  },
  {
    "question":
        "9. When and by whom was the world's first seismoscope created?",
    "answers": [
      {
        "answerText": "A. In 132, by Chinese scientist Zhen Heng",
        "score": true
      },
      {"answerText": "B. K.N. Abdulabekov.", "score": false},
      {"answerText": "С. Mavlonov", "score": false},
      {"answerText": "D.Golitsyn B.", "score": false},
    ],
  },
  {
    "question":
        "10. You are sitting alone in the house, suddenly the chandeliers and windows begin to rattle and the dishes on the shelves begin to fall down.  What are your actions?",
    "answers": [
      {"answerText": "А. Stand in the doorway", "score": true},
      {
        "answerText": "B. Call your relatives about the incident",
        "score": false
      },
      {"answerText": "C. Jump out the window", "score": false},
      {"answerText": "D. Call loudly for help", "score": false},
    ],
  },
  {
    "question":
        "11. Where is the best place to hide inside a building during an earthquake?",
    "answers": [
      {
        "answerText":
            "A. Under a stable table, under beds, near load-bearing interior walls, in the corners of supporting load-bearing walls, in a doorway",
        "score": true
      },
      {
        "answerText": "B. Under the window sill, inside cabinets",
        "score": false
      },
      {
        "answerText": "C. In air shafts, entryways of apartment buildings",
        "score": false
      },
      {"answerText": "D. Elevators and stairs", "score": false},
    ],
  },
  {
    "question":
        "12 What would you do if you were on a city street during an earthquake?",
    "answers": [
      {"answerText": "А. Take no action", "score": false},
      {"answerText": "B. Hide in any building", "score": false},
      {
        "answerText":
            "C. Get away from the houses, find your way to the square and wide streets",
        "score": true
      },
      {
        "answerText":
            "D. Find a way to businesses, factories that have shelter",
        "score": false
      },
    ],
  },
  {
    "question": "13. What is the plan for preparing for an earthquake?",
    "answers": [
      {
        "answerText":
            "А. Before an earthquake, during an earthquake, after an earthquake.",
        "score": true
      },
      {"answerText": "B. Determining evacuation routes", "score": false},
      {"answerText": "C. Marking open spaces", "score": false},
      {"answerText": "D. Preparing backup water.", "score": false},
    ],
  },
  {
    "question":
        "14. Where is the best place to hide inside a building during an earthquake?",
    "answers": [
      {
        "answerText":
            "A. Under a stable table, under beds, near load-bearing interior walls, in the corners of supporting load-bearing walls, in a doorway",
        "score": true
      },
      {
        "answerText": "B. Under the window sill, inside cabinets",
        "score": false
      },
      {
        "answerText": "C. In air shafts, entryways of apartment buildings",
        "score": false
      },
      {"answerText": "D. Elevators and stairs", "score": false},
    ],
  },
  {
    "question": "15. What is an earthquake?",
    "answers": [
      {
        "answerText":
            "A.Fluctuating movements of the earth's surface as a result of its internal movements",
        "score": true
      },
      {
        "answerText": "B. The place where an underground tremor occurred",
        "score": false
      },
      {
        "answerText":
            "C. The movement of rocks down a slope by gravity due to wetting.",
        "score": false
      },
      {"answerText": "D. Correct answer B.", "score": false},
    ],
  },
  {
    "question":
        "16. Where do you begin first aid for a person in critical condition during an earthquake?",
    "answers": [
      {"answerText": "A. With a position on the ground", "score": false},
      {"answerText": "B. With an assessment of the situation", "score": true},
      {"answerText": "C. From fainting.", "score": false},
      {"answerText": "D. From calling an ambulance", "score": false},
    ],
  },
  {
    "question":
        "17. In an earthquake, for how long is a tourniquet applied to stop bleeding in a victim?",
    "answers": [
      {"answerText": "А. 2 hours", "score": false},
      {"answerText": "B. 1.5 hours", "score": false},
      {"answerText": "C. 2 to 2.5 hours", "score": false},
      {"answerText": "D. 1 hour", "score": true},
    ],
  },
  {
    "question": "18. What does the siren signal mean?",
    "answers": [
      {"answerText": "А. \"Attention everyone!\"", "score": true},
      {"answerText": "B. \"Flood!\"", "score": false},
      {"answerText": "C. \"Risk of chemical poisoning!\"", "score": false},
      {"answerText": "D. \"Risk of radiation poisoning!\"", "score": false},
    ],
  },
  {
    "question":
        "19. Who is working to rescue and provide first aid to victims in an earthquake emergency zone?",
    "answers": [
      {
        "answerText":
            "А. Medical personnel and rescuers involved in the emergency area.",
        "score": false
      },
      {"answerText": "B. Medical personnel.", "score": false},
      {"answerText": "C. Rescuers.", "score": false},
      {
        "answerText":
            "D. Medical personnel, rescuers, formations, service workers, students, and the public involved in the emergency area. 20.",
        "score": true
      },
    ],
  },
  {
    "question": "20. What is stress?",
    "answers": [
      {"answerText": "А. A state of being elated.", "score": false},
      {
        "answerText":
            "B. A set of physiological protective reactions that occur in animals and humans in response to various adverse factors (stressors).",
        "score": true
      },
      {
        "answerText": "C. A sense of danger, a state of apprehension.",
        "score": false
      },
      {"answerText": "D. Uncontrollable fear.", "score": false},
    ],
  },
  {
    "question": "21. Which type of emergency refers to geologic hazards?",
    "answers": [
      {"answerText": "A. Earthquake, tsunami, landslides.", "score": false},
      {
        "answerText": "B. Earthquakes, landslides, and avalanches.",
        "score": true
      },
      {"answerText": "C. Landslides, avalanches, rockslides.", "score": false},
      {
        "answerText": "D. Earthquakes, landslides, and rockslides.",
        "score": false
      },
    ],
  },
  {
    "question": "22. When are earthquakes recorded as an emergency?",
    "answers": [
      {"answerText": "A. М=2.", "score": false},
      {"answerText": "B. М=5.", "score": false},
      {"answerText": "C. М≥2.", "score": false},
      {"answerText": "D. М≥5.", "score": true},
    ],
  },
  {
    "question":
        "23. What are some ways to protect people from natural disasters?",
    "answers": [
      {
        "answerText":
            "А. Provide timely and accurate information about disasters.",
        "score": true
      },
      {"answerText": "B. Provide special clothing.", "score": false},
      {"answerText": "C. Procurement of rescue equipment.", "score": false},
      {
        "answerText": "D. No protection from natural disasters.",
        "score": false
      },
    ],
  },
  {
    "question": "24. What is one cause of an earthquake:",
    "answers": [
      {
        "answerText": "A. Interaction of the Earth's crust plates.",
        "score": true
      },
      {"answerText": "B. Wave oscillations in the rocks.", "score": false},
      {
        "answerText":
            "C. Construction of treatment facilities in the zone of tectonic faults.",
        "score": false
      },
      {"answerText": "D. The vagaries of the weather.", "score": false},
    ],
  },
  {
    "question": "25. One of the warning signs of an approaching earthquake:",
    "answers": [
      {
        "answerText":
            "A. Radiation of nearby electrical wires, smell of gas in places not previously observed.",
        "score": true
      },
      {"answerText": "B. A sudden change in the weather.", "score": false},
      {
        "answerText": "C. A short circuit in the electrical system.",
        "score": false
      },
      {"answerText": "D. Ḱ Vibration of the winds.", "score": false},
    ],
  },
  {
    "question":
        "26. What should you do if you are at school during the first tremors of an earthquake?",
    "answers": [
      {"answerText": "A. Classes should be avoided.", "score": false},
      {"answerText": "B. You should run outside.", "score": false},
      {
        "answerText": "C. You should wait for the teacher's instructions.",
        "score": true
      },
      {
        "answerText":
            "D. You must wait for the message that will be broadcast on television.",
        "score": false
      },
    ],
  },
  {
    "question": "27. Do you think there could be aftershocks to an earthquake?",
    "answers": [
      {"answerText": "А. Yes", "score": true},
      {"answerText": "B. No", "score": false},
      {"answerText": "C. I never thought about it.", "score": false},
      {"answerText": "D. I don't know.", "score": false},
    ],
  },
  {
    "question":
        "28. How should you behave if you find yourself under the rubble of a collapsed building?",
    "answers": [
      {
        "answerText": "A. You don't have to do anything personally.",
        "score": false
      },
      {"answerText": "B. Fear should not be conquered.", "score": false},
      {
        "answerText": "C. There is no need to believe that help will come.",
        "score": false
      },
      {
        "answerText": "D. It is necessary to shout and call for help.",
        "score": true
      },
    ],
  },
  {
    "question":
        "29. What means of communication and notification are used to inform the population?",
    "answers": [
      {
        "answerText": "А. Through wired and wireless communications.",
        "score": false
      },
      {
        "answerText": "B. Through telephone and cellular telephones.",
        "score": false
      },
      {
        "answerText": "C. Through television and radio channels.",
        "score": false
      },
      {
        "answerText":
            "D. By telephone, radiotelephone, television and radio channels.",
        "score": true
      },
    ],
  },
  {
    "question":
        "30. Who is responsible for planning, organizing, and conducting evacuations during an earthquake?",
    "answers": [
      {"answerText": "A. medical authorities", "score": false},
      {"answerText": "B. evacuation bodies", "score": true},
      {"answerText": "C. the mahalla committee", "score": false},
      {"answerText": "D. public order protection bodies", "score": false},
    ],
  },
  {
    "question": "31. What groups are natural emergencies divided into?",
    "answers": [
      {
        "answerText":
            "A.Geological hazards, hydrometeorological hazards, epidemiological, epizootic and epiphytotic emergencies.",
        "score": true
      },
      {
        "answerText": "B. Geological hazards, hydrometeorological hazards.",
        "score": false
      },
      {
        "answerText":
            "C. Conditions associated with changes in land and hydrosphere conditions.",
        "score": false
      },
      {
        "answerText":
            "D. Hydrometeorological hazards, changes in the state of the hydrosphere.",
        "score": false
      },
    ],
  },
  {
    "question":
        "32. What is the name of the place where an earthquake occurred?",
    "answers": [
      {"answerText": "А. Hypocenter", "score": true},
      {"answerText": "B. The source of the earthquake", "score": false},
      {"answerText": "C. Epicenter", "score": false},
      {"answerText": "D. Correct answers A and B", "score": false},
    ],
  },
  {
    "question": "33. What is the epicenter of an earthquake?",
    "answers": [
      {
        "answerText":
            "А. The projection of the hypocenter onto the surface of the earth",
        "score": true
      },
      {"answerText": "B. The epicenter of an earthquake", "score": false},
      {
        "answerText": "C. Distance between the epicenter and the hypocenter",
        "score": false
      },
      {"answerText": "D. All answers are correct", "score": false},
    ],
  },
  {
    "question": "34. What is the depth of an earthquake?",
    "answers": [
      {
        "answerText":
            "А. The projection of the hypocenter onto the surface of the earth",
        "score": true
      },
      {"answerText": "B. The origin of the earthquake", "score": false},
      {
        "answerText": "C. Distance between the epicenter and the hypocenter",
        "score": false
      },
      {"answerText": "D. All answers are correct", "score": false},
    ],
  },
  {
    "question": "35. List the layers of the earth",
    "answers": [
      {"answerText": "А. The shell, mantle, and core", "score": true},
      {"answerText": "B. Atmosphere, lithosphere", "score": false},
      {"answerText": "C. Hydrosphere, Ionosphere", "score": false},
      {"answerText": "D. All answers are correct", "score": false},
    ],
  },
  {
    "question": "36. How many types of earthquakes exist in nature?",
    "answers": [
      {
        "answerText": "A. Three types: tectonic, volcanic, and landslide",
        "score": true
      },
      {"answerText": "B. Two types: mobilistic and fixist", "score": false},
      {"answerText": "C. Two types: tectonic, volcanic", "score": false},
      {"answerText": "D. Correct answer B.", "score": false},
    ],
  },
  {
    "question": "37. List the seismic belts on the globe",
    "answers": [
      {
        "answerText":
            "A. Three: Pacific, Mediterranean-Asian, and seismic belts of submarine mountain ranges located in the middle of the Atlantic Ocean",
        "score": true
      },
      {"answerText": "B. Two: Pacific, Mediterranean", "score": false},
      {"answerText": "C. One: Pacific", "score": false},
      {"answerText": "D. Correct answer B.", "score": false},
    ],
  },
  {
    "question":
        "38. List the scales for measuring the strength of earthquakes in Uzbekistan.",
    "answers": [
      {
        "answerText": "А. Richter, Medvedev-Spanheuer-Karnik (MSK-64)",
        "score": true
      },
      {"answerText": "B. Mobilistic and fixistic", "score": false},
      {"answerText": "C. Tectonic, volcanic", "score": false},
      {"answerText": "D. Correct answer B", "score": false},
    ],
  },
  {
    "question":
        "39. What types are earthquakes divided into according to their depth of occurrence?",
    "answers": [
      {"answerText": "А. Rimmed, subsurface, deep-focused", "score": true},
      {"answerText": "B. tectonic, volcanic, landslide", "score": false},
      {"answerText": "C. Mantle, deep focal, subcortical", "score": false},
      {"answerText": "D. Correct answer B.", "score": false},
    ],
  },
  {
    "question":
        "40. Which of the following is the correct unit of measurement for the Richter scale?",
    "answers": [
      {"answerText": "А. Magnitude", "score": true},
      {"answerText": "B. Score", "score": false},
      {"answerText": "C. Newton", "score": false},
      {"answerText": "D. Correct answer B.", "score": false},
    ],
  }
];
