create table CLIENT (NUMCLI decimal (8) not null,
					NOM char (50) not null,
					PRENOM char (40) not null,
					ADRESSE char (200) not null,
					primary key (NUMCLI));

create table COMMANDE (NUMCOM decimal (10) not null,
						DATE decimal (8) not null,
						ADRESSE_LIVRAISON char (200) not null,
						NUMCLI decimal (8) not null,
						primary key (NUMCOM),
						foreign key (NUMCLI) references CLIENT
						on delete no action on update cascade);

create table COMPOSITION (NUMCOM decimal (10) not null,
				CODE decimal (10) not null,
				QUANTITE decimal (5) not null,
				primary key (NUMCOM,CODE),
				foreign key (NUMCOM) references COMMANDE
				on delete no action on update cascade,
				foreign key (CODE) references PRODUIT
				on delete no action on update cascade);

create table PRODUIT (CODE decimal (10) not null,
			LIBELLE char (50) not null,
			PRIX decimal (6) not null,
			primary key (CODE));

create unique index XCLI_NUMCLI on CLIENT(NUMCLI);
create unique index XCOM_NUMCOM on COMMANDE(NUMCOM);
create unique index XPROD_CODE on PRODUIT(CODE);

