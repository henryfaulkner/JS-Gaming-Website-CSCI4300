/*
creating database
*/
CREATE SCHEMA IF NOT EXISTS jsgamedb;
USE jsgamedb;

/*
creating tables
user stores all the users - their login info, name, and amount of tokens they have
product stores all the products available in the store - their name, the name of the picture used by them, and their price
scores stores all the high scores for both games, game is either 'snake' or 'bird'
user and product have a many to many relationship - user can have many products, product can be owned by many users
user and scores have a many to one relationship - user can have many scores
*/

CREATE TABLE user (screenname varchar(255), email varchar(255), pass varchar(255), tokens int, primary key(screenname));
CREATE TABLE product (id int NOT NULL AUTO_INCREMENT, name varchar(255), picture_name varchar (255), price int, primary key(id));
CREATE TABLE scores (screenname varchar(255), score int default 0, game varchar(5), foreign key (screenname) references user (screenname) ON DELETE CASCADE);
CREATE TABLE ownsproduct (screenname varchar(255), id int, foreign key(screenname) references user (screenname), 
foreign key (id) references product (id));

/*
sample insertions
*/

#users
INSERT into user () VALUES 
('ELIT3_GAMER', 'email@email.com', '1234', 0);
INSERT into user () VALUES
('BOB', 'email2@email.com', '2122', 0);

#products
INSERT into product (name, picture_name, price) VALUES
('Forest Green Web Background', 'forestgreen', 5);
INSERT into product (name, picture_name, price) VALUES
('Sky Blue Web Background', 'skyblue', 10);
INSERT into product (name, picture_name, price) VALUES
('Khaki Web Background', 'khaki', 0);

#scores 
INSERT into scores() VALUES
('ELIT3_GAMER', 250, 'snake');
INSERT into scores() VALUES
('ELIT3_GAMER', 30, 'bird');
INSERT into scores() VALUES
('BOB', 2, 'bird');
INSERT into scores() VALUES
('HenryFaulkner', 10000, 'bird');
INSERT into scores() VALUES
('HenryFaulkner', 0, 'bird');
INSERT into scores() VALUES
('fakeaccount', 20, 'snake'); 


#ownsproduct
INSERT into ownsproduct() VALUES
('Bob', 3);
INSERT into ownsproduct() VALUES
('ELIT3_GAMER', 1);
INSERT into ownsproduct() VALUES
('ELIT3_GAMER', 2);
INSERT into ownsproduct() VALUES
('ELIT3_GAMER', 3);


/*
sample queries
*/

#get the names of all the products ELIT3_GAMER owns
SELECT name
FROM product, ownsproduct
WHERE product.id = ownsproduct.id and screenname = 'ELIT3_GAMER';

#high scores from flappy bird in descending order
SELECT screenname, score
FROM scores
WHERE game = 'bird'
ORDER BY score desc;

#setting bob's tokens to 15
UPDATE user
SET tokens = 15
WHERE screenname = 'Bob';

SELECT email 
FROM user
WHERE email="hlf46553@uga.edu";

DELETE from user where screenname="Henry1";

SELECT screenname
FROM user 
WHERE email="hlf46553@uga.edu" and pass="Baseball9";

DELETE FROM user WHERE screenname=(SELECT screenname WHERE email="fake@account.com" and pass="Fakeaccount69");
DELETE FROM user WHERE screenname="sd";
SET SQL_SAFE_UPDATES = 0;