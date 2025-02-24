CREATE TABLE email_data (
    id SERIAL PRIMARY KEY,
    sender VARCHAR(255),
    recipient VARCHAR(255),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	isaddressed BOOLEAN
);





CREATE TABLE transaction_details (
    id SERIAL,
    application_name VARCHAR(20),
    transaction_id integer PRIMARY KEY,
    customer_id VARCHAR(255),
    transaction_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Status text,
	SMS_STATUS VARCHAR(255),
	nextstep_email VARCHAR(255)
);

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('IMPS', 48754893, '3821932', '2025-02-01 12:01:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('IMPS', 43283210, '2232322', '2025-02-10 22:21:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('IMPS', 43223219, '19878292', '2025-02-15 04:21:00', 'Completed', 'Failed Due to Phonenumber not matched with CBS. Please connect with Branch Team','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('IMPS', 40983920, '3421', '2025-02-19 14:31:00', 'Failed. Multiple account linked with mobilenumber', 'Failed','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('IMPS', 43892012, '867812', '2025-02-12 15:01:00', 'Completed & SMS Sent', 'Delivered','NONE');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('NEFT', 68754893, '3821932', '2025-02-01 12:01:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('NEFT', 63283210, '2232322', '2025-02-10 22:21:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('NEFT', 63223219, '19878292', '2025-02-15 04:21:00', 'Completed', 'Failed Due to Phonenumber not matched with CBS. Please connect with Branch Team','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('NEFT', 60983920, '3421', '2025-02-19 14:31:00', 'Failed. Multiple account linked with mobilenumber', 'Failed','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('NEFT', 63892012, '867812', '2025-02-12 15:01:00', 'Completed & SMS Sent', 'Delivered','NONE');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('RTGS', 28754893, '3821932', '2025-02-01 12:01:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('RTGS', 23283210, '2232322', '2025-02-10 22:21:00', 'Completed & SMS Sent', 'Delivered','NONE');
INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('RTGS', 23223219, '19878292', '2025-02-15 04:21:00', 'Completed', 'Failed Due to Phonenumber not matched with CBS. Please connect with Branch Team','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('RTGS', 20983920, '3421', '2025-02-19 14:31:00', 'Failed. High Memo on Account', 'Failed','shashank.goswami9@gmail.com');

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES('RTGS', 23892012, '867812', '2025-02-12 15:01:00', 'Completed & SMS Sent', 'Delivered','NONE');

select * from transaction_details;

INSERT INTO transaction_details (application_name, transaction_id, customer_id, transaction_date, status, sms_status, nextstep_email)
VALUES
('IMPS', 48754893, '3821932', '2025-02-01 12:01:00', 'Completed & SMS Sent', 'Delivered'),
('IMPS', 43283210, '2232322', '2025-02-10 22:21:00', 'Completed & SMS Sent', 'Delivered'),
('IMPS', 43223219, '19878292', '2025-02-15 04:21:00', 'Completed', 'Failed Due to Phonenumber not matched with CBS. Please connect with Branch Team','shashank.goswami9@gmail.com'),
('IMPS', 40983920, '3421', '2025-02-19 14:31:00', 'Failed. Multiple account linked with mobilenumber', 'Failed','shashank.goswami9@gmail.com'),
('IMPS', 43892012, '867812', '2025-02-12 15:01:00', 'Completed & SMS Sent', 'Delivered'),

('NEFT', 1002, 'CUST002', '2025-02-22 13:15:00', 'Pending', 'Failed Due to Phonenumber not matched to '),
('RTGS', 1003, 'CUST003', '2025-02-22 14:20:00', 'Completed', 'Delivered'),
('AXIOM', 1004, 'CUST004', '2025-02-22 15:25:00', 'Failed', 'Delivered'),
('IMPS', 1005, 'CUST005', '2025-02-22 16:30:00', 'Completed', 'Pending'),
('SMS ALERT', 1006, 'CUST006', '2025-02-22 17:35:00', 'Pending', 'Failed'),
('NEFT', 1007, 'CUST007', '2025-02-22 18:40:00', 'Completed', 'Delivered'),
('RTGS', 1008, 'CUST008', '2025-02-22 19:45:00', 'Failed', 'Delivered'),
('AXIOM', 1009, 'CUST009', '2025-02-22 20:50:00', 'Completed', 'Pending'),
('SMS ALERT', 1010, 'CUST010', '2025-02-22 21:55:00', 'Pending', 'Failed');
