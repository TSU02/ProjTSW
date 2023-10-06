//CHECKOUT

window.onload = function() {
    var form = document.getElementById("checkout-form");
    var isFormSubmitted = false;

    form.addEventListener("submit", function() {
        isFormSubmitted = true;
    });

    window.addEventListener("beforeunload", function(event) {
        if (!isFormSubmitted) {
            event.preventDefault();
            event.returnValue = "Sei sicuro di voler lasciare questa pagina? Le modifiche non salvate andranno perse.";
        }
    });

    window.addEventListener("popstate", function(event) {
        if (!isFormSubmitted) {
            event.preventDefault();
            var confirmLeave = confirm("Sei sicuro di voler lasciare questa pagina? Le modifiche non salvate andranno perse.");
            if (confirmLeave) {
                history.back();
            }
        }
    });

    history.pushState(null, null, location.href);
    window.onpopstate = function() {
        history.pushState(null, null, location.href);
    };
};


//FUNZIONE PER CONTROLLO FORM LATO CLIENT
$(document).ready(function () {
    // Aggiungi un listener per l'evento di cambio nei campi di input
    $('input[data-validation]').on('input', function () {
        var validationType = $(this).data('validation');
        var value = $(this).val().trim();
        var isValid = false;

        // Aggiungi qui le tue regole di validazione per ogni campo
        switch (validationType) {
		    case 'fullName':
			    isValid = /^[A-Za-z\s]+$/.test(value) && /\s/.test(value); // Deve contenere solo lettere e almeno uno spazio
			    break;
		    case 'alphaString':
		        isValid = /^[A-Za-z\s]+$/.test(value); // Consente solo lettere e spazi
		        break;
		    case 'email':
		        isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value); // Valida l'indirizzo email
		        break;
		    case 'address':
			    isValid = /^[A-Za-z\s]+\s\d+$/.test(value); // Deve essere nel formato "stringa di lettere e il numero"
			    break;
		    case 'zipCode':
		        isValid = /^\d{5}$/.test(value); // Codice numerico di 5 cifre
		        break;
		    case 'cardNumber':
		        isValid = /^\d{4}-?\d{4}-?\d{4}-?\d{4}.*$/.test(value); // Numero della carta di 16 cifre
		        break;
		    case 'expDate':
		        isValid = /^\d{2}\/\d{2}$/.test(value); // Data nel formato MM/YYYY
		        break;
		    case 'cvv':
		        isValid = /^\d{3}$/.test(value); // Codice numerico di tre cifre
		        break;
		    default:
		        isValid = true; // Se non è specificato alcun tipo di validazione, è valido
		}

        // Aggiungi o rimuovi la classe 'error' in base alla validità
        if (isValid || value=='') {
            $(this).removeClass('error');
        } else {
            $(this).addClass('error');
        }
    });
});

//FUNZIONI DI FORMATTAZIONE
document.addEventListener("DOMContentLoaded", function() {

	//per cardNumber
	const cardNumber = document.getElementById("cardNumber");
	cardNumber.addEventListener("input", function() {
		var v = this.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
	    var matches = v.match(/\d{4,16}/g);
	    var match = matches && matches[0] || '';
	    var parts = [];
	    for (i=0, len=match.length; i<len; i+=4) {
	        parts.push(match.substring(i, i+4));
	    }
	    if (parts.length) {
	        this.value =  parts.join('-');
	    } else {
	        this.value = value;
	    }
	});
	
	//per expDate
	const expDate = document.getElementById("expDate");		
	expDate.addEventListener("input", function() {
		var v = this.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
        var matches = v.match(/\d{2,4}/g);
        var match = matches && matches[0] || '';
        var parts = [];
        for (i=0, len=match.length; i<len; i+=2) {
            parts.push(match.substring(i, i+2));
        }
        if (parts.length) {
            this.value = parts.join('/');
        } else {
            this.value = value;
        }
	});
	
	//per cvv
	const cvv = document.getElementById("cvv");	
	cvv.addEventListener("input", function() {
		const maxLength = 3;
		const regex = /^\d*$/;
		if (!regex.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
		}
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
	});
	
	//per zipCode
	const zipCode = document.getElementById("zipCode");	
	zipCode.addEventListener("input", function() {
		const maxLength = 5;
		const regex = /^\d*$/;  	
		if (!regex.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
		}
		if (this.value.length > maxLength) {
			this.value = this.value.slice(0, maxLength);
		}
	});

});

