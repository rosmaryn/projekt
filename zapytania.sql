1.Wyświetl, które ze składników będą przeterminowane w dniu 02.02.2021.
select nazwa from skladniki where termin_waznosci<'2021-02-02';

2.Których dań nie da się przyrządzić bez używania skladnika o ID równym 4?
select menu.nazwa from menu inner join skladniki on menu.glowny_skladnik = skladniki.nazwa where skladniki.skladnik_id=4;

3.Wyświetl ile zamówień obsługuje jednocześnie każdy kelner.
select nazwa, count(nr_zamowienia) from kelner group by nazwa;

4.Wyświetl ile porcji poszczególnych dań da się przyrządzić, zakładając że nie zabraknie innych składników, niż główny.
select menu.nazwa, skladniki.ilosc from menu inner join skladniki on menu.glowny_skladnik = skladniki.nazwa order by skladniki.ilosc;

5.Ile minut zajmie przygotowanie wszystkich dań, jeśli jednocześnie pracuje dwóch kucharzy?
select sum(czas_wykonania)/2 as 'czas wykonania' from zamowienie;

6.Wyświetl wszystkie dane kucharza, który zarabia najwięcej.
select *from kucharz where pensja=(select max(pensja) from kucharz);

7.Wyświetl miesięczny koszt, jaki ponosi restauracja na samo opłacenie kucharzy.
select sum(kucharz.pensja)*2 from kucharz;


8.Wyświetl imię, pensję i numery zamówień najsłabiej opłacanego kelnera
select nazwa as 'imie', pensja, nr_zamowienia from kelner where pensja=(select min(pensja) from kelner);

9.Sprawdź, ile restauracja jest w stanie zarobić, przygotowując dania składające się głównie z brokułów.
select menu.cena*skladniki.ilosc from menu inner join skladniki on menu.glowny_skladnik = skladniki.nazwa where menu.glowny_skladnik='brokul';

10.Wyświetl alfabetycznie imiona kelnerów i nazwy dań, które mają dostarczyć.
select obsluga, danie from zamowienie order by obsluga asc;