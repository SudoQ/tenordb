#!/bin/bash
echo "" > init.sql
pg_dump -c tenordb > init.sql
