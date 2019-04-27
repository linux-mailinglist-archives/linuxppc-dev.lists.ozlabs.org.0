Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB81B3B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:14:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtGY4yTFzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:14:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbN4DF8zDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:12 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MS3r9-1hEZPX2dSN-00TRpw; Sat, 27 Apr 2019 14:53:04 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource size in
 port struct
Date: Sat, 27 Apr 2019 14:52:17 +0200
Message-Id: <1556369542-13247-37-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:5xh4xCURPmXUvaYJVhWOOLAQMBFKolTB1CtYzDRsCmMQTGj9Kze
 7Fbh3rf2q+OnFvF6rluf5naHkTWp2AKMpX/8qWmYyA8oK2d2GVmdCXs4872KOgx/atiTp7G
 d+ALZSGvhXvKgBZpXx6a8p8ION7NAMwQ3bOjpLN0lyMQnletfe+ZuAytTgD3Wq6yfeTr+s+
 ZII786NCtXHLUZuyeofOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:djD9tuASFVE=:wQ91fFs/J3mQ70zz2azDZi
 im5ZVJReMctn3//8m2Nt0OgUPtDqqY+sijlutMtZDPhqldM97rtFBZYkaeP2c+ho94Dyyv5xJ
 JPrU0zAnjLpBLflEiqQj2QKQ00bY4ILqd1U2PbOFn2CTp/ed2fY9mYHa0pE+sIpoHtc+8lpxH
 pPPIoMWy/ODt8IGfp7MgpRUnhFF9LWtRHwBCQ1grDn9NU7p99VeTS/eIahJndKg5BAUcqXwnP
 LlJqCFMnMhEpoj82UbC44Gdjp+FOX3LAfgokKS720Jt/VXrunAD8j0jj9OzvcNqYMcQvbeL5s
 /G84cB8lueVqSPZv/aUfyFHRfkIQu4H9qG0Jsq9i7EjvvGcwi7eebccjW5ysR72XWCw7YLMSr
 euQO2e2vLrSChK25RK+Pa+s+iOxwovyAFFvUf6IdlAo4KuBrtvNYvUzhsW79om8XTk7vZItZj
 7TSTWr/77g2Mb2xEp/vHWXyuaDBq1GF5akbfDFuQpyhDC2n7kv+f2d81S6N8F+2VVzVgxxZ11
 ejpY1uMNSTLIEjZz2ZQQpDJK6LGJyOAbW3uZfxbfXxtuw+jSRK5X8+7GT7kQvFUTxrLmBwOnL
 Sc2xTRmfKR5NjOMT4ubLfgXTHLEc2aRjIHnGo9FrwNA8YrZ6RDGXfR4fbvkRXkLzrXqP7q12L
 1aYbWyXYagNY4dghtfcpxqjj+GrDC38boBH3GX25G9fCM/ituqT4K286oeRniAX+UfdhEq2K6
 EMu4EZWzMilQGmLMUNxFb0GpQPLPnCxtQGmepw==
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

The io resource size is currently recomputed when it's needed but this
actually needs to be done once (or drivers could specify fixed values)

Simplify that by doing this computation only once and storing the result
into the mapsize field. serial8250_register_8250_port() is now called
only once on driver init, the previous call sites now just fetch the
value from the mapsize field.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_core.c |  3 +++
 drivers/tty/serial/8250/8250_port.c | 33 +++++++++++++++------------------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index ebfb0bd..89e3f09 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -255,3 +255,5 @@ static inline int serial_index(struct uart_port *port)
 {
 	return port->minor - 64;
 }
+
+unsigned int serial8250_port_size(struct uart_8250_port *pt);
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 71a398b..a9d4ba1 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -979,6 +979,9 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
 	if (up->port.uartclk == 0)
 		return -EINVAL;
 
+	/* compute the mapsize in case the driver didn't specify one */
+	up->mapsize = serial8250_port_size(up);
+
 	mutex_lock(&serial_mutex);
 
 	uart = serial8250_find_match_or_unused(&up->port);
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index d2f3310..d09af4c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2829,7 +2829,7 @@ void serial8250_do_pm(struct uart_port *port, unsigned int state,
 		serial8250_do_pm(port, state, oldstate);
 }
 
-static unsigned int serial8250_port_size(struct uart_8250_port *pt)
+unsigned int serial8250_port_size(struct uart_8250_port *pt)
 {
 	if (pt->port.mapsize)
 		return pt->port.mapsize;
@@ -2849,9 +2849,7 @@ static unsigned int serial8250_port_size(struct uart_8250_port *pt)
  */
 static int serial8250_request_std_resource(struct uart_8250_port *up)
 {
-	unsigned int size = serial8250_port_size(up);
 	struct uart_port *port = &up->port;
-	int ret = 0;
 
 	switch (port->iotype) {
 	case UPIO_AU:
@@ -2863,32 +2861,31 @@ static int serial8250_request_std_resource(struct uart_8250_port *up)
 		if (!port->mapbase)
 			break;
 
-		if (!request_mem_region(port->mapbase, size, "serial")) {
-			ret = -EBUSY;
-			break;
-		}
+		if (!request_mem_region(port->mapbase,
+					port->mapsize, "serial"))
+			return -EBUSY;
 
 		if (port->flags & UPF_IOREMAP) {
-			port->membase = ioremap_nocache(port->mapbase, size);
-			if (!port->membase) {
-				release_mem_region(port->mapbase, size);
-				ret = -ENOMEM;
-			}
+			port->membase = ioremap_nocache(port->mapbase,
+							port->mapsize);
+			if (!port->membase)
+				release_mem_region(port->mapbase,
+						   port->mapsize);
+				return -ENOMEM;
 		}
 		break;
 
 	case UPIO_HUB6:
 	case UPIO_PORT:
-		if (!request_region(port->iobase, size, "serial"))
-			ret = -EBUSY;
+		if (!request_region(port->iobase, port->mapsize, "serial"))
+			return -EBUSY;
 		break;
 	}
-	return ret;
+	return 0;
 }
 
 static void serial8250_release_std_resource(struct uart_8250_port *up)
 {
-	unsigned int size = serial8250_port_size(up);
 	struct uart_port *port = &up->port;
 
 	switch (port->iotype) {
@@ -2906,12 +2903,12 @@ static void serial8250_release_std_resource(struct uart_8250_port *up)
 			port->membase = NULL;
 		}
 
-		release_mem_region(port->mapbase, size);
+		release_mem_region(port->mapbase, port->mapsize);
 		break;
 
 	case UPIO_HUB6:
 	case UPIO_PORT:
-		release_region(port->iobase, size);
+		release_region(port->iobase, port->mapsize);
 		break;
 	}
 }
-- 
1.9.1

