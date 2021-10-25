let boton_modal = document.getElementById('btn_modal');
let modal = document.getElementById('initial_modal');
let btn_modal_puntaje = document.getElementById("btn_modal_puntaje");
let btn_acabar = document.getElementById("btn_acabar");
let btn_no_finalizar = document.getElementById('btn_no_finalizar');
let btn_si_finalizar = document.getElementById('btn_si_finalizar');
let ron= document.getElementById('ronda');
let name= document.getElementById('nombre');
let txt_puntaje= document.getElementById('puntaje');
let btn_record= document.getElementById('btn_record');
let puntajes_modal = document.getElementById('puntajes_modal');
let puntaje_obtenido = document.getElementById('puntaje_obtenido');
let pregunta= document.getElementById('pregunta')
let txt_res1= document.getElementById('res1');
let txt_res2= document.getElementById('res2');
let txt_res3= document.getElementById('res3');
let txt_res4= document.getElementById('res4');
let nombre = document.getElementById('usuario');
let maxima_ronda= document.getElementById('maxima_ronda');
///variable Globales 
let idPlayer =0;
let respuestasFinal={};
let ronda=1;
let puntaje=0;

boton_modal.addEventListener('click', ()=>{// incio del progrma
    
    ingresar();
    
})

let CompareRespuesta = async (txt)=>{// funcion que comprar el Json  qeu contiene las respuesats con los botnoes

    if(respuestasFinal[0].respuesta==txt.innerHTML && ronda<6){
        
        ronda++;
        let formRonda = new FormData();
        formRonda.append('ronda', ronda);
        let puntaje_ronda = await fetch('./php/darpremios.php',{
            method: "post",
            body:formRonda
        });
        puntaje_ronda = await puntaje_ronda.text();
        

        puntaje= parseInt(puntaje_ronda);
        txt_puntaje.innerHTML=puntaje;
        
       
        if(ronda==6){
            txt_puntaje.innerHTML=puntaje;
            alert("gano felicidades")
            fin_modal.hidden = false;
            puntaje_obtenido.innerHTML= puntaje
            
            maxima_ronda.innerHTML= ronda; 
            
        }else{
        ingresar();}
   }else{
       
       puntaje_obtenido.innerHTML= puntaje 
       maxima_ronda.innerHTML= ronda; 
       txt_puntaje.innerHTML=puntaje;
       fin_modal.hidden = false;
        }
}

const ingresar = async ()=>{
    ron.innerHTML=ronda;

    if(ronda==1){// inicio del jeugo crea nuevo id de jugador 
        txt_puntaje.innerHTML=0;

    let newID = await fetch('./php/newid.php');
    newID = await newID.text();
    
    idPlayer = parseInt(newID);
    
  
    var formData = new FormData();
    
    formData.append('id', idPlayer);
    formData.append('nombre', nombre.value);
    formData.append('ronda', ronda);
    formData.append('puntaje', puntaje);
    const response = await fetch('./php/ingresar.php',{// envio de datos   del jugador  a la base de datos 
        method:"post",
        body:formData
    })
    let result = await response.text();
    

    if(result=="1"){
        modal.hidden=true;// esconde el formulario del ingreso y da inicio al juego asignado las preguntas 

        preguntas();
        
    }else{
        alert("No se puedo ingresar al juego");
    }
    
}else if(ronda<6){// este condicional funciona despues de la primera ronda  hasta la ultima 
    var formUsuario = new FormData();
    formUsuario.append('id', idPlayer);
    formUsuario.append('ronda', ronda);
    formUsuario.append('puntaje', puntaje);

    let actualizar_puntaje= await fetch('./php/actualizar_usuario.php', {// cada vez que hay una nueva ronda se actualiza los puntajes del jugador
        method:'post',
        body: formUsuario

    });
    actualizar_puntaje = await actualizar_puntaje.text();
    console.log(actualizar_puntaje);
    

    preguntas();
}else{
    alert("Termino el juego");
}

    
}
const preguntas =  async()=>{

    var formPreguntas = new FormData();
    formPreguntas.append('id_cat', ronda);

    let newPreguntas = await fetch('./php/conspreguntas.php',{//se envia  la   categoria a para que busque las preguntas correspondientes a la categoria 
        method: 'POST',
        body:formPreguntas
    });

    
    let preguntasNivel = await newPreguntas.text();

    if(preguntasNivel!="0"){
        let preguntaFinal= JSON.parse(preguntasNivel);// se traen las preguntas en formato JSON


        preguntarAlzar=preguntaFinal[parseInt(Math.random()*4)]; // se escoge una de las 5 preguntas alzar

        pregunta.innerHTML = preguntarAlzar.enunciado;

    traerRespuestas(preguntarAlzar.id_pregunta);
    }else{
        alert("sucedio un problema con el sistemas");
    }
}

const traerRespuestas = async(id) =>{
    var formRespuestas = new FormData();
    
    formRespuestas.append('id_pre', id);
    

let newRespuestas = await fetch('./php/consrespuestas.php', {// se trea las 4 respuestas con base al id de la pregunta selecionada alzar
    method: 'POST',
    body:formRespuestas
});

    let respuestaSel = await newRespuestas.text();
    respuestasFinal = JSON.parse(respuestaSel);

    if(respuestaSel!="0"){// se aginan las respuestas a cada boton 
        
        
        
        txt_res1.innerHTML = respuestasFinal[0].respuesta;
        txt_res2.innerHTML = respuestasFinal[1].respuesta;
        txt_res3.innerHTML = respuestasFinal[2].respuesta;
        txt_res4.innerHTML = respuestasFinal[3].respuesta;

        
    }

}
txt_res1.addEventListener('click',()=>CompareRespuesta(txt_res1))// se usa una funcion para compara todas las respuestas
     txt_res2.addEventListener('click',()=>CompareRespuesta(txt_res2) )
     txt_res3.addEventListener('click', ()=>CompareRespuesta(txt_res3))
     txt_res4.addEventListener('click', ()=>CompareRespuesta(txt_res4))
    
           

btn_record.addEventListener('click', ()=>readPlayers());



let readPlayers  = async ()=>{

    let record = await fetch('./php/historial.php');// funcion para buscar las mejores puntucioanes en  un top 10
   
    puntajes_modal.hidden = false;
    record = await record.text();
    let tabla_puntajes = document.getElementById('tabla_puntajes');
    lista_record = JSON.parse(record);
    salida = "";
    lista_record.forEach(Element=>{
        salida += `
            <tr>
                <td>`+Element.nombre+`</td>
                
                <td>`+Element.puntaje+`</td>
                
                <td>`+Element.ronda+`</td>
            </tr>
        `;
    });
    tabla_puntajes.innerHTML = salida;

}

btn_modal_puntaje.addEventListener('click',()=>{
    puntajes_modal.hidden = true;
});

btn_acabar.addEventListener('click',()=>{
    acabar_modal.hidden = false;
});
btn_no_finalizar.addEventListener('click',()=>{
    acabar_modal.hidden = true;
});
fin_modal= document.getElementById('fin_modal');
btn_si_finalizar.addEventListener('click',()=>{
    fin_modal.hidden = false;
    puntaje_obtenido.innerHTML= puntaje 
    maxima_ronda.innerHTML= ronda;
    
});