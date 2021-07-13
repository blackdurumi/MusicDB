drop table featuring;
drop table music;
drop table albums;
drop table artists;
drop table genres;

create table genres(genre varchar(10), primary key (genre));
create table artists(artist varchar(20), genre varchar(10), primary key (artist), foreign key (genre) references genres);
create table albums(album varchar(20), year varchar(4), genre varchar(10), artist varchar(20), primary key (album), foreign key (genre) references genres, foreign key (artist) references artists);
create table music(music_id varchar(3), title varchar(20), album varchar(20), plays int, primary key (music_id), foreign key (album) references albums);
create table featuring(music_id varchar(3), artist varchar(20), primary key (music_id, artist), foreign key (music_id) references music, foreign key (artist) references artists);

insert into genres values ('Hip-hop');
insert into genres values ('Inde');
insert into genres values ('Ballad');
insert into genres values ('Rock');
insert into genres values ('Dance');

insert into artists values('BTS', 'Hip-hop');
insert into artists values('Changmo', 'Hip-hop');
insert into artists values('IU', 'Inde');
insert into artists values('Jeong seung-hwan', 'Ballad');
insert into artists values('Guckkasten', 'Rock');
insert into artists values('IZ*ONE', 'Dance');
insert into artists values('Brave Girls', 'Dance');
insert into artists values('SUGA', 'Hip-hop');
insert into artists values('Halsey', 'Inde');
insert into artists values('Lee jung-hoon', 'Inde');

insert into albums values('Guckkasten', 2010, 'Rock', 'Guckkasten');
insert into albums values('Mask Singer', 2016, 'Rock', 'Guckkasten');
insert into albums values('One-reeler', 2020, 'Dance', 'IZ*ONE');
insert into albums values('BLOOM*IZ', 2020, 'Dance', 'IZ*ONE');
insert into albums values('HEART*IZ', 2019, 'Dance', 'IZ*ONE');
insert into albums values('Rollin', 2017, 'Dance', 'Brave Girls');
insert into albums values('Map of the Soul', 2019, 'Hip-hop', 'BTS');
insert into albums values('Dynamite', 2020, 'Hip-hop', 'BTS');
insert into albums values('LOVE YOURSELF', 2017, 'Hip-hop', 'BTS');
insert into albums values('Boyhood', 2019, 'Hip-hop', 'Changmo');
insert into albums values('Eight', 2020, 'Inde', 'IU');
insert into albums values('Love poem', 2019, 'Inde', 'IU');
insert into albums values('And spring', 2018, 'Ballad', 'Jeong seung-hwan');

insert into music values(001, 'Mirror', 'Guckkasten', 19111);
insert into music values(002, 'Lazenca, Save us', 'Mask Singer', 36879);
insert into music values(003, 'Don''t cry', 'Mask Singer', 48452);
insert into music values(004, 'Panorama', 'One-reeler', 66367);
insert into music values(005, 'FIESTA', 'BLOOM*IZ', 122061);
insert into music values(006, 'Violeta', 'HEART*IZ', 105865);
insert into music values(007, 'Rollin', 'Rollin', 269632);
insert into music values(009, 'Dynamite', 'Dynamite', 406735);
insert into music values(010, 'Boy with Luv', 'Map of the Soul', 419230);
insert into music values(011, 'DNA', 'LOVE YOURSELF', 391103);
insert into music values(012, 'FAKE LOVE', 'LOVE YOURSELF', 324848);
insert into music values(013, 'METEOR', 'Boyhood', 261683);
insert into music values(014, 'REMEDY', 'Boyhood', 37594);
insert into music values(016, 'Eight', 'Eight', 358591);
insert into music values(017, 'Blueming', 'Love poem', 307446);
insert into music values(018, 'Snowman', 'And spring', 208321);

insert into featuring values(016, 'SUGA');
insert into featuring values(010, 'Halsey');