Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7CC50E36E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 16:38:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn70f3hpxz3c7r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 00:38:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fp0JWmH8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fp0JWmH8; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn6zG4sMSz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 00:36:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650897418; x=1682433418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=09yRLDdukF2NqScy5FEXRNekxsijnB9E2xteSASuYuI=;
 b=Fp0JWmH8tIdz0oCzKbQftK9J9D4qK6ENgsmQiikIWzHDpQWsIipoyZCF
 HQ2hB8icDSTN0ozqWwHTf1E9rH4zYijtur3VEC/F18KTkQu9xeNhTHxcY
 QTcV4MaTu7sIa5HFRg6iOuzHgwWv5eVO0ZNp8/5MwcW8/+0raYy8UqlnD
 4iAawktF974Fd0pEauJ5yhFJNobNQq6nI0pKTbf2b9h6Kl6sKJyF+bPoR
 2Zki6+jiIsF2Be14o9kwvg4hXxKLN7PHw3UHh870o3gBmnEvXbw9taMrR
 ANAWV9gvmr4BH1/KsZS+WWz8jN3ePU2Wgaeiw1xcKszyOPo50RA3dCdFD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264113314"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="264113314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 07:36:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="579316136"
Received: from lpuglia-mobl.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.217.93])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 07:35:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vicente Bergas <vicencb@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v4 09/13] serial: General support for multipoint addresses
Date: Mon, 25 Apr 2022 17:34:06 +0300
Message-Id: <20220425143410.12703-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425143410.12703-1-ilpo.jarvinen@linux.intel.com>
References: <20220425143410.12703-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, heiko@sntech.de,
 linux-sh@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matt Turner <mattst88@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add generic support for serial multipoint addressing. Two new ioctls
are added. TIOCSADDR is used to indicate the destination/receive
address. TIOCGADDR returns the current address in use. The driver
should implement set_addr and get_addr to support addressing mode.

Adjust ADDRB clearing to happen only if driver does not provide
set_addr (=the driver doesn't support address mode).

This change is necessary for supporting devices with RS485 multipoint
addressing [*]. A following patch in the patch series adds support for
Synopsys Designware UART capable for 9th bit addressing mode. In this
mode, 9th bit is used to indicate an address (byte) within the
communication line. The 9th bit addressing mode is selected using ADDRB
introduced by the previous patch.

Transmit addresses / receiver filter are specified by setting the flags
SER_ADDR_DEST and/or SER_ADDR_RECV. When the user supplies the transmit
address, in the 9bit addressing mode it is sent out immediately with
the 9th bit set to 1. After that, the subsequent normal data bytes are
sent with 9th bit as 0 and they are intended to the device with the
given address. It is up to receiver to enforce the filter using
SER_ADDR_RECV. When userspace has supplied the receive address, the
driver is expected to handle the matching of the address and only data
with that address is forwarded to the user. Both SER_ADDR_DEST and
SER_ADDR_RECV can be given at the same time in a single call if the
addresses are the same.

The user can clear the receive filter with SER_ADDR_RECV_CLEAR.

[*] Technically, RS485 is just an electronic spec and does not itself
specify the 9th bit addressing mode but 9th bit seems at least
"semi-standard" way to do addressing with RS485.

Cc: linux-api@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 .../driver-api/serial/serial-rs485.rst        | 23 ++++++-
 arch/alpha/include/uapi/asm/ioctls.h          |  3 +
 arch/mips/include/uapi/asm/ioctls.h           |  3 +
 arch/parisc/include/uapi/asm/ioctls.h         |  3 +
 arch/powerpc/include/uapi/asm/ioctls.h        |  3 +
 arch/sh/include/uapi/asm/ioctls.h             |  3 +
 arch/sparc/include/uapi/asm/ioctls.h          |  3 +
 arch/xtensa/include/uapi/asm/ioctls.h         |  3 +
 drivers/tty/serial/8250/8250_core.c           |  2 +
 drivers/tty/serial/serial_core.c              | 62 ++++++++++++++++++-
 drivers/tty/tty_io.c                          |  2 +
 include/linux/serial_core.h                   |  6 ++
 include/uapi/asm-generic/ioctls.h             |  3 +
 include/uapi/linux/serial.h                   |  8 +++
 14 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/serial/serial-rs485.rst b/Documentation/driver-api/serial/serial-rs485.rst
index 6bc824f948f9..2f45f007fa5b 100644
--- a/Documentation/driver-api/serial/serial-rs485.rst
+++ b/Documentation/driver-api/serial/serial-rs485.rst
@@ -95,7 +95,28 @@ RS485 Serial Communications
 		/* Error handling. See errno. */
 	}
 
-5. References
+5. Multipoint Addressing
+========================
+
+   The Linux kernel provides serial_addr structure to handle addressing within
+   multipoint serial communications line such as RS485. 9th bit addressiong mode
+   is enabled by adding ADDRB flag in termios c_cflag.
+
+   Serial core calls device specific set/get_addr in response to TIOCSADDR and
+   TIOCGADDR ioctls with a pointer to serial_addr. Destination and receive
+   address can be specified using serial_addr flags field. Receive address may
+   also be cleared using flags. Once an address is set, the communication
+   can occur only with the particular device and other peers are filtered out.
+   It is left up to the receiver side to enforce the filtering.
+
+   Address flags:
+	- SER_ADDR_RECV: Receive (filter) address.
+	- SER_ADDR_RECV_CLEAR: Clear receive filter (only for TIOCSADDR).
+	- SER_ADDR_DEST: Destination address.
+
+   Note: not all devices supporting RS485 support multipoint addressing.
+
+6. References
 =============
 
  [1]	include/uapi/linux/serial.h
diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/uapi/asm/ioctls.h
index 971311605288..500cab3e1d6b 100644
--- a/arch/alpha/include/uapi/asm/ioctls.h
+++ b/arch/alpha/include/uapi/asm/ioctls.h
@@ -125,4 +125,7 @@
 #define TIOCMIWAIT	0x545C	/* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* _ASM_ALPHA_IOCTLS_H */
diff --git a/arch/mips/include/uapi/asm/ioctls.h b/arch/mips/include/uapi/asm/ioctls.h
index 16aa8a766aec..3859dc46857e 100644
--- a/arch/mips/include/uapi/asm/ioctls.h
+++ b/arch/mips/include/uapi/asm/ioctls.h
@@ -96,6 +96,9 @@
 #define TIOCGISO7816	_IOR('T', 0x42, struct serial_iso7816)
 #define TIOCSISO7816	_IOWR('T', 0x43, struct serial_iso7816)
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* I hope the range from 0x5480 on is free ... */
 #define TIOCSCTTY	0x5480		/* become controlling tty */
 #define TIOCGSOFTCAR	0x5481
diff --git a/arch/parisc/include/uapi/asm/ioctls.h b/arch/parisc/include/uapi/asm/ioctls.h
index 82d1148c6379..62337743db64 100644
--- a/arch/parisc/include/uapi/asm/ioctls.h
+++ b/arch/parisc/include/uapi/asm/ioctls.h
@@ -86,6 +86,9 @@
 #define TIOCSTOP	0x5462
 #define TIOCSLTC	0x5462
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Used for packet mode */
 #define TIOCPKT_DATA		 0
 #define TIOCPKT_FLUSHREAD	 1
diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
index 2c145da3b774..84fd69ac366a 100644
--- a/arch/powerpc/include/uapi/asm/ioctls.h
+++ b/arch/powerpc/include/uapi/asm/ioctls.h
@@ -120,4 +120,7 @@
 #define TIOCMIWAIT	0x545C	/* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif	/* _ASM_POWERPC_IOCTLS_H */
diff --git a/arch/sh/include/uapi/asm/ioctls.h b/arch/sh/include/uapi/asm/ioctls.h
index 11866d4f60e1..f82966b7dba2 100644
--- a/arch/sh/include/uapi/asm/ioctls.h
+++ b/arch/sh/include/uapi/asm/ioctls.h
@@ -113,4 +113,7 @@
 #define TIOCMIWAIT	_IO('T', 92) /* 0x545C */	/* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* __ASM_SH_IOCTLS_H */
diff --git a/arch/sparc/include/uapi/asm/ioctls.h b/arch/sparc/include/uapi/asm/ioctls.h
index 7fd2f5873c9e..e44624c67c79 100644
--- a/arch/sparc/include/uapi/asm/ioctls.h
+++ b/arch/sparc/include/uapi/asm/ioctls.h
@@ -125,6 +125,9 @@
 #define TIOCMIWAIT	0x545C /* Wait for change on serial input line(s) */
 #define TIOCGICOUNT	0x545D /* Read serial port inline interrupt counts */
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Kernel definitions */
 
 /* Used for packet mode */
diff --git a/arch/xtensa/include/uapi/asm/ioctls.h b/arch/xtensa/include/uapi/asm/ioctls.h
index 6d4a87296c95..759ca9377f2a 100644
--- a/arch/xtensa/include/uapi/asm/ioctls.h
+++ b/arch/xtensa/include/uapi/asm/ioctls.h
@@ -127,4 +127,7 @@
 #define TIOCMIWAIT	_IO('T', 92) /* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* _XTENSA_IOCTLS_H */
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 01d30f6ed8fb..f67bc3b76f65 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1008,6 +1008,8 @@ int serial8250_register_8250_port(const struct uart_8250_port *up)
 		uart->port.rs485	= up->port.rs485;
 		uart->rs485_start_tx	= up->rs485_start_tx;
 		uart->rs485_stop_tx	= up->rs485_stop_tx;
