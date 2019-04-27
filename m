Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 453DDB3AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:01:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rszk4JdXzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrb01xGQzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:51 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MoNy4-1h0jOB13NY-00ooZP; Sat, 27 Apr 2019 14:52:55 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 25/41] drivers: tty: serial: timbuart: fix formatting issues
Date: Sat, 27 Apr 2019 14:52:06 +0200
Message-Id: <1556369542-13247-26-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:dHmoa7nRbvk336kCXOJfWYY+mUp7+Lq3TccEDqKxr5HUdU0dY6C
 yzuj71JxmIOUypO0f3pRhohp2gsNBabdH6V+CbQXryApBGH2Qcpkk/9cghWYtQLFmk7hZJw
 tepHWArJtIL3O9kTqTVYZs321PvyO/k3/FRT6KFOh/DxNZXymlya5ap69Okq5lTHOD9MAiI
 qb5auophN8XTtreo3NFMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gjnUy8VjKBc=:6/DHqsP7yN5wzO9+7DC2n8
 lNG/EpmmowAYCu/KGzhIX5p6LhSK32c1yrm86RdntgiIPGYdN8gMaLZCPNnxnwghsQFRAJ5zV
 9xkdt896UlAtGYFCFPzpOaO1cbPAsThUpqssiRHx1engI+/lkzXk9yABXMY3YCHlXjinOPsTm
 KzI0dHA353sgQlnD6dWM3kFr5I/ygx4Cs7xhhcW6YgjI/81AJ7j9KR0eoXwiM2UpaZHUdv5Fo
 nALAZ5w6CscrZMqX/uPEAH0x8etUEfcXGJHZrh4U7Q9oZANiZqLD9DMXv1+9yIdkAR5XJYYh5
 pBhFM1LhNxD7X7TpGFn16aHdJGVj8/1tLALG17dzuxtQXwNwdaTeIqKukYtxP+ZULUb1RQpkP
 1yGXAGe7RGMf/TaeT4VuiXdbUtMi+NhQesZBUxFhjwTgKMUy7w3JutjCYV65XHxnn5gjDOtKM
 UJPdpek1o+BLdUd0AcvpwD1rsDsLRqddKOysAxluJZ/AtEiXr+XxGYPYc2a7gMQpo/7Nv85z6
 rkRH6X4G9SHkobTiu1ADzRnH13BfzWnIDBC2/wretXlYyRQKnn2jYL2dvWT+HkIrXzGI72Yzt
 9JN3tpLmuO+ealCBwKZZN2xrAvuNFosYEJlYoJagelLSdZOMrwNHthgU31iZCjXRa/vKgM+jy
 XYEUKfUU8DV/qvpgHch/zvy4F6lg+4hxgAT6qUFPg0xknu2WCgg6egJURn36Vn5FOaRpHJagq
 WrCZKX9d2oKU+YkR8yqWzaVlLTr7gYIJp5r+mg==
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

    WARNING: Missing a blank line after declarations
    #43: FILE: drivers/tty/serial/timbuart.c:43:
    +	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~RXFLAGS;
    +	iowrite32(ier, port->membase + TIMBUART_IER);

    WARNING: Missing a blank line after declarations
    #50: FILE: drivers/tty/serial/timbuart.c:50:
    +	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~TXBAE;
    +	iowrite32(ier, port->membase + TIMBUART_IER);

    WARNING: Missing a blank line after declarations
    #86: FILE: drivers/tty/serial/timbuart.c:86:
    +		u8 ch = ioread8(port->membase + TIMBUART_RXFIFO);
    +		port->icount.rx++;

    WARNING: Missing a blank line after declarations
    #202: FILE: drivers/tty/serial/timbuart.c:202:
    +	u8 cts = ioread8(port->membase + TIMBUART_CTRL);
    +	dev_dbg(port->dev, "%s - cts %x\n", __func__, cts);

    WARNING: Block comments use * on subsequent lines
    #296: FILE: drivers/tty/serial/timbuart.c:296:
    +	/* The serial layer calls into this once with old = NULL when setting
    +	   up initially */

    WARNING: Block comments use a trailing */ on a separate line
    #296: FILE: drivers/tty/serial/timbuart.c:296:

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/timbuart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/timbuart.c b/drivers/tty/serial/timbuart.c
index dcce936..d80c332 100644
--- a/drivers/tty/serial/timbuart.c
+++ b/drivers/tty/serial/timbuart.c
@@ -40,6 +40,7 @@ static void timbuart_stop_rx(struct uart_port *port)
 {
 	/* spin lock held by upper layer, disable all RX interrupts */
 	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~RXFLAGS;
+
 	iowrite32(ier, port->membase + TIMBUART_IER);
 }
 
@@ -47,6 +48,7 @@ static void timbuart_stop_tx(struct uart_port *port)
 {
 	/* spinlock held by upper layer, disable TX interrupt */
 	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~TXBAE;
+
 	iowrite32(ier, port->membase + TIMBUART_IER);
 }
 
@@ -83,6 +85,7 @@ static void timbuart_rx_chars(struct uart_port *port)
 
 	while (ioread32(port->membase + TIMBUART_ISR) & RXDP) {
 		u8 ch = ioread8(port->membase + TIMBUART_RXFIFO);
+
 		port->icount.rx++;
 		tty_insert_flip_char(tport, ch, TTY_NORMAL);
 	}
@@ -199,6 +202,7 @@ static void timbuart_tasklet(unsigned long arg)
 static unsigned int timbuart_get_mctrl(struct uart_port *port)
 {
 	u8 cts = ioread8(port->membase + TIMBUART_CTRL);
+
 	dev_dbg(port->dev, "%s - cts %x\n", __func__, cts);
 
 	if (cts & TIMBUART_CTRL_CTS)
@@ -293,7 +297,8 @@ static void timbuart_set_termios(struct uart_port *port,
 	baud = baudrates[bindex];
 
 	/* The serial layer calls into this once with old = NULL when setting
-	   up initially */
+	 * up initially
+	 */
 	if (old)
 		tty_termios_copy_hw(termios, old);
 	tty_termios_encode_baud_rate(termios, baud, baud);
@@ -500,4 +505,3 @@ static int timbuart_remove(struct platform_device *dev)
 MODULE_DESCRIPTION("Timberdale UART driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:timb-uart");
-
-- 
1.9.1

