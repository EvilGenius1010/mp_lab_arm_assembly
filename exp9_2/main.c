#include <lpc214x.h>

int main(void)
{
    unsigned long int c = 0xFF0000;
	
	  PINSEL1 &= ~(1 << 0);  // Clear bit 0
    PINSEL1 &= ~(1 << 1);  // Clear bit 1

    // Configure P0.16 to P0.23 as output
    IODIR0 = c;

    // Turn ON LEDs connected to P0.16 to P0.23
    IOSET0 = c;

    while (1)
    {
	
        // Example: Toggle LEDs using direct write
        IOCLR0 = c;  // Turn OFF LEDs
        IOSET0 = c;  // Turn ON LEDs
    }
}
