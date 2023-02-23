create or replace function adjustPrice(
	itemID integer,
	newPricing FLoat
)
returns integer
language plpgsql as $$
begin 
	update products_for_concession  
	set pricing = newPricing
	where item_id = itemID;
	return itemID;
end;
$$


select *
from products_for_concession 
where item_id = adjustPrice(1, 16.00);