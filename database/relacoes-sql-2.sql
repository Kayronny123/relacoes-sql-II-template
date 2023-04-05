
-- Práticas
CREATE TABLE users(
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at DATETIME
);
INSERT INTO users(id, name, email, password, created_at) VALUES
('U01', 'Murilo', "murilo@email.com", "muri123", strftime('%Y-%m-%d %H:%M:%S', 'now')),
('U02', 'Leandro', "leo@email.com", "leo123", strftime('%Y-%m-%d %H:%M:%S', 'now')),
('U03', 'Felipe', "felipe@email.com", "felipe123", strftime('%Y-%m-%d %H:%M:%S', 'now'));
SELECT * FROM users;
CREATE TABLE follows(
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    CONSTRAINT fk_follower_id FOREIGN KEY (follower_id) REFERENCES users(id),
    CONSTRAINT fk_followed_id FOREIGN KEY (followed_id) REFERENCES users(id)
);

DROP TABLE follows;
INSERT INTO follows(follower_id, followed_id) VALUES
("U01", "U02"),
("U01", "U03"),
("U02", "U01");
SELECT * FROM follows;
SELECT U1.id AS followerId, U1.name AS followerName, U2.id AS followedId, U2.name AS followedName 
FROM users u1
LEFT JOIN follows f ON f.follower_id = U1.id
LEFT JOIN users u2 ON f.followed_id = u2.id;