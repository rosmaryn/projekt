trigger1: create trigger dod_cena before insert on menu for each row set new.cena = new.cena+1;

trigger2: create trigger podwyzka before insert on kucharz for each row set new.pensja = new.pensja+400;

procedura: create procedure liczba_kucharzy() select count(nazwa) from kucharz; 

funkcja:

delimiter //
mysql> create function podwyzka (pensja int(6), premia int(3)) returns int
    -> begin
    -> declare nowa_pensja int(6);
    -> set nowa_pensja=pensja+premia;
    -> return nowa_pensja;
    -> end//
mysql> delimiter ;
