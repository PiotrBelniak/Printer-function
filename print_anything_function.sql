CREATE OR REPLACE NONEDITIONABLE FUNCTION "PIOTR"."PRINT_ANYTHING" (adata IN ANYDATA) return CLOB
IS
    aType ANYTYPE;
    retval clob;
begin
    CASE adata.GetType(atype)
        WHEN DBMS_TYPES.TYPECODE_BDOUBLE THEN           retval:= trg_printanydata_pkg.print_BDOUBLE(adata);
        WHEN DBMS_TYPES.TYPECODE_BFLOAT THEN            retval:= trg_printanydata_pkg.print_BFLOAT(adata); 
        WHEN DBMS_TYPES.TYPECODE_CHAR THEN              retval:= trg_printanydata_pkg.print_CHAR(adata);
        WHEN DBMS_TYPES.TYPECODE_DATE THEN              retval:= trg_printanydata_pkg.print_DATE(adata);
        WHEN DBMS_TYPES.TYPECODE_INTERVAL_DS THEN       retval:= trg_printanydata_pkg.print_INTERVALDS(adata);
        WHEN DBMS_TYPES.TYPECODE_INTERVAL_YM THEN       retval:= trg_printanydata_pkg.print_INTERVALYM(adata);
        WHEN DBMS_TYPES.TYPECODE_NCHAR THEN             retval:= trg_printanydata_pkg.print_NCHAR(adata);  
        WHEN DBMS_TYPES.TYPECODE_NUMBER THEN            retval:= trg_printanydata_pkg.print_NUMBER(adata);
        WHEN DBMS_TYPES.TYPECODE_NVARCHAR2 THEN         retval:= trg_printanydata_pkg.print_NVARCHAR2(adata);   
        WHEN DBMS_TYPES.TYPECODE_RAW THEN               retval:= trg_printanydata_pkg.print_RAW(adata);         
        WHEN DBMS_TYPES.TYPECODE_TIMESTAMP THEN         retval:= trg_printanydata_pkg.print_TIMESTAMP(adata); 
        WHEN DBMS_TYPES.TYPECODE_TIMESTAMP_TZ THEN      retval:= trg_printanydata_pkg.print_TIMESTAMP_TZ(adata);   
        WHEN DBMS_TYPES.TYPECODE_TIMESTAMP_LTZ THEN     retval:= trg_printanydata_pkg.print_TIMESTAMP_LTZ(adata);
        WHEN DBMS_TYPES.TYPECODE_VARCHAR2 THEN          retval:= trg_printanydata_pkg.print_VARCHAR2(adata);
        WHEN DBMS_TYPES.TYPECODE_OBJECT THEN            retval:= trg_printanydata_pkg.print_OBJECT(adata);
        WHEN DBMS_TYPES.TYPECODE_REF THEN               retval:= trg_printanydata_pkg.print_REF(adata);
        WHEN DBMS_TYPES.TYPECODE_NAMEDCOLLECTION THEN   retval:= trg_printanydata_pkg.print_coll(adata);
        ELSE                                            retval:= 'The abstract of type:' || adata.GetTypeName;
    END CASE;
    return retval;
END print_anything;

/
