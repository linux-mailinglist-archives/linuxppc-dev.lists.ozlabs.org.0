Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878DB39C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:34:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rsMy0J1kzDq7W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:34:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrT66nffzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:46 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0G5n-1gXkoO0kCt-00xITk; Sat, 27 Apr 2019 14:53:07 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 39/41] drivers: tty: serial: pmac_zilog: fill mapsize and use
 it
Date: Sat, 27 Apr 2019 14:52:20 +0200
Message-Id: <1556369542-13247-40-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:cAQG+0D3UvfMqv8b+CkNtVcswZtDqF2lX087MK9isXMtCtEuT0Z
 +LMvw9S8Tc3gAW5AwMqdBeMVX80UXPgUiQX3GDAwydtKI18PtYqNh2qK8dQfa4yBEZlrd1g
 VFeIauCytrNe9vDPPGAAhgPqYDFdooytbUCh1T2kC3df+mNQEgvvapvejEhIxI7xt++ViLv
 FxMypxg9TvTXo+483DuLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JbWJYl/z86Y=:AfUHXZyI0rYrTcXrDfF6qI
 MsyI9ktNaqoSao04HUcu062H3AOny0fTjnjWXA4c4onYTcO/5YLu10OCXHb+J1m+g7hObnhRG
 vs217EAPsMyd2cL9U16idxvqv6uEZhwiWKRc8xjoS1VopitogudmOcw65b78tGcQw7gYyWfwu
 fX5DzFve0pRc0ZABVzrzmtBNgMB0ZAYvx/bGUxlsMZcQfXAswkv0MLKUtjDdssmXFHfPJc8a1
 jUZ9gAcBppZWcNAh0pYeOZiFih2Ay5KEwtpMNRKs/FQhNJs9GQug75OpzNt1A0zP5pP/fCeeZ
 EgxiCJvmRtBEE5+YbW7mPe/vZE8JPX/OMJLy0H2dX/BU8ns9ksGXUfJKrjBojS2H+N0TvNxD8
 j4VOfUEuWnxcdYiVNPpSvgW2QW/kMAQTxaL/476BeIPYaCDPnor4iJXPadns1/FI4tOxuoXT7
 1HHoO9vDgLa2wum+e1Q5XzmgoL8LgaFiycERH7Vzj99V/AhXSPH8ekdU97upV/7AWYCP5A0s6
 EBsMyIXgcS+mr5u5R/ywj1LKJhEOsu0eqGvDRvmXhKb99V7HgQv/m6JORXrB1LhNM9ntkwS74
 rNqOAeaPVhYsUACPCG9hY4slXpfQwnv4hYc7X5zml1WIGtXaI4pg8Z/bkyyZ8UVzy/EeQvxEP
 Mw2bqg3M8i7FRPOJ2mkqIDALRn2r7NYhG2CoCrKsNJA/wIZktd7vR8qgXT/4FPtJu76uzg6QN
 phzqLuS3ZluJDPbcJL8gpTdmNCKe6Z/Zi0wWgw==
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
 drivers/tty/serial/pmac_zilog.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index bcb5bf7..1fef014 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -88,6 +88,8 @@
 #define PMACZILOG_NAME		"ttyPZ"
 #endif
 
+#define PMZ_MAPSIZE		0x1000
+
 #define pmz_debug(fmt, arg...)	pr_debug("ttyPZ%d: " fmt, uap->port.line, ## arg)
 #define pmz_error(fmt, arg...)	pr_err("ttyPZ%d: " fmt, uap->port.line, ## arg)
 #define pmz_info(fmt, arg...)	pr_info("ttyPZ%d: " fmt, uap->port.line, ## arg)
@@ -1411,7 +1413,8 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	if (of_address_to_resource(np, 0, &r_ports))
 		return -ENODEV;
 	uap->port.mapbase = r_ports.start;
-	uap->port.membase = ioremap(uap->port.mapbase, 0x1000);
+	uap->port.mapsize = PMZ_MAPSIZE;
+	uap->port.membase = ioremap(uap->port.mapbase, uap->port.mapsize);
 
 	uap->control_reg = uap->port.membase;
 	uap->data_reg = uap->control_reg + 0x10;
@@ -1709,6 +1712,7 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 		return -ENODEV;
 
 	uap->port.mapbase  = r_ports->start;
+	uap->port.mapsize  = PMZ_MAPSIZE;
 	uap->port.membase  = (unsigned char __iomem *) r_ports->start;
 	uap->port.iotype   = UPIO_MEM;
 	uap->port.irq      = irq;
-- 
1.9.1

