public class prim
{
    public static void main(String[] s) throws Exception
    {
    	System.out.println("There will be code");
    	//int a = EA.einInt();
    	//int b = EA.einInt();
    	//System.out.println(dek(a));

    }

//dekrementiert die übergebene Ganzzahl. 

    public int dek(int i){
    	return --i;
    }

//sagt, ob die zweite übergebene Ganzzahl ein Vielfaches der ersten übergebenen Ganzzahl ist.

    public boolean vielfach(int a, int b){
    	if(a == 0 || a == 0){
    		return false;
    	}

    	int div = b / a;
    	double divd = (double)b / (double)a;
    	double divi = (double)div;

    	if(divd == divi) {
    		return true;
    	}
    	else{
    		return false;
    	}
    }

//wirft alle Ganzzahlen, die die übergebene Bedingung erfüllen, aus der Liste hinaus.

    public IntListe werfen(int i, IntListe is){
    	return is;
    }

/*
Vorstufe für das Sieb des Eratosthenes: Aus der übergebenen Liste werden
das vorderste Element und alle weiteren Elemente, die keine Vielfachen
des vordersten Elements sind, in die zurück gegebene Ergebnis-Liste übernommen.
*/

    public IntListe sieb(IntListe is){
    	return is;
    }

//Sieb des Eratosthenes.

    public IntListe prims(IntListe is){
    	return is;
    }

//gibt eine Liste mit allen Primzahlen bis zur übergebenen

	public IntListe primzahlen(int i){
		return new IntListe();
	}

}
