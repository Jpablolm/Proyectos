USE ETL_IoT

CREATE SCHEMA stg

CREATE TABLE stg.event (
		event_id BIGINT NULL,
		timestamp DATE NULL,
		operator_id VARCHAR(200) NULL,
		maintenance_schedule DATE NULL,
		sensor_id VARCHAR(200) NULL,
		sensor_type VARCHAR(200) NULL,
		location VARCHAR(200) NULL,
		manufacturer VARCHAR(200) NULL,
		model VARCHAR(200) NULL,
		regulations VARCHAR(200) NULL,
		affected_equipment VARCHAR(200) NULL,
		sample_rate INT NULL,
		value DECIMAL(10, 2) NULL,
		unit VARCHAR(200) NULL,
		description VARCHAR(200) NULL,
		alert BIT NULL,
		alarm_threshold DECIMAL(10, 2) NULL,
		battery_level INT NULL,
		status VARCHAR(200) NULL,
		reliability VARCHAR(200) NULL
) 
GO

CREATE TABLE dim.equipment(
	equipment_sk INT IDENTITY(1,1) NOT NULL,
	equipment VARCHAR(200) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[equipment_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE dim.location(
	location_sk INT IDENTITY(1,1) NOT NULL,
	enterprise VARCHAR(200) NULL,
	city VARCHAR(200) NULL,
	location VARCHAR(200) NULL,
	latitude NUMERIC(18, 9) NULL,
	longitude NUMERIC(18, 9) NULL,
	PRIMARY KEY CLUSTERED 
(
	[location_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

CREATE TABLE dim.reliability(
	reliability_sk INT IDENTITY(1,1) NOT NULL,
	reliability VARCHAR(200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reliability_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE dim.sensor(
	sensor_sk INT IDENTITY(1,1) NOT NULL,
	sensor_cd VARCHAR(200) NOT NULL,
	sensor_type VARCHAR(200) NOT NULL,
	unit_of_measure VARCHAR(200) NOT NULL,
	manufacturer VARCHAR(200) NOT NULL,
	regulations VARCHAR(200) NOT NULL,
	model VARCHAR(200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sensor_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE dim.status(
	status_sk INT IDENTITY(1,1) NOT NULL,
	status VARCHAR(200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE SCHEMA fact 

CREATE TABLE fact.event(
	event_id INT NOT NULL,
	timestamp DATETIME NOT NULL,
	sensor_sk INT NOT NULL,
	location_sk INT NOT NULL,
	reliability_sk INT NOT NULL,
	status_sk INT NOT NULL,
	equipment_sk INT NOT NULL,
	operator_id VARCHAR(200) NOT NULL,
	maintenance_schedule DATETIME NULL,
	sample_rate INT NOT NULL,
	value DECIMAL(10, 2) NOT NULL,
	description VARCHAR(200) NOT NULL,
	alert BIT NOT NULL,
	alarm_threshold decimal(10, 2) NULL,
	battery_level INT NULL
) 
GO

ALTER TABLE fact.event WITH CHECK ADD CONSTRAINT [FK_event_equipment] FOREIGN KEY ([equipment_sk])
REFERENCES dim.equipment ([equipment_sk]);

ALTER TABLE [fact].[event] CHECK CONSTRAINT [FK_event_equipment]

ALTER TABLE fact.event WITH CHECK ADD CONSTRAINT [FK_event_location] FOREIGN KEY ([location_sk])
REFERENCES dim.location ([location_sk]);

ALTER TABLE [fact].[event] CHECK CONSTRAINT [FK_event_location]
GO
ALTER TABLE [fact].[event]  WITH CHECK ADD  CONSTRAINT [FK_event_sensor] FOREIGN KEY([sensor_sk])
REFERENCES [dim].[sensor] ([sensor_sk])
GO
ALTER TABLE [fact].[event] CHECK CONSTRAINT [FK_event_sensor]
GO
ALTER TABLE [fact].[event]  WITH CHECK ADD  CONSTRAINT [FK_event_status] FOREIGN KEY([status_sk])
REFERENCES [dim].[status] ([status_sk])
G
ALTER TABLE [fact].[event] CHECK CONSTRAINT [FK_event_status]
GO