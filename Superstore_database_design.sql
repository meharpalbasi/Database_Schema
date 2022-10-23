
CREATE TABLE `Customers` (
    `Customer_ID` varchar(10)  NOT NULL ,
    `Customer_name` varchar(128)  NOT NULL ,
    `Country` varchar(52) NOT NULL , 	 
    `City` varchar(28)  NOT NULL ,
    `State` varchar(28)  NOT NULL ,
    `Postal_code` int  NOT NULL ,
    `Region` varchar(28)  NOT NULL ,
    `Segment` varchar(28)  NOT NULL ,
    PRIMARY KEY (
        `Customer_ID`
    )
);

CREATE TABLE `Orders` (
    `Order_ID` varchar(16)  NOT NULL ,
    `Customer_ID` varchar(10)  NOT NULL ,
    `Order_date` date  NOT NULL ,
    `Ship_date` date  NOT NULL ,
    `Ship_mode` enum(Standard-Class,Second-Class,First-Class,Same-Day)  NOT NULL ,
    PRIMARY KEY (
        `Order_ID`
    )
);

CREATE TABLE `Order_Details` (
    `Order_ID` varchar(16)  NOT NULL ,
    `Product_ID` varchar(18)  NOT NULL ,
    `Quantity` int  NOT NULL ,
    `Sales` decimal(10,2)  NOT NULL ,
    `Profit` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `Order_ID`,`Product_ID`
    )
);

CREATE TABLE `Products` (
    `Product_ID` varchar(18)  NOT NULL ,
    `Product-Name` varchar(258)  NOT NULL ,
    `Category` varchar(258)  NOT NULL ,
    `Sub-Category` varchar(258)  NOT NULL ,
    PRIMARY KEY (
        `Product_ID`
    )
);

ALTER TABLE `Orders` ADD CONSTRAINT `fk_Orders_Customer_ID` FOREIGN KEY(`Customer_ID`)
REFERENCES `Customers` (`Customer_ID`);

ALTER TABLE `Order_Details` ADD CONSTRAINT `fk_Order_Details_Order_ID` FOREIGN KEY(`Order_ID`)
REFERENCES `Orders` (`Order_ID`);

ALTER TABLE `Order_Details` ADD CONSTRAINT `fk_Order_Details_Product_ID` FOREIGN KEY(`Product_ID`)
REFERENCES `Products` (`Product_ID`);
