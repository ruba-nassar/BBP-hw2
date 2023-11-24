--Q1 
BEGIN
  DECLARE
    TODAY DATE := SYSDATE;
    TOMORROW TODAY%TYPE;
  BEGIN
    TOMORROW := TODAY + 1;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('Today: ' || TODAY);
    DBMS_OUTPUT.PUT_LINE('Tomorrow: ' || TOMORROW);
  END;
END;

DECLARE
  my_date DATE := SYSDATE;
  v_last_day DATE;
BEGIN
  SELECT LAST_DAY(my_date) INTO v_last_day FROM DUAL;
  DBMS_OUTPUT.PUT_LINE('Last day of the month: ' || TO_CHAR(v_last_day, 'Month dd, yyyy'));
END;

DECLARE
  my_date DATE := SYSDATE;
  v_last_day DATE;
  future_date DATE;
  months_diff NUMBER;
BEGIN
  SELECT LAST_DAY(my_date) INTO v_last_day FROM DUAL;
  future_date := my_date + 45;
  months_diff := MONTHS_BETWEEN(future_date, my_date);
  DBMS_OUTPUT.PUT_LINE('Last day of the month: ' || TO_CHAR(v_last_day, 'Month dd, yyyy'));
  DBMS_OUTPUT.PUT_LINE('Future date after adding 45 days: ' || TO_CHAR(future_date, 'Month dd, yyyy'));
  DBMS_OUTPUT.PUT_LINE('Months difference: ' || months_diff);
END;

--Q2
CREATE TABLE countries (
  country_name VARCHAR2(50),
  median_age NUMBER(6, 2)
);

INSERT INTO countries (country_name, median_age) VALUES ('Japan', 30.5);


DECLARE
  country_name countries.country_name%TYPE;
  median_age countries.median_age%TYPE;
BEGIN
  SELECT country_name, median_age INTO country_name, median_age
  FROM countries
  WHERE country_name = 'Japan';
  DBMS_OUTPUT.PUT_LINE('The median age in ' || country_name || ' is ' || median_age || '.');
END;




