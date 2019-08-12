#!/usr/bin/env ruby
# frozen_string_literal: true

FIRST_FEMALE_NAMES = [
  'Abigail',
  'Ada',
  'Adela',
  'Adele',
  'Adelen',
  'Adelina',
  'Adeline',
  'Adina',
  'Adine',
  'Adna',
  'Adriana',
  'Agathe',
  'Agnes',
  'Agnethe',
  'Ahlam',
  'Aida',
  'Aila',
  'Ailin',
  'Aina',
  'Aisha',
  'Aiza',
  'Alba',
  'Alea',
  'Aleah',
  'Aleena',
  'Aleksandra',
  'Alette',
  'Alexandra',
  'Alia',
  'Alice',
  'Alicia',
  'Alicja',
  'Alida',
  'Alina',
  'Aline',
  'Alisa',
  'Alise',
  'Alisha',
  'Aliya',
  'Alma',
  'Alva',
  'Alvilde',
  'Amal',
  'Amalia',
  'Amalie',
  'Amanda',
  'Amelia',
  'Amelie',
  'Amelija',
  'Amina',
  'Aminda',
  'Amine',
  'Amira',
  'Amna',
  'Amy',
  'Ana',
  'Anastasia',
  'Anaya',
  'Andrea',
  'Andrine',
  'Ane',
  'Anea',
  'Anette',
  'Angela',
  'Angelica',
  'Angelika',
  'Angelina',
  'Anine',
  'Anisa',
  'Anita',
  'Anja',
  'Ann',
  'Anna',
  'Annabel',
  'Annabell',
  'Annabelle',
  'Anne',
  'Anneli',
  'Annie',
  'Annika',
  'Anniken',
  'Anny',
  'Antonina',
  'Aria',
  'Ariana',
  'Ariane',
  'Ariel',
  'Arina',
  'Arsema',
  'Arya',
  'Asma',
  'Asta',
  'Astri',
  'Astrid',
  'Athena',
  'Augusta',
  'Aurelia',
  'Aurora',
  'Ava',
  'Aya',
  'Ayan',
  'Ayat',
  'Ayla',
  'Aylin',
  'Beatrice',
  'Bella',
  'Benedicte',
  'Benedikte',
  'Bertine',
  'Bettina',
  'Bianca',
  'Bushra',
  'Camilla',
  'Carina',
  'Carla',
  'Carmen',
  'Caroline',
  'Cassandra',
  'Cathrine',
  'Cecilia',
  'Cecilie',
  'Celia',
  'Celin',
  'Celina',
  'Celine',
  'Charlotte',
  'Chloe',
  'Christina',
  'Christine',
  'Clara',
  'Cornelia',
  'Dagny',
  'Dania',
  'Daniela',
  'Daniella',
  'Diana',
  'Dima',
  'Dina',
  'Dorthea',
  'Ea',
  'Ebba',
  'Edda',
  'Edel',
  'Edith',
  'Eila',
  'Eileen',
  'Eir',
  'Eira',
  'Eiril',
  'Eirill',
  'Eirin',
  'Eivor',
  'Ela',
  'Eldana',
  'Elea',
  'Eleah',
  'Elena',
  'Eleonora',
  'Eli',
  'Eliana',
  'Elida',
  'Elif',
  'Elin',
  'Elina',
  'Eline',
  'Elinor',
  'Elisa',
  'Elisabeth',
  'Elise',
  'Eliza',
  'Elizabeth',
  'Ella',
  'Elle',
  'Ellen',
  'Elli',
  'Ellie',
  'Ellinor',
  'Elly',
  'Elma',
  'Elsa',
  'Else',
  'Elvine',
  'Elvira',
  'Ema',
  'Embla',
  'Emeli',
  'Emelie',
  'Emely',
  'Emilia',
  'Emilie',
  'Emilija',
  'Emily',
  'Emina',
  'Emine',
  'Emma',
  'Emmeli',
  'Emmelin',
  'Emmeline',
  'Emmi',
  'Emmie',
  'Emmy',
  'Enya',
  'Erica',
  'Erika',
  'Erle',
  'Estelle',
  'Ester',
  'Esther',
  'Eva',
  'Evelina',
  'Evelyn',
  'Fanny',
  'Farah',
  'Fatima',
  'Fatma',
  'Felicia',
  'Fie',
  'Filippa',
  'Fiona',
  'Fredrikke',
  'Freja',
  'Freya',
  'Freyja',
  'Frida',
  'Fride',
  'Frøya',
  'Gabija',
  'Gabriela',
  'Gabriele',
  'Gabriella',
  'Gabrielle',
  'Gina',
  'Gloria',
  'Grace',
  'Greta',
  'Gunhild',
  'Guro',
  'Hadia',
  'Hafsa',
  'Hailey',
  'Hala',
  'Halima',
  'Hana',
  'Hanan',
  'Hani',
  'Hanna',
  'Hannah',
  'Hanne',
  'Hedda',
  'Hedvig',
  'Heidi',
  'Helen',
  'Helena',
  'Helene',
  'Helin',
  'Helle',
  'Helmine',
  'Hennie',
  'Henny',
  'Henriette',
  'Hermine',
  'Hiba',
  'Hilde',
  'Iben',
  'Ida',
  'Idun',
  'Idunn',
  'Iman',
  'Ina',
  'Inaya',
  'Ine',
  'Ines',
  'Inga',
  'Ingebjørg',
  'Ingeborg',
  'Inger',
  'Ingrid',
  'Ingvild',
  'Irene',
  'Iris',
  'Irmelin',
  'Isa',
  'Isabel',
  'Isabell',
  'Isabella',
  'Isabelle',
  'Iselin',
  'Isra',
  'Ive',
  'Ivi',
  'Ivy',
  'Jana',
  'Jannat',
  'Janne',
  'Jasmin',
  'Jasmine',
  'Jennie',
  'Jennifer',
  'Jenny',
  'Jessica',
  'Joanna',
  'Johanna',
  'Johanne',
  'Josefine',
  'Josephine',
  'Julia',
  'Juliane',
  'Julianne',
  'Julie',
  'June',
  'Juni',
  'Kaia',
  'Kaisa',
  'Kaja',
  'Kajsa',
  'Kamila',
  'Kamile',
  'Kamilla',
  'Karen',
  'Kari',
  'Karin',
  'Karina',
  'Karine',
  'Karla',
  'Karolina',
  'Karoline',
  'Katarina',
  'Kathrine',
  'Katrine',
  'Kayla',
  'Khadija',
  'Kine',
  'Kira',
  'Klara',
  'Konstanse',
  'Kornelia',
  'Kristiane',
  'Kristin',
  'Kristina',
  'Kristine',
  'Laiba',
  'Laila',
  'Lamar',
  'Lana',
  'Lara',
  'Laura',
  'Lea',
  'Leah',
  'Leana',
  'Leila',
  'Leja',
  'Lena',
  'Lene',
  'Leni',
  'Leona',
  'Leonora',
  'Lerke',
  'Leyla',
  'Lia',
  'Liana',
  'Liepa',
  'Liliana',
  'Lilja',
  'Lilje',
  'Lilli',
  'Lillian',
  'Lillie',
  'Lilly',
  'Lily',
  'Lina',
  'Linda',
  'Linde',
  'Line',
  'Linea',
  'Linn',
  'Linnea',
  'Lisa',
  'Lise',
  'Liv',
  'Liva',
  'Live',
  'Livia',
  'Lone',
  'Lotta',
  'Lotte',
  'Louisa',
  'Louise',
  'Lovise',
  'Luca',
  'Lucia',
  'Lucy',
  'Luka',
  'Luna',
  'Lycke',
  'Lydia',
  'Lykke',
  'Lærke',
  'Madeleine',
  'Madelen',
  'Madelene',
  'Magdalena',
  'Maia',
  'Maida',
  'Maiken',
  'Maja',
  'Malak',
  'Malena',
  'Malene',
  'Mali',
  'Malin',
  'Marcelina',
  'Maren',
  'Margit',
  'Margrethe',
  'Mari',
  'Maria',
  'Mariam',
  'Marianne',
  'Marie',
  'Mariel',
  'Mariell',
  'Marielle',
  'Marina',
  'Marion',
  'Marit',
  'Marita',
  'Marlene',
  'Marta',
  'Marte',
  'Martha',
  'Marthe',
  'Martina',
  'Martine',
  'Martyna',
  'Marwa',
  'Mary',
  'Maryam',
  'Mathea',
  'Mathilda',
  'Mathilde',
  'Matilda',
  'Matilde',
  'Maud',
  'May',
  'Maya',
  'Medina',
  'Melina',
  'Melinda',
  'Melissa',
  'Mia',
  'Michelle',
  'Mie',
  'Mikaela',
  'Mila',
  'Milana',
  'Milea',
  'Mileah',
  'Milena',
  'Milia',
  'Milja',
  'Milla',
  'Mille',
  'Millie',
  'Mina',
  'Mira',
  'Miriam',
  'Moa',
  'Molly',
  'Mona',
  'Monika',
  'Muna',
  'Munira',
  'My',
  'Nadia',
  'Najma',
  'Nanna',
  'Naomi',
  'Natalia',
  'Natalie',
  'Nathalie',
  'Nawal',
  'Nela',
  'Nelia',
  'Nellie',
  'Nelly',
  'Nicole',
  'Nicoline',
  'Nikola',
  'Nikoline',
  'Nila',
  'Nina',
  'Noelia',
  'Noelle',
  'Noor',
  'Noora',
  'Nora',
  'Norah',
  'Nour',
  'Nova',
  'Oda',
  'Olava',
  'Olea',
  'Oline',
  'Olivia',
  'Oliwia',
  'Othelia',
  'Othelie',
  'Othilie',
  'Otilie',
  'Ovidia',
  'Paula',
  'Paulina',
  'Pauline',
  'Pernille',
  'Petra',
  'Pia',
  'Pola',
  'Rachel',
  'Ragna',
  'Ragnhild',
  'Rahaf',
  'Rakel',
  'Randi',
  'Rania',
  'Rawan',
  'Rayan',
  'Rebecca',
  'Rebekka',
  'Regine',
  'Rikke',
  'Rita',
  'Ronja',
  'Rose',
  'Rufta',
  'Runa',
  'Ruth',
  'Sabrina',
  'Safa',
  'Saga',
  'Sahar',
  'Salma',
  'Samantha',
  'Samira',
  'Sana',
  'Sandra',
  'Sanna',
  'Sannah',
  'Sanne',
  'Sara',
  'Sarah',
  'Savannah',
  'Selda',
  'Selena',
  'Selin',
  'Selina',
  'Seline',
  'Selma',
  'Serina',
  'Serine',
  'Sham',
  'Sidra',
  'Sienna',
  'Signe',
  'Sigrid',
  'Siham',
  'Silja',
  'Silje',
  'Simona',
  'Simone',
  'Sina',
  'Sine',
  'Siren',
  'Siri',
  'Smilte',
  'Sofia',
  'Sofie',
  'Sofija',
  'Sol',
  'Solveig',
  'Sonia',
  'Sonja',
  'Sophia',
  'Sophie',
  'Stella',
  'Stina',
  'Stine',
  'Sumaya',
  'Sundus',
  'Sunniva',
  'Susanna',
  'Susanne',
  'Synne',
  'Synnøve',
  'Tala',
  'Tale',
  'Talia',
  'Tara',
  'Tea',
  'Teja',
  'Thale',
  'Thalia',
  'Thea',
  'Thelma',
  'Therese',
  'Thilde',
  'Tia',
  'Tilda',
  'Tilde',
  'Tilia',
  'Tilje',
  'Tilla',
  'Tina',
  'Tindra',
  'Tine',
  'Tiril',
  'Tirill',
  'Tomine',
  'Tone',
  'Tonje',
  'Tora',
  'Trine',
  'Tuva',
  'Tyra',
  'Ugne',
  'Ulla',
  'Ulrikke',
  'Una',
  'Urte',
  'Valentina',
  'Vanessa',
  'Vega',
  'Vera',
  'Veronica',
  'Veronika',
  'Veslemøy',
  'Victoria',
  'Vida',
  'Viktoria',
  'Vilde',
  'Vilja',
  'Vilje',
  'Villemo',
  'Vilma',
  'Vilte',
  'Viola',
  'Vivian',
  'Vår',
  'Vårin',
  'Weronika',
  'Wiktoria',
  'Wilma',
  'Yara',
  'Yasmin',
  'Ylva',
  'Yusra',
  'Åsa',
  'Åse',
  'Åsne',
  'Zahra',
  'Zainab',
  'Zara',
  'Zoe',
  'Zofia',
  'Zuzanna',
]
FIRST_MALE_NAMES = [
  'Aaron',
  'Abbas',
  'Abdirahman',
  'Abdul',
  'Abdullah',
  'Abdullahi',
  'Abdulrahman',
  'Abel',
  'Adam',
  'Adamas',
  'Adas',
  'Adnan',
  'Adrian',
  'Agnar',
  'Ahmad',
  'Ahmed',
  'Aiden',
  'Ailo',
  'Akram',
  'Aksel',
  'Alan',
  'Albert',
  'Aleksander',
  'Alex',
  'Alexander',
  'Alf',
  'Alfred',
  'Ali',
  'Alvar',
  'Alvin',
  'Amadeus',
  'Amandus',
  'Amar',
  'Amin',
  'Amir',
  'Amund',
  'Anas',
  'Anders',
  'Andre',
  'Andreas',
  'Anthony',
  'Anton',
  'Antoni',
  'Antonio',
  'Aras',
  'Are',
  'Arham',
  'Arian',
  'Arijus',
  'Arin',
  'Arman',
  'Armin',
  'Arn',
  'Arnas',
  'Arne',
  'Aron',
  'Aronas',
  'Arthur',
  'Artur',
  'Arvid',
  'Arvin',
  'Aryan',
  'Asbjørn',
  'Ask',
  'Askil',
  'Aslak',
  'Audun',
  'August',
  'Augustas',
  'Aune',
  'Axel',
  'Ayaan',
  'Ayan',
  'Ayman',
  'Ayoub',
  'Ayub',
  'Ayuub',
  'Balder',
  'Baran',
  'Bartosz',
  'Bastian',
  'Ben',
  'Benas',
  'Bendik',
  'Benjamin',
  'Bernard',
  'Bernhard',
  'Bilal',
  'Billy',
  'Birk',
  'Bjørn',
  'Bjørnar',
  'Bo',
  'Brage',
  'Brede',
  'Brian',
  'Bror',
  'Bruno',
  'Brynjar',
  'Carl',
  'Carlos',
  'Carsten',
  'Casper',
  'Caspian',
  'Charlie',
  'Chris',
  'Chrisander',
  'Christer',
  'Christian',
  'Christoffer',
  'Christopher',
  'Colin',
  'Conrad',
  'Cornelius',
  'Dag',
  'Damian',
  'Danial',
  'Daniel',
  'Danny',
  'Darin',
  'David',
  'Dawid',
  'Denis',
  'Deniz',
  'Dennis',
  'Dexter',
  'Didrik',
  'Diego',
  'Domas',
  'Dominic',
  'Dominik',
  'Dominykas',
  'Dovydas',
  'Dylan',
  'Ebbe',
  'Edgar',
  'Edin',
  'Edmund',
  'Edvald',
  'Edvard',
  'Edvin',
  'Edward',
  'Edwin',
  'Eik',
  'Eilev',
  'Eilif',
  'Einar',
  'Eirik',
  'Eivind',
  'Eldar',
  'Eliah',
  'Elian',
  'Elias',
  'Elijah',
  'Elling',
  'Elliot',
  'Elliott',
  'Elmer',
  'Elvin',
  'Elyas',
  'Emanuel',
  'Emil',
  'Emilian',
  'Emilio',
  'Emilis',
  'Emin',
  'Emir',
  'Emmanuel',
  'Emmett',
  'Emre',
  'Emrik',
  'Endre',
  'Enes',
  'Eren',
  'Eric',
  'Erik',
  'Erlend',
  'Erling',
  'Eryk',
  'Eskil',
  'Eskild',
  'Espen',
  'Ethan',
  'Evan',
  'Evander',
  'Even',
  'Fabian',
  'Falk',
  'Felix',
  'Ferdinand',
  'Filip',
  'Fillip',
  'Finn',
  'Franciszek',
  'Frank',
  'Frans',
  'Frederik',
  'Fredrik',
  'Fridtjof',
  'Gabriel',
  'Gard',
  'Gaute',
  'Georg',
  'Gunnar',
  'Gustas',
  'Gustav',
  'Haakon',
  'Hallvard',
  'Halvard',
  'Halvor',
  'Hamza',
  'Hans',
  'Harald',
  'Harun',
  'Hasan',
  'Hashim',
  'Hassan',
  'Hauk',
  'Heine',
  'Helge',
  'Helmer',
  'Henning',
  'Henrik',
  'Henry',
  'Herkus',
  'Herman',
  'Hermann',
  'Hjalmar',
  'Hubert',
  'Hugo',
  'Hussein',
  'Håkon',
  'Håvard',
  'Ian',
  'Ibrahim',
  'Idris',
  'Igor',
  'Ilyas',
  'Imran',
  'Imre',
  'Ingmar',
  'Isa',
  'Isaac',
  'Isac',
  'Isak',
  'Ismail',
  'Ivan',
  'Ivar',
  'Iver',
  'Ivo',
  'Jack',
  'Jacob',
  'Jakob',
  'Jakub',
  'James',
  'Jamie',
  'Jan',
  'Jaran',
  'Jarle',
  'Jasper',
  'Jayden',
  'Jens',
  'Jeppe',
  'Jesper',
  'Jo',
  'Joachim',
  'Joakim',
  'Joar',
  'Joel',
  'Johan',
  'Johann',
  'Johannes',
  'John',
  'Jokubas',
  'Jon',
  'Jonah',
  'Jonas',
  'Jonatan',
  'Jonathan',
  'Jone',
  'Joris',
  'Josef',
  'Joseph',
  'Joshua',
  'Jostein',
  'Julian',
  'Julius',
  'Justin',
  'Jørgen',
  'Kacper',
  'Kai',
  'Kajus',
  'Kamil',
  'Karim',
  'Karl',
  'Karol',
  'Karsten',
  'Kasper',
  'Kaspian',
  'Kenan',
  'Kenneth',
  'Kent',
  'Kevin',
  'Khaled',
  'Khalid',
  'Kian',
  'Kim',
  'Kjell',
  'Kjetil',
  'Knut',
  'Konrad',
  'Kornelius',
  'Kristian',
  'Kristoffer',
  'Kristupas',
  'Krystian',
  'Kåre',
  'Lars',
  'Lasse',
  'Laurits',
  'Lauritz',
  'Lavrans',
  'Leander',
  'Leif',
  'Lennox',
  'Leo',
  'Leon',
  'Leonard',
  'Leonardo',
  'Leonel',
  'Levi',
  'Liam',
  'Lias',
  'Linus',
  'Lionel',
  'Loke',
  'Lorik',
  'Louie',
  'Louis',
  'Luca',
  'Lucas',
  'Ludvig',
  'Ludvik',
  'Luis',
  'Luka',
  'Lukas',
  'Luke',
  'Lyder',
  'Maciej',
  'Mads',
  'Magne',
  'Magnus',
  'Mahamed',
  'Mahdi',
  'Mahir',
  'Mahmoud',
  'Maksim',
  'Maksymilian',
  'Malik',
  'Malte',
  'Malvin',
  'Marcel',
  'Marco',
  'Marcus',
  'Mario',
  'Marius',
  'Mark',
  'Markas',
  'Marko',
  'Markus',
  'Marlon',
  'Martin',
  'Martinius',
  'Martinus',
  'Marvin',
  'Matas',
  'Mateo',
  'Mateusz',
  'Matheo',
  'Matheus',
  'Mathias',
  'Mathis',
  'Matias',
  'Mats',
  'Matteo',
  'Matteus',
  'Matthew',
  'Matthias',
  'Mattias',
  'Mattis',
  'Max',
  'Maxim',
  'Maximilian',
  'Maximillian',
  'Melvin',
  'Michael',
  'Michal',
  'Mika',
  'Mikael',
  'Mikail',
  'Mikal',
  'Mike',
  'Mikkel',
  'Mikolaj',
  'Milan',
  'Milian',
  'Millian',
  'Milo',
  'Mio',
  'Mohamad',
  'Mohamed',
  'Mohammad',
  'Mohammed',
  'Mons',
  'Morgan',
  'Morten',
  'Mostafa',
  'Muhammad',
  'Muhammed',
  'Musab',
  'Mustafa',
  'Natan',
  'Nataniel',
  'Nathan',
  'Nathaniel',
  'Natnael',
  'Neo',
  'Nicholas',
  'Nicklas',
  'Nickolai',
  'Niclas',
  'Nico',
  'Nicolai',
  'Nicolas',
  'Nicolay',
  'Niklas',
  'Nikodem',
  'Nikolai',
  'Nikolas',
  'Nikolay',
  'Nils',
  'Noa',
  'Noah',
  'Noel',
  'Nojus',
  'Odd',
  'Odin',
  'Ola',
  'Olaf',
  'Olai',
  'Olander',
  'Olav',
  'Ole',
  'Oliver',
  'Olivier',
  'Oliwier',
  'Olve',
  'Omar',
  'Omer',
  'Oscar',
  'Oskar',
  'Osman',
  'Otto',
  'Owen',
  'Patrick',
  'Patrik',
  'Patryk',
  'Paul',
  'Peder',
  'Pelle',
  'Per',
  'Peter',
  'Petter',
  'Philip',
  'Phillip',
  'Piotr',
  'Preben',
  'Pål',
  'Rafael',
  'Ragnar',
  'Rasmus',
  'Ravn',
  'Rayan',
  'Richard',
  'Ridwan',
  'Robert',
  'Robin',
  'Rokas',
  'Rolf',
  'Romeo',
  'Ruben',
  'Runar',
  'Ryan',
  'Said',
  'Sakarias',
  'Salman',
  'Sam',
  'Sami',
  'Samir',
  'Samson',
  'Samuel',
  'Sander',
  'Scott',
  'Sean',
  'Sebastian',
  'Selmer',
  'Severin',
  'Sigmund',
  'Sigurd',
  'Sigve',
  'Silas',
  'Simen',
  'Simon',
  'Sindre',
  'Sivert',
  'Sjur',
  'Snorre',
  'Sofus',
  'Solan',
  'Sondre',
  'Stanislaw',
  'Stefan',
  'Steffen',
  'Stein',
  'Steinar',
  'Steven',
  'Stian',
  'Storm',
  'Sune',
  'Svein',
  'Sven',
  'Sverre',
  'Syed',
  'Syver',
  'Sølve',
  'Szymon',
  'Tage',
  'Taha',
  'Taim',
  'Tallak',
  'Tarjei',
  'Tellef',
  'Teo',
  'Teodor',
  'Terje',
  'Theo',
  'Theodor',
  'Theodore',
  'Thomas',
  'Thor',
  'Thorvald',
  'Tian',
  'Tidemann',
  'Tim',
  'Timian',
  'Tinius',
  'Tobias',
  'Tom',
  'Tomas',
  'Tommy',
  'Tony',
  'Tor',
  'Torben',
  'Torbjørn',
  'Tord',
  'Tore',
  'Torgeir',
  'Torje',
  'Torjus',
  'Tormod',
  'Torstein',
  'Torvald',
  'Tristan',
  'Trond',
  'Troy',
  'Truls',
  'Trygve',
  'Trym',
  'Tymon',
  'Ulrik',
  'Varg',
  'Vebjørn',
  'Vegar',
  'Vegard',
  'Vemund',
  'Vetle',
  'Victor',
  'Vidar',
  'Viggo',
  'Viktor',
  'Vilhelm',
  'Viljar',
  'Ville',
  'Vilmer',
  'Vincent',
  'Vinjar',
  'Walter',
  'Wiktor',
  'Wilhelm',
  'William',
  'Wilmer',
  'Wojciech',
  'Yahya',
  'Yasin',
  'Yasir',
  'Yazan',
  'Yosef',
  'Younes',
  'Yousef',
  'Youssef',
  'Yusuf',
  'Ørjan',
  'Øystein',
  'Øyvind',
  'Ådne',
  'Åsmund',
  'Zakaria',
  'Zakariya'
]

def get_first_name
  if rand.round == 0
    FIRST_FEMALE_NAMES[rand(FIRST_FEMALE_NAMES.size)]
  else
    FIRST_MALE_NAMES[rand(FIRST_MALE_NAMES.size)]
  end
end