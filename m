Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BAB3BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:20:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtPT1229zDqfv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:20:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbS00yjzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:15 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M8yso-1hOCqc49nq-0069pN; Sat, 27 Apr 2019 14:52:57 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 27/41] drivers: tty: serial: sunzilog: fix formatting issues
Date: Sat, 27 Apr 2019 14:52:08 +0200
Message-Id: <1556369542-13247-28-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Z847pBHLI6QbxAGimBdq6+JmZrHYKMuxRAjW98flGjUtS5oHGJC
 2yP7klqt22fYcBJ7wz2PjoaV7D64B1mPwQH9AQj7l5Pif1Pndm+YkU0UNordwQ5Wy1IxDut
 dU/69hgbv0mSPvXN1+wW7rRWDrd2Q3LYi4dUSMc59RL3wnqb6nh5ZX42JvsXC4WFJoJr6tj
 A9xdCttEcAPucvS++lRjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tNojbdkleHM=:9ujyteLLaneELFgH5hYsXU
 FmkTTYGb5T7+MhFSRxW6RP06KacNNylocm68V6AAD8whk7j7kEMJw/4l8VeF3ghRB345gxcJl
 yi4Q0VTSsywBO0CxySdF3pCj6tAY72cl6tQrSD8eZdkx41BKOJIcbekSMUGqaLwRweDvkomVe
 UUQN1UnJuI2dcage7PJFJGVnPeaDvpXaD+/AfVngqsmpjk/28GGmZ60IFUnJmcY1VFs1cO9lL
 SIdjVxJoDXDNDC/smX9goshA6hTd5LedoCnXdtND/ojke1p2hNyiSo1WXwJc1HDt6aWjgVmaw
 iJHqRShIkc3R30Cj9ayYw0C20F7hiuT2Gua2tTlLQ9nzNzXudoAUSdc7L75D83QvMc8Kl5fK6
 H9ykZk8D2xOEeffyTW5tciWLIrPHn/LA2u5WuFqDAOEETuybAlYfjHtSvwjX0CmerpW4+8v12
 ss5uNL4Z/jHKbYdeXoVJ/AA5DePUWobfPU0kLaFidbpUQ11bbQMTjTvgeQOrvJgIR0Mo+BPi2
 ud9aclEUkUPB+ZbTtvt5GkqlW2z51SWOHN+e8s5n5QYqqr3rI1tuxY+069jB34pbRIE/nKpfl
 CQ4JlurwTIxBJdf8Ej3WN4nawPUGz5lpc453M18J7DpT0bCHPxBX9Fls5RywQQrcNmSVco1m3
 IqPjYq4FKC+oucATLGNH1cZbTJE8vQdT82XHkSY4xjNrufVLtSgYgB6bWLFJ5F+FkhESxVOlV
 7JOReBvvazMQKmAlwl+0fZW6VKhH1rhYqwWz/E3QznKjBbSX6CjB1b0fS7CkYIO4k8vrlbx71
 yaOB+ixpkAZRkG3Jkv6LqUorR2GulbOUdvLOr5QF+UZnA03y9q6+7wGINPqrehBGbubOA8FnJ
 7fhUPqGe36mz8JatGpaEZfAuM+YCJzCx4/c16PQvS41KULG/9BGvQGU3QMcoRE
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix checkpatch warnings:

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    #38: FILE: drivers/tty/serial/sunzilog.c:38:
    +#include <asm/io.h>

    WARNING: line over 80 characters
    #109: FILE: drivers/tty/serial/sunzilog.c:109:
    +#define ZILOG_CHANNEL_FROM_PORT(PORT)	((struct zilog_channel __iomem *)((PORT)->membase))

    WARNING: line over 80 characters
    #116: FILE: drivers/tty/serial/sunzilog.c:116:
    +#define ZS_WANTS_MODEM_STATUS(UP)	((UP)->flags & SUNZILOG_FLAG_MODEM_STATUS)

    WARNING: line over 80 characters
    #179: FILE: drivers/tty/serial/sunzilog.c:179:
    +static int __load_zsregs(struct zilog_channel __iomem *channel, unsigned char *regs)

    WARNING: Missing a blank line after declarations
    #188: FILE: drivers/tty/serial/sunzilog.c:188:
    +		unsigned char stat = read_zsreg(channel, R1);
    +		if (stat & ALL_SNT)

    ERROR: trailing whitespace
    #231: FILE: drivers/tty/serial/sunzilog.c:231:
    +^I$

    WARNING: braces {} are not necessary for any arm of this statement
    #276: FILE: drivers/tty/serial/sunzilog.c:276:
    +		if (ZS_TX_ACTIVE(up)) {
    [...]
    +		} else {
    [...]

    ERROR: else should follow close brace '}'
    #378: FILE: drivers/tty/serial/sunzilog.c:378:
    +			}
    +			else if (r1 & PAR_ERR)

    ERROR: code indent should use tabs where possible
    #397: FILE: drivers/tty/serial/sunzilog.c:397:
    +^I^I    ^Itty_insert_flip_char(port, ch, flag);$

    WARNING: please, no space before tabs
    #397: FILE: drivers/tty/serial/sunzilog.c:397:
    +^I^I    ^Itty_insert_flip_char(port, ch, flag);$

    WARNING: line over 80 characters
    #440: FILE: drivers/tty/serial/sunzilog.c:440:
    +		/* The Zilog just gives us an interrupt when DCD/CTS/etc. change.

    WARNING: line over 80 characters
    #441: FILE: drivers/tty/serial/sunzilog.c:441:
    +		 * But it does not tell us which bit has changed, we have to keep

    WARNING: Missing a blank line after declarations
    #464: FILE: drivers/tty/serial/sunzilog.c:464:
    +		unsigned char status = readb(&channel->control);
    +		ZSDELAY();

    WARNING: line over 80 characters
    #468: FILE: drivers/tty/serial/sunzilog.c:468:
    +		 * It can occur because of how we do serial console writes.  It would

    WARNING: line over 80 characters
    #469: FILE: drivers/tty/serial/sunzilog.c:469:
    +		 * be nice to transmit console writes just like we normally would for

    WARNING: line over 80 characters
    #470: FILE: drivers/tty/serial/sunzilog.c:470:
    +		 * a TTY line. (ie. buffered and TX interrupt driven).  That is not

    WARNING: line over 80 characters
    #471: FILE: drivers/tty/serial/sunzilog.c:471:
    +		 * easy because console writes cannot sleep.  One solution might be

    WARNING: line over 80 characters
    #593: FILE: drivers/tty/serial/sunzilog.c:593:
    +static __inline__ unsigned char sunzilog_read_channel_status(struct uart_port *port)

    WARNING: plain inline is preferred over __inline__
    #593: FILE: drivers/tty/serial/sunzilog.c:593:
    +static __inline__ unsigned char sunzilog_read_channel_status(struct uart_port *port)

    ERROR: trailing whitespace
    #664: FILE: drivers/tty/serial/sunzilog.c:664:
    +^I/* NOTE: Not subject to 'transmitter active' rule.  */ $

    ERROR: trailing whitespace
    #752: FILE: drivers/tty/serial/sunzilog.c:752:
    +^I^I/* NOTE: Not subject to 'transmitter active' rule.  */ $

    ERROR: trailing whitespace
    #779: FILE: drivers/tty/serial/sunzilog.c:779:
    +^I^I/* NOTE: Not subject to 'transmitter active' rule.  */ $

    WARNING: line over 80 characters
    #999: FILE: drivers/tty/serial/sunzilog.c:999:
    +static int sunzilog_verify_port(struct uart_port *port, struct serial_struct *ser)

    WARNING: Missing a blank line after declarations
    #1142: FILE: drivers/tty/serial/sunzilog.c:1142:
    +		unsigned char val = readb(&channel->control);
    +		if (val & Tx_BUF_EMP) {

    WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
    #1230: FILE: drivers/tty/serial/sunzilog.c:1230:
    +	printk(KERN_INFO "Console: ttyS%d (SunZilog zs%d)\n",

    WARNING: braces {} are not necessary for single statement blocks
    #1383: FILE: drivers/tty/serial/sunzilog.c:1383:
    +		if (__load_zsregs(channel, up->curregs)) {
    +			up->flags |= SUNZILOG_FLAG_ESCC;
    +		}

    WARNING: quoted string split across lines
    #1493: FILE: drivers/tty/serial/sunzilog.c:1493:
    +		dev_info(&op->dev, "Keyboard at MMIO 0x%llx (irq = %d) "
    +		       "is a %s\n",

    WARNING: quoted string split across lines
    #1497: FILE: drivers/tty/serial/sunzilog.c:1497:
    +		dev_info(&op->dev, "Mouse at MMIO 0x%llx (irq = %d) "
    +		       "is a %s\n",

    WARNING: Missing a blank line after declarations
    #1581: FILE: drivers/tty/serial/sunzilog.c:1581:
    +		struct uart_sunzilog_port *up = sunzilog_irq_chain;
    +		err = request_irq(zilog_irq, sunzilog_interrupt, IRQF_SHARED,

    WARNING: line over 80 characters
    #1590: FILE: drivers/tty/serial/sunzilog.c:1590:
    +			/* printk (KERN_INFO "Enable IRQ for ZILOG Hardware %p\n", up); */

    WARNING: line over 80 characters
    #1627: FILE: drivers/tty/serial/sunzilog.c:1627:
    +			/* printk (KERN_INFO "Disable IRQ for ZILOG Hardware %p\n", up); */

    ERROR: trailing statements should be on next line
    #1248: FILE: drivers/tty/serial/sunzilog.c:1248:
    +	case B150: baud = 150; break;

    ERROR: trailing statements should be on next line
    #1249: FILE: drivers/tty/serial/sunzilog.c:1249:
    +	case B300: baud = 300; break;

    ERROR: trailing statements should be on next line
    #1250: FILE: drivers/tty/serial/sunzilog.c:1250:
    +	case B600: baud = 600; break;

    ERROR: trailing statements should be on next line
    #1251: FILE: drivers/tty/serial/sunzilog.c:1251:
    +	case B1200: baud = 1200; break;

    ERROR: trailing statements should be on next line
    #1252: FILE: drivers/tty/serial/sunzilog.c:1252:
    +	case B2400: baud = 2400; break;

    ERROR: trailing statements should be on next line
    #1253: FILE: drivers/tty/serial/sunzilog.c:1253:
    +	case B4800: baud = 4800; break;

    ERROR: trailing statements should be on next line
    #1254: FILE: drivers/tty/serial/sunzilog.c:1254:
    +	default: case B9600: baud = 9600; break;

    ERROR: trailing statements should be on next line
    #1255: FILE: drivers/tty/serial/sunzilog.c:1255:
    +	case B19200: baud = 19200; break;

    ERROR: trailing statements should be on next line
    #1256: FILE: drivers/tty/serial/sunzilog.c:1256:
    +	case B38400: baud = 38400; break;

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 118 +++++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 6285bba..17b0520 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -106,14 +106,17 @@ struct uart_sunzilog_port {
 
 static void sunzilog_putchar(struct uart_port *port, int ch);
 
-#define ZILOG_CHANNEL_FROM_PORT(PORT)	((struct zilog_channel __iomem *)((PORT)->membase))
-#define UART_ZILOG(PORT)		((struct uart_sunzilog_port *)(PORT))
+#define ZILOG_CHANNEL_FROM_PORT(PORT)	\
+	((struct zilog_channel __iomem *)((PORT)->membase))
+#define UART_ZILOG(PORT)		\
+	((struct uart_sunzilog_port *)(PORT))
 
 #define ZS_IS_KEYB(UP)	((UP)->flags & SUNZILOG_FLAG_CONS_KEYB)
 #define ZS_IS_MOUSE(UP)	((UP)->flags & SUNZILOG_FLAG_CONS_MOUSE)
 #define ZS_IS_CONS(UP)	((UP)->flags & SUNZILOG_FLAG_IS_CONS)
 #define ZS_IS_KGDB(UP)	((UP)->flags & SUNZILOG_FLAG_IS_KGDB)
-#define ZS_WANTS_MODEM_STATUS(UP)	((UP)->flags & SUNZILOG_FLAG_MODEM_STATUS)
+#define ZS_WANTS_MODEM_STATUS(UP)	\
+	((UP)->flags & SUNZILOG_FLAG_MODEM_STATUS)
 #define ZS_IS_CHANNEL_A(UP)	((UP)->flags & SUNZILOG_FLAG_IS_CHANNEL_A)
 #define ZS_REGS_HELD(UP)	((UP)->flags & SUNZILOG_FLAG_REGS_HELD)
 #define ZS_TX_STOPPED(UP)	((UP)->flags & SUNZILOG_FLAG_TX_STOPPED)
@@ -176,7 +179,8 @@ static void sunzilog_clear_fifo(struct zilog_channel __iomem *channel)
 /* This function must only be called when the TX is not busy.  The UART
  * port lock must be held and local interrupts disabled.
  */
-static int __load_zsregs(struct zilog_channel __iomem *channel, unsigned char *regs)
+static int __load_zsregs(struct zilog_channel __iomem *channel,
+			 unsigned char *regs)
 {
 	int i;
 	int escc;
@@ -185,6 +189,7 @@ static int __load_zsregs(struct zilog_channel __iomem *channel, unsigned char *r
 	/* Let pending transmits finish.  */
 	for (i = 0; i < 1000; i++) {
 		unsigned char stat = read_zsreg(channel, R1);
+
 		if (stat & ALL_SNT)
 			break;
 		udelay(100);
@@ -228,7 +233,7 @@ static int __load_zsregs(struct zilog_channel __iomem *channel, unsigned char *r
 	/* Lower and upper byte of baud rate generator divisor.  */
 	write_zsreg(channel, R12, regs[R12]);
 	write_zsreg(channel, R13, regs[R13]);
-	
+
 	/* Now rewrite R14, with BRENAB (if set).  */
 	write_zsreg(channel, R14, regs[R14]);
 
@@ -273,11 +278,10 @@ static void sunzilog_maybe_update_regs(struct uart_sunzilog_port *up,
 				       struct zilog_channel __iomem *channel)
 {
 	if (!ZS_REGS_HELD(up)) {
-		if (ZS_TX_ACTIVE(up)) {
+		if (ZS_TX_ACTIVE(up))
 			up->flags |= SUNZILOG_FLAG_REGS_HELD;
-		} else {
+		else
 			__load_zsregs(channel, up->curregs);
-		}
 	}
 }
 
@@ -374,8 +378,7 @@ static void sunzilog_kbdms_receive_chars(struct uart_sunzilog_port *up,
 				up->port.icount.brk++;
 				if (uart_handle_break(&up->port))
 					continue;
-			}
-			else if (r1 & PAR_ERR)
+			} else if (r1 & PAR_ERR)
 				up->port.icount.parity++;
 			else if (r1 & CRC_ERR)
 				up->port.icount.frame++;
@@ -394,7 +397,7 @@ static void sunzilog_kbdms_receive_chars(struct uart_sunzilog_port *up,
 
 		if (up->port.ignore_status_mask == 0xff ||
 		    (r1 & up->port.ignore_status_mask) == 0) {
-		    	tty_insert_flip_char(port, ch, flag);
+			tty_insert_flip_char(port, ch, flag);
 		}
 		if (r1 & Rx_OVR)
 			tty_insert_flip_char(port, 0, TTY_OVERRUN);
@@ -437,9 +440,9 @@ static void sunzilog_status_handle(struct uart_sunzilog_port *up,
 		if (status & SYNC)
 			up->port.icount.dsr++;
 
-		/* The Zilog just gives us an interrupt when DCD/CTS/etc. change.
-		 * But it does not tell us which bit has changed, we have to keep
-		 * track of this ourselves.
+		/* The Zilog just gives us an interrupt when DCD/CTS/etc.
+		 * change.But it does not tell us which bit has changed,
+		 * we have to keep track of this ourselves.
 		 */
 		if ((status ^ up->prev_status) ^ DCD)
 			uart_handle_dcd_change(&up->port,
@@ -461,15 +464,17 @@ static void sunzilog_transmit_chars(struct uart_sunzilog_port *up,
 
 	if (ZS_IS_CONS(up)) {
 		unsigned char status = readb(&channel->control);
+
 		ZSDELAY();
 
 		/* TX still busy?  Just wait for the next TX done interrupt.
 		 *
-		 * It can occur because of how we do serial console writes.  It would
-		 * be nice to transmit console writes just like we normally would for
-		 * a TTY line. (ie. buffered and TX interrupt driven).  That is not
-		 * easy because console writes cannot sleep.  One solution might be
-		 * to poll on enough port->xmit space becoming free.  -DaveM
+		 * It can occur because of how we do serial console writes.
+		 * It would be nice to transmit console writes just like we
+		 * normally would for a TTY line. (ie. buffered and TX
+		 * interrupt driven).  That is not easy because console
+		 * writes cannot sleep.  One solution might be to poll on
+		 * enough port->xmit space becoming free.  -DaveM
 		 */
 		if (!(status & Tx_BUF_EMP))
 			return;
@@ -590,7 +595,8 @@ static irqreturn_t sunzilog_interrupt(int irq, void *dev_id)
 /* A convenient way to quickly get R0 status.  The caller must _not_ hold the
  * port lock, it is acquired here.
  */
-static __inline__ unsigned char sunzilog_read_channel_status(struct uart_port *port)
+static inline unsigned char
+sunzilog_read_channel_status(struct uart_port *port)
 {
 	struct zilog_channel __iomem *channel;
 	unsigned char status;
@@ -661,13 +667,13 @@ static void sunzilog_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	else
 		clear_bits |= DTR;
 
-	/* NOTE: Not subject to 'transmitter active' rule.  */ 
+	/* NOTE: Not subject to 'transmitter active' rule. */
 	up->curregs[R5] |= set_bits;
 	up->curregs[R5] &= ~clear_bits;
 	write_zsreg(channel, R5, up->curregs[R5]);
 }
 
-/* The port lock is held and interrupts are disabled.  */
+/* The port lock is held and interrupts are disabled. */
 static void sunzilog_stop_tx(struct uart_port *port)
 {
 	struct uart_sunzilog_port *up =
@@ -749,7 +755,7 @@ static void sunzilog_enable_ms(struct uart_port *port)
 	if (new_reg != up->curregs[R15]) {
 		up->curregs[R15] = new_reg;
 
-		/* NOTE: Not subject to 'transmitter active' rule.  */ 
+		/* NOTE: Not subject to 'transmitter active' rule. */
 		write_zsreg(channel, R15, up->curregs[R15] & ~WR7pEN);
 	}
 }
@@ -776,7 +782,7 @@ static void sunzilog_break_ctl(struct uart_port *port, int break_state)
 	if (new_reg != up->curregs[R5]) {
 		up->curregs[R5] = new_reg;
 
-		/* NOTE: Not subject to 'transmitter active' rule.  */ 
+		/* NOTE: Not subject to 'transmitter active' rule. */
 		write_zsreg(channel, R5, up->curregs[R5]);
 	}
 
@@ -996,7 +1002,8 @@ static void sunzilog_config_port(struct uart_port *port, int flags)
 }
 
 /* We do not support letting the user mess with the divisor, IRQ, etc. */
-static int sunzilog_verify_port(struct uart_port *port, struct serial_struct *ser)
+static int sunzilog_verify_port(struct uart_port *port,
+				struct serial_struct *ser)
 {
 	return -EINVAL;
 }
@@ -1139,6 +1146,7 @@ static void sunzilog_putchar(struct uart_port *port, int ch)
 	 */
 	do {
 		unsigned char val = readb(&channel->control);
+
 		if (val & Tx_BUF_EMP) {
 			ZSDELAY();
 			break;
@@ -1237,15 +1245,34 @@ static int __init sunzilog_console_setup(struct console *con, char *options)
 	 * this hackish cflag thing is OK.
 	 */
 	switch (con->cflag & CBAUD) {
-	case B150: baud = 150; break;
-	case B300: baud = 300; break;
-	case B600: baud = 600; break;
-	case B1200: baud = 1200; break;
-	case B2400: baud = 2400; break;
-	case B4800: baud = 4800; break;
-	default: case B9600: baud = 9600; break;
-	case B19200: baud = 19200; break;
-	case B38400: baud = 38400; break;
+	case B150:
+		baud = 150;
+		break;
+	case B300:
+		baud = 300;
+		break;
+	case B600:
+		baud = 600;
+		break;
+	case B1200:
+		baud = 1200;
+		break;
+	case B2400:
+		baud = 2400;
+		break;
+	case B4800:
+		baud = 4800;
+		break;
+	default:
+	case B9600:
+		baud = 9600;
+		break;
+	case B19200:
+		baud = 19200;
+		break;
+	case B38400:
+		baud = 38400;
+		break;
 	}
 
 	brg = BPS_TO_BRG(baud, ZS_CLOCK / ZS_CLOCK_DIVISOR);
@@ -1380,9 +1407,9 @@ static void sunzilog_init_hw(struct uart_sunzilog_port *up)
 		up->curregs[R14] = BRSRC | BRENAB;
 		up->curregs[R15] = FIFOEN; /* Use FIFO if on ESCC */
 		up->curregs[R7p] = TxFIFO_LVL | RxFIFO_LVL;
-		if (__load_zsregs(channel, up->curregs)) {
+		if (__load_zsregs(channel, up->curregs))
 			up->flags |= SUNZILOG_FLAG_ESCC;
-		}
+
 		/* Only enable interrupts if an ISR handler available */
 		if (up->flags & SUNZILOG_FLAG_ISR_HANDLER)
 			up->curregs[R9] |= MIE;
@@ -1489,12 +1516,12 @@ static int zs_probe(struct platform_device *op)
 		}
 		uart_inst++;
 	} else {
-		dev_info(&op->dev, "Keyboard at MMIO 0x%llx (irq = %d) "
-		       "is a %s\n",
+		dev_info(&op->dev,
+		       "Keyboard at MMIO 0x%llx (irq = %d) is a %s\n",
 		       (unsigned long long) up[0].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[0].port));
-		dev_info(&op->dev, "Mouse at MMIO 0x%llx (irq = %d) "
-		       "is a %s\n",
+		dev_info(&op->dev,
+		       "Mouse at MMIO 0x%llx (irq = %d) is a %s\n",
 		       (unsigned long long) up[1].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[1].port));
 		kbm_inst++;
@@ -1578,6 +1605,7 @@ static int __init sunzilog_init(void)
 
 	if (zilog_irq) {
 		struct uart_sunzilog_port *up = sunzilog_irq_chain;
+
 		err = request_irq(zilog_irq, sunzilog_interrupt, IRQF_SHARED,
 				  "zs", sunzilog_irq_chain);
 		if (err)
@@ -1587,7 +1615,10 @@ static int __init sunzilog_init(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk (KERN_INFO "Enable IRQ for ZILOG Hardware %p\n", up); */
+			/* printk(KERN_INFO
+			 *        "Enable IRQ for ZILOG Hardware %p\n",
+			 *        up);
+			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       |= SUNZILOG_FLAG_ISR_HANDLER;
 			up->curregs[R9] |= MIE;
@@ -1624,7 +1655,10 @@ static void __exit sunzilog_exit(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk (KERN_INFO "Disable IRQ for ZILOG Hardware %p\n", up); */
+			/* printk(KERN_INFO
+			 *        "Disable IRQ for ZILOG Hardware %p\n",
+			 *        up);
+			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       &= ~SUNZILOG_FLAG_ISR_HANDLER;
 			up->curregs[R9] &= ~MIE;
-- 
1.9.1

