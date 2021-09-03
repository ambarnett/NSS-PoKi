--What grades are stored in the database?
--Select * From Grade;
--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

--What emotions may be associated with a poem?
--Select * From Emotion;

--How many poems are in the database?

Select COUNT(*) as NumOfPoems From Poem;

--Sort authors alphabetically by name. What are the names of the top 76 authors?
Select Top 76 
	Name 
From 
	author a
ORDER BY a.Name ;

--Starting with the above query, add the grade of each of the authors.
Select TOP 76 
	a.Name as Author, 
	g.Name as Grade
From 
	Author a
JOIN Grade g on a.GradeId = g.Id
ORDER BY a.Name;

--Starting with the above query, add the recorded gender of each of the authors.
Select TOP 76
	a.Name as Author,
	g.Name as Grade,
	gn.Name as Gender
From 
	Author a 
JOIN Grade g ON a.GradeId = g.Id
JOIN Gender gn ON a.GenderId = gn.Id
ORDER BY a.Name;

--What is the total number of words in all poems in the database?
Select SUM(WordCount) as 'Total Word Count' 
From Poem; 

--Which poem has the fewest characters?
Select TOP 1 *
From 
	Poem
ORDER BY Poem.CharCount ASC;

--How many authors are in the third grade?
Select COUNT(*) as 'Authors in the 3rd Grade'
From Author a 
JOIN Grade g ON a.GradeId = g.Id
WHERE g.Id = 3;

--How many total authors are in the first through third grades?
Select COUNT(*) as 'Authors in grades 1st through 3rd'
From Author a
JOIN Grade g ON a.GradeId = g.Id
WHERE g.Id != 5 AND g.Id != 4;

--What is the total number of poems written by fourth graders?
Select COUNT(p.Id) as 'Poems written by 4th Graders'
From Author a
JOIN Poem p ON a.Id = p.AuthorId
JOIN Grade g ON a.GradeId = g.Id
WHERE g.Id = 4;

--How many poems are there per grade?
Select 
	COUNT(p.Id) as 'Poems written by 1st Graders'
	COUNT(p.Id) as 'Poems written by 2nd Graders'


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)

--What is the title of the poem that has the most words?

--Which author(s) have the most poems? (Remember authors can have the same name.)
--Select a.Id, a.Name, COUNT(*) 'Number of Poems'
--FROM Author a
--JOIN Poem p on p.AuthorId = a.Id
--GROUP BY a.Id, a.Name
--ORDER BY 'Number of Poems' DESC;

--How many poems have an emotion of sadness?

--How many poems are not associated with any emotion?

--Which emotion is associated with the least number of poems?

--Which grade has the largest number of poems with an emotion of joy?
Select TOP 1 g.name, count(p.id) 'Num of Poems'
FROM Poem p
JOIN PoemEmotion pe ON p.Id = pe.PoemId
JOIN Emotion e ON e.Id = pe.EmotionId
JOIN Author a ON p.AuthorId = a.Id
JOIN Grade g ON g.Id = a.GradeId
WHERE e.Name = 'Joy'
GROUP BY g.Name
ORDER BY 'Num of Poems' DESC;

--Which gender has the least number of poems with an emotion of fear?