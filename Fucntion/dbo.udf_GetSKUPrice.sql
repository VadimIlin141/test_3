create or alter function udf_GetSKUPrice(
	@ID_SKU int
)
returns decimal(18, 2)
as
begin
	declare @price decimal(18, 2)
	-- Используем nullif для избежания деления на ноль
	select @Price = sum(Value) / nullif(sum(Quantity), 0)		
	from dbo.Basket
	where ID_SKU = @ID_SKU

	return @Price
end
