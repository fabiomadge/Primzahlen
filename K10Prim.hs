module K10Prim where

import Char (toUpper,chr,ord)


-- **************************************************************************
-- *         Der Arbeitsauftrag für die Abteilung INTLISTE                  *
-- **************************************************************************

-- Der Datentyp IntListe ----------------------------------------------------
-- --------------------------------------------------------------------------

data IntListe = L | Int :> IntListe deriving Eq

instance Show IntListe where show = zeigen

zeigen1,zeigen         :: IntListe -> String                        -- String-Darstellung einer IntListe.

zeigen1 L              = ""
zeigen1 (i:>L)         = show i
zeigen1 (i:>is)        = show i ++ "," ++ zeigen1 is

zeigen is              = '<' : (zeigen1 is ++ ">")

-- Die Schnittstelle des Datentyps ------------------------------------------
-- --------------------------------------------------------------------------

istLeer          :: IntListe -> Bool                                -- ... sagt, ob die Liste leer ist.
kopf             :: IntListe -> Int                                 -- ... gibt das vorderste Listenelement zurück.
rest             :: IntListe -> IntListe                            -- ... gibt den Rest der Liste ohne das vorderste Element zurück.
anfang           :: IntListe -> IntListe                            -- ... gibt den Anfang der Liste ohne das hinterste Element zurück.
ende             :: IntListe -> Int                                 -- ... gibt das hinterste Listenelement zurück.

istLeer                 = (== L)

kopf (i:>is)            = i

rest (i:>is)            = is

anfang (i:>L)           = L 
anfang (i:>is)          = i :> (anfang is)

ende (i:>L)             = i
ende (i:>is)            = ende is

-- **************************************************************************
-- *                     Ende Abteilung INTLISTE                            *
-- **************************************************************************


-- **************************************************************************
-- *        Der Arbeitsauftrag für die Abteilung INTLISTENSTEUERUNG         *
-- **************************************************************************

-- Funktionen der Klasse IntListSteuerung -----------------------------------
-- --------------------------------------------------------------------------

neu              :: IntListe                                        -- ... erzeugt eine neue, leere IntListe.
anfuegen         :: Int -> IntListe -> IntListe                     -- ... fügt eine Ganzzahl vorne an eine Liste an.
loeschen         :: Int -> IntListe -> IntListe                     -- ... löscht die übergebene Ganzzahl aus der übergebenen Liste.
solange          :: (a -> Bool) -> (a -> a) -> (a -> b -> b) 
                     -> a -> b -> b                                 -- ... das HUGS-Gegenstück zu einer Java-Schleife.
liste            :: Int -> IntListe                                 -- ... erzeugt eine Liste, die alle Zahlen ab 2 bis zur überge-
                                                                    --     benen Ganzzahl enthält.

neu                     = L

anfuegen i L            = i :> L
anfuegen i is           = if i == kopf is - 1
                           then i :> is
                           else is

loeschen i L            = L	
loeschen i is           = if i < kopf is
                           then is
			               else if i == kopf is
		                         then rest is
				                 else kopf is :> loeschen i (rest is)

solange bedingung schritt f x y 
                        = if bedingung x
			               then solange bedingung schritt f (schritt x) (f x y) 
			               else y

liste i                 = if i > 1
                           then solange (>1) dek anfuegen i neu
			               else neu

-- **************************************************************************
-- *                 Ende Abteilung INTLISTSTEUERUNG                        *
-- **************************************************************************


-- **************************************************************************
-- *            Der Arbeitsauftrag für die Abteilung PRIM                   *
-- **************************************************************************
							 
-- Funktionen der Klasse Prim -----------------------------------------------
-- -------------------------------------------------------------------------- 

dek                     :: Int -> Int                               -- ... dekrementiert die übergebene Ganzzahl. 
vielfach                :: Int -> Int -> Bool                       -- ... sagt, ob die zweite übergebene Ganzzahl ein Vielfaches
                                                                    --     der ersten übergebenen Ganzzahl ist.
werfen                  :: (Int -> Bool) -> IntListe -> IntListe    -- ... wirft alle Ganzzahlen, die die übergebene Bedingung
                                                                    --     erfüllen, aus der Liste hinaus.
sieb                    :: IntListe -> IntListe                     -- ... Vorstufe für das Sieb des Eratosthenes: Aus der übergebenen
                                                                    --     Liste werden das vorderste Element und alle weiteren
                                                                    --     Elemente, die keine Vielfachen des vordersten Elements sind,
                                                                    --     in die zurück gegebene Ergebnis-Liste übernommen.
prims                   :: IntListe -> IntListe                     -- ... Sieb des Eratosthenes.
primzahlen              :: Int -> IntListe                          -- ... gibt eine Liste mit allen Primzahlen bis zur übergebenen
                                                                    --     Ganzzahl zurück. 
main                    :: IO ()                                    -- ... Das Hauptprogramm.
						   
dek i                   = i - 1

vielfach i j            = mod j i == 0

werfen bedingung L      = L
werfen bedingung (i:>is)
                        = if bedingung i 
			               then werfen bedingung is
                           else i :> werfen bedingung is					
						   
sieb L                  = L
sieb is                 = let k = kopf is
                          in
			              k :> werfen (vielfach k) is
					  
prims L                 = L
prims is                = let k = kopf is
                          in
			              k :> prims (werfen (vielfach k) is)
						  
primzahlen              = prims . liste

main                    = putStrLn hauptmenue                   >>
                          schleife

-- **************************************************************************
-- *                         Ende Abteilung PRIM                            *
-- **************************************************************************


-- **************************************************************************
-- *                System-Teil: für Schüler irrelevant.                    *
-- *                                                                        *
-- * (HUGS benötigt diesen Teil, um das Programm interaktiv auszuführen.)   *      
-- **************************************************************************


-- Bausteine für Ein- und Ausgabe -------------------------------------------
-- --------------------------------------------------------------------------
breite                  :: Int
rechts                  :: String -> Int
mal                     :: Int -> Char -> String
leer                    :: Int -> String -> String
zentrieren              :: Int -> Int -> String -> String 
anordnen                :: [String] -> String

titel,schluss,
 funtast,funtast1,
 funtast2,zentitel,
 zentschluss,obenunten,
 zwischenleer,titelzeile,
 schlusszeile,ftzeile,
 ftzeile1,ftzeile2      :: String

liste1,liste2,liste3    :: [String]

hauptmenue              :: String
liste4                  :: [String]
untermenue              :: String
liste5                  :: [String]
schlussbild             :: String

istZiffer               :: Char -> Bool
trimmen                 :: String -> String
c2ziff                  :: Char -> Int
s2zahl                  :: Num a => String -> a
schleife,primprog       :: IO ()
 
breite                  = 50

rechts txt              = breite - 2 - length txt

mal 0 c                 = ""
mal n c                 = c : mal (n-1) c

leer 0 s                = s
leer n s                = ' ' : leer (n-1) s

zentrieren anfang ende text
                        = let delta  = ende - anfang
                              mitte  = delta `div` 2
                              lth    = length text `div` 2
                              start  = mitte - lth
			              in
			              leer start text

anordnen []             = ""
anordnen (x:xs)         = x ++ "\n" ++ anordnen xs

titel                   = "PROGRAMM PRIMZAHLEN"
schluss                 = "ENDE PROGRAMM PRIMZAHLEN!"
funtast                 = "FUNKTION" ++ leer 25 "TASTE"
funtast1                = "Programm beenden" ++ leer 20 "E"
funtast2                = "Primzahl-Liste" ++ leer 22 "P"
zentitel                = zentrieren 0 (breite - 2) titel
zentschluss             = zentrieren 0 (breite - 2) schluss
							  
obenunten               = leer 5 (mal breite '*')
zwischenleer            = leer 5 ('*' : (mal (breite - 2) ' ' ++ "*"))
titelzeile              = leer 5 ('*' : zentitel ++ leer (rechts zentitel) "*")
schlusszeile            = leer 5 ('*' : zentschluss ++ leer (rechts zentschluss) "*")
ftzeile                 = leer 5 ('*' : leer 5 funtast ++ leer (rechts (leer 5 funtast)) "*")
ftzeile1                = leer 5 ('*' : leer 5 funtast1 ++ leer (rechts (leer 5 funtast1)) "*")
ftzeile2                = leer 5 ('*' : leer 5 funtast2 ++ leer (rechts (leer 5 funtast2)) "*")
liste1                  = ["\n\n\n",obenunten,zwischenleer,titelzeile,zwischenleer]
liste2                  = [ftzeile,zwischenleer,ftzeile1,ftzeile2,zwischenleer,obenunten]
liste3                  = liste1 ++ liste2
hauptmenue              = anordnen liste3
liste4                  = ["\n\n",obenunten,zwischenleer,ftzeile,zwischenleer,ftzeile1,ftzeile2,zwischenleer,obenunten]
untermenue              = anordnen liste4
liste5                  = ["\n\n",obenunten,zwischenleer,schlusszeile,zwischenleer,obenunten,"\n\n\n"]
schlussbild             = anordnen liste5

istZiffer c             = ord c > 47 && ord c < 58

trimmen                 = filter istZiffer

c2ziff c                = case c of 
                           '1' -> 1
                           '2' -> 2
                           '3' -> 3
                           '4' -> 4
                           '5' -> 5
                           '6' -> 6
                           '7' -> 7
                           '8' -> 8
                           '9' -> 9
                           _   -> 0
                                                
s2zahl                  = let h a b = 10*a + b
                              f     = foldl h 0
                          in
                          fromIntegral . f . map c2ziff 

schleife                = getChar                                 >>=
                          \c -> case (toUpper c) of
                                 'E'  -> putStrLn (chr 8 : "")    >>
                                         putStrLn schlussbild
                                 'P'  -> putStrLn (chr 8 : "")    >>
                                         primprog
                                 _    -> putStrLn (chr 8 : "")    >>
                                         putStrLn untermenue      >>
                                         schleife 

primprog                = putStr "     Obere Grenze (1 - 12939) eingeben: "                    >>
                          getLine                                                              >>=
                          \ein -> if head ein == '-'
                                   then putStrLn "\n     FEHLEINGABE!"                         >>
                                        putStrLn untermenue                                    >>
                                        schleife
                                   else let trimein = trimmen ein
                                            i       = s2zahl trimein
                                        in
                                        case (i > 0 && i < 12939) of
                                        False  -> putStrLn "\n     FEHLEINGABE!"               >>
                                                  putStrLn untermenue                          >>
                                                  schleife
                                        _      -> putStrLn ("\n     Primzahlen bis " ++ show i
                                                   ++ ":\n     " ++ (show . primzahlen) i)     >>
                                                  putStrLn untermenue                          >>
                                                  schleife                                            
 

						  
								 
                         						   
 