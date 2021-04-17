class InputPAge extends StatefulWidget {
  @override
  _InputPAgeState createState() => _InputPAgeState();
}

class _InputPAgeState extends State<InputPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Center(
        child: Text("Body Text"),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

