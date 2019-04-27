Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDCB37E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 14:58:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rrb33WxrzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 22:58:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSf0TZQzDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:21 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPXpS-1h7dOA2vUw-00MaDR; Sat, 27 Apr 2019 14:52:44 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and use it
Date: Sat, 27 Apr 2019 14:51:54 +0200
Message-Id: <1556369542-13247-14-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:HsinThJYSBbvZXPfm+0O6kKUO+qcziVpNnYsjWaEzEiMEg9DSuK
 dNf0rb/MCsWgo6VR685d/dBzsntfhucM9zdpec9KJhVPsvgZXFU+FHm2NA8+p9uNUoUt2t/
 97+mu3GZ0mzF7ACNEs/tQdl8KcWi9bu5JVWLna6RzeYMAWm9wnFG9XjorOOkAQTF4hi7dJB
 W8BggkCEpEPmgsUJa1QKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M2CupHkdprI=:t4eNWY5bS1vu92cW6qDWEU
 ADcR+6Kg7dcevcZPeO14Esbr4UB1TouOkNfW01O86yvYnijA1sc/wnjYLbAFIt0rwXMyPKNGU
 O/PioqNftTLrLR+ttFEWixd+2dV3vE30I4Ge56dkTfvUCXNuMnkxzEAZskQfusFSpau0qMp3m
 4B3eZ7QEbqsajYkwU+gX1wSdVckm7ohYMvPl92gqYlvK0WbrvXhR6X59BXzlQ+TeldpXpLkpt
 qxNlzP/6DsfSHkrfCntzbFaD4FkxHXnhDUDngfu6J8I1XCkKuDwY7JEfPQIoyLB7Ao7TKq3gj
 WIlU9tIg7jI/cufHOP/EkSmv0xP8qavjGQazjMDDC57vd+Jovtnwcp3n24xxplR6xxuT5tAwY
 Wp9TEeiF0rZwe1z9tF6QztbHm2UaaNo2wv6I1A+IN6pVUFBFul9CnwmxQG81GmFjrhxWSgUtJ
 IMMdF66BcOi48fIhcMfXtDWMpWDXC+uWdiPjeWhQk1RUYc6PrVeGQOYfhDHJelX7nkF9fOJvN
 yjiW401cuK4NbC6nHAjZULv7zT8Ckza4ID+/BlH0wUfNAkj6i28hgOSsg58c6b5fMCXjyhkJL
 5R5FYtY9cs3sxNW2/qp+GIWH0qY3L7sI0LyA/aC3gm70d0HNqsoPZD49KGFdJ75JCDJrwlJ+l
 +MfViqK0FaiihFHJPKgf95dVxASBqvUqvWXYZbU0XDUpXNVGBfQQpp5jxT6/y8t/byI8M1vTQ
 ll/ztjVh1UtTy87vhydhWCwlP4maAW5p4lwI3g==
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

Fill the struct uart_port->mapsize field and use it, insteaf of
hardcoded values in many places. This makes the code layout a bit
more consistent and easily allows using generic helpers for the
io memory handling.

Candidates for such helpers could be eg. the request+ioremap and
iounmap+release combinations.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 44d65bd..c322ab6 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -342,7 +342,7 @@ static const char *ulite_type(struct uart_port *port)
 
 static void ulite_release_port(struct uart_port *port)
 {
-	release_mem_region(port->mapbase, ULITE_REGION);
+	release_mem_region(port->mapbase, port->mapsize);
 	iounmap(port->membase);
 	port->membase = NULL;
 }
@@ -356,15 +356,15 @@ static int ulite_request_port(struct uart_port *port)
 		"ulite console: port=%p; port->mapbase=%llx\n",
 		 port, (unsigned long long) port->mapbase);
 
-	if (!request_mem_region(port->mapbase, ULITE_REGION, "uartlite")) {
+	if (!request_mem_region(port->mapbase, port->mapsize, "uartlite")) {
 		dev_err(port->dev, "Memory region busy\n");
 		return -EBUSY;
 	}
 
-	port->membase = ioremap(port->mapbase, ULITE_REGION);
+	port->membase = ioremap(port->mapbase, port->mapsize);
 	if (!port->membase) {
 		dev_err(port->dev, "Unable to map registers\n");
-		release_mem_region(port->mapbase, ULITE_REGION);
+		release_mem_region(port->mapbase, port->mapsize);
 		return -EBUSY;
 	}
 
@@ -649,6 +649,7 @@ static int ulite_assign(struct device *dev, int id, u32 base, int irq,
 	port->iotype = UPIO_MEM;
 	port->iobase = 1; /* mark port in use */
 	port->mapbase = base;
+	port->mapsize = ULITE_REGION;
 	port->membase = NULL;
 	port->ops = &ulite_ops;
 	port->irq = irq;
-- 
1.9.1

