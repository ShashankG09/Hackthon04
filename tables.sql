drop table email_data;

CREATE TABLE email_data (
    id SERIAL PRIMARY KEY,
    sender VARCHAR(255),
    subject VARCHAR(255),
    recipient VARCHAR(255),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	isaddressed VARCHAR(30),
	response_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	
);
commit;

CREATE TABLE tran_config (
    id SERIAL PRIMARY KEY,  -- automatically increments
    application_name VARCHAR(30),
    spoc_Detail VARCHAR(300)
);
commit;


INSERT INTO tran_config (application_name, spoc_Detail) VALUES
('IMPS', 'impssupport@example.com,as');
INSERT INTO tran_config (application_name, spoc_Detail) VALUES('NEFT', 'shashank.goswami9@gmail.com');
INSERT INTO tran_config (application_name, spoc_Detail) VALUES('RTGS', 'rajkumar@example.com');
INSERT INTO tran_config (application_name, spoc_Detail) VALUES('UPI', 'amit.sharma@example.com');




CREATE TABLE transaction_details (
    id SERIAL PRIMARY KEY, 
    application_name VARCHAR(20),
    transaction_id INTEGER NOT NULL,
    transaction_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transaction_amount INTEGER,
    Status VARCHAR(20),
    Remarks TEXT, 
    Alert_STATUS VARCHAR(255),
    nextstep_email INTEGER, 
    CONSTRAINT fk_nextstep_email FOREIGN KEY (nextstep_email) 
    REFERENCES tran_config(id)
);

-- Insert sample data into transaction_details table
INSERT INTO transaction_details (application_name, transaction_id, transaction_amount, Status, Remarks, Alert_STATUS, nextstep_email) VALUES
('IMPS', 1001, 5000, 'Completed', 'Transaction successful', 'Success', 1),
('NEFT', 1002, 15000, 'Pending', 'Transaction initiated', 'Pending', 2),
('RTGS', 1003, 500000, 'Completed', 'Transaction successful', 'Success', 3),
('UPI', 1004, 3000, 'Failed', 'Insufficient balance', 'Failure', 4);
