USE [DataVizCourse]
GO

/****** Object:  View [dbo].[finer_data]    Script Date: 10/05/2023 01:29:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[finer_data] as
select ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS id,
hotel
,convert(int, is_canceled) as is_canceled
,convert(int, lead_time) as lead_time
,convert(int, year_arrive) as year_arrive
,month_arrive
,convert(int, week_arrive) as week_arrive
,convert(int, day_arrive) as day_arrive
,convert(int, weekend_nights_stays) as weekend_nights_stays
,convert(int, week_nights_stays) as week_nights_stays
,convert(int, adults) as adults
,CASE WHEN childern = 'NA' THEN 0 ELSE convert(int, childern) END AS children
,convert(int, babies) as babies
,meal
,country
,market_segment
,distribution_channel
,convert(int, is_repeated_guest) as is_repeated_guest
,convert(int, previous_cancellations) as previous_cancellations
,convert(int, previous_bookings_not_canceled) as previous_bookings_not_canceled
,reserved_room_type
,assigned_room_type
,booking_changes
,deposit_type
,CASE WHEN agent = 'NULL' THEN NULL ELSE convert(int, agent) END AS agent
,CASE WHEN company = 'NULL' THEN NULL ELSE convert(int, company) END AS company
,convert(int, days_in_waiting_list) as days_in_waiting_list
,customer_type
,CASE WHEN adr = 'NULL' THEN NULL ELSE convert(float, adr) END AS adr
,convert(int, required_car_parking_spaces) as required_car_parking_spaces
,convert(int, total_of_special_requests) as total_of_special_requests
,reservation_status 
,convert(date, reservation_status_date) reservation_status_date
from FULL_RAW_DATA

GO

--select distinct country from main_tab
--
--select country, count(*) count_booking from MAIN_TAB where is_canceled = '1' group by country

--select top 1000 * from finer_data

