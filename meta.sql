-- Query for X$Attrib table
SELECT
    my_Attrib.Xa$Id    AS my_Id
,   my_Attrib.Xa$Type  AS my_Type
,   my_Attrib.Xa$ASize AS my_ASize
,   my_Attrib.Xa$Attrs AS my_Attrs
FROM X$Attrib AS my_Attrib;

-- Query for X$Field table
SELECT
    my_Field.Xe$Id       AS my_Id
,   my_Field.Xe$File     AS my_File
,   my_Field.Xe$Name     AS my_Name
,   my_Field.Xe$DataType AS my_DataType
,   my_Field.Xe$Offset   AS my_Offset
,   my_Field.Xe$Size     AS my_Size
,   my_Field.Xe$Dec      AS my_Dec
,   my_Field.Xe$Flags    AS my_Flags
,   CASE
        WHEN my_Field.Xe$DataType = 15 THEN
            CASE
                WHEN my_Field.Xe$Size = 2 THEN 'SMALLIDENTITY'
                WHEN my_Field.Xe$Size = 4 THEN 'IDENTITY'
                WHEN my_Field.Xe$Size = 8 THEN 'BIGIDENTITY'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 9 THEN
            CASE
                WHEN my_Field.Xe$Size = 4 THEN 'BFLOAT4'
                WHEN my_Field.Xe$Size = 8 THEN 'BFLOAT8'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 21 THEN 'LONGVARBINARY'
        WHEN my_Field.Xe$DataType = 19 THEN 'CURRENCY'
        WHEN my_Field.Xe$DataType = 3 THEN 'DATE'
        WHEN my_Field.Xe$DataType = 30 THEN 'DATETIME'
        WHEN my_Field.Xe$DataType = 5 THEN 'DECIMAL'
        WHEN my_Field.Xe$DataType = 2 THEN
            CASE
                WHEN my_Field.Xe$Size = 4 THEN 'REAL'
                WHEN my_Field.Xe$Size = 8 THEN 'DOUBLE'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 27 THEN 'UNIQUEIDENTIFIER'
        WHEN my_Field.Xe$DataType = 1 THEN
            CASE
                WHEN my_Field.Xe$Size = 1 THEN 'TINYINT'
                WHEN my_Field.Xe$Size = 2 THEN 'SMALLINT'
                WHEN my_Field.Xe$Size = 4 THEN 'INTEGER'
                WHEN my_Field.Xe$Size = 8 THEN 'BIGINT'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 6 THEN 'DECIMAL'
        WHEN my_Field.Xe$DataType = 8 THEN 'NUMERIC'
        WHEN my_Field.Xe$DataType = 18 THEN 'NUMERICSA'
        WHEN my_Field.Xe$DataType = 28 THEN 'NUMERICSLB'
        WHEN my_Field.Xe$DataType = 29 THEN 'NUMERICSLS'
        WHEN my_Field.Xe$DataType = 31 THEN 'NUMERICSTB'
        WHEN my_Field.Xe$DataType = 17 THEN 'NUMERICSTS'
        WHEN my_Field.Xe$DataType = 0 THEN
            CASE
                WHEN my_Field.Xe$Size <= 8000 THEN 'CHAR'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 4 THEN 'TIME'
        WHEN my_Field.Xe$DataType = 20 THEN 'TIMESTAMP'
        WHEN my_Field.Xe$DataType = 14 THEN
            CASE
                WHEN my_Field.Xe$Size = 1 THEN 'UTINYINT'
                WHEN my_Field.Xe$Size = 2 THEN 'USMALLINT'
                WHEN my_Field.Xe$Size = 4 THEN 'UINTEGER'
                WHEN my_Field.Xe$Size = 8 THEN 'UBIGINT'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 25 THEN 'NCHAR'
        WHEN my_Field.Xe$DataType = 26 THEN 'NVARCHAR'
        WHEN my_Field.Xe$DataType = 11 THEN 'VARCHAR'
        WHEN my_Field.Xe$DataType = 16 THEN 'BIT'
        WHEN my_Field.Xe$DataType = 7 THEN 'BIT'
        -- Add any other mappings you may have
        ELSE 'UNKNOWN'
    END AS FriendlyDataType
FROM X$Field AS my_Field; -- returns 50,727

-- Query for X$File table
SELECT
    my_File.Xf$Id       AS my_Id
,   my_File.Xf$Name     AS my_Name
,   my_File.Xf$Loc      AS my_Loc
,   my_File.Xf$Flags    AS my_Flags
,   my_File.Xf$Reserved AS my_Reserved
FROM X$File AS my_File
WHERE my_File.Xf$Name LIKE '%AP_INV_TAX_DTL_H%'
; -- returns 1875 -- it would seem file means table.

-- Query for X$Index table
SELECT
    my_Index.Xi$File   AS my_File
,   my_Index.Xi$Field  AS my_Field
,   my_Index.Xi$Number AS my_Number
,   my_Index.Xi$Part   AS my_Part
,   my_Index.Xi$Flags  AS my_Flags
FROM X$Index AS my_Index; -- returns 7713 tuples

-- Query for X$Occurs table
SELECT
    my_Occurs.Xo$FileId       AS my_FileId
,   my_Occurs.Xo$ParentId     AS my_ParentId
,   my_Occurs.Xo$Length       AS my_Length
,   my_Occurs.Xo$Offset       AS my_Offset
,   my_Occurs.Xo$Count        AS my_Count
,   my_Occurs.Xo$MappingIndex AS my_MappingIndex
,   my_Occurs.Xo$Flags        AS my_Flags
FROM X$Occurs AS my_Occurs;  -- returns aught

-- Query for X$Proc table
SELECT
    Xp$Name     AS my_Name
,   Xp$Ver      AS my_Ver
,   Xp$Id       AS my_Id
,   Xp$Flags    AS my_Flags
,   Xp$Trustee  AS my_Trustee
,   Xp$Sequence AS my_Sequence
,   Xp$Misc     AS my_ddl
FROM X$Proc AS my_Proc;     -- returns 66

-- Query for X$Relate table
SELECT
    my_Relate.Xr$PId        AS my_PId
,   my_Relate.Xr$Index      AS my_Index
,   my_Relate.Xr$FId        AS my_FId
,   my_Relate.Xr$FIndex     AS my_FIndex
,   my_Relate.Xr$Name       AS my_Name
,   my_Relate.Xr$UpdateRule AS my_UpdateRule
,   my_Relate.Xr$DeleteRule AS my_DeleteRule
,   my_Relate.Xr$Reserved   AS my_Reserved
FROM X$Relate AS my_Relate;   -- returns aught... there are no foreign keys meaning lots of orphans

-- Query for X$Rights table
SELECT
    my_Rights.Xr$User   AS my_User
,   my_Rights.Xr$Object AS my_Object
,   my_Rights.Xr$Type   AS my_Type
,   my_Rights.Xr$Column AS my_Column
,   my_Rights.Xr$Rights AS my_Rights
FROM X$Rights AS my_Rights;  -- returns 3011

-- Query for X$Trigger table
SELECT
    my_Trigger.Xt$Name       AS my_Name
,   my_Trigger.Xt$Version    AS my_Version
,   my_Trigger.Xt$File       AS my_File
,   my_Trigger.Xt$Event      AS my_Event
,   my_Trigger.Xt$ActionTime AS my_ActionTime
,   my_Trigger.Xt$ForEach    AS my_ForEach
,   my_Trigger.Xt$Order      AS my_Order
,   my_Trigger.Xt$Sequence   AS my_Sequence
,   my_Trigger.Xt$Misc       AS my_Misc
FROM X$Trigger AS my_Trigger; -- returns aught

-- Query for X$User table
SELECT TOP 10
    my_User.Xu$Id       AS my_Id
,   my_User.Xu$Name     AS my_Name
,   my_User.Xu$Password AS my_Password
,   my_User.Xu$Flags    AS my_Flags
FROM X$User AS my_User;       -- returns 3 tuples

-- Query for X$Variant table
SELECT -- returns aught
    my_Variant.Xvar$FileId AS my_FileId
,   my_Variant.Xvar$Pdf    AS my_Pdf
FROM X$Variant AS my_Variant;          -- returns aught

-- Query for X$View table
SELECT TOP 1
    my_View.Xv$Name     AS my_Name
,   my_View.Xv$Version  AS my_Version
,   my_View.Xv$Id       AS my_Id
,   my_View.Xv$Trustee  AS my_Trustee
,   my_View.Xv$Sequence AS my_Sequence
,   my_View.Xv$Misc     AS my_the_drl
FROM X$View AS my_View ;       -- returns a lot



--=========================queries=================================


SELECT
    my_Index.Xi$File     AS my_File
,   my_Index.Xi$Field    AS my_Field
,   my_Index.Xi$Number   AS my_Number
,   my_Index.Xi$Part     AS my_Part
,   my_Index.Xi$Flags    AS my_Flags
,   my_File.Xf$Name      AS my_table_name
,   my_Field.Xe$Name     AS my_column_name
FROM       X$Index AS my_Index
INNER JOIN X$File  AS my_File  ON my_Index.Xi$File  = my_File.Xf$Id
INNER JOIN X$Field AS my_Field ON my_Index.Xi$Field = my_Field.Xe$Id
WHERE 1=1
--AND UPPER(my_File.Xf$Name) LIKE 'INVENTORY_MSTR'
ORDER BY
    my_table_name
,   my_Number
,   my_Part;

SELECT * 
FROM  X$Field



-- Query for X$Field table
SELECT DISTINCT
    bar.FriendlyDataType
FROM 
(
SELECT
    my_Field.Xe$Id       AS my_Id
,   my_Field.Xe$File     AS my_File
,   my_Table.Xf$Name     AS my_table_name
,   my_Field.Xe$Name     AS my_Name
,   my_Field.Xe$DataType AS my_DataType
,   my_Field.Xe$Offset   AS my_Offset
,   my_Field.Xe$Size     AS my_Size
,   my_Field.Xe$Dec      AS my_Dec
,   my_Field.Xe$Flags    AS my_Flags
,   CASE
        WHEN my_Field.Xe$DataType = 15 THEN
            CASE
                WHEN my_Field.Xe$Size = 2 THEN 'SMALLIDENTITY'
                WHEN my_Field.Xe$Size = 4 THEN 'IDENTITY'
                WHEN my_Field.Xe$Size = 8 THEN 'BIGIDENTITY'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 9 THEN
            CASE
                WHEN my_Field.Xe$Size = 4 THEN 'BFLOAT4'
                WHEN my_Field.Xe$Size = 8 THEN 'BFLOAT8'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 21 THEN 'LONGVARBINARY'
        WHEN my_Field.Xe$DataType = 19 THEN 'CURRENCY'
        WHEN my_Field.Xe$DataType = 3 THEN 'DATE'
        WHEN my_Field.Xe$DataType = 30 THEN 'DATETIME'
        WHEN my_Field.Xe$DataType = 5 THEN 'DECIMAL'
        WHEN my_Field.Xe$DataType = 2 THEN
            CASE
                WHEN my_Field.Xe$Size = 4 THEN 'REAL'
                WHEN my_Field.Xe$Size = 8 THEN 'DOUBLE'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 27 THEN 'UNIQUEIDENTIFIER'
        WHEN my_Field.Xe$DataType = 1 THEN
            CASE
                WHEN my_Field.Xe$Size = 1 THEN 'TINYINT'
                WHEN my_Field.Xe$Size = 2 THEN 'SMALLINT'
                WHEN my_Field.Xe$Size = 4 THEN 'INTEGER'
                WHEN my_Field.Xe$Size = 8 THEN 'BIGINT'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 6 THEN 'DECIMAL'
        WHEN my_Field.Xe$DataType = 8 THEN 'NUMERIC'
        WHEN my_Field.Xe$DataType = 18 THEN 'NUMERICSA'
        WHEN my_Field.Xe$DataType = 28 THEN 'NUMERICSLB'
        WHEN my_Field.Xe$DataType = 29 THEN 'NUMERICSLS'
        WHEN my_Field.Xe$DataType = 31 THEN 'NUMERICSTB'
        WHEN my_Field.Xe$DataType = 17 THEN 'NUMERICSTS'
        WHEN my_Field.Xe$DataType = 0 THEN
            CASE
                WHEN my_Field.Xe$Size <= 8000 THEN 'CHAR'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 4 THEN 'TIME'
        WHEN my_Field.Xe$DataType = 20 THEN 'TIMESTAMP'
        WHEN my_Field.Xe$DataType = 14 THEN
            CASE
                WHEN my_Field.Xe$Size = 1 THEN 'UTINYINT'
                WHEN my_Field.Xe$Size = 2 THEN 'USMALLINT'
                WHEN my_Field.Xe$Size = 4 THEN 'UINTEGER'
                WHEN my_Field.Xe$Size = 8 THEN 'UBIGINT'
                ELSE 'UNKNOWN'
            END
        WHEN my_Field.Xe$DataType = 25 THEN 'NCHAR'
        WHEN my_Field.Xe$DataType = 26 THEN 'NVARCHAR'
        WHEN my_Field.Xe$DataType = 11 THEN 'VARCHAR'
        WHEN my_Field.Xe$DataType = 16 THEN 'BIT'
        WHEN my_Field.Xe$DataType = 7 THEN 'BIT'
        -- Add any other mappings you may have
        ELSE 'UNKNOWN'
    END AS FriendlyDataType
FROM      X$Field AS my_Field
LEFT JOIN X$File  AS my_Table ON my_Field.Xe$File = my_Table.Xf$Id
WHERE 1=1
AND my_Field.Xe$DataType <> 255
AND my_Field.Xe$DataType <> 227
AND rtrim(my_Table.Xf$Name) NOT LIKE '%X$%' 
ORDER BY my_table_name, my_Name
) AS bar
;
