#!/bin/bash
config-pin p8.11 gpio
config-pin p8.13 gpio
config-pin p8.15 gpio
config-pin p9.28 spi_cs
config-pin p9.29 spi
config-pin p9.30 spi
config-pin p9.31 spi_sclk

config-pin p9.17 spi_cs
config-pin p9.18 spi
config-pin p9.21 spi
config-pin p9.22 spi_sclk

config-pin -q p8.11 
config-pin -q p8.13 
config-pin -q p8.15
config-pin -q p9.28
config-pin -q p9.29
config-pin -q p9.30
config-pin -q p9.31

config-pin -q p9.17
config-pin -q p9.18
config-pin -q p9.21
config-pin -q p9.22
