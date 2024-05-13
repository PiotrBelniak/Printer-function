CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PIOTR"."CONVERT_TO_TEXT_PKG" 
IS
    function convert_BINARY_DOUBLE(dane IN BINARY_DOUBLE) return VARCHAR2
    IS
    BEGIN
        return  to_char(dane) || 'd';     
    END convert_BINARY_DOUBLE;

    function convert_BINARY_FLOAT(dane IN BINARY_FLOAT) return VARCHAR2
    IS
    BEGIN
        return  to_char(dane) || 'f';     
    END convert_BINARY_FLOAT; 

    function convert_DATE(dane IN DATE) return VARCHAR2
    IS 
    BEGIN
        return  to_char(dane,'DD.MM.RRRR');  
    END convert_DATE;   

    function convert_INTERVAL_DAY_TO_SECOND(dane IN INTERVAL DAY TO SECOND) return VARCHAR2
    IS  
    BEGIN
        return  EXTRACT(DAY FROM dane) || ' days, ' 
                                || EXTRACT(HOUR FROM dane) || ' hours, ' 
                                || EXTRACT(MINUTE FROM dane) || ' minutes and ' 
                                || EXTRACT(SECOND FROM dane) || ' seconds.';
    END convert_INTERVAL_DAY_TO_SECOND;   

    function convert_INTERVAL_YEAR_TO_MONTH(dane IN INTERVAL YEAR TO MONTH) return VARCHAR2
    IS  
    BEGIN
        return EXTRACT(YEAR FROM dane) || ' years and ' 
                                || EXTRACT(MONTH FROM dane) || ' months.';  
    END convert_INTERVAL_YEAR_TO_MONTH;  

    function convert_NCHAR(dane IN NCHAR) return VARCHAR2
    IS 
    BEGIN
        return to_char(dane);    
    END convert_NCHAR;   

    function convert_NUMBER(dane IN NUMBER) return VARCHAR2
    IS
    BEGIN
        return to_char(dane);   
    END convert_NUMBER;   

    function convert_NVARCHAR2(dane IN NVARCHAR2) return VARCHAR2
    IS
    BEGIN
        return to_char(dane);      
    END convert_NVARCHAR2;  

    function convert_RAW(dane IN RAW) return VARCHAR2
    IS 
    BEGIN
        return utl_raw.cast_to_varchar2(dane);    
    END convert_RAW; 

    function convert_TIMESTAMP(dane IN TIMESTAMP) return VARCHAR2
    IS 
    BEGIN
        return to_char(dane,'DD.MM.RRRR HH24:MI:SS');    
    END convert_TIMESTAMP;  

    function convert_TIMESTAMP_WITH_TZ(dane IN TIMESTAMP WITH TIME ZONE) return VARCHAR2
    IS 
    BEGIN
        return to_char(dane,'DD.MM.RRRR HH24:MI:SS TZR');    
    END convert_TIMESTAMP_WITH_TZ;  

    function convert_TIMESTAMP_WITH_LOCAL_TZ(dane IN TIMESTAMP WITH LOCAL TIME ZONE) return VARCHAR2  
    IS 
    BEGIN
        return to_char(dane,'DD.MM.RRRR HH24:MI:SS');    
    END convert_TIMESTAMP_WITH_LOCAL_TZ;    

END convert_to_text_pkg;

/
