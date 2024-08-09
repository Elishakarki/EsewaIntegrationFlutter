## using  webview:

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

here
In Flutter (and Dart), triple quotes ''' (single quotes) or """ (double quotes) are used to define multi-line string literals. They allow you to write strings that span multiple lines without needing to use newline characters (\n) or concatenate multiple strings together. This is particularly useful for embedding large chunks of text, such as HTML, JSON, or other formatted data, directly into your code.

## Usage :
The triple quotes allow you to embed the entire HTML content as a single string literal without needing to use escape sequences or concatenate multiple strings. This makes the code more readable and easier to manage.

Example Without Triple Quotes (for comparison):
```
const String kNavigationExamplePage = '<!DOCTYPE html>\n'
    '<html>\n'
    '<head>\n'
    '    <title>Navigation Delegate Example</title>\n'
    '</head>\n'
    '<body>\n'
    '<p>\n'
    '    The navigation delegate is set to block navigation to the youtube website.\n'
    '</p>\n'
    '<ul>\n'
    '    <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>\n'
    '    <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>\n'
    '</ul>\n'
    '</body>\n'
    '</html>';
```

LoadRequest method ()

## string_name.split(pattern)
void main() { 
    
  // Creating a string 
  String gfg = "Geeks For Geeks !!"; 
    
  // Splitting the string 
  // across spaces 
  print(gfg.split(" ")); 
}

output:

[Geeks, For, Geeks, !!]
![alt text](image-2.png)

void main() { 
    
  // Creating a string 
  String gfg = "GeeksForGeeks"; 
    
  // Splitting each 
  // character of the string 
  print(gfg.split("")); 
}

output:
[G,e,e,k,s,F,o,r,G,e,e,k,s ]
// Main function 
void main() { 
  // Creating a string 
  String gfg = "Geeks1For2Geeks3is4the5best6computer7science8website."; 
    
  // Splitting each character 
  // of the string 
  print(gfg.split(new RegExp(r"[0-9]"))); 
}

output:
[Geeks, For, Geeks, is , the , best, computer , science, website.]

 now in my coding :
 cookies:""_gid=GA1.2.469067392.1723013614; _ga=GA1.1.1454020836.1723013614; _ga_04YGWK0175=GS1.1.1723030537.3.0.1723030717.0.0.0""
 result = cookies.split(",");
 print(result);

 output:["_gid=GA1.2.469067392.1723013614,  _ga=GA1.1.1454020836.1723013614,  _ga_04YGWK0175=GS1.1.1723030537.3.0.1723030717.0.0.0"]

  constructor : super, this , 


class Person {
  final String name;
  final int age;

  // Base class constructor
  Person(this.name, this.age) {
    print('Person constructor: $name, $age');
  }
}

// Derived class that extends Person
class Employee extends Person {
  final String jobTitle;

  // Default constructor for Employee
  Employee(String name, int age, this.jobTitle) : super(name, age) {
    print('Employee constructor: $jobTitle');
  }

  // Named constructor for Employee
  Employee.withDefaultJob(String name, int age)
      : this(name, age, 'Flutter expert'); 

}
void main() {
  // Create an instance of Person
  Person person = Person('Alice', 30);
  
  // Create an instance of Employee using the default constructor
  Employee employee1 = Employee('Bob', 40, 'Developer');

  // Create an instance of Employee using the named constructor
  Employee employee2 = Employee.withDefaultJob('Charlie', 25);
}


encoding