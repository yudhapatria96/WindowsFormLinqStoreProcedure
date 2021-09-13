create procedure show_data 
as
select * from dbo.ProductInfo
GO

create procedure update_data
@idProduct int,
@itemName nVarchar(50),
@Design nVarchar(50),
@Color nVarchar(50),
@ExpiryDate datetime,
@UpdateDate datetime
as
update dbo.ProductInfo set ItemName = @itemName, Design = @Design, Color = @Color, ExpiryDate = @ExpiryDate, UpdateDate = @UpdateDate where ProductID = @idProduct
GO

create procedure insert_data
@idProduct int,
@itemName nVarchar(50),
@Design nVarchar(50),
@Color nVarchar(50),
@ExpiryDate datetime,
@InsertDate datetime
as
insert into dbo.ProductInfo values(@idProduct, @itemName, @Design, @Color, @InsertDate, null ,@ExpiryDate);
GO

create procedure delete_data
@idProduct int
as
delete from dbo.ProductInfo where ProductID = @idProduct;
GO

create procedure search_data_by_id
@idProduct int
as
select * from dbo.ProductInfo where ProductID = @idProduct;
GO