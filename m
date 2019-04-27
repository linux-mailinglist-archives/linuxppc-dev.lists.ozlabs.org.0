Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6997EB3A1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:45:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rscQ6VpjzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZs5TNXzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:45 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M3UhO-1hKv3E1nDW-000feT; Sat, 27 Apr 2019 14:52:46 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 15/41] drivers: tty: serial: uartlite: fix use fix bare
 'unsigned'
Date: Sat, 27 Apr 2019 14:51:56 +0200
Message-Id: <1556369542-13247-16-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:H9Hq+xMuwfZXnigABXZrW477+wXowxTgyBBLY0HAV0mnCDYh/e0
 TH2w4PbDOyXyM86Lq7DloZ+B8ibFAqHgCXXMWMGOq9YWJ3Y3vlKsyrAZnSi1E5Li5qxc0Ar
 AY0Hr5JlBrCnebDS4GMDfCcj7dIYVLdfUOg6Bcei5qLQJLaC/QfWMzWDYdXhqXpmqWR3y/g
 yAdYT/Wa4x9gI+B2VhpoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D2oOUfp8uCo=:5lrDda8U5aFZpudo3KrlHw
 QfcRhxGTGMLAHkNzBRnnd+lkn58nSdvpn7c9TUOtolJKzKAO+OHtV4ghnYuB42I+wrqdaJeQA
 gYzoWs33uC4a7MEOzq8e49qWA7R1n0n0CJXL9li7QI/rlHHOjSfmzNdtlYGandPhoSKIZvmze
 MZNSv5A3AiESPc+6rxlOMHPKPhMXZxYwhozZkykdv45FqWIFy3tXM953eirGCdE+zz/ARHgat
 inDIaIanbYbslfbRuGRyZDgiwBLaZ5wBoMw36vPZAqBoB/PebQqlI5oSdjHbqQo8cTAvg5zKx
 Fz8Dga5iu6r26bwr12d4/0kttmebIxOIoYseRF8DO7Hk6PAPhZ0OV+kDQW4QMdDyS22ZbCKBW
 v6sHArgHVJFBy5P/N3j8+k9hJ9bpVK8T+1DDkd4C8oYNMdfE97O8l32iuy1M0xj0Jyrr52TVe
 Y6R5XXFCfdmUx0vkMgfiK90/uHq46F6svsco7pON2WLshBLO7OJK4Y5HoH+m0+H9KX5b8kY7s
 TVJ5KGWYNOKUm8TPEj4gzeLLiCdU02YlIHTDvy1bwOH1SSDC6P1nUfopB+g5e+bAxSIYL1HTu
 sJ20OB/G1JxxPGIzUZa2KTTSoDO3t3r6M79VoqO6FbffsYG64Ppl0en3PtH0FxAt7ec2xRW0S
 DB6fvKXx3fq2SygcFrdjvFulYTqPmWXFVeAqZY1I3+Rgqoi+SBC+HeSGk4J1i+wvp6+yc0Lqh
 6Hw2xJD0bTtvS6/ZIe53IAofiXy3wk5bOBPxkg==
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

    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
    #562: FILE: drivers/tty/serial/uartlite.c:562:
    +	unsigned retries = 1000000;

    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
    #574: FILE: drivers/tty/serial/uartlite.c:574:
    +				 const char *s, unsigned n)

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 4c28600..6f79353 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -559,7 +559,7 @@ static void early_uartlite_putc(struct uart_port *port, int c)
 	 * we'll never timeout on a working UART.
 	 */
 
-	unsigned retries = 1000000;
+	unsigned int retries = 1000000;
 	/* read status bit - 0x8 offset */
 	while (--retries && (readl(port->membase + 8) & (1 << 3)))
 		;
@@ -571,7 +571,7 @@ static void early_uartlite_putc(struct uart_port *port, int c)
 }
 
 static void early_uartlite_write(struct console *console,
-				 const char *s, unsigned n)
+				 const char *s, unsigned int n)
 {
 	struct earlycon_device *device = console->data;
 	uart_console_write(&device->port, s, n, early_uartlite_putc);
-- 
1.9.1

