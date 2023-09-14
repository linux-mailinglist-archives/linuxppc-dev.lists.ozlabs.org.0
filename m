Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4377A0D72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b7yR++Mw;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zhh9mXIg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmmWG6W9Pz3dK9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 04:46:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b7yR++Mw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zhh9mXIg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 04:44:57 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmmTP5Hjtz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 04:44:57 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJW0TuhSdXUv9FTqZdQkgamZVGooxW5FNHg4lshg/t0=;
	b=b7yR++MwVrSn/oZyZAiFtiEqhu8NcXqsYfx3rC/XpO4EZC4l5KrgdrtxsgqwvyuxTMaR7k
	oSdj9dUk7NFQ+BFfCloJuU548l879b5L9FheE1cQ3gTo3ltCq2YlPCl/dNESytplQ3xBI5
	sqMc5zikJ/QWSA41fnYP+BMaNx6vgjH9hLhc4B/5h+/MVluHgK13bFvOLvDkM2wBTqGkgz
	+Ax3E/cSzbm5VKAVC4asblEB+O0hFtsLIA9tJM8v3WBEcFwIRqIZ6JnK2Nt+I9VEVRecXz
	2l1SEH/EGbna5YRWcFOtxN9XVe9HF3CeDUYBPgarRCC5BW8nw4VNiyBRU61ItQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJW0TuhSdXUv9FTqZdQkgamZVGooxW5FNHg4lshg/t0=;
	b=Zhh9mXIgjMHMUzh4F4Pe2Bl3bw4SjfghqkK66A25GbHwssWjWIzB0B37CiHQnHnWaU8Y2k
	8Rclrpq4v1Rb1JBQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH tty v1 47/74] serial: pmac_zilog: Use port lock wrappers
Date: Thu, 14 Sep 2023 20:44:04 +0206
Message-Id: <20230914183831.587273-48-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
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
Cc: Petr Mladek <pmladek@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/pmac_zilog.c | 52 ++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 13668ffdb1e7..c8bf08c19c64 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -246,9 +246,9 @@ static bool pmz_receive_chars(struct uart_pmac_port *uap)
 #endif /* USE_CTRL_O_SYSRQ */
 		if (uap->port.sysrq) {
 			int swallow;
-			spin_unlock(&uap->port.lock);
+			uart_port_unlock(&uap->port);
 			swallow = uart_handle_sysrq_char(&uap->port, ch);
-			spin_lock(&uap->port.lock);
+			uart_port_lock(&uap->port);
 			if (swallow)
 				goto next_char;
 		}
@@ -435,7 +435,7 @@ static irqreturn_t pmz_interrupt(int irq, void *dev_id)
 	uap_a = pmz_get_port_A(uap);
 	uap_b = uap_a->mate;
 
-	spin_lock(&uap_a->port.lock);
+	uart_port_lock(&uap_a->port);
 	r3 = read_zsreg(uap_a, R3);
 
 	/* Channel A */
@@ -456,14 +456,14 @@ static irqreturn_t pmz_interrupt(int irq, void *dev_id)
 		rc = IRQ_HANDLED;
 	}
  skip_a:
-	spin_unlock(&uap_a->port.lock);
+	uart_port_unlock(&uap_a->port);
 	if (push)
 		tty_flip_buffer_push(&uap->port.state->port);
 
 	if (!uap_b)
 		goto out;
 
-	spin_lock(&uap_b->port.lock);
+	uart_port_lock(&uap_b->port);
 	push = false;
 	if (r3 & (CHBEXT | CHBTxIP | CHBRxIP)) {
 		if (!ZS_IS_OPEN(uap_b)) {
@@ -481,7 +481,7 @@ static irqreturn_t pmz_interrupt(int irq, void *dev_id)
 		rc = IRQ_HANDLED;
 	}
  skip_b:
-	spin_unlock(&uap_b->port.lock);
+	uart_port_unlock(&uap_b->port);
 	if (push)
 		tty_flip_buffer_push(&uap->port.state->port);
 
@@ -497,9 +497,9 @@ static inline u8 pmz_peek_status(struct uart_pmac_port *uap)
 	unsigned long flags;
 	u8 status;
 	
-	spin_lock_irqsave(&uap->port.lock, flags);
+	uart_port_lock_irqsave(&uap->port, &flags);
 	status = read_zsreg(uap, R0);
-	spin_unlock_irqrestore(&uap->port.lock, flags);
+	uart_port_unlock_irqrestore(&uap->port, flags);
 
 	return status;
 }
@@ -685,7 +685,7 @@ static void pmz_break_ctl(struct uart_port *port, int break_state)
 	else
 		clear_bits |= SND_BRK;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	new_reg = (uap->curregs[R5] | set_bits) & ~clear_bits;
 	if (new_reg != uap->curregs[R5]) {
@@ -693,7 +693,7 @@ static void pmz_break_ctl(struct uart_port *port, int break_state)
 		write_zsreg(uap, R5, uap->curregs[R5]);
 	}
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 #ifdef CONFIG_PPC_PMAC
@@ -865,18 +865,18 @@ static void pmz_irda_reset(struct uart_pmac_port *uap)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&uap->port.lock, flags);
+	uart_port_lock_irqsave(&uap->port, &flags);
 	uap->curregs[R5] |= DTR;
 	write_zsreg(uap, R5, uap->curregs[R5]);
 	zssync(uap);
-	spin_unlock_irqrestore(&uap->port.lock, flags);
+	uart_port_unlock_irqrestore(&uap->port, flags);
 	msleep(110);
 
-	spin_lock_irqsave(&uap->port.lock, flags);
+	uart_port_lock_irqsave(&uap->port, &flags);
 	uap->curregs[R5] &= ~DTR;
 	write_zsreg(uap, R5, uap->curregs[R5]);
 	zssync(uap);
-	spin_unlock_irqrestore(&uap->port.lock, flags);
+	uart_port_unlock_irqrestore(&uap->port, flags);
 	msleep(10);
 }
 
@@ -896,9 +896,9 @@ static int pmz_startup(struct uart_port *port)
 	 * initialize the chip
 	 */
 	if (!ZS_IS_CONS(uap)) {
-		spin_lock_irqsave(&port->lock, flags);
+		uart_port_lock_irqsave(port, &flags);
 		pwr_delay = __pmz_startup(uap);
-		spin_unlock_irqrestore(&port->lock, flags);
+		uart_port_unlock_irqrestore(port, flags);
 	}	
 	sprintf(uap->irq_name, PMACZILOG_NAME"%d", uap->port.line);
 	if (request_irq(uap->port.irq, pmz_interrupt, IRQF_SHARED,
@@ -921,9 +921,9 @@ static int pmz_startup(struct uart_port *port)
 		pmz_irda_reset(uap);
 
 	/* Enable interrupt requests for the channel */
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 	pmz_interrupt_control(uap, 1);
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 
 	return 0;
 }
@@ -933,7 +933,7 @@ static void pmz_shutdown(struct uart_port *port)
 	struct uart_pmac_port *uap = to_pmz(port);
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	/* Disable interrupt requests for the channel */
 	pmz_interrupt_control(uap, 0);
@@ -948,19 +948,19 @@ static void pmz_shutdown(struct uart_port *port)
 		pmz_maybe_update_regs(uap);
 	}
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 
 	/* Release interrupt handler */
 	free_irq(uap->port.irq, uap);
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	uap->flags &= ~PMACZILOG_FLAG_IS_OPEN;
 
 	if (!ZS_IS_CONS(uap))
 		pmz_set_scc_power(uap, 0);	/* Shut the chip down */
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 /* Shared by TTY driver and serial console setup.  The port lock is held
@@ -1247,7 +1247,7 @@ static void pmz_set_termios(struct uart_port *port, struct ktermios *termios,
 	struct uart_pmac_port *uap = to_pmz(port);
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);	
+	uart_port_lock_irqsave(port, &flags);	
 
 	/* Disable IRQs on the port */
 	pmz_interrupt_control(uap, 0);
@@ -1259,7 +1259,7 @@ static void pmz_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (ZS_IS_OPEN(uap))
 		pmz_interrupt_control(uap, 1);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static const char *pmz_type(struct uart_port *port)
@@ -1896,7 +1896,7 @@ static void pmz_console_write(struct console *con, const char *s, unsigned int c
 	struct uart_pmac_port *uap = &pmz_ports[con->index];
 	unsigned long flags;
 
-	spin_lock_irqsave(&uap->port.lock, flags);
+	uart_port_lock_irqsave(&uap->port, &flags);
 
 	/* Turn of interrupts and enable the transmitter. */
 	write_zsreg(uap, R1, uap->curregs[1] & ~TxINT_ENAB);
@@ -1908,7 +1908,7 @@ static void pmz_console_write(struct console *con, const char *s, unsigned int c
 	write_zsreg(uap, R1, uap->curregs[1]);
 	/* Don't disable the transmitter. */
 
-	spin_unlock_irqrestore(&uap->port.lock, flags);
+	uart_port_unlock_irqrestore(&uap->port, flags);
 }
 
 /*
-- 
2.39.2

