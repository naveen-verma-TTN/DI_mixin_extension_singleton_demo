/*
What Are Mixins?
Mixins are a way of reusing a class’s code in multiple class hierarchies.
They provide an elegant way to reuse code from different classes that don’t quite fit into
the same class hierarchy.

Mixin allows dart developers to use methods and properties which are not defined in the same class
– without subclassing or extending the other class.
 */

import 'package:flutter/cupertino.dart';

class Employee {
  void clockIn() {
    // ...
  }
}

// use mixins on your classes via the `with` keyword
class Nurse extends Employee with Medical {}

class Doctor extends Employee with Medical {
  performSurgery() {
    // ...
  }
}

class Bartender extends Employee {}

mixin Medical {
  int takeTemperature() {
    // ...
    return 98;
  }
}

// todo: singleton class

class MySingletonClass {
  static final MySingletonClass _instance = MySingletonClass._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory MySingletonClass() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  MySingletonClass._internal() {
    // initialization logic
  }

  String print() => 'hello';
}

class MyDemo {
  void callBack() {
    debugPrint(MySingletonClass().print());
  }
}

//  print(MySingletonClass().hashCode == MySingletonClass().hashCode);

// Assignments
/**
 * Create three class Animal (canRun), Bird (canFly), Insect (canRun, canFly)
 * having common properties like eat(), sleep(), drink() using mixin
 *
 * Create a singleton class Employee having id, name, age, gender, and print all the details
 * and use extension function to print M: male, F: female, O: Others
 */
