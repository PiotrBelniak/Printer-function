CREATE OR REPLACE NONEDITIONABLE PACKAGE "PIOTR"."CONVERT_TO_TEXT_PKG" 
IS
    function convert_BINARY_DOUBLE(dane IN BINARY_DOUBLE) return VARCHAR2;
    function convert_BINARY_FLOAT(dane IN BINARY_FLOAT) return VARCHAR2;
    function convert_DATE(dane IN DATE) return VARCHAR2;
    function convert_INTERVAL_DAY_TO_SECOND(dane IN INTERVAL DAY TO SECOND) return VARCHAR2;
    function convert_INTERVAL_YEAR_TO_MONTH(dane IN INTERVAL YEAR TO MONTH) return VARCHAR2;
    function convert_NCHAR(dane IN NCHAR) return VARCHAR2;
    function convert_NUMBER(dane IN NUMBER) return VARCHAR2;
    function convert_NVARCHAR2(dane IN NVARCHAR2) return VARCHAR2;
    function convert_RAW(dane IN RAW) return VARCHAR2;
    function convert_TIMESTAMP(dane IN TIMESTAMP) return VARCHAR2;
    function convert_TIMESTAMP_WITH_TZ(dane IN TIMESTAMP WITH TIME ZONE) return VARCHAR2;
    function convert_TIMESTAMP_WITH_LOCAL_TZ(dane IN TIMESTAMP WITH LOCAL TIME ZONE) return VARCHAR2;    
END convert_to_text_pkg;

/
