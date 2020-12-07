drop database if exists FitnessDatabase;
create database FitnessDatabase character set utf8mb4;
use FitnessDatabase;


create table Klijent(
    sifra int not null primary key auto_increment,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    Spol char(1) not null,
    Dob int(2) not null,
    Visina char(5) not null,
    Masa varchar(5) not null,
    BrojTjednihTreninga int(1) not null,
    Trener int,
    Gym int 
);

create table Trener(
    sifra int not null primary key auto_increment ,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    Spol char(1) not null,
    Iskustvo varchar(20) not null,
    BrojKlijenata int,
    Vrsta varchar(20) not null,
    Email varchar(30) not null,
    SocialMedia varchar(100),
    FitnessCompany int
);

create table Trening(
    sifra int not null primary key auto_increment ,
    Naziv varchar(20) not null,
    Trajanje varchar(20) not null,
    Odmor varchar(20) not null,
    BrojPonavljanja varchar(15) not null,
    TjednihTreninga int(5)not null,
    Trener int ,
    Klijent int 
);

create table Prehrana(
    sifra int not null primary key auto_increment,
    Klijent int not null, #FK
    Vrsta varchar(20) not null,
    TjedniTroskovi decimal(10,2)
);

create table FitnessCompany(
    sifra int not null primary key auto_increment,
    Naziv varchar(30) not null,
    Osnutak datetime,
    Opis text ,
    BrojKlijenata int(10),
    Kontakt varchar(30)not null,
    Drzava varchar(15)
);

create table FitnessProizvodi(
    sifra int not null primary key auto_increment,
    Naziv varchar(50) not null,
    Opis varchar(200),
    Cijena decimal(10,2) not null,
    Kolicina varchar(15) not null,
    Proizvodac int not null #FK
);

create table Gym(
    sifra int not null primary key auto_increment,
    Naziv varchar(30) not null,
    Grad varchar(15),
    Drzava varchar(15) not null,
    RadnoVrijeme varchar(15) not null,
    BrojKlijenata int
);

create table Cilj(
    sifra int not null primary key auto_increment,
    ZeljenaKilaza int(4) not null,
    ZeljeniBodyFat varchar(10),
    ZeljeniMuscleMass varchar(10),
    Klijent int not null
);


alter table Cilj add foreign key(Klijent) references Klijent(sifra);
alter table Klijent add foreign key(Gym) references Gym(sifra);
alter table FitnessProizvodi add foreign key(Proizvodac) references FitnessCompany(sifra);
alter table Trener add foreign key(FitnessCompany) references FitnessCompany(sifra);
alter table Trening add foreign key(Klijent) references Klijent(sifra);
alter table Klijent add foreign key(Trener) references Trener(sifra);
alter table Prehrana add foreign key(Klijent) references Klijent(sifra);
alter table Trening add foreign key(Trener) references Trener(sifra);


insert into FitnessCompany(sifra,Naziv,Osnutak,BrojKlijenata,Kontakt,Drzava)
values (null,'5%Nutrition','2015-06-09','1350','5percentbusiness@gmail.com','USA'),(null,'RogueFitness','2017-07-07','2200','roguebusiness@gmail.com','USA'),
(null,'Proteka','2014-06-19','132','protekabusiness@gmail.com','Hrvatska');

insert into trener(sifra,Ime,Prezime,Spol,Iskustvo,BrojKlijenata,Vrsta,Email,FitnessCompany)
values (null,'Richard','Piana','M','25godina','150','TrenerSnage','richpiana@gmail.com',1),
(null,'Jeff','Cavaliere','M','20godina','95','KondicijskiTrener','jeffcav@gmail.com',2),(null,'Eva','Rusan','Ž','15godina','15','KondicijskiTrener','evarusan@gmail.com',3)
,(null,'Petar','Stipić','M','8godina','13','TrenerSnage','stipic@gmail.com',3),(null,'Oleksii','Novikov','M','5godina','25','Strongman','onovikov@gmail.com',2)
,(null,'Filip','Horvat','M','5godina','7','ClassicPhiTrener','filiph@gmail.com',1);


insert into Gym(sifra,Naziv,Grad,Drzava,RadnoVrijeme,BrojKlijenata)
values (null,'Gyms4you','Osijek','Hrvatska','0-24h/7','3000');

insert into klijent(sifra,Ime,Prezime,Spol,Dob,Visina,Masa,BrojTjednihTreninga,Trener,Gym)
values(null,'Tin','Jeger','M','22','180cm','75kg','5',4,1),(null,'Valentin','Mikić','M','24','183cm','90kg','5',1,1),(null,'Marin','Amidžić','M','24','179cm','83kg','7',5,1);
select * from gym;
select * from fitnesscompany;
select * from trening;
select * from klijent;
select * from trener;
select * from prehrana;
select * from fitnessproizvodi;

insert into FitnessProizvodi(sifra,Naziv,Cijena,Kolicina,Proizvodac)
values (null,'5150 PreWorkout','1.00','Sample',1),(null,'ShakeTime RealFood Protein','44.99','2kg',1),(null,'JointDefender Kapsule','36.99','36kapsula',1),
(null,'StandardGoldWhey','100.00','5kg',1),(null,'Kazein','88.45','2.54kg',3),(null,'Kreatin','44.44','2.54kg',3);

insert into prehrana(sifra,Klijent,Vrsta,TjedniTroskovi)
values (null,1,'DobijanjeKilaze','100.00');

select * from trener;
select * from trening;
select * from klijent;
insert into trening(sifra,Naziv,Trajanje,Odmor,BrojPonavljanja,TjednihTreninga,Trener,Klijent)
values(null,'TreningPrsa','2h','4min','4-8','2',1,3),(null,'TreningLeda','2h','4min','8-12','2',1,3)
,(null,'TreningNoge','1h','2min','10-12','1',1,3),(null,'TreningRuke','1.5h','1.5min','12-16','1',1,3),
(null,'Weakside','WeaksideH','WeaksideMIN','WeaksideREPS','1',1,3);
insert into trening(sifra,Naziv,Trajanje,Odmor,BrojPonavljanja,TjednihTreninga,Trener,Klijent)
values (null,'TreningPrsa','1.5h','1min','12-14','1',4,1);

select a.naziv , a.TjednihTreninga 
from trening a inner join klijent b on a.klijent=b.sifra where b.sifra=3;


