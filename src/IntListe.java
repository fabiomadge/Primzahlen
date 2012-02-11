public class IntListe
{

	//String-Darstellung einer IntListe.
	public String toString(){
		return "-1";
	}

	//sagt, ob die Liste leer ist.
	public Boolean istLeer(IntListe is){
		return false;
	}

	//gibt das vorderste Listenelement zurück.
	public int kopf(IntListe is){
		return -1;
	}

	//gibt den Rest der Liste ohne das vorderste Element zurück.
	public IntListe rest(IntListe is){
		return is;
	}

	//gibt den Anfang der Liste ohne das hinterste Element zurück.
	public IntListe anfang(IntListe is){
		return is;
	}

	//gibt das hinterste Listenelement zurück.
	public int ende(IntListe is){
		return -1;
	}
}
