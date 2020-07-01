function start()
{
	wysHaslo="";

	for(i=0;i<haslo.length;i++)
	{
		if(haslo.charAt(i)==' ')
		{
			wysHaslo += ' ';
		}
		else
		{
			wysHaslo += '-';
		}
	}
	$("#poleHaslo").html(wysHaslo);
	
	document.querySelector("#gracz").value="";
	document.querySelector("#wygrana2").value = "";
}

window.onload = start;

var porazki = 0;
var wygrana = false;

function SprLitere(litera)
{
	var l = $(litera).html();
	var czyZnaleziono = false;
	
	for(i=0;i<haslo.length;i++)
	{
		if(haslo.charAt(i)==l)
		{
			czyZnaleziono = true;
			wysHaslo = wysHaslo.ustawZnak(i,l);
		}
	}
	
	if(czyZnaleziono==false)
	{
		$(litera).prop("onclick", null).off("click");
		$(litera).removeClass("litera");
		$(litera).addClass("czerwona");
		
		porazki++;
		
		$("#image").html('<img src="./pictures/'+porazki+'.png" alt="Wisielec"/>');
		
		if(porazki==10)
		{
			$("#literki").html('<p class="porazka">Przegrałeś! Hasło to :<br/>'+haslo+'</p>');
		}
	}
	else
	{
		$(litera).prop("onclick", null).off("click");
		$(litera).removeClass("litera");
		$(litera).addClass("zielona");
	}
	
	$("#poleHaslo").html(wysHaslo);
	
	if(haslo==wysHaslo)
	{
		wygrana = true;
		licznikWygranych +=1;
		document.querySelector("#wygrana").value = licznikWygranych;
		$("#literki").html("<p class='sukces'>Brawo wygrałeś!</p>");
		$("#ileWygranych").html('<p style="font-size:20px;">Liczba wygranych: '+licznikWygranych+'</p>');
	}
}

String.prototype.ustawZnak = function(miejsce, znak)
{
	if(miejsce > this.length-1)
	{
		return this.toString();
	}
	else
	{
		return this.substr(0,miejsce)+znak+this.substr(miejsce+1);
	}
}

function odslonHaslo()
{
	if(wygrana==false)
	{
		$("#literki").html('<p class="porazka">Przegrałeś! Hasło to :<br/>'+haslo+'</p>');
	}
}

function noweHaslo()
{
	document.querySelector("#wygrana").value = licznikWygranych;
	document.forms[0].submit();
	//javascript:location.reload();
}

function zapiszWynik()
{
	if(document.querySelector("#gracz").value!="")
	{
		document.querySelector("#wygrana2").value = licznikWygranych;
		document.forms[1].submit();
		//javascript:location.reload();
	}	
}