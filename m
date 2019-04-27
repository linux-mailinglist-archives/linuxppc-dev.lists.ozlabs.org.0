Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34717B37D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 14:56:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rrXH0qz2zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 22:56:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSd4JD1zDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:21 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MdeSn-1glaAQ1CHx-00ZjUI; Sat, 27 Apr 2019 14:52:47 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/41] drivers: tty: serial: uartlite: fix overlong lines
Date: Sat, 27 Apr 2019 14:51:57 +0200
Message-Id: <1556369542-13247-17-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Ck93dTfp9+M+xebhyVSLDIJuo4MjSGOjDhbkWBRUIflN7U9qSCe
 pUde8jE0w5A43JR5NuYza+AsYcjHeRQdVwFH5DfzOGQOqRZzgRch+fJcKukuNGfeEOytvZR
 5/10Xwz0fpHNGToPKDV3mQbY+HwaGvDTud8ym7VEBca8ousV2I6zja+sNCKPIsmKUiAW4+V
 hJqAZT0gvkBV1/kztVb2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lFLVA5ANqXA=:+nwoqH7LETA5l4ZD6Cy0by
 9QQxF9w7JwL9dfUQLkTSklNQAm9TDaWBKAb/AK8KrfiMTcGzLt9Ee5RiujQGuJAuFYCa25OaW
 PsRCxkE462T85gSy8Pd/1exhcYQsoX46KyLQ4ZKSeHvVV8tbKS/OwkFfGrRHmBQ8UlBeXLZK5
 ebF4s0a/Z8QgHeSqLp8Mld3p8Su8UoV9Y8qvT6GUpcFbwp930569alSTM8wqnyrp9aFJ3bviY
 wC6Tzx19GZ9/leyIqE3JEmv02FWM4Ec4A6QWgiqsopsuDAzIuR2eWi4DxrYaPHzxccOjVXhW2
 RfH12CPwxeEkAGqjze7Djw/S5IYL86ng+BscK9UV3x0uudrqH2DvL3151YkbTo13FkHwqeNnW
 DIe1MAVVKDPOOe4QN7noYVLhRj71YKuN4gMT/LJ+u880TUoLEHCWMILbm5ZFZyvlzBG6K47hU
 9N57YDdSPilc+UdCPlSqXcQ4hJByXjZkI6wRREnTfmyit5sfL61G8Cy9lTvJngnoKEflZ/q/D
 +VkFl7qZhum7WEPeks7u2yKFDTGflXCZYn2mA1tQq+cnqN0OJ85RJZpWS9w6/wqjPbVQmeHnX
 K1uOze3TXyWYC56Tqwpenyo+uVz9fCc59R4P6VjWRvoYFvUN2alVsNGhQFk7qhdBWZ+GW9efn
 J+EJarUbpowxoppGXDdCKd50A08hfJxVUT6cLO8NZbGm/sKEm6hc8cXIke/czqdZS6Z34iUaH
 iiO7jtF61oWxoOCw5a6wqJbKewrFO8VHKUZg/A==
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

    WARNING: line over 80 characters
    #283: FILE: drivers/tty/serial/uartlite.c:283:
    +	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,

    WARNING: Missing a blank line after declarations
    #577: FILE: drivers/tty/serial/uartlite.c:577:
    +	struct earlycon_device *device = console->data;
    +	uart_console_write(&device->port, s, n, early_uartlite_putc);

    WARNING: line over 80 characters
    #590: FILE: drivers/tty/serial/uartlite.c:590:
    +OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);

    WARNING: line over 80 characters
    #591: FILE: drivers/tty/serial/uartlite.c:591:
    +OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 6f79353..0140cec 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -280,7 +280,8 @@ static int ulite_startup(struct uart_port *port)
 		return ret;
 	}
 
-	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
+	ret = request_irq(port->irq, ulite_isr,
+			  IRQF_SHARED | IRQF_TRIGGER_RISING,
 			  "uartlite", port);
 	if (ret)
 		return ret;
@@ -574,6 +575,7 @@ static void early_uartlite_write(struct console *console,
 				 const char *s, unsigned int n)
 {
 	struct earlycon_device *device = console->data;
+
 	uart_console_write(&device->port, s, n, early_uartlite_putc);
 }
 
@@ -587,8 +589,10 @@ static int __init early_uartlite_setup(struct earlycon_device *device,
 	return 0;
 }
 EARLYCON_DECLARE(uartlite, early_uartlite_setup);
-OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);
-OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);
+OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b",
+		    early_uartlite_setup);
+OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a",
+		    early_uartlite_setup);
 
 #endif /* CONFIG_SERIAL_UARTLITE_CONSOLE */
 
-- 
1.9.1

