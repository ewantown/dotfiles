-- SELECT 'SELECT ' || LISTAGG(COLNAME, ', ') WITHIN GROUP (ORDER BY COLNO) || ' FROM ' || TABNAME || ';' AS QUERY_STRING FROM SYSCAT.COLUMNS WHERE TABSCHEMA = 'CMSPROD' GROUP BY TABNAME;

-- select 'select ' || listagg(colname, ', ') within group (order by colno) || ' from ' || tabname || ';' as query_string from syscat.columns where tabschema = 'cmsprod' group by tabname;
