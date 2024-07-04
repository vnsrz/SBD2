-- -------- < TF_I11_DeboraMoreira > --------
--
--                    SCRIPT DE CONSULTA (DML)
--
-- Data Criacao ...........: 03/07/2024
-- Autor(es) ..............: Débora Caires de Souza Moreira
-- 							 Vinícius Roriz Meireles Silva
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: employees
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--         => 05 Views
-- 
-- Ultimas Alteracoes
--   10/06/2024 => Criação do script
--   03/07/2024 => Ajustes na apresentacao da documentacao
--                 desse script.
--
-- ---------------------------------------------------------

USE employees;

-- View 1: Funcionários por Gênero
-- Mostra a quantidade de funcionários para cada gênero.
CREATE OR REPLACE VIEW v_emp_by_gender AS
SELECT gender, COUNT(*) AS total
FROM employees
GROUP BY gender;

-- View 2: Histórico de Salários por Funcionário
-- Mostra todos os salários que cada empregado ja teve.
CREATE OR REPLACE VIEW v_salary_history AS
SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no, s.from_date;

-- View 3: Histórico de Títulos por Funcionário
-- Mostra todos os títulos que cada empregado ja teve.
CREATE OR REPLACE VIEW v_title_history AS
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
ORDER BY e.emp_no, t.from_date;

-- View 4: Títulos atuais de cada funcionário
-- Lista todos os empregados que possuem um título atualmente.
CREATE OR REPLACE VIEW v_current_employee_titles AS
    SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
    FROM employees e
    JOIN titles t ON e.emp_no = t.emp_no
    WHERE t.to_date  = '9999-01-01';

-- View 5: Funcionários atuais com seus salários mais recentes
-- Lista todos os empregados que possuem um salário atualmente.
CREATE OR REPLACE VIEW v_current_employee_salaries AS
    SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE s.to_date = '9999-01-01'; 
    
-- Criação de tabelas materializadas

CREATE TABLE IF NOT EXISTS m_emp_by_gender AS SELECT * FROM v_emp_by_gender;
CREATE TABLE IF NOT EXISTS m_title_history AS SELECT * FROM v_title_history;
CREATE TABLE IF NOT EXISTS m_salary_history AS SELECT * FROM v_salary_history;
CREATE TABLE IF NOT EXISTS m_current_employee_titles AS SELECT * FROM v_current_employee_titles;
CREATE TABLE IF NOT EXISTS m_current_employee_salaries AS SELECT * FROM v_current_employee_salaries;


-- Adicionando índices para otimização
CREATE INDEX idx_emp_by_gender_gender ON m_emp_by_gender(gender);
CREATE INDEX idx_salary_history_emp_no ON m_salary_history(emp_no);
CREATE INDEX idx_title_history_emp_no ON m_title_history(emp_no);
CREATE INDEX idx_current_employee_titles_emp_no ON m_current_employee_titles(emp_no);
CREATE INDEX idx_current_employee_salaries_emp_no ON m_current_employee_salaries(emp_no);

SELECT * FROM v_emp_by_gender;
SELECT * FROM v_salary_history;
SELECT * FROM v_title_history;
SELECT * FROM v_current_employee_titles;
SELECT * FROM v_current_employee_salaries;