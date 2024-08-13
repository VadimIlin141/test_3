if object_id('SKU') is null
begin
	create table SKU (
		ID int not null identity,
		Code as 's' + cast(ID as varchar(10)) unique,
		Name varchar(255) not null,
		constraint PK_SKU primary key clustered (ID)
	)
end

if object_id('Family') is null
begin
	create table Family (
		ID int not null identity,
		SurName varchar(255) not null,
		BudgetValue int not null,
		constraint PK_Family primary key clustered (ID)
	)
end

if object_id('Basket') is null
begin
	create table Basket (
		ID int not null identity primary key,
		ID_SKU int not null, 
		ID_Family int not null,
		Quantity int not null check (Quantity >= 0),
		Value int not null check (Value >= 0),
		PurchaseDate datetime default getdate(),
		DiscountValue int not null,
		constraint FK_Basket_SKU foreign key (ID_SKU) references dbo.SKU(ID),
		constraint FK_Basket_Family foreign key (ID_Family) references dbo.Family(ID)
	)
end
