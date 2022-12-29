DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
CustomerID VARCHAR(10) NOT NUL PRIMARY KEY,
FullName VARCHAR(100) NOT NULL,
Country VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
District VARCHAR(100) NOT NULL,
ZipCode VARCHAR(5) NOT NULL,
Gender VARCHAR(10) NOT NULL,
PaymentMethod VARCHAR(100),
product_id INT(4) NOT NULL AUTO_INCREMENT,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

/* Data insertion for 'Customers' */
INSERT INTO Customers (CustomerID, FullName, Country, City, District, ZipCode, Gender, PaymentMethod, product_id) VALUES
('3668-QPYBK', 'Nguyễn Phương Anh', 'Việt Nam', 'Hà Nội', 'Ba Đình', '90003', 'Female', 'Mailed check', 1),
('9237-HQITU', 'Lê Thị Thanh An', 'Việt Nam', 'Tp. Hồ Chí Minh', 'Quận 10', '90005', 'Female', 'Electronic check', 2),
('9305-CDSKC', 'Phạm Giang Linh', 'Việt Nam', 'Hải Dương', 'Chí Linh', '90006', 'Female', 'Electronic check', 3),
('7892-POOKP', 'Đinh Hoàng Minh', 'Việt Nam', 'Hà Nội', 'Bắc Từ Liêm', '90010', 'Male', 'Electronic check', 4),
('0280-XJGEX', 'Tạ Thị Khánh Ngọc', 'Việt Nam', 'Hà Nội', 'Thanh Xuân', '90015', 'Female', 'Bank transfer (automatic)', 5),
('4190-MFLUW', 'Lê Phương Thảo', 'Việt Nam', 'Thái Nguyên', 'Phổ Yên', '90020', 'Female', 'Credit card (automatic)', 6),
('8779-QRDMV', 'Phạm Nhật Tiến', 'Việt Nam', 'Hà Nội', 'Nam Từ Liêm', '90022', 'Male', 'Electronic check', 7),
('1066-JKSGK', 'Phạm Văn Thương', 'Việt Nam', 'Hà Nội', 'Hai Bà Trưng', '90024', 'Male', 'Mailed check', 8),
('6467-CHFZW', 'Nguyễn Văn Hảo', 'Việt Nam', 'Tp. Hồ Chí Minh', 'Quận 9', '90028', 'Male', 'Electronic check', 9),
('8665-UTDHZ', 'Nguyễn Phạm Quốc', 'Việt Nam', 'Hà Nội', 'Hoàn Kiếm', '90029', 'Male', 'Electronic check', 10);
