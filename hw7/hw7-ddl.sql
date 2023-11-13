# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!


CREATE TABLE skills (
    id INT NOT NULL, 
    name VARCHAR(256) NOT NULL,
    description VARCHAR(256) NOT NULL,
    url VARCHAR(256),
    tag VARCHAR(256) NOT NULL,
    time_commitment INT, 
    PRIMARY KEY (id)
    
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, name, description, url, tag, time_commitment)
values
    (001, 'Adobe Certified Expert', 'Certifications for specific Adobe software like Photoshop, Illustrator, or InDesign', 'https://experienceleague.adobe.com/docs/certification/program/overview.html?lang=en', 'skill 1', 20),
    (002, 'UX/UI Design Certification', 'Certification for User Experience and User Interface Design', 'https://www.nngroup.com/certification/', 'skill 2', 8),
    (003, 'HTML and CSS Proficiency', 'Strong knowledge of HTML and CSS for web design', 'https://www.w3schools.com/', 'skill 3', 15),
    (004, 'JavaScript Developer', 'Proficiency in JavaScript programming and web development', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript', 'skill 4', 20),
    (005, 'AWS Certified Developer', 'Certification for Amazon Web Services development', 'https://aws.amazon.com/certification/certified-developer-associate/', 'skill 5', 30),
    (006, 'Python Programming Certification', 'Certification for proficiency in Python programming', 'https://www.python.org/', 'skill 6', 35),
    (007, 'CISSP - Certified Information Systems Security Professional', 'Certification for information security', 'https://www.isc2.org/certifications/CISSP', 'skill 7', 18),
    (008, 'DevOps Certification', 'Certifications for specific database systems, such as Oracle or MongoDB', NULL, 'skill 8', 40);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    last_name VARCHAR(256) NOT NULL,
    first_name VARCHAR(256),
    email VARCHAR(256),
    linkedin_url VARCHAR(256),
    headshot_url VARCHAR(256),
    discord_handle VARCHAR(256),
    brief_bio VARCHAR(256),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people(id, last_name, first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
values
    (1, 'Smith', 'John', 'john.smith@email.com', 'https://www.linkedin.com/in/johnsmith', 'john_headshot.jpg', 'john_discord', 'John Smith is a software developer with a passion for front-end web development.', '2022-01-15'),
    (2, 'Johnson', 'Alice', 'alice.johnson@email.com', 'https://www.linkedin.com/in/alicejohnson', 'alice_headshot.jpg', 'alice_discord', 'Alice Johnson is a UX/UI designer specializing in user-centered design.', '2022-02-20'),
    (3, 'Brown', 'Bob', 'bob.brown@email.com', 'https://www.linkedin.com/in/bobbrown', 'bob_headshot.jpg', 'bob_discord', 'Bob Brown is a data scientist with expertise in machine learning and data analysis.', '2022-03-25'),
    (4, 'Davis', 'Eve', 'eve.davis@email.com', 'https://www.linkedin.com/in/evedavis', 'eve_headshot.jpg', 'eve_discord', 'Eve Davis is a project manager experienced in leading software development teams.', '2022-04-30'),
    (5, 'Wilson', 'Grace', 'grace.wilson@email.com', 'https://www.linkedin.com/in/gracewilson', 'grace_headshot.jpg', 'grace_discord', 'Grace Wilson is a graphic designer with a focus on branding and visual identity.', '2022-05-15'),
    (6, 'Miller', 'Mike', 'mike.miller@email.com', 'https://www.linkedin.com/in/mikemiller', 'mike_headshot.jpg', 'mike_discord', 'Mike Miller is a full-stack developer proficient in multiple programming languages.', '2022-06-20'),
    (7, 'Martinez', 'Olivia', 'olivia.martinez@example.com', 'https://www.linkedin.com/in/oliviamartinez', 'olivia_martinez.jpg', 'OliviaMartinez#9876', 'Front-end developer with a passion for creating beautiful user interfaces.', '2023-05-12'),
    (8, 'Lee', 'James', 'james.lee@example.com', 'https://www.linkedin.com/in/jameslee', 'james_lee.jpg', 'JamesLee#5678', 'Experienced software engineer with a focus on backend development.', '2023-06-20'),
    (9, 'Taylor', 'Ella', 'ella.taylor@example.com', 'https://www.linkedin.com/in/ellataylor', 'ella_taylor.jpg', 'EllaTaylor#1234', 'Aspiring web designer with a keen eye for aesthetics.', '2023-07-05'),
    (10, 'Harris', 'Noah', 'noah.harris@example.com', 'https://www.linkedin.com/in/noahharris', 'noah_harris.jpg', 'NoahHarris#3456', 'Recent graduate passionate about full-stack web development.', '2023-08-15');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id INT NOT NULL auto_increment,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills(skills_id, people_id, date_acquired)
values
    (1, 1, '2022-06-15'), 
    (3, 1, '2023-07-20'), 
    (6, 1, '2023-09-05'), 
    (3, 2, '2023-08-10'), 
    (4, 2, '2022-09-30'), 
    (5, 2, '2021-01-02'),
    (1, 3, '2021-01-04'),
    (5, 3, '2021-12-25'),
    (3, 5, '2019-10-16'),
    (6, 5, '2019-11-14'),
    (2, 6, '2015-10-05'),
    (3, 6, '2020-10-09'),
    (4, 6, '2020-04-07'),
    (3, 7, '2022-08-19'),
    (5, 7, '2017-09-22'),
    (6, 7, '2018-01-12'),
    (1, 8, '2019-03-11'),
    (3, 8, '2022-05-30'),
    (5, 8, '2023-06-29'),
    (6, 8, '2014-11-11'),
    (2, 9, '2010-09-01'),
    (5, 9, '2023-07-05'),
    (6, 9, '2021-12-28'),
    (1, 10, '2021-04-25'),
    (4, 10, '2021-03-28'),
    (5, 10, '2020-01-17');
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    id INT,
    name VARCHAR(256),
    sort_priority INT,
    PRIMARY KEY(id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(id, name, sort_priority)
values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id INT NOT NULL auto_increment,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss and Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(people_id, role_id, date_assigned)
values
    (1, 2, '2023-10-23'),
    (2, 5, '2022-08-09'),
    (2, 6, '2021-05-06'),
    (3, 2, '2022-12-10'),
    (3, 4, '2022-10-09'),
    (4, 3, '2021-11-30'),
    (5, 3, '2021-01-28'),
    (6, 2, '2023-09-19'),
    (6, 1, '2023-04-07'),
    (7, 1, '2023-12-15'),
    (8, 1, '2021-11-07'),
    (8, 4, '2022-03-29'),
    (9, 2, '2022-08-30'),
    (10, 2, '2022-03-06'),
    (10, 1, '2023-09-15');
