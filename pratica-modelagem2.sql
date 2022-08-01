CREATE TABLE users (
	"id" SERIAL PRIMARY KEY,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"name" TEXT NOT NULL,
	"password" TEXT NOT NULL
);


CREATE TABLE products (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"mainImage" TEXT NOT NULL,
	"price" TEXT NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "categories"("id"),
	"size" TEXT NOT NULL,
	"stock" INTEGER NOT NULL
);


CREATE TABLE categories (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);


CREATE TABLE orders (
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"addressId" INTEGER NOT NULL REFERENCES "addresses"("id"),
	"status" TEXT NOT NULL,
	"date" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);


CREATE TABLE "secondaryImages" (
	"id" SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"url" TEXT NOT NULL
);


CREATE TABLE addresses (
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"country" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"district" TEXT NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT,
	"zipCode" varchar(8)
);


CREATE TABLE "ordersProducts" (
	"id" SERIAL PRIMARY KEY,
	"orderId" INTEGER NOT NULL REFERENCES "orders"("id"),
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"quantity" INTEGER NOT NULL
);