CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PIOTR"."PRINTANYTHING_PKG" 
IS
    function print_bdouble(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000); 
    BEGIN
        retval:= 'Binary double: ' ||  to_char(adata.AccessBDouble) || 'd';     
        return retval;
    END print_bdouble;

    function print_bfloat(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000); 
    BEGIN
        retval:= 'Binary float: ' ||  to_char(adata.AccessBFloat) || 'f';      
        return retval;
    END print_bfloat;    

    function print_char(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000); 
    BEGIN
        retval:= 'Char: ' || adata.AccessChar;   
        return retval;
    END print_char;    

    function print_date(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);
    BEGIN
        retval:= 'Date: ' ||  to_char(adata.AccessDate,'DD.MM.RRRR');  
        return retval;
    END print_date;    

    function print_intervalds(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);  
    BEGIN
        retval:= 'Interval DS : ' ||  EXTRACT(DAY FROM adata.AccessIntervalDS) || ' days, ' 
                                || EXTRACT(HOUR FROM adata.AccessIntervalDS) || ' hours, ' 
                                || EXTRACT(MINUTE FROM adata.AccessIntervalDS) || ' minutes and ' 
                                || EXTRACT(SECOND FROM adata.AccessIntervalDS) || ' seconds.';
        return retval;
    END print_intervalds;   

    function print_intervalym(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Interval YM : ' || EXTRACT(YEAR FROM adata.AccessIntervalYM) || ' years and ' 
                                || EXTRACT(MONTH FROM adata.AccessIntervalYM) || ' months.';  
        return retval;
    END print_intervalym;    

    function print_nchar(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);    
    BEGIN
        retval:= 'National char : ' || to_char(adata.AccessNChar);    
        return retval;
    END print_nchar;    

    function print_number(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Number : ' || to_char(adata.AccessNumber);   
        return retval;
    END print_number;    

    function print_nvarchar2(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'National varying char : ' || to_char(adata.AccessNVarchar2);      
        return retval;
    END print_nvarchar2;    

    function print_raw(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Raw : ' || utl_raw.cast_to_varchar2(adata.AccessRaw);    
        return retval;
    END print_raw;    

    function print_timestamp(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Timestamp : ' || to_char(adata.AccessTimestamp,'DD.MM.RRRR HH24:MI:SS');       
        return retval;
    END print_timestamp;    

    function print_timestamp_tz(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Timestamp with time zone: ' || to_char(adata.AccessTimestamp,'DD.MM.RRRR HH24:MI:SS TZR');        
        return retval;
    END print_timestamp_tz;    

    function print_timestamp_ltz(adata IN ANYDATA) return VARCHAR2   
    IS
        retval VARCHAR2(10000);   
    BEGIN
        retval:= 'Timestamp with local time zone: ' || to_char(adata.AccessTimestamp,'DD.MM.RRRR HH24:MI:SS');    
        return retval;
    END print_timestamp_ltz;    

    function print_varchar2(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);  
    BEGIN
        retval:= 'Text : ' || adata.AccessVarchar2;    
        return retval;
    END print_varchar2;     

    function print_object(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);
        result_code PLS_INTEGER;
        issue_6550 EXCEPTION;
        pragma EXCEPTION_INIT(issue_6550,-6550);
    BEGIN
        EXECUTE IMMEDIATE 'DECLARE ' ||
                        '  myobj ' || adata.GetTypeName || '; ' ||
                        '  myad anydata := :ad; ' ||
                        'BEGIN ' ||
                        '   :res :=myad.GetObject(myobj); ' ||
                        '   :ret :=myobj.print(); ' ||
                        'END;' USING IN adata,OUT result_code,OUT retval;
        retval:= adata.GetTypeName || ': ' || retval;
        return retval;
    EXCEPTION
    WHEN issue_6550 THEN
        IF INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302')>0 THEN
            retval:= SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302',1,1)-1,INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'ORA-',1,2)-INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302',1,1));
            return retval;
        END IF;    
    END print_object;    

    function print_ref(adata IN ANYDATA) return VARCHAR2
    IS
        retval VARCHAR2(10000);
        result_code PLS_INTEGER;
        issue_6550 EXCEPTION;
        pragma EXCEPTION_INIT(issue_6550,-6550);
    BEGIN
        EXECUTE IMMEDIATE 'DECLARE ' || 
                        '  myref ' || adata.GetTypeName || '; ' ||
                        '  myobj ' || SUBSTR(adata.GetTypeName, INSTR(adata.GetTypeName,' ')) || '; ' ||
                        '  myad anydata := :ad; ' ||
                        'BEGIN ' ||
                        '   :res :=myad.GetREF(myref); ' ||
                        '   UTL_REF.SELECT_OBJECT(myref,myobj);' ||
                        '   :ret :=myobj.print(); ' ||
                        'END;' USING IN adata,OUT result_code,OUT retval;   
        retval:= adata.GetTypeName || ': ' || retval;
        return retval;
    EXCEPTION
    WHEN issue_6550 THEN
        IF INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302')>0 THEN
            retval:= SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302',1,1)-1,INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'ORA-',1,2)-INSTR(DBMS_UTILITY.FORMAT_ERROR_STACK,'PLS-00302',1,1));
            return retval;
        ELSE
            return DBMS_UTILITY.FORMAT_ERROR_STACK;
        END IF;
    END print_ref;   

    function print_coll(adata IN ANYDATA) return CLOB
    IS
        retval CLOB;
        result_code PLS_INTEGER;
        nazwa_typu VARCHAR2(100);
        nazwa_paczki VARCHAR2(100);
        nazwa_ownera VARCHAR2(100);
        ref_mod VARCHAR2(100);
        ref_string_1 VARCHAR2(200);
        ref_string_2 VARCHAR2(5000);
        coll_elem VARCHAR2(100);
        coll_elem_pkg VARCHAR2(100);
        coll_elem_owner VARCHAR2(100);
        loop_line_string VARCHAR2(10000);
        is_pkg_def_coll_elem BOOLEAN;
        is_nested_coll BOOLEAN;
        coll_elem_coll_checker NUMBER(1);
        base_types varchar2_100_ntt:=varchar2_100_ntt('BINARY_DOUBLE','BINARY_FLOAT','CHAR','DATE','INTERVAL DAY TO SECOND','INTERVAL YEAR TO MONTH','NUMBER','NVARCHAR2','NCHAR','RAW','TIMESTAMP',
                                                'TIMESTAMP WITH TZ','TIMESTAMP WITH LOCAL TZ','VARCHAR2');
        object_coll_type_attr_names varchar2_100_ntt;
        object_coll_type_attr_types varchar2_100_ntt;
    BEGIN
        nazwa_typu:=SUBSTR(adata.GetTypeName, INSTR(adata.GetTypeName,'.')+1);
        nazwa_ownera:=SUBSTR(adata.GetTypeName,1, INSTR(adata.GetTypeName,'.')-1);
        BEGIN
            SELECT elem_type_name,elem_type_owner,elem_type_mod INTO coll_elem,coll_elem_owner,ref_mod from all_coll_types where type_name= nazwa_typu AND owner=nazwa_ownera;
            SELECT COUNT(*) INTO coll_elem_coll_checker FROM all_coll_types where type_name= coll_elem AND owner=nazwa_ownera;
            IF coll_elem_coll_checker>0 THEN
                is_nested_coll:=TRUE;
            END IF;
            is_pkg_def_coll_elem := FALSE;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            coll_elem:='';
        END;

        IF coll_elem IS NULL THEN
            BEGIN
                SELECT elem_type_name,package_name,elem_type_package,elem_type_owner,elem_type_mod 
                INTO coll_elem,nazwa_paczki,coll_elem_pkg,coll_elem_owner,ref_mod from all_plsql_coll_types where type_name=nazwa_typu AND owner=nazwa_ownera;
                
                SELECT COUNT(*) INTO coll_elem_coll_checker FROM all_plsql_coll_types where type_name= coll_elem AND owner=nazwa_ownera;
                IF coll_elem_coll_checker>0 THEN
                    is_nested_coll:=TRUE;
                END IF;
                
                If coll_elem_pkg IS NULL THEN
                    is_pkg_def_coll_elem := FALSE;
                ELSE
                    is_pkg_def_coll_elem := TRUE;
                END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20991,'Unknown collection');
            END;
        END IF;
      
        If coll_elem MEMBER OF base_types THEN
            IF coll_elem NOT IN ('CHAR','VARCHAR2') THEN
                loop_line_string:='convert_to_text_pkg.convert_' || REPLACE(coll_elem,' ','_') || '(myobj(indx))';
            ELSE
                loop_line_string:='myobj(indx)';
            END IF;
        elsif ref_mod ='REF' THEN
            loop_line_string:='subelement.print()';
        elsif is_nested_coll THEN
            loop_line_string:='trg_printany(AnyData.ConvertCollection(myobj(indx)))';
        else
            IF is_pkg_def_coll_elem THEN
                select attr_name,attr_type_name BULK COLLECT INTO object_coll_type_attr_names,object_coll_type_attr_types 
                    from all_plsql_type_attrs where type_name = coll_elem and owner=coll_elem_owner and package_name = coll_elem_pkg;               
            ELSE
                select attr_name,attr_type_name BULK COLLECT INTO object_coll_type_attr_names,object_coll_type_attr_types 
                    from all_type_attrs where type_name  = coll_elem and owner=coll_elem_owner;   
            END IF;
            For indeks IN object_coll_type_attr_names.FIRST..object_coll_type_attr_names.LAST LOOP
                IF object_coll_type_attr_types(indeks) IN ('CHAR','VARCHAR2') THEN
                    loop_line_string:=loop_line_string || 'myobj(indx).'|| object_coll_type_attr_names(indeks) || '|| '','' ||';
                ELSIF object_coll_type_attr_types(indeks) MEMBER OF base_types THEN
                    loop_line_string:=loop_line_string || 'convert_to_text_pkg.convert_' || REPLACE(object_coll_type_attr_types(indeks),' ','_') || '(myobj(indx).'|| object_coll_type_attr_names(indeks) || ')|| '','' ||';
                ELSE
                    loop_line_string:=loop_line_string || 'myobj(indx).'|| object_coll_type_attr_names(indeks) || '.print() || '','' ||';
                END IF;
            END LOOP;
            loop_line_string:=RTRIM(loop_line_string,'|| '','' || ' );
        end if;
        If nazwa_paczki IS NOT NULL THEN
            nazwa_typu:= nazwa_paczki || '.' || nazwa_typu;
        END IF;
        nazwa_typu:=nazwa_ownera || '.' || nazwa_typu;
        IF ref_mod='REF' THEN
            ref_string_1:=  '  myobj ' || nazwa_typu || '; ' || 
                            '  subelement ' || coll_elem || '; ';
            ref_string_2:=  '   UTL_REF.SELECT_OBJECT(myobj(indx),subelement);' ||
                            '   intermediate:=intermediate || ''('' || ' || loop_line_string || '|| '') '';  ';          
        ELSE
            ref_string_1:=  '  myobj ' || nazwa_typu || '; ';
            ref_string_2:='       intermediate:=intermediate || ''('' || ' || loop_line_string || '|| '') '';  ';
        END IF;
        EXECUTE IMMEDIATE 'DECLARE ' ||
            ref_string_1 ||
            '  myad anydata := :ad; ' ||
            '  intermediate CLOB; ' ||
            'BEGIN ' ||
            '   :res :=myad.GetCollection(myobj); ' ||
            '   IF  myobj.COUNT>0 THEN ' ||
            '   FOR indx IN myobj.FIRST..myobj.LAST LOOP ' ||
            ref_string_2 ||
            '   END LOOP; ' ||
            '   ELSE ' ||
            '       intermediate:=''()''; ' ||
            '   END IF; ' ||
            '   :ret :=intermediate; ' ||
            'END;' USING IN adata,OUT result_code,OUT retval;
        retval:= nazwa_typu || ': ' || retval;
        return retval;
    END print_coll;

END printanything_pkg;

/
