import 'package:chat_flutter/src/base/base_stateless_screen.dart';
import 'package:chat_flutter/src/bloc/bloc_provider.dart';
import 'package:chat_flutter/src/bloc/login_bloc.dart';
import 'package:chat_flutter/src/managers/user_manager.dart';
import 'package:chat_flutter/src/pages/chat_contacts_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseStatelessScreen {
  static final String pageRoute = 'login_page_route';

  @override
  Widget buildAppBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ],
        ),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90, left: 30.0, child: circulo),
        Positioned(top: -40, right: -30, child: circulo),
        Positioned(bottom: -50, right: -10.0, child: circulo)
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Chat App Flutter',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 60.0),
                _buildNameField(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc)
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _buildNameField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidName,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              hintText: 'Roy',
              labelText: 'Name',
              errorText: snapshot.error,
            ),
            onChanged: (value) => bloc.changeName(value),
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidName,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 15.0,
            ),
            child: Text(
              'Ingresar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData
              ? () => _login(context, snapshot.data.toString())
              : null,
        );
      },
    );
  }

  _login(BuildContext context, String userName) {
    UserManager manager = UserManager();
    manager.saveUser(userName);
    Navigator.pushReplacementNamed(context, ChatContactsPage.pageRoute);
  }
}
