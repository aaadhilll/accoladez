import 'package:accolades/source/applications/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDateScreen extends StatelessWidget {
  WeatherDateScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Weather details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter password';
              //   }
              //   return null;
              // },
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                label: Padding(
                  padding: EdgeInsets.only(left: 11),
                  child: BlkTest(test: 'Enter name of the city'),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15),
                //   borderSide: const BorderSide(
                //     width: 1,
                //     color: Colors.black,
                //   ), //<-- SEE HERE
                // ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: BlkTest(test: 'Back')),
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.height / 5,
                            MediaQuery.of(context).size.width / 9),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<WeatherBloc>()
                          .add(WeatherDetialsEvent(cityName: _controller.text));
                    },
                    child: BlkTest(
                      test: 'Search',
                    )),
              ],
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is Initial) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10),
                    child: CircularProgressIndicator(),
                  ));
                }
                if (state is ErrorDataState) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text(state.models)),
                  );
                }
                if (state is WeateherDataState) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 8),
                      child: Column(
                        children: [
                          Text17(test: "City : ${state.model.name}"),
                          Text17(test: "Temp : ${state.model.main.temp} K"),
                          Text17(
                              test:
                                  "Description : ${state.model.weather[0].description}"),
                          Text17(
                            test:
                                "Humidity : ${state.model.main.humidity.toString()} %",
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BlkTest extends StatelessWidget {
  const BlkTest({super.key, required this.test});
  final String test;

  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style: TextStyle(color: Colors.black),
    );
  }
}

class Text17 extends StatelessWidget {
  const Text17({super.key, required this.test});
  final String test;

  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style: TextStyle(fontSize: 17),
    );
  }
}
