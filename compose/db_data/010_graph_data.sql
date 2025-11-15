USE [DemoData]
GO
-- Insert data into node tables. Inserting into a node table is same as inserting into a regular table
PRINT 'Insert Person data'
INSERT INTO Person (ID, name)
    VALUES (1, 'John')
         , (2, 'Mary')
         , (3, 'Alice')
         , (4, 'Jacob')
         , (5, 'Julie');
GO
PRINT 'Insert Resturant data'
INSERT INTO Restaurant (ID, name, city)
    VALUES (1, 'Taco Dell','Bellevue')
         , (2, 'Ginger and Spice','Seattle')
         , (3, 'Noodle Land', 'Redmond');
GO 
PRINT 'Insert City data'
INSERT INTO City (ID, name, stateName)
    VALUES (1,'Bellevue','WA')
         , (2,'Seattle','WA')
         , (3,'Redmond','WA');
GO
-- Insert into edge table. While inserting into an edge table,
-- you need to provide the $node_id from $from_id and $to_id columns.
/* Insert which restaurants each person likes */
PRINT 'Insert likes data'
INSERT INTO likes
    VALUES ((SELECT $node_id FROM Person WHERE ID = 1), (SELECT $node_id FROM Restaurant WHERE ID = 1), 9)
         , ((SELECT $node_id FROM Person WHERE ID = 2), (SELECT $node_id FROM Restaurant WHERE ID = 2), 9)
         , ((SELECT $node_id FROM Person WHERE ID = 3), (SELECT $node_id FROM Restaurant WHERE ID = 3), 9)
         , ((SELECT $node_id FROM Person WHERE ID = 4), (SELECT $node_id FROM Restaurant WHERE ID = 3), 9)
         , ((SELECT $node_id FROM Person WHERE ID = 5), (SELECT $node_id FROM Restaurant WHERE ID = 3), 9);
GO
/* Associate in which city live each person*/
PRINT 'Insert livesIn data'
INSERT INTO livesIn
    VALUES ((SELECT $node_id FROM Person WHERE ID = 1), (SELECT $node_id FROM City WHERE ID = 1))
         , ((SELECT $node_id FROM Person WHERE ID = 2), (SELECT $node_id FROM City WHERE ID = 2))
         , ((SELECT $node_id FROM Person WHERE ID = 3), (SELECT $node_id FROM City WHERE ID = 3))
         , ((SELECT $node_id FROM Person WHERE ID = 4), (SELECT $node_id FROM City WHERE ID = 3))
         , ((SELECT $node_id FROM Person WHERE ID = 5), (SELECT $node_id FROM City WHERE ID = 1));
GO
/* Insert data where the restaurants are located */
PRINT 'Insert locatedIn data'
INSERT INTO locatedIn
    VALUES ((SELECT $node_id FROM Restaurant WHERE ID = 1), (SELECT $node_id FROM City WHERE ID =1))
         , ((SELECT $node_id FROM Restaurant WHERE ID = 2), (SELECT $node_id FROM City WHERE ID =2))
         , ((SELECT $node_id FROM Restaurant WHERE ID = 3), (SELECT $node_id FROM City WHERE ID =3));
GO
/* Insert data into the friendOf edge */
PRINT 'Insert friendOf data'
INSERT INTO friendOf
    VALUES ((SELECT $NODE_ID FROM Person WHERE ID = 1), (SELECT $NODE_ID FROM Person WHERE ID = 2))
         , ((SELECT $NODE_ID FROM Person WHERE ID = 2), (SELECT $NODE_ID FROM Person WHERE ID = 3))
         , ((SELECT $NODE_ID FROM Person WHERE ID = 3), (SELECT $NODE_ID FROM Person WHERE ID = 1))
         , ((SELECT $NODE_ID FROM Person WHERE ID = 4), (SELECT $NODE_ID FROM Person WHERE ID = 2))
         , ((SELECT $NODE_ID FROM Person WHERE ID = 5), (SELECT $NODE_ID FROM Person WHERE ID = 4));
GO
