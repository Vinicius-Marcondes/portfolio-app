CREATE TABLE "users" (
	"id" INTEGER NOT NULL UNIQUE GENERATED BY DEFAULT AS IDENTITY,
	"password" VARCHAR(255),
	"name" VARCHAR(255),
	"email" VARCHAR(255) UNIQUE,
	"created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	"profile_picture" TEXT,
	PRIMARY KEY("id")
);

CREATE TABLE "portifolios" (
	"id" INTEGER NOT NULL UNIQUE GENERATED BY DEFAULT AS IDENTITY,
	"user_id" INTEGER,
	"cover" TEXT,
	"created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id")
);

CREATE TABLE "photos" (
	"id" INTEGER NOT NULL UNIQUE GENERATED BY DEFAULT AS IDENTITY,
	"portifolio_id" INTEGER,
	"user_id" INTEGER,
	"category_id" INTEGER,
	"title" VARCHAR(255),
	"description" VARCHAR(255),
	"path" TEXT,
	"created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id")
);

CREATE TABLE "categories" (
	"id" INTEGER NOT NULL UNIQUE GENERATED BY DEFAULT AS IDENTITY,
	"name" VARCHAR(255),
	"description" VARCHAR(255),
	"created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id")
);

ALTER TABLE "portifolios"
ADD FOREIGN KEY("user_id") REFERENCES "users"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "photos"
ADD FOREIGN KEY("portifolio_id") REFERENCES "portifolios"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "photos"
ADD FOREIGN KEY("user_id") REFERENCES "users"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "photos"
ADD FOREIGN KEY("category_id") REFERENCES "categories"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;