abstract class Person {
  num age;
  num height;
  num? weight;
  Person(this.age,this.height,this.weight);

  num getIdealWeight(
      /*
      if male weight = height / age * 10
      if female weight = height / age * 9
       */
      );

}
