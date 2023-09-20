import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: summaryData.map(
              (data) {
                //.map changes list of map to list of rows
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: (data['user_answer'] as String) ==
                                    (data['correct_answer'] as String)
                                ? const Color.fromARGB(255, 150, 198, 241)
                                : const Color.fromARGB(255, 249, 133, 241),
                            shape: BoxShape.circle),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 22, 2, 56)),
                        )),
                    const SizedBox(width: 20),
                    Expanded(
                      // "expanded" taked only the availbe space in the flex widget
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //without expanded widget column takes infinite amount of width even if its beyond screen boundaries
                        children: [
                          Text(
                            data['Question'] as String,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(data['user_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 201, 58, 226))),
                          Text(data['correct_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 25, 115, 189))),
                        ],
                      ),
                    )
                  ]),
                );
              },
            ).toList()),
      ),
    ); //.toList changes iterable to list
  }
}
//we need to use typecasting while working with maps that store different data types
//  Text((data['question_index']as int) --> coverts it into int
//(((data['question_index']as int)+1).toString()) --> coverts the whole thing into string, because "Text" doesnt accept int
//flex is the"row" or "column" widget above you put into expanded