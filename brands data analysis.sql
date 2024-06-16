create database brands;

SELECT * FROM brands.brands_v2;


-- count the diffrent no of brands data available

select brand , count(brand) as brand_count from brands.brands_v2
group by brand
order by brand_count desc limit 2;

-- top 10 costliest products 

select info_v2.product_name , max(finance.listing_price) as costly_prod from brands.finance
join brands.info_v2 on info_v2.product_id = finance.product_id
group by info_v2.product_name
order by costly_prod desc
limit 10;

-- top 10 products who earned the most revenue

select info_v2.product_name , round(sum(finance.revenue),2) as profit from brands.finance
join brands.info_v2 on info_v2.product_id = finance.product_id
group by info_v2.product_name
order by profit desc
limit 10;

-- top 10 most rated products

select info_v2.product_name , max(reviews_v2.reviews) as rating from brands.reviews_v2
join brands.info_v2 on info_v2.product_id = reviews_v2.product_id 
group by info_v2.product_name
order by rating desc limit 10;

-- top 10 least rated products

select info_v2.product_name , min(reviews_v2.reviews) as rating from brands.reviews_v2
join brands.info_v2 on info_v2.product_id = reviews_v2.product_id 
group by info_v2.product_name
order by rating asc limit 10;

-- top 10 product with lowest ratings

select info_v2.product_name , min(reviews_v2.rating) as rating1 from brands.reviews_v2
join brands.info_v2 on info_v2.product_id = reviews_v2.product_id 
group by info_v2.product_name
order by rating1 asc limit 10;

-- top 10 product with highest ratings


select info_v2.product_name , max(reviews_v2.rating) as rating1 from brands.reviews_v2
join brands.info_v2 on info_v2.product_id = reviews_v2.product_id 
group by info_v2.product_name
order by rating1 desc limit 10;


