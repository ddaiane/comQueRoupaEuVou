   /**
    * 
    * javascript da aplicação web disponível no repositório https://github.com/ddaiane/comQueRoupaEuVou
    * autora: Daiane Marcon

    * Licensed under a Creative Commons Attribution-NonCommercial 3.0 license
    * https://creativecommons.org/licenses/by-nc/3.0/
    * you can do whatever you want with this code, except make money
    * 
    */

   
   // Global XMLHttpRequest
   var xmlHttp;
   var json; //json disponivel para todas funções

   var counter = 0; //contador para quantidade de cards


   /*
    **************** funções de interação com php e banco de dados ******
    */
   //inserir nova entrada no banco de dados
   function fnCreate() {
     var tipo = getCampos("tipo");
     var salto = getRadio("salto");
     var cor = getCores();
     var clima = getRadio("clima");
     var lavar = getRadio("lavar");
     var manutencao = getRadio("manutencao");
     var imagem = getCampos("imagemCadastro");
     var disponivel = "true";
     if (lavar == "true" || manutencao == "true") {
       disponivel = "false";
     }
     var url = "server.php?op=create&&tipo=" + tipo + "&&salto=" + salto + "&&cor=" + cor + "&&imagem=" + imagem + "&&clima=" + clima +
       "&&lavar=" + lavar + "&&manutencao=" + manutencao + "&&disponivel=" + disponivel;
     xmlHttp.onreadystatechange = createCallback;
     xmlHttp.open("GET", url, false);
     xmlHttp.send();
   }
   //se resposta true do php, fecha modal de cadastro e apresenta msg de sucesso, se resposta false, avisa que deu erro
   function createCallback() {
     if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
       var sucesso = parseInt(xmlHttp.responseText);
       console.log(xmlHttp.responseText);
       if (sucesso == 1) {
         alert("Peça cadastrada com sucesso!");
         jQuery('#staticBackdrop').modal('hide');
         padrao();
       } else {
         alert("Erro na conexão com o servidor!")
       }
     }
   }



   //puxa json completo
   function fnRead() {
     xmlHttp = new XMLHttpRequest();
     xmlHttp.onreadystatechange = readCallback;
     xmlHttp.open("GET", "server.php?op=read", false);
     xmlHttp.send();
   }

   function readCallback() {
     if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
       json = JSON.parse(xmlHttp.responseText);
       if (counter == 0) { //se tela tiver sem peças, gera cards pra exibir as peças
         clonaCard();
       }
     }
   }


   /*
   Atualiza situação da disponibilidade e variaveis de manutencao e lavagem
   */
   function fnUpdate(id) {
     let idDisponibilidade = "disponibilidade-" + id;
     let idLavar = "lavar-" + id;
     let idManutencao = "manutencao-" + id;
     let lavar;
     let manutencao;
     let disponivel;
     if (document.getElementById(idLavar).checked) {
       lavar = 1;
     } else {
       lavar = 0;
     }
     if (document.getElementById(idManutencao).checked) {
       manutencao = 1;
     } else {
       manutencao = 0;
     }
     if (lavar == 1 || manutencao == 1) {
       disponivel = 0;
     } else {
       disponivel = 1;
     }

     var url =
       "server.php?op=update&id=" +
       id +
       "&lavar=" +
       lavar +
       "&manutencao=" +
       manutencao +
       "&disponivel=" +
       disponivel;

     xmlHttp.onreadystatechange = updateCallback;
     xmlHttp.open("GET", url, false);
     xmlHttp.send();
   }

   function updateCallback() {
     if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
       fnRead();
     }
   } //depois do update atualiza json para ficar disponivel a nova versão



   /*
   Deleta uma entrada no banco de dados
   */
   function fnDelete(id) {
     xmlHttp.onreadystatechange = deleteCallback;
     xmlHttp.open("GET", "server.php?op=delete&&id=" + id, true);
     xmlHttp.send();
   }

   function deleteCallback() { //apaga o card da tela após deletar do bd
     if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
       let id = parseInt(xmlHttp.responseText);
       let element = "card-" + id;
       document.getElementById(element).remove();
       console.log(element);
     }
   }


   /*
   Pesquisa no banco de dados a partir do nome de uma coluna e um valor desejado que devem ser passados nos parametros
   */
   function fnSearch(tag, busca) {
     xmlHttp.onreadystatechange = searchCallback;
     xmlHttp.open("GET", "server.php?op=search&&tag=" + tag + "&busca=" + busca, false);
     xmlHttp.send();
     return json; //retorna o json da busca para a função que chamou a busca
   }

   function searchCallback() {
     if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
       // retorna o json da busca
       json = JSON.parse(xmlHttp.responseText);
       return json;
     }

   }





   /*
    **************** funções de interatividade da página ******
    */

   //mostra input salto sapato apenas quando sapato é selecionado no cadastro
   function mostraSapato(obj) {
     var menu = obj;
     var selecionado = menu.value;
     var salto = document.getElementById("salto");

     if (selecionado === 'sapato') {
       salto.setAttribute("style", "display: block");
     } else {
       salto.setAttribute("style", "display: none");
     }
   }


   //conferir quantas cores tão marcadas no cadastro e colocar em array
   function getCores() {
     var coresSelecionadas = [];
     var cores = document.getElementsByName("cor");
     for (var cor of cores) {
       if (cor.checked) {
         coresSelecionadas.push(cor.value);
       }
     }
     return coresSelecionadas;
   }

   //pega valores dos campos do cadastro
   function getCampos(categoria) {
     var value = document.getElementById(categoria).value;
     return value;
   }

   //pega valor dos botao radio do cadastro
   function getRadio(categoria) {
     var form = document.getElementById("cadastro");
     return form.elements[categoria].value;
   }


   //valida campos non null do cadastro antes de mandar para fnCreate()
   function valida() {
     var corMarcada = $('section.checkbox-group.required :checkbox:checked').length > 0;
     var imagem = document.getElementById("imagemCadastro").value;
     if (imagem != "" && corMarcada) {
       fnCreate();
     } else {
       alert("Selecione pelo menos uma cor e informe uma imagem, por favor.");
     }
   }



   //gera cards da tela principal
   function clonaCard() {
     let cardOriginal = document.getElementById("cardModelo");
     let mother = document.getElementById("caixa");
     let card;

     for (i = 0; i < 7; i++) {
       if (counter > json.length) {
         break;
       }
       let clima;
       if (json[counter].clima == "verao") {
         clima = "Verão";
       } else if (json[counter].clima == "meiaEstacao") {
         clima = "Meia Estação";
       } else if (json[counter].clima == "inverno") {
         clima = "Inverno";
       }

       let disponbilidade;
       if (json[counter].manutencao == "1" || json[counter].lavar == "1") {
         disponbilidade = "Peça indisponível";
       } else if (json[counter].manutencao == "0" && json[counter].lavar == "0") {
         disponbilidade = "Peça disponível";
       }

       if (counter >= json.length) {
         fim();
         break;
       }

       //clona o card
       card = cardOriginal.cloneNode(true);

       mother.appendChild(card)

       card.setAttribute("class", "cardGerado");
       card.querySelector("img").setAttribute("src", json[counter].imagem); //seta imagem

       let titulo = capitalize(json[counter].tipo);
       if (json[counter].salto == "1") {
         titulo += " com salto";
       }
       titulo += " de " + clima + " id: #" + json[counter].id;
       card.querySelector("h3").innerText = titulo; //seta titulo principal
       card.querySelector("span").innerText = disponbilidade; //seta subtitulo

       let idSubtitulo = "disponibilidade-" + json[counter].id;
       card.querySelector("span").setAttribute("id", idSubtitulo);

       let idCard = "card-" + json[counter].id;
       card.setAttribute("id", idCard);

       if (json[counter].lavar === "1") {
         card.querySelector(".switchLavar").checked = true;
       } else {
         card.querySelector(".switchLavar").checked = false;
       }
       if (json[counter].manutencao === "1") {
         card.querySelector(".switchManutencao").checked = true;
       } else {
         card.querySelector(".switchManutencao").checked = false;
       }
       let idLavar = "lavar-" + json[counter].id;
       let idManut = "manutencao-" + json[counter].id;
       let idDeleta = "deleta-" + json[counter].id;
       card.querySelector(".switchLavar").setAttribute("id", idLavar);
       card.querySelector(".switchManutencao").setAttribute("id", idManut);
       card.querySelector(".botaoDeleta").setAttribute("id", idDeleta);

       card.setAttribute("style", "display: block;");
       counter++;
     }
   }

   //função pra mostrar resultados de filtragens
   function filtra(tag, busca) {
     fnSearch(tag, busca); //busca no banco e atualiza json

     //remove todos cards do json anterior
     var lista = document.getElementsByClassName("cardGerado");
     for (var i = lista.length - 1; i >= 0; i--) {
       lista[i].remove()
     }
     counter = 0; //zera contador ja que os cards foram apagados

     clonaCard();
   }

   //função pra retornar a exibição padrão
   function padrao() {
     fnRead();
     //remove todos cards do json anterior
     var lista = document.getElementsByClassName("cardGerado");
     for (var i = lista.length - 1; i >= 0; i--) {
       lista[i].remove()
     }
     counter = 0; //zera contador ja que os cards foram apagados
     clonaCard();
   }


   //muda dinamicamente entre disponivel e indisponivel no status de cada card quando clica na chave para lavar ou arrumar 
   function mudaDisponibilidade(input) {
     let idNum = input.id; //id do elemento html
     idNum = idNum.split("-");
     let id = idNum[1]
     let idDisponibilidade = "disponibilidade-" + id;
     let localizaçãoJson;

     fnUpdate(id);

     for (i = 0; i <= json.length; i++) {
       if (json[i].id == id) {
         localizaçãoJson = i;
         break;
       }
     }
     if (json[localizaçãoJson].lavar == 0 && json[localizaçãoJson].manutencao == 0) {
       document.getElementById(idDisponibilidade).innerHTML = "Peça disponível";
     } else if (json[localizaçãoJson].lavar == 1 || json[localizaçãoJson].manutencao == 1) {
       document.getElementById(idDisponibilidade).innerHTML = "Peça indisponível";
     }

   }


   //deleta peça do banco de dados e remove imediatamente da exibição quando clica no botão deletar em cada card 
   function deletaPeca(input) {
     let idNum = input.id; //id do elemento html
     idNum = idNum.split("-");
     let id = idNum[1]

     fnDelete(id);

     let element = "card-" + id;
     document.getElementById(element).remove();
   }


   //scroll infinito
   window.onscroll = function () {
     if ((window.innerHeight + window.scrollY) > (document.body.offsetHeight) - 8) {
       clonaCard();
     }
   }

   //primeira letra em maiuscula
   function capitalize(str) {
     if (typeof str !== 'string') {
       return '';
     }
     return str.charAt(0).toUpperCase() + str.substr(1);
   }


   //numero random para a sugestao de looks
   function randomNum(min, max) {
     min = Math.ceil(min);
     max = Math.floor(max);
     return Math.floor(Math.random() * (max - min)) + min;
   }



   //sugestao de roupa a partir de um clima
   function sugere(climaDesejado) {
     //remove todos cards do json anterior
     var lista = document.getElementsByClassName("cardGerado");
     for (var i = lista.length - 1; i >= 0; i--) {
       lista[i].remove()
     }

     let arrSugest = []; //cria array pras peças escolhidas
     let peca1 = null;

     let jsonSugestao = fnSearch("clima", climaDesejado);

     do {
       var random = randomNum(0, jsonSugestao.length);
       if (jsonSugestao[random].tipo != "sapato" && jsonSugestao[random].disponivel == 1) {
         peca1 = jsonSugestao[random];
         arrSugest.push(peca1);
       } // arranja uma primeira peça aleatoria q nao é sapato
     } while (peca1 == null); //ate achar uma peca1


     //arranja um sapato do mesmo clima
     let jsonPeca2 = fnSearch("tipo", "sapato");
     let peca2 = null;
     do {
       var random = randomNum(0, jsonPeca2.length);
       if (jsonPeca2[random].clima == climaDesejado && jsonPeca2[random].disponivel == 1) {
         peca2 = jsonPeca2[random];
         arrSugest.push(peca2);
       }
     } while (peca2 == null);



     //arranja uma camiseta, blusa ou moletom
     let peca3 = null;
     if (peca1.tipo == "calca" || peca1.tipo == "short" || peca1.tipo == "saia") {

       do {
         let top;


         if (climaDesejado == "verao") {
           var escolhaNum = randomNum(0, 1);
           if (escolhaNum == 0) {
             top = "blusa";
           }
           if (escolhaNum == 1) {
             top = "camiseta";
           }
         } else {
           var escolhaNum = randomNum(0, 1);
           if (escolhaNum == 0) {
             top = "blusa";
           }
           if (escolhaNum == 1) {
             top = "moletom";
           }
         }

         let jsonPeca3 = fnSearch("tipo", top); // -> escolhe um desses que tenha o mesmo clima do climaDesejado

         var random = randomNum(0, jsonPeca3.length);
         if (jsonPeca3[random].clima == climaDesejado && jsonPeca3[random].disponivel == 1) {
           peca3 = jsonPeca3[random];
           arrSugest.push(peca3);
           break;
         }
       } while (peca3 == null); //ate achar uma peca3
     }


     if (peca1.tipo == "blusa" || peca1.tipo == "camiseta" || peca1.tipo == "moletom") { //arranjar parte de baixo
       let peca4;
       do {
         let bottom = null;


         if (climaDesejado == "inverno" || climaDesejado == "meiaEstacao") {
           var escolhaNum = randomNum(0, 1);
           if (escolhaNum == 0) {
             bottom = "saia";
           }
           if (escolhaNum == 1) {
             bottom = "calca";
           }
         } else {
           var escolhaNum = randomNum(0, 1);
           if (escolhaNum == 0) {
             bottom = "saia";
           }
           if (escolhaNum == 1) {
             bottom = "short";
           }
         }

         let jsonPeca4 = fnSearch("tipo", bottom); //-> escolhe um desses que tenha o mesmo clima do climaDesejado

         var random = randomNum(0, jsonPeca4.length);
         if (jsonPeca4[random].clima == climaDesejado && jsonPeca4[random].disponivel == 1) {
           peca4 = jsonPeca4[random];
           arrSugest.push(peca4);
           break;
         }

       } while (peca4 == null);
     }


     if (peca1.tipo == "vestido") {
       let peca5 = null;

       if (climaDesejado == "inverno" || climaDesejado == "meiaEstacao") { //escolhe um casaco
         do {
           let jsonPeca5 = fnSearch("tipo", "casaco");

           var random = randomNum(0, jsonPeca5.length);
           if (jsonPeca5[random].clima == climaDesejado && jsonPeca5[random].disponivel == 1) {
             peca5 = jsonPeca5[random];
             arrSugest.push(peca5);
             break;
           }

         } while (peca5 == null);

       }

     }

     if (peca1.tipo == "casaco") { //nao é verao, pode escolher calca, saia, vestido, blusa 
       let peca7 = null;
       var escolhaNum = randomNum(0, 1);

       if (escolhaNum == 0) { //escolhe um vestido do clima
         let jsonPeca7 = fnSearch("tipo", "vestido")
         do {
           var random = randomNum(0, jsonPeca7.length);
           if (jsonPeca7[random].clima == climaDesejado && jsonPeca7[random].disponivel == 1) {
             peca7 = jsonPeca7[random];
             arrSugest.push(peca7);
             break;
           }
         } while (peca7 == null);
       }


       if (escolhaNum == 1) { //escolhe blusa + 0 ou 1 pra calca ou saia
         let jsonPeca8 = fnSearch("tipo", "blusa");

         for (i = 0; i <= jsonPeca8.length; i++) {
           if (jsonPeca8[i].clima == climaDesejado) {
             let peca8 = jsonPeca8[i];
             arrSugest.push(peca8);
             break;
           }
         }


         var escolhaNum = randomNum(0, 1);
         if (escolhaNum == 0) { //escolhe calca
           let jsonPeca9 = fnSearch("tipo", "calca");

           for (i = 0; i <= jsonPeca9.length; i++) {
             if (jsonPeca9[i].clima == climaDesejado) {
               let peca9 = jsonPeca9[i];
               arrSugest.push(peca9);
               break;
             }
           }
         }

         if (escolhaNum == 1) { //escolhe saia
           let jsonPeca10 = fnSearch("tipo", "saia");

           for (i = 0; i <= jsonPeca10.length; i++) {
             if (jsonPeca10[i].clima == climaDesejado) {
               let peca10 = jsonPeca10[i];
               arrSugest.push(peca10);
               break;
             }
           }
         }
       }
     }

     json = arrSugest; //transforma o json global no array de objetos gerado na funçao
     counter = 0;

     clonaCard();

   }