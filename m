Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5B66D945
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 10:06:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx30N37nSz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:06:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZXVsElWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZXVsElWk;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx2zP3Rjfz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 20:05:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673946321; x=1705482321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mc4IIvtsUqhAI5kkpaTnZtGUtVo9P7s6TINo203YwNY=;
  b=ZXVsElWkK8ZG69DOP9L2GHR2ynIJB6EdS6azBnDP1wp9lCq/7h6Zy47E
   WoOTbGWNGyYqdboL0yCm80ovB0i3RDmhfFQqBxU57KjxCMwlYF2psBYuL
   eWUla8+5kT3lxZHy+4EEhuJaaXNzGyrTql2y/EL4GPrzxfyYMs+w5gSFh
   XrId0/0IN+xOl3jJ3Pi/QUY47PNg3Hb9WG/KeEQ2GpBqwtxtKu8vw1epB
   WWkKC2DiZ73CZzqLv3f5PRX6DQaiumSaRXIYdxPWiXP9z4KiT9jnJ9CWS
   0xB2dHbpXkVwEZRQhr7lgHis+bVl9wAgq2KQer+opfTkfO1rIh7WiKEAi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324701089"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="324701089"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 01:05:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783174180"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="783174180"
Received: from tronach-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.40.3])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 01:05:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Lin <dtwlin@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Oliver Neukum <oneukum@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 07/12] tty: Convert ->dtr_rts() to take bool argument
Date: Tue, 17 Jan 2023 11:03:53 +0200
Message-Id: <20230117090358.4796-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230117090358.4796-1-ilpo.jarvinen@linux.intel.com>
References: <20230117090358.4796-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the raise/on parameter in ->dtr_rts() to bool through the
callchain. The parameter is used like bool. In USB serial, there
remains a few implicit bool -> larger type conversions because some
devices use u8 in their control messages.

In moxa_tiocmget(), dtr variable was reused for line status which
requires int so use a separate variable for status.

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/char/pcmcia/synclink_cs.c |  4 +--
 drivers/mmc/core/sdio_uart.c      |  4 +--
 drivers/staging/greybus/uart.c    |  2 +-
 drivers/tty/amiserial.c           |  2 +-
 drivers/tty/hvc/hvc_console.c     |  4 +--
 drivers/tty/hvc/hvc_console.h     |  2 +-
 drivers/tty/hvc/hvc_iucv.c        |  4 +--
 drivers/tty/moxa.c                | 54 ++++++++++++++++---------------
 drivers/tty/mxser.c               |  2 +-
 drivers/tty/n_gsm.c               |  2 +-
 drivers/tty/serial/serial_core.c  |  8 ++---
 drivers/tty/synclink_gt.c         |  2 +-
 drivers/tty/tty_port.c            |  4 +--
 drivers/usb/class/cdc-acm.c       |  2 +-
 drivers/usb/serial/usb-serial.c   |  2 +-
 include/linux/tty_port.h          |  4 +--
 16 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 4391138e1b8a..46a0b586d234 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -378,7 +378,7 @@ static void async_mode(MGSLPC_INFO *info);
 static void tx_timeout(struct timer_list *t);
 
 static bool carrier_raised(struct tty_port *port);
-static void dtr_rts(struct tty_port *port, int onoff);
+static void dtr_rts(struct tty_port *port, bool onoff);
 
 #if SYNCLINK_GENERIC_HDLC
 #define dev_to_port(D) (dev_to_hdlc(D)->priv)
@@ -2442,7 +2442,7 @@ static bool carrier_raised(struct tty_port *port)
 	return info->serial_signals & SerialSignal_DCD;
 }
 
-static void dtr_rts(struct tty_port *port, int onoff)
+static void dtr_rts(struct tty_port *port, bool onoff)
 {
 	MGSLPC_INFO *info = container_of(port, MGSLPC_INFO, port);
 	unsigned long flags;
diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
index 47f58258d8ff..c6b4b2b2a4b2 100644
--- a/drivers/mmc/core/sdio_uart.c
+++ b/drivers/mmc/core/sdio_uart.c
@@ -548,14 +548,14 @@ static bool uart_carrier_raised(struct tty_port *tport)
  *	adjusted during an open, close and hangup.
  */
 
-static void uart_dtr_rts(struct tty_port *tport, int onoff)
+static void uart_dtr_rts(struct tty_port *tport, bool onoff)
 {
 	struct sdio_uart_port *port =
 			container_of(tport, struct sdio_uart_port, port);
 	int ret = sdio_uart_claim_func(port);
 	if (ret)
 		return;
-	if (onoff == 0)
+	if (!onoff)
 		sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 	else
 		sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 90ff07f2cbf7..92d49740d5a4 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -701,7 +701,7 @@ static int gb_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	return -ENOIOCTLCMD;
 }
 
-static void gb_tty_dtr_rts(struct tty_port *port, int on)
+static void gb_tty_dtr_rts(struct tty_port *port, bool on)
 {
 	struct gb_tty *gb_tty;
 	u8 newctrl;
diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 01c4fd3ce7c8..29d4c554f6b8 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -1459,7 +1459,7 @@ static bool amiga_carrier_raised(struct tty_port *port)
 	return !(ciab.pra & SER_DCD);
 }
 
-static void amiga_dtr_rts(struct tty_port *port, int raise)
+static void amiga_dtr_rts(struct tty_port *port, bool raise)
 {
 	struct serial_state *info = container_of(port, struct serial_state,
 			tport);
diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index a683e21df19c..10c10cfdf92a 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -376,7 +376,7 @@ static int hvc_open(struct tty_struct *tty, struct file * filp)
 		/* We are ready... raise DTR/RTS */
 		if (C_BAUD(tty))
 			if (hp->ops->dtr_rts)
-				hp->ops->dtr_rts(hp, 1);
+				hp->ops->dtr_rts(hp, true);
 		tty_port_set_initialized(&hp->port, true);
 	}
 
@@ -406,7 +406,7 @@ static void hvc_close(struct tty_struct *tty, struct file * filp)
 
 		if (C_HUPCL(tty))
 			if (hp->ops->dtr_rts)
-				hp->ops->dtr_rts(hp, 0);
+				hp->ops->dtr_rts(hp, false);
 
 		if (hp->ops->notifier_del)
 			hp->ops->notifier_del(hp, hp->data);
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 18d005814e4b..6d3428bf868f 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -66,7 +66,7 @@ struct hv_ops {
 	int (*tiocmset)(struct hvc_struct *hp, unsigned int set, unsigned int clear);
 
 	/* Callbacks to handle tty ports */
-	void (*dtr_rts)(struct hvc_struct *hp, int raise);
+	void (*dtr_rts)(struct hvc_struct *hp, bool raise);
 };
 
 /* Register a vterm and a slot index for use as a console (console_init) */
diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index 7d49a872de48..fe862a6882d6 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -658,13 +658,13 @@ static void hvc_iucv_notifier_hangup(struct hvc_struct *hp, int id)
 /**
  * hvc_iucv_dtr_rts() - HVC notifier for handling DTR/RTS
  * @hp:		Pointer the HVC device (struct hvc_struct)
- * @raise:	Non-zero to raise or zero to lower DTR/RTS lines
+ * @raise:	True to raise or false to lower DTR/RTS lines
  *
  * This routine notifies the HVC back-end to raise or lower DTR/RTS
  * lines.  Raising DTR/RTS is ignored.  Lowering DTR/RTS indicates to
  * drop the IUCV connection (similar to hang up the modem).
  */
-static void hvc_iucv_dtr_rts(struct hvc_struct *hp, int raise)
+static void hvc_iucv_dtr_rts(struct hvc_struct *hp, bool raise)
 {
 	struct hvc_iucv_private *priv;
 	struct iucv_path        *path;
diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index 6a1e78e33a2c..9be3d585d5a9 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -502,15 +502,15 @@ static void moxa_poll(struct timer_list *);
 static void moxa_set_tty_param(struct tty_struct *, const struct ktermios *);
 static void moxa_shutdown(struct tty_port *);
 static bool moxa_carrier_raised(struct tty_port *);
-static void moxa_dtr_rts(struct tty_port *, int);
+static void moxa_dtr_rts(struct tty_port *, bool);
 /*
  * moxa board interface functions:
  */
 static void MoxaPortEnable(struct moxa_port *);
 static void MoxaPortDisable(struct moxa_port *);
 static int MoxaPortSetTermio(struct moxa_port *, struct ktermios *, speed_t);
-static int MoxaPortGetLineOut(struct moxa_port *, int *, int *);
-static void MoxaPortLineCtrl(struct moxa_port *, int, int);
+static int MoxaPortGetLineOut(struct moxa_port *, bool *, bool *);
+static void MoxaPortLineCtrl(struct moxa_port *, bool, bool);
 static void MoxaPortFlowCtrl(struct moxa_port *, int, int, int, int, int);
 static int MoxaPortLineStatus(struct moxa_port *);
 static void MoxaPortFlushData(struct moxa_port *, int);
@@ -1443,7 +1443,7 @@ static bool moxa_carrier_raised(struct tty_port *port)
 	return dcd;
 }
 
-static void moxa_dtr_rts(struct tty_port *port, int onoff)
+static void moxa_dtr_rts(struct tty_port *port, bool onoff)
 {
 	struct moxa_port *ch = container_of(port, struct moxa_port, port);
 	MoxaPortLineCtrl(ch, onoff, onoff);
@@ -1481,7 +1481,7 @@ static int moxa_open(struct tty_struct *tty, struct file *filp)
 	if (!tty_port_initialized(&ch->port)) {
 		ch->statusflags = 0;
 		moxa_set_tty_param(tty, &tty->termios);
-		MoxaPortLineCtrl(ch, 1, 1);
+		MoxaPortLineCtrl(ch, true, true);
 		MoxaPortEnable(ch);
 		MoxaSetFifo(ch, ch->type == PORT_16550A);
 		tty_port_set_initialized(&ch->port, true);
@@ -1557,19 +1557,21 @@ static unsigned int moxa_chars_in_buffer(struct tty_struct *tty)
 static int moxa_tiocmget(struct tty_struct *tty)
 {
 	struct moxa_port *ch = tty->driver_data;
-	int flag = 0, dtr, rts;
+	bool dtr, rts;
+	int flag = 0;
+	int status;
 
 	MoxaPortGetLineOut(ch, &dtr, &rts);
 	if (dtr)
 		flag |= TIOCM_DTR;
 	if (rts)
 		flag |= TIOCM_RTS;
-	dtr = MoxaPortLineStatus(ch);
-	if (dtr & 1)
+	status = MoxaPortLineStatus(ch);
+	if (status & 1)
 		flag |= TIOCM_CTS;
-	if (dtr & 2)
+	if (status & 2)
 		flag |= TIOCM_DSR;
-	if (dtr & 4)
+	if (status & 4)
 		flag |= TIOCM_CD;
 	return flag;
 }
@@ -1578,7 +1580,7 @@ static int moxa_tiocmset(struct tty_struct *tty,
 			 unsigned int set, unsigned int clear)
 {
 	struct moxa_port *ch;
-	int dtr, rts;
+	bool dtr, rts;
 
 	mutex_lock(&moxa_openlock);
 	ch = tty->driver_data;
@@ -1589,13 +1591,13 @@ static int moxa_tiocmset(struct tty_struct *tty,
 
 	MoxaPortGetLineOut(ch, &dtr, &rts);
 	if (set & TIOCM_RTS)
-		rts = 1;
+		rts = true;
 	if (set & TIOCM_DTR)
-		dtr = 1;
+		dtr = true;
 	if (clear & TIOCM_RTS)
-		rts = 0;
+		rts = false;
 	if (clear & TIOCM_DTR)
-		dtr = 0;
+		dtr = false;
 	MoxaPortLineCtrl(ch, dtr, rts);
 	mutex_unlock(&moxa_openlock);
 	return 0;
@@ -1877,12 +1879,12 @@ static void MoxaPortFlushData(struct moxa_port *port, int mode)
  *
  *      Function 13:    Get the DTR/RTS state of this port.
  *      Syntax:
- *      int  MoxaPortGetLineOut(int port, int *dtrState, int *rtsState);
+ *      int  MoxaPortGetLineOut(int port, bool *dtrState, bool *rtsState);
  *           int port           : port number (0 - 127)
- *           int * dtrState     : pointer to INT to receive the current DTR
+ *           bool * dtrState    : pointer to bool to receive the current DTR
  *                                state. (if NULL, this function will not
  *                                write to this address)
- *           int * rtsState     : pointer to INT to receive the current RTS
+ *           bool * rtsState    : pointer to bool to receive the current RTS
  *                                state. (if NULL, this function will not
  *                                write to this address)
  *
@@ -1892,10 +1894,10 @@ static void MoxaPortFlushData(struct moxa_port *port, int mode)
  *
  *      Function 14:    Setting the DTR/RTS output state of this port.
  *      Syntax:
- *      void MoxaPortLineCtrl(int port, int dtrState, int rtsState);
+ *      void MoxaPortLineCtrl(int port, bool dtrState, bool rtsState);
  *           int port           : port number (0 - 127)
- *           int dtrState       : DTR output state (0: off, 1: on)
- *           int rtsState       : RTS output state (0: off, 1: on)
+ *           bool dtrState      : DTR output state
+ *           bool rtsState      : RTS output state
  *
  *
  *      Function 15:    Setting the flow control of this port.
@@ -2103,18 +2105,18 @@ static int MoxaPortSetTermio(struct moxa_port *port, struct ktermios *termio,
 	return baud;
 }
 
-static int MoxaPortGetLineOut(struct moxa_port *port, int *dtrState,
-		int *rtsState)
+static int MoxaPortGetLineOut(struct moxa_port *port, bool *dtrState,
+		bool *rtsState)
 {
 	if (dtrState)
-		*dtrState = !!(port->lineCtrl & DTR_ON);
+		*dtrState = port->lineCtrl & DTR_ON;
 	if (rtsState)
-		*rtsState = !!(port->lineCtrl & RTS_ON);
+		*rtsState = port->lineCtrl & RTS_ON;
 
 	return 0;
 }
 
-static void MoxaPortLineCtrl(struct moxa_port *port, int dtr, int rts)
+static void MoxaPortLineCtrl(struct moxa_port *port, bool dtr, bool rts)
 {
 	u8 mode = 0;
 
diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index 96c72e691cd7..d4fb11e39bb1 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -465,7 +465,7 @@ static bool mxser_carrier_raised(struct tty_port *port)
 	return inb(mp->ioaddr + UART_MSR) & UART_MSR_DCD;
 }
 
-static void mxser_dtr_rts(struct tty_port *port, int on)
+static void mxser_dtr_rts(struct tty_port *port, bool on)
 {
 	struct mxser_port *mp = container_of(port, struct mxser_port, port);
 	unsigned long flags;
diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 81fc2ec3693f..8dd0d6441c42 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -3792,7 +3792,7 @@ static bool gsm_carrier_raised(struct tty_port *port)
 	return dlci->modem_rx & TIOCM_CD;
 }
 
-static void gsm_dtr_rts(struct tty_port *port, int onoff)
+static void gsm_dtr_rts(struct tty_port *port, bool onoff)
 {
 	struct gsm_dlci *dlci = container_of(port, struct gsm_dlci, port);
 	unsigned int modem_tx = dlci->modem_tx;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 20ed8a088b2d..053535846ba2 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -169,7 +169,7 @@ uart_update_mctrl(struct uart_port *port, unsigned int set, unsigned int clear)
 #define uart_set_mctrl(port, set)	uart_update_mctrl(port, set, 0)
 #define uart_clear_mctrl(port, clear)	uart_update_mctrl(port, 0, clear)
 
-static void uart_port_dtr_rts(struct uart_port *uport, int raise)
+static void uart_port_dtr_rts(struct uart_port *uport, bool raise)
 {
 	if (raise)
 		uart_set_mctrl(uport, TIOCM_DTR | TIOCM_RTS);
@@ -239,7 +239,7 @@ static int uart_port_startup(struct tty_struct *tty, struct uart_state *state,
 		 * port is open and ready to respond.
 		 */
 		if (init_hw && C_BAUD(tty))
-			uart_port_dtr_rts(uport, 1);
+			uart_port_dtr_rts(uport, true);
 	}
 
 	/*
@@ -302,7 +302,7 @@ static void uart_shutdown(struct tty_struct *tty, struct uart_state *state)
 		}
 
 		if (!tty || C_HUPCL(tty))
-			uart_port_dtr_rts(uport, 0);
+			uart_port_dtr_rts(uport, false);
 
 		uart_port_shutdown(port);
 	}
@@ -1885,7 +1885,7 @@ static bool uart_carrier_raised(struct tty_port *port)
 	return mctrl & TIOCM_CAR;
 }
 
-static void uart_dtr_rts(struct tty_port *port, int raise)
+static void uart_dtr_rts(struct tty_port *port, bool raise)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport;
diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
index 4ba71ec764f7..2b786265ce7b 100644
--- a/drivers/tty/synclink_gt.c
+++ b/drivers/tty/synclink_gt.c
@@ -3138,7 +3138,7 @@ static bool carrier_raised(struct tty_port *port)
 	return info->signals & SerialSignal_DCD;
 }
 
-static void dtr_rts(struct tty_port *port, int on)
+static void dtr_rts(struct tty_port *port, bool on)
 {
 	unsigned long flags;
 	struct slgt_info *info = container_of(port, struct slgt_info, port);
diff --git a/drivers/tty/tty_port.c b/drivers/tty/tty_port.c
index a573c500f95b..a788a6bf487d 100644
--- a/drivers/tty/tty_port.c
+++ b/drivers/tty/tty_port.c
@@ -463,7 +463,7 @@ EXPORT_SYMBOL(tty_port_carrier_raised);
 void tty_port_raise_dtr_rts(struct tty_port *port)
 {
 	if (port->ops->dtr_rts)
-		port->ops->dtr_rts(port, 1);
+		port->ops->dtr_rts(port, true);
 }
 EXPORT_SYMBOL(tty_port_raise_dtr_rts);
 
@@ -478,7 +478,7 @@ EXPORT_SYMBOL(tty_port_raise_dtr_rts);
 void tty_port_lower_dtr_rts(struct tty_port *port)
 {
 	if (port->ops->dtr_rts)
-		port->ops->dtr_rts(port, 0);
+		port->ops->dtr_rts(port, false);
 }
 EXPORT_SYMBOL(tty_port_lower_dtr_rts);
 
diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 36bf051b345b..d4f9220b8162 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -651,7 +651,7 @@ static int acm_tty_open(struct tty_struct *tty, struct file *filp)
 	return tty_port_open(&acm->port, tty, filp);
 }
 
-static void acm_port_dtr_rts(struct tty_port *port, int raise)
+static void acm_port_dtr_rts(struct tty_port *port, bool raise)
 {
 	struct acm *acm = container_of(port, struct acm, port);
 	int val;
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 019720a63fac..f8404073558b 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -765,7 +765,7 @@ static bool serial_port_carrier_raised(struct tty_port *port)
 	return true;
 }
 
-static void serial_port_dtr_rts(struct tty_port *port, int on)
+static void serial_port_dtr_rts(struct tty_port *port, bool on)
 {
 	struct usb_serial_port *p = container_of(port, struct usb_serial_port, port);
 	struct usb_serial_driver *drv = p->serial->type;
diff --git a/include/linux/tty_port.h b/include/linux/tty_port.h
index cf098459cb01..c44e489de0ff 100644
--- a/include/linux/tty_port.h
+++ b/include/linux/tty_port.h
@@ -16,7 +16,7 @@ struct tty_struct;
 /**
  * struct tty_port_operations -- operations on tty_port
  * @carrier_raised: return true if the carrier is raised on @port
- * @dtr_rts: raise the DTR line if @raise is nonzero, otherwise lower DTR
+ * @dtr_rts: raise the DTR line if @raise is true, otherwise lower DTR
  * @shutdown: called when the last close completes or a hangup finishes IFF the
  *	port was initialized. Do not use to free resources. Turn off the device
  *	only. Called under the port mutex to serialize against @activate and
@@ -32,7 +32,7 @@ struct tty_struct;
  */
 struct tty_port_operations {
 	bool (*carrier_raised)(struct tty_port *port);
-	void (*dtr_rts)(struct tty_port *port, int raise);
+	void (*dtr_rts)(struct tty_port *port, bool raise);
 	void (*shutdown)(struct tty_port *port);
 	int (*activate)(struct tty_port *port, struct tty_struct *tty);
 	void (*destruct)(struct tty_port *port);
-- 
2.30.2

