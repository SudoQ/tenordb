#!/bin/bash
echo "" > init.sql
pg_dump --clean --no-owner tenordb > init.sql
