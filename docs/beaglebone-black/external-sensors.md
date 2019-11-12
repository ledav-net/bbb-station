
------------------------
--- External Sensors ---
------------------------

DHT11:
- gnd -> P9.02 (gnd)
- vcc -> P9.03 (3.3v)
- S   -> P9.12 (GPIO_28, gpmc_be1n)

Photo Diode (vma407):
- adc -> P9.32 (1.8v)
- gns -> P9.34 (GNDA_ADC)
- out -> P9.39 (AIO0)

TSL2561:
- gns -> P9.02 (gnd)
- Vin -> P9.03 (3.3v)
- SCL -> P9.19 (I2C-2-SCL)
- SDA -> P9.20 (I2C-2-SDA)
- INT -> n/c

SGP30:
- Vin -> P9.03 (3.3v)
- 1v8 -> n/c
- gnd -> P9.02 (GND)
- SCL -> P9.19 (I2C-2-SCL)
- SDA -> P9.20 (I2C-2-SDA)
