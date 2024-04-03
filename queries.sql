CREATE OR REPLACE PACKAGE order_management_package AS
    -- Procedure to apply discount
    PROCEDURE process_orders_discount;

    -- Procedure to delete orders 
    PROCEDURE process_orders_delete;

    -- Procedure to update working hours of all staff
    PROCEDURE update_work_hours;
END order_management_package;



CREATE OR REPLACE PACKAGE BODY order_management_package AS  
    -- Procedure to delete orders and apply discount
    PROCEDURE process_orders_discount AS
BEGIN
    -- Apply a 5% discount to orders with payment as "Credit card"
    UPDATE orders
            SET order_price = order_price * 0.95
            WHERE payment = 'Credit card';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Handle exceptions 
            DBMS_OUTPUT.PUT_LINE
    ('Error occurred during execution: ' || SQLERRM);
    ROLLBACK;
END
process_orders_discount;


    -- Procedure to check delete order rows with COD
    PROCEDURE process_orders_delete AS
BEGIN
    -- Delete orders with payment as UPI
    DELETE FROM orders WHERE payment = 'COD';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Handle exceptions 
            DBMS_OUTPUT.PUT_LINE
    ('Error occurred during execution: ' || SQLERRM);
    ROLLBACK;
END
process_orders_delete;


    -- Procedure to check for threshold working hours of all staff and update
    PROCEDURE update_work_hours
(in_threshold IN NUMBER) AS
BEGIN
    UPDATE staff 
        SET work_hours = CASE WHEN work_hours > in_threshold THEN in_threshold ELSE work_hours END;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Handle exceptions 
            DBMS_OUTPUT.PUT_LINE
    ('Error occurred during execution: ' || SQLERRM);
    ROLLBACK;
END
update_work_hours;

END order_management_package;


CREATE TABLE original_order_price
(
    order_id INT PRIMARY KEY,
    original_price INT
);

CREATE OR REPLACE TRIGGER before_process_orders_discount
BEFORE
DELETE OR
UPDATE OF order_price ON orders
FOR EACH ROW
DECLARE
    v_original_price NUMBER;
BEGIN
    -- Store the original order price in a temporary table
    IF DELETING THEN
    -- If the order is being deleted, store the original price in a temporary table
    INSERT INTO original_order_price
        (order_id, original_price)
    VALUES
        (:OLD.order_id, :OLD.order_price);
    ELSIF UPDATING THEN
    -- If the order is being updated, store the original price in a temporary table
    INSERT INTO original_order_price
        (order_id, original_price)
    VALUES
        (:OLD.order_id, :OLD.order_price);
END
IF;
END before_process_orders_discount;



CREATE OR REPLACE TRIGGER after_process_orders_discount
AFTER
DELETE OR
UPDATE OF order_price ON orders
FOR EACH ROW
DECLARE
    v_discounted_price NUMBER;
BEGIN
    -- Log the changes made to the orders
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE
    ('Order ' || :OLD.order_id || ' with payment as UPI deleted.');
ELSIF UPDATING THEN
        v_discounted_price := :OLD.order_price * 0.95;
        DBMS_OUTPUT.PUT_LINE
('Order ' || :OLD.order_id || ' with payment as Credit card received a 5% discount.');
        DBMS_OUTPUT.PUT_LINE
('Original Price: ' || :OLD.order_price);
        DBMS_OUTPUT.PUT_LINE
('Discounted Price: ' || v_discounted_price);
END
IF;
END after_process_orders_discount;




-- Creating a table to store trigger log
CREATE TABLE orders_delete_trigger_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    action_type VARCHAR2
(20),
    action_timestamp TIMESTAMP,
    details VARCHAR2
(4000)
);

-- Creating a BEFORE DELETE trigger
CREATE OR REPLACE TRIGGER before_orders_delete_trigger
BEFORE
DELETE ON orders
FOR EACH
ROW
BEGIN
    INSERT INTO orders_delete_trigger_log
        (action_type, action_timestamp, details)
    VALUES
        ('BEFORE DELETE', SYSTIMESTAMP, 'Deleting order with payment=''' || :OLD.payment || '''');
END
before_orders_delete_trigger;
/

-- Creating an AFTER DELETE trigger
CREATE OR REPLACE TRIGGER after_orders_delete_trigger
AFTER
DELETE ON orders
FOR EACH
ROW
BEGIN
    INSERT INTO orders_delete_trigger_log
        (action_type, action_timestamp, details)
    VALUES
        ('AFTER DELETE', SYSTIMESTAMP, 'Deleted order with payment=''' || :OLD.payment || '''');
END
after_orders_delete_trigger;
/




-- BEFORE TRIGGER
CREATE OR REPLACE TRIGGER before_staff_operation 
BEFORE
INSERT OR
UPDATE OR DELETE ON staff 
FOR EACH ROW
BEGIN
    -- Ensure that work_hours is not negative 
    IF :NEW.work_hours < 0 THEN 
        RAISE_APPLICATION_ERROR
    (-20001, 'work_hours cannot be negative.');
END
IF; 
END; 
/

-- AFTER TRIGGER
CREATE OR REPLACE TRIGGER after_staff_operation 
AFTER
INSERT OR
UPDATE OR DELETE ON staff 
FOR EACH ROW
BEGIN
    -- Log changes to the STAFF_AUDIT table 
    IF INSERTING THEN
    INSERT INTO staff_audit
        (audit_id, staff_id, operation_type, operation_time)
    VALUES
        (staff_audit_seq.nextval, :NEW.staff_id, 'INSERT', systimestamp);
    ELSIF UPDATING THEN
    INSERT INTO staff_audit
        (audit_id, staff_id, operation_type, operation_time)
    VALUES
        (staff_audit_seq.nextval, :NEW.staff_id, 'UPDATE', systimestamp);
    ELSIF DELETING THEN
    INSERT INTO staff_audit
        (audit_id, staff_id, operation_type, operation_time)
    VALUES
        (staff_audit_seq.nextval, :OLD.staff_id, 'DELETE', systimestamp);
END
IF; 
END; 
/
