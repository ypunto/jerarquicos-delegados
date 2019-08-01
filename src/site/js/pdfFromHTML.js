function HTMLtoPDF(){
	
var image01 = document.getElementById("image01");
var image02 = document.getElementById("image02");
image01.classList.add("images-show");
image02.classList.add("images-show");
$(".block").remove();
$("i").remove(".icon");
$("img").remove(".images");
$("#button").remove();
	
	

var pdf = new jsPDF('p', 'pt', 'a4');
source = $('#HTMLtoPDF')[0];
	
specialElementHandlers = {
	'#bypassme': function(element, renderer){
		return true
	}
}
margins = {
    top: 50,
    left: 55,
    width: 470
  };
pdf.fromHTML(
  	source // HTML string or DOM elem ref.
  	, margins.left // x coord
  	, margins.top // y coord
  	, {
  		'width': margins.width // max width of content on PDF
  		, 'elementHandlers': specialElementHandlers
  	},
  	function (dispose) {
  	  // dispose: object with X, Y of the last line add to the PDF
  	  //          this allow the insertion of new lines after html
        pdf.save('Documentacion-a-presentar.pdf');
      }
  )	
	

	var btn = document.createElement("div");
	btn.classList.add("listo-page");
	var hr = document.createElement("hr");
	hr.classList.add("hr-class");
	var button = document.createElement("button");
	button.className = 'button button-fill button-round button-margin-pdf';
	button.innerHTML = 'Crear otro Documento';
	button.setAttribute("onclick", "reload()"); 
	var h1 = document.createElement("h1");
	h1.className = 'page-title-big';
	h1.innerHTML = 'Listo!';
	var h2 = document.createElement("h2");
	h2.className = 'page-title-small';
	h2.innerHTML = 'Se ha descargado el archivo<br>en tu móvil.';
    btn.appendChild(h1);
	btn.appendChild(hr);
	btn.appendChild(h2);
	btn.appendChild(button);
    document.body.appendChild(btn);


	
}



  