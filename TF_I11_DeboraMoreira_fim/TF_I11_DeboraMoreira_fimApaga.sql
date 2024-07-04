-- -------- < TF_I11_DeboraMoreira > --------
--
--                    SCRIPT DE APAGA (DDL)
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
--              => Deleta views e tabelas materializadas.
--
-- ---------------------------------------------------------

USE employees;

DROP TABLE IF EXISTS dept_emp,
                     dept_manager,
                     titles,
                     salaries, 
                     employees, 
                     departments;

DROP VIEW IF EXISTS v_emp_by_gender,
                    v_salary_history,
                    v_title_history,
                    v_current_employee_titles,
                    v_current_employee_salaries;
                    
DROP TABLE IF EXISTS m_emp_by_gender,
                     m_title_history,
                     m_salary_history,
                     m_current_employee_titles,
                     m_current_employee_salaries;

