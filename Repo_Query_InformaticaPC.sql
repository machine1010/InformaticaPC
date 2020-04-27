---Informatica Repository Schema Queries 
---PowerCenter query returns all PowerCenter mappings with update strategy transformations using repository views:
SELECT DISTINCT(PARENT_MAPPING_NAME) AS MAPPING_NAME, SUBJECT_AREA AS FOLDER_NAME FROM REP_ALL_MAPPINGS A, REP_WIDGET_INST B WHERE A.PARENT_MAPPING_ID = B.MAPPING_ID AND A.PARENT_SUBJECT_ID=B.SUBJECT_ID AND B.WIDGET_TYPE=4;

----PowerCenter repository query that lists all sources (whether they are used in a mapping or not) and any mappings the source is used in a repository:
SELECT REP_ALL_SOURCES.SOURCE_NAME, REP_SRC_MAPPING.MAPPING_NAME, REP_ALL_SOURCES.SOURCE_DATABASE_NAME FROM REP_SRC_MAPPING, REP_ALL_SOURCES WHERE REP_SRC_MAPPING.SOURCE_ID(+) = REP_ALL_SOURCES.SOURCE_ID and REP_SRC_MAPPING.SOURCE_NAME(+) = REP_ALL_SOURCES.PARENT_SOURCE_NAME and REP_SRC_MAPPING.SUBJECT_ID(+) = REP_ALL_SOURCES.SUBJECT_ID;

----The Sequence Generator stores values in the repository. 
----Following is a query for current value of all Sequence Generator within a repository: 
SELECT a.attr_value AS current_value ,b.WIDGET_NAME AS Transformation_name
FROM rep_widget_attra , REP_ALL_TRANSFORMS b 
WHERE a.attr_id=4 AND a.widget_id IN (SELECT widget_id FROM REP_ALL_TRANSFORMS WHERE widget_type_name LIKE 'Sequence') AND a.widget_id=b.widget_id;
