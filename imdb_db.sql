-- IMDB Design a DB for IMDB 
-- 1. Movie should have multiple media(Video or Image) 
-- 2. Movie can belongs to multiple Genre 
-- 3. Movie can have multiple reviews and Review can belongs to a user 
-- 4. Artist can have multiple skills 
-- 5. Artist can perform multiple role in a single film


-- Table Movies
create table movies(
    movie_id int PRIMARY KEY,
    movie_title VARCHAR(255),
    movie_director VARCHAR(70),
    movie_released date,
    movie_description TEXT
);

-- Table Genres
create table genres(
    genre_id int,
    genre_name VARCHAR(255),
    PRIMARY KEY(genre_id)
);

-- Table Media
create table media(
    media_id int PRIMARY KEY,
    media_url VARCHAR(255),
    media_type ENUM('video', 'image'),
    foreign key (media_id) references movies(movie_id)
);

-- Table Users
create table users(
    user_id int PRIMARY KEY,
    user_name VARCHAR(255),
    user_password VARCHAR(255)
);

-- Table Reviews
create table reviews(
    review_id int PRIMARY KEY,
    review_comment VARCHAR(255),
    review_rating float,
    review_date date,
    user_id int,
    movie_id int,
    foreign key(review_id) references movies(movie_id),
    foreign key(user_id) references users(user_id),  
);

-- Table Artists
create table artists(
    artist_id int PRIMARY KEY,
    artist_name VARCHAR(255),
)

-- Table Skills
create table skills(
    skills_id int PRIMARY KEY,
    skills_name VARCHAR(255),
)

-- Table Artist Skills
create table artist_skills(
    artist_id int,
    skills_id int,
    primary key (artist_id, skills_id),
    foreign key(artist_id) references artists(artist_id),
    foreign key(skills_id) references skills(skills_id)
)

-- Table Roles
create table roles(
    role_id int primary key,
    role_name VARCHAR(100),
)

-- Table Artist Role
create table artist_roles(
    artist_id int,
    role_id int,
    movie_id int,
    foreign key(artist_id) references artists(artist_id),
    foreign key(role_id) references roles(role_id),
    foreign key(movie_id) references movies(movie_id),
)