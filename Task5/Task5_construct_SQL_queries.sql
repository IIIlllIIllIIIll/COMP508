-- 1. To search for staff's role history, and retrieve the following details (Staff ID, Staff Name (Concatenation of Last and First names) and their role history
SELECT
    s.staff_id,
    s.first_name
    || ' '
    || s.last_name AS "Full name",
    r.start_date,
    r.end_date,
    r.role_id,
    r.description,
    r.contract_number
FROM
    staff        s,
    role_history r
WHERE
        s.staff_id = r.staff_id
    AND lower(s.staff_id) = lower('&staff_id')
ORDER BY
    start_date ASC;
    
-- 2. To search for all subsection of a road, and retrieve following details (Road ID, Road name, Subsection ID, Subsection name)
SELECT
    r.road_id   AS "Road ID",
    r.road_name AS "Road name",
    s.road_id   AS "Subsection ID",
    s.road_name AS "Subsection name"
FROM
    road r,
    road s
WHERE
    r.road_id = s.section_of
ORDER BY
    r.road_id ASC;

-- 3. To search for average length of each types of road, and retrieve following details (Category ID, Road category, Number of roads, Total length, Average length, Minimum length, Maximum length)
SELECT
    c.category_id AS "Category ID",
    c.description AS "Road category",
    COUNT(*)      AS "Number of roads",
    SUM(length)   AS "Total length",
    AVG(length)   AS "Average length",
    MIN(length)   AS "Minimum length",
    MAX(length)   AS "Maximum length"
FROM
    road     r,
    category c
WHERE
    r.category_id = c.category_id
GROUP BY
    c.category_id,
    c.description
HAVING
    AVG(length) > &avg_length
ORDER BY
    c.category_id ASC;

-- 4. To search all staff that has been worked on the project that user has entered, and retrieve following details (Staff ID, Full name, Phone number, Email)
SELECT
    s.staff_id                                     AS "Staff ID",
    s.first_name
    || ' '
    || s.last_name                                 AS "Full name",
    r.contract_number,
    r.start_date,
    r.end_date,
    trunc(nvl(r.end_date, sysdate) - r.start_date) AS "Duration",
    s.phone_number                                 AS "Phone number",
    s.email                                        AS "Email"
FROM
    project      p,
    contract     c,
    role_history r,
    staff        s
WHERE
    ( p.project_id = c.project_id
      AND c.contract_number = r.contract_number
      AND r.staff_id = s.staff_id )
    AND ( lower(p.project_id) = lower('&project_id') )
ORDER BY
    r.start_date ASC,
    s.staff_id ASC;
    
-- 5. To search all contractor and its contract including contractors that do not have contract yet, and retrieve following details (
SELECT
    o.contractor_id,
    o.name                                         AS "Contractor name",
    c.contract_number,
    c.project_id,
    c.name                                         AS "Contract name",
    c.estimated_cost,
    c.actual_cost,
    c.actual_cost - c.estimated_cost               AS "Cost difference",
    c.start_date,
    c.end_date,
    trunc(nvl(c.end_date, sysdate) - c.start_date) AS "Duration"
FROM
    contractor o,
    contract   c
WHERE
    o.contractor_id = c.contractor_id (+)
ORDER BY
    o.contractor_id ASC,
    c.contract_number ASC;