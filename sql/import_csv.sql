USE [DataVizCourse]
GO

/****** Object:  Table [dbo].[MAIN_TAB]    Script Date: 10/05/2023 00:48:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FULL_RAW_DATA](
	[hotel] [varchar](100) NULL,
	[is_canceled] [varchar](20) NULL,
	[lead_time] [varchar](20) NULL,
	[year_arrive] [varchar](100) NULL,
	[month_arrive] [varchar](20) NULL,
	[week_arrive] [varchar](100) NULL,
	[day_arrive] [varchar](100) NULL,
	[weekend_nights_stays] [varchar](100) NULL,
	[week_nights_stays] [varchar](100) NULL,
	[adults] [varchar](100) NULL,
	[childern] [varchar](100) NULL,
	[babies] [varchar](100) NULL,
	[meal] [varchar](10) NULL,
	[country] [varchar](50) NULL,
	[market_segment] [varchar](100) NULL,
	[distribution_channel] [varchar](100) NULL,
	[is_repeated_guest] [varchar](100) NULL,
	[previous_cancellations] [varchar](100) NULL,
	[previous_bookings_not_canceled] [varchar](100) NULL,
	[reserved_room_type] [varchar](100) NULL,
	[assigned_room_type] [varchar](100) NULL,
	[booking_changes] [varchar](100) NULL,
	[deposit_type] [varchar](100) NULL,
	[agent] [varchar](100) NULL,
	[company] [varchar](100) NULL,
	[days_in_waiting_list] [varchar](100) NULL,
	[customer_type] [varchar](20) NULL,
	[adr] [varchar](100) NULL,
	[required_car_parking_spaces] [varchar](100) NULL,
	[total_of_special_requests] [varchar](100) NULL,
	[reservation_status] [varchar](20) NULL,
	[reservation_status_date] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


BULK INSERT FULL_RAW_DATA
FROM 'C:\My Documents\Codam\AMS_course\repo\db\hotel_bookings.csv'
WITH
(
    FIRSTROW = 2,  
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)

GO