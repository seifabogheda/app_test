import 'package:assignment_test/model.dart';
import 'package:flutter/material.dart';

class FixTabView extends StatelessWidget {
  const FixTabView({Key? key, this.person}) : super(key: key);
 final Person? person;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            for(var i=0;i<5;i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(child: Text('$i',style: const TextStyle(color: Colors.white),)),
                ),
              ),
          ],
        ),
        const Divider(thickness: 5,color: Colors.black,),
        Column(
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text(
                'Counter: ${54}',)),
            ),
            ElevatedButton(
              onPressed: () async {
                // context.read<FixProvider>().increaseCounter();
              },
              child: const Text('Increase Counter'),
            )
          ],
        ),
        const Divider(thickness: 5,color: Colors.black,),
        Text('Ideal weight: ${person?.weight}'),
        ElevatedButton(onPressed: (){
          // person = Person(25,180);
          person?.getIdealWeight();
        }, child: const Text('Calculate weight'))
      ],
    );
  }
}

