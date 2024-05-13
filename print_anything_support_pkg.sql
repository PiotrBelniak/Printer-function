--------------------------------------------------------
--  File created - poniedzia³ek-maja-13-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PRINTANYTHING_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PIOTR"."PRINTANYTHING_PKG" ACCESSIBLE BY (function print_anything)
IS
    type varchar2_100_ntt IS TABLE OF VARCHAR2(100);
    function print_bdouble(adata IN ANYDATA) return VARCHAR2;
    function print_bfloat(adata IN ANYDATA) return VARCHAR2;
    function print_char(adata IN ANYDATA) return VARCHAR2;
    function print_date(adata IN ANYDATA) return VARCHAR2;
    function print_intervalds(adata IN ANYDATA) return VARCHAR2;
    function print_intervalym(adata IN ANYDATA) return VARCHAR2;
    function print_nchar(adata IN ANYDATA) return VARCHAR2;
    function print_number(adata IN ANYDATA) return VARCHAR2;
    function print_nvarchar2(adata IN ANYDATA) return VARCHAR2;
    function print_raw(adata IN ANYDATA) return VARCHAR2;
    function print_timestamp(adata IN ANYDATA) return VARCHAR2;
    function print_timestamp_tz(adata IN ANYDATA) return VARCHAR2;
    function print_timestamp_ltz(adata IN ANYDATA) return VARCHAR2;    
    function print_varchar2(adata IN ANYDATA) return VARCHAR2;
    function print_object(adata IN ANYDATA) return VARCHAR2;
    function print_ref(adata IN ANYDATA) return VARCHAR2;
    function print_coll(adata IN ANYDATA) return CLOB;

END printanything_pkg;

/