+		uart->port.set_addr	= up->port.set_addr;
+		uart->port.get_addr	= up->port.get_addr;
 		uart->dma		= up->dma;
 
 		/* Take tx_loadsz from fifosize if it wasn't set separately */
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index de198c2acefe..2cd129c78ef6 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1350,6 +1350,56 @@ static int uart_set_iso7816_config(struct uart_port *port,
 	return 0;
 }
 
+static int uart_set_addr(struct uart_port *port,
+			 struct serial_addr __user *serial_addr_user)
+{
+	struct serial_addr addr;
+	unsigned long flags;
+	int ret;
+
+	if (!port->set_addr)
+		return -ENOTTY;
+
+	if (copy_from_user(&addr, serial_addr_user, sizeof(*serial_addr_user)))
+		return -EFAULT;
+
+	spin_lock_irqsave(&port->lock, flags);
+	ret = port->set_addr(port, &addr);
+	spin_unlock_irqrestore(&port->lock, flags);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(serial_addr_user, &addr, sizeof(addr)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int uart_get_addr(struct uart_port *port,
+			 struct serial_addr __user *serial_addr_user)
+{
+	struct serial_addr addr;
+	unsigned long flags;
+	int ret;
+
+	if (!port->get_addr)
+		return -ENOTTY;
+
+	if (copy_from_user(&addr, serial_addr_user, sizeof(*serial_addr_user)))
+		return -EFAULT;
+
+	spin_lock_irqsave(&port->lock, flags);
+	ret = port->get_addr(port, &addr);
+	spin_unlock_irqrestore(&port->lock, flags);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(serial_addr_user, &addr, sizeof(addr)))
+		return -EFAULT;
+
+	return 0;
+}
+
 /*
  * Called via sys_ioctl.  We can use spin_lock_irq() here.
  */
@@ -1427,6 +1477,15 @@ uart_ioctl(struct tty_struct *tty, unsigned int cmd, unsigned long arg)
 	case TIOCGISO7816:
 		ret = uart_get_iso7816_config(state->uart_port, uarg);
 		break;
+
+	case TIOCSADDR:
+		ret = uart_set_addr(uport, uarg);
+		break;
+
+	case TIOCGADDR:
+		ret = uart_get_addr(uport, uarg);
+		break;
+
 	default:
 		if (uport->ops->ioctl)
 			ret = uport->ops->ioctl(uport, cmd, arg);
@@ -1493,7 +1552,8 @@ static void uart_set_termios(struct tty_struct *tty,
 		goto out;
 	}
 
-	tty->termios.c_cflag &= ~ADDRB;
+	if (!uport->set_addr)
+		tty->termios.c_cflag &= ~ADDRB;
 
 	uart_change_speed(tty, state, old_termios);
 	/* reload cflag from termios; port driver may have overridden flags */
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 7e8b3bd59c7b..93d8609e88aa 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2885,6 +2885,8 @@ static long tty_compat_ioctl(struct file *file, unsigned int cmd,
 	case TIOCSERGETLSR:
 	case TIOCGRS485:
 	case TIOCSRS485:
+	case TIOCSADDR:
+	case TIOCGADDR:
 #ifdef TIOCGETP
 	case TIOCGETP:
 	case TIOCSETP:
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 504d365e2803..a2efd3fe2635 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -135,6 +135,12 @@ struct uart_port {
 						struct serial_rs485 *rs485);
 	int			(*iso7816_config)(struct uart_port *,
 						  struct serial_iso7816 *iso7816);
+
+	int			(*set_addr)(struct uart_port *p,
+					    struct serial_addr *addr);
+	int			(*get_addr)(struct uart_port *p,
+					    struct serial_addr *addr);
+
 	unsigned int		irq;			/* irq number */
 	unsigned long		irqflags;		/* irq flags  */
 	unsigned int		uartclk;		/* base uart clock */
diff --git a/include/uapi/asm-generic/ioctls.h b/include/uapi/asm-generic/ioctls.h
index cdc9f4ca8c27..689743366091 100644
--- a/include/uapi/asm-generic/ioctls.h
+++ b/include/uapi/asm-generic/ioctls.h
@@ -106,6 +106,9 @@
 # define FIOQSIZE	0x5460
 #endif
 
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Used for packet mode */
 #define TIOCPKT_DATA		 0
 #define TIOCPKT_FLUSHREAD	 1
diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
index fa6b16e5fdd8..8cb785ea7087 100644
--- a/include/uapi/linux/serial.h
+++ b/include/uapi/linux/serial.h
@@ -149,4 +149,12 @@ struct serial_iso7816 {
 	__u32	reserved[5];
 };
 
+struct serial_addr {
+	__u32	flags;
+#define SER_ADDR_RECV			(1 << 0)
+#define SER_ADDR_RECV_CLEAR		(1 << 1)
+#define SER_ADDR_DEST			(1 << 2)
+	__u32	addr;
+};
+
 #endif /* _UAPI_LINUX_SERIAL_H */
-- 
2.30.2

