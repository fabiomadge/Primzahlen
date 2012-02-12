public class IntListe
{
	private IntListe is;

	//String-Darstellung einer IntListe.
	public String toString(){
		return "-1";
	}

	//sagt, ob die Liste leer ist.
	public Boolean istLeer(){
		return false;
	}

	//gibt das vorderste Listenelement zurück.
	public int kopf(){
		return -1;
	}

	//gibt den Rest der Liste ohne das vorderste Element zurück.
	public IntListe rest(){
		return is;
	}

	//gibt den Anfang der Liste ohne das hinterste Element zurück.
	public IntListe anfang(){
		return is;
	}

	//gibt das hinterste Listenelement zurück.
	public int ende(){
		return -1;
	}
}
