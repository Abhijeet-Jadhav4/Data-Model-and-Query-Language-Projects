CREATE TABLE account(
user_id int(20),
email_id varchar(140) NOT NULL UNIQUE,
password varchar(20) NOT NULL,
display_name varchar(20) NOT NULL UNIQUE,
bio varchar(140),
acc_created_on Date NOT NULL,
last_logged_in Date,
PRIMARY KEY(user_id)
);

CREATE TABLE drafted_tweets(
drafted_tweet_id int(20),
drafted_tweet_content varchar(140) NOT NULL,
user_id int(20) NOT NULL,
time datetime,
primary key(drafted_tweet_id),
FOREIGN KEY (user_id) REFERENCES account (user_id)
);

CREATE TABLE follow(
follower_id int(20),
user_id int(20) NOT NULL,
primary key(follower_id),
FOREIGN KEY (user_id) REFERENCES account (user_id)
);


CREATE TABLE followings(
following_id int(20),
user_id int(20) NOT NULL,
PRIMARY KEY(following_id),
FOREIGN KEY (user_id) REFERENCES account (user_id)
);


CREATE TABLE tweet(
tweet_id int(20),
user_id int(20) NOT NULL,
tweet_content varchar(140) NOT NULL,
time datetime,
PRIMARY KEY(tweet_id),
FOREIGN KEY (user_id) REFERENCES account (user_id)
);



CREATE TABLE retweet(
rt_id int(20),
user_id int(20) NOT NULL,
tweet_id int(20) NOT NULL,
retweet_content varchar(140) NOT NULL,
time datetime,
PRIMARY KEY(rt_id),
FOREIGN KEY (tweet_id) REFERENCES tweet (tweet_id),
FOREIGN KEY (user_id) REFERENCES account (user_id)
);

CREATE TABLE comment(

comment_id int(20),
user_id int(20) NOT NULL,
tweet_id int(20) NOT NULL,
comment_content varchar(140) NOT NULL,
time datetime,
PRIMARY KEY(comment_id),
FOREIGN KEY (user_id) REFERENCES account (user_id),
FOREIGN KEY (tweet_id) REFERENCES tweet (tweet_id)
);


CREATE TABLE like_info(
like_id int(20),
user_id int(20) NOT NULL,
tweet_id int(20) NOT NULL,
PRIMARY KEY(like_id),
FOREIGN KEY (user_id) REFERENCES account (user_id),
FOREIGN KEY (tweet_id) REFERENCES tweet (tweet_id)
);
