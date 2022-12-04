
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
                 var Culqi = [];    
                 Culqi.publicKey = 'pk_test_08844ad484aa4e03';
                 Culqi.settings({
                    title: 'Culqi',
                    currency: 'PEN',
                    amount: 1000,
                    order: 'ord_live_0CjjdWhFpEAZlxlz'
                    });   
             
  
                Culqi.options({
                    lang: 'auto',
                    installments: false,
                    paymentMethods: {
                      tarjeta: true,
                      bancaMovil: true,
                      agente: true,
                      billetera: true,
                      cuotealo: true
                    }
                });
            
                 
            
                Culqi.options({
                    style: {
                      logo: 'https://culqi.com/LogoCulqi.png',
                      bannerColor: '9BB613', // hexadecimal
                      buttonBackground: '58CD94', // hexadecimal
                      menuColor: '9BB613', // hexadecimal
                      linksColor: '9BB613', // hexadecimal
                      buttonText: 'Pagar', // texto que tomará el botón
                     buttonTextColor: '9BB613', // hexadecimal
                     priceColor: '9BB613' // hexadecimal
                    }
                });
           
            
         
                const btn_pagar = document.getElementById('btn_pagar');
                btn_pagar.addEventListener('click', function (e) {
                    // Abre el formulario con la configuración en Culqi.settings y CulqiOptions
                    Culqi.open();
                    e.preventDefault();
                });
           
            
           
                function culqi() {
                  if (Culqi.token) {  // ¡Objeto Token creado exitosamente!
                    const token = Culqi.token;
                    console.log(`Se ha creado el objeto Token: ${token}.`);
                    //En esta linea de codigo debemos enviar el "Culqi.token.id"
                    //hacia tu servidor con Ajax
                  } else if (Culqi.order) {  // ¡Objeto Order creado exitosamente!
                    const order = Culqi.order;
                    console.log(`Se ha creado el objeto Order: ${order}.`);

                  } else {
                    // Mostramos JSON de objeto error en consola
                    console.log(`Error : ${Culqi.error.merchant_message}.`);
                  }
                };
           
                                
          