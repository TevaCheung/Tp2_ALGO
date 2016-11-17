create table CLIENT (NUMCLI decimal (8) not null,
					 NOM char (50) not null,
					 PRENOM char (50) not null,
					 ADRESSE char (100) not null,
					 primary key (NUMCLI));

create table BENEFICIAIRE (NUMCLI decimal (8) not null,
						   NUMCOMPTE decimal (10) not null, 
						   primary key (NUMCLI,NUMCOMPTE),
						   foreign key (NUMCLI) references CLIENT
						   on delete no action on delete cascade,
						   foreign key (NUMCOMPTE) references COMPTE
		  				   on delete no action on delete cascade);
			 
create table COMPTE (NUMCOMPTE decimal (10) not null,
					 SOLDE decimal (10) not null,
					 primary key (NUMCOMPTE));

create table RETRAIT (NUMCLI decimal (8) not null,
					  NUMCOMPTE decimal (10) not null, 
					  MONTANT decimal (12) not null,
					  DATE decimal (8) not null,
					  primary key (NUMCLI,NUMCOMPTE),
				  	  foreign key (NUMCLI) references CLIENT
					  on delete no action on delete cascade,
				   	  foreign key (NUMCOMPTE) references COMPTE
					  on delete no action on delete cascade);

create table DEPOT (NUMCLI decimal (8) not null,
					NUMCOMPTE decimal (10) not null, 
					MONTANT decimal (12) not null,
					DATE decimal (8) not null,
					primary key (NUMCLI,NUMCOMPTE),
					foreign key (NUMCLI) references CLIENT
					on delete no action on delete cascade,
					foreign key (NUMCOMPTE) references COMPTE
					on delete no action on delete cascade);

create unique index XCLI_NUMCLI on CLIENT(NUMCLI);
create unique index XCOMPTE_NUMCOMPTE on COMPTE(NUMCOMPTE);


