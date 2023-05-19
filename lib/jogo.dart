import 'dart:math';
import 'package:flutter/material.dart';



class Jogo  extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}



class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("../imagens/padrao.png");
  var mensagem = "Escolha uma Opção Abaixo";
  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Opção selecionada: " +escolhaUsuario);
    print("Opção APP: " + escolhaApp);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("../imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("../imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("../imagens/tesoura.png");
        });
        break;
    }
    //resultado
    //vitoria
    if(escolhaUsuario == "tesoura" && escolhaApp == "papel" || escolhaUsuario == "papel" && escolhaApp == "pedra" || escolhaUsuario == "pedra" && escolhaApp == "tesoura" ){
      this.mensagem = "Parabens Você ganhou!";
    //derrota
    }else if (escolhaUsuario == "tesoura" && escolhaApp == "pedra" || escolhaUsuario == "papel" && escolhaApp == "tesoura" || escolhaUsuario == "pedra" && escolhaApp == "papel" ){
      this.mensagem ="Voce perdeu!";
    }else{
      this.mensagem ="Deu Empate!";
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),    
      ),


      body: Column(
        children: [
          //texto - Escolha do App
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          //imagem
          Image(image: this._imagemApp),
          //Image.asset("../imagens/padrao.png"),
          
          

          // GestureDetector(
          //   onTap: (){print("Um clique");},
          //   onDoubleTap: () {print("Dois cliques na Imagem ");},
          //   onLongPress: () {print("Clique longo na Imagem");},
          //   child:Image.asset("../imagens/padrao.png"),
          // ),   



          //texto - Resultado
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          //linha com 3 imagens
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child: Image.asset("../imagens/pedra.png", height: 100),
              ),

              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset("../imagens/papel.png", height: 100),
              ),

              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset("../imagens/tesoura.png", height: 100),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}


