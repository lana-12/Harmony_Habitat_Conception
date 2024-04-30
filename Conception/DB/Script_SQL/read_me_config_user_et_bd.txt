pour commencer à construire la bdd :

je vous conseille de faire un bdd nommée 'harmony_habitat'
avec un user nommé 'user_harmony_habitat' qui a des droits que sur cette bdd
avec comme pw 'harmony_habitat'
pour avoir le même fichier de config pour le back :

bdname : 'harmony_habitat'
username : 'user_harmony_habitat'
host : 'localhost'
password : 'harmony_habitat'

qd la bdd est créée :

en premier, faire tourner le script 00 de création des 6 tables

puis, pour le peuplement, faire tourner les scripts de peuplement dans l'ordre suivant :

Attention ! -> 	Certains scripts risquent de durer longtemps, surtout pour la table 'crime'
		et (moins) pour 'commune' et 'position_gps'

01 - table 'region'
02 - table 'departement'
03 - table 'position_gps'
04 - table 'commune'
05 - table 'crime_categorie'
06 - table 'crime'

sinon ca va de coincer pour les clés étrangères.

si jamais ca ne marchait pas, dites le moi sur discord, y'a une marche à suivre à cause des id en auto_increment, on le fera ensemble.
