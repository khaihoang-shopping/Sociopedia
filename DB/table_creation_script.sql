CREATE TABLE users(
    user_id BIGINT NOT NULL,
    email VARCHAR(255) NULL,
    name VARCHAR(255) NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    profile_info JSON NOT NULL
);
ALTER TABLE
    users ADD PRIMARY KEY(user_id);
ALTER TABLE
    users ADD UNIQUE users_email_unique(email);

CREATE TABLE posts(
    post_id BIGINT NOT NULL,
    user_id INTEGER NULL,
    content VARCHAR(255) NULL,
    upvote INTEGER NULL,
    downvote INTEGER NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    posts ADD PRIMARY KEY(post_id);


CREATE TABLE relationships(
    rela_id BIGINT NOT NULL,
    follower_id INTEGER NULL,
    followed_id INTEGER NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    relationships ADD PRIMARY KEY(rela_id);

CREATE TABLE votes(
    vote_id SERIAL PRIMARY KEY,
    post_id INTEGER NULL,
    comment_id INTEGER NULL,
    user_id INTEGER NOT NULL,
    created_at INTEGER NOT NULL,
    vote_type TEXT NOT NULL
);
ALTER TABLE
    votes ADD PRIMARY KEY(vote_id);

CREATE TABLE comments(
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    parent_comment_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at INTEGER NOT NULL
);
ALTER TABLE
    comments ADD PRIMARY KEY(comment_id);

--foreign key constraints
ALTER TABLE
    comments ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY(user_id) REFERENCES users(user_id);
ALTER TABLE
    votes ADD CONSTRAINT votes_user_id_foreign FOREIGN KEY(user_id) REFERENCES users(user_id);
ALTER TABLE
    posts ADD CONSTRAINT posts_user_id_foreign FOREIGN KEY(user_id) REFERENCES users(user_id);
ALTER TABLE
    votes ADD CONSTRAINT votes_post_id_foreign FOREIGN KEY(post_id) REFERENCES posts(post_id);
ALTER TABLE
    relationships ADD CONSTRAINT relationships_follower_id_foreign FOREIGN KEY(follower_id) REFERENCES users(user_id);
ALTER TABLE
    relationships ADD CONSTRAINT relationships_followed_id_foreign FOREIGN KEY(followed_id) REFERENCES users(user_id);
ALTER TABLE
    comments ADD CONSTRAINT comments_post_id_foreign FOREIGN KEY(post_id) REFERENCES posts(post_id);
ALTER TABLE
    votes ADD CONSTRAINT votes_comment_id_foreign FOREIGN KEY(comment_id) REFERENCES comments(comment_id);
