Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0153B3BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:18:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtLx3856zDqG0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:18:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbP5DwpzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:13 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N79q8-1ghy553AGC-017Rst; Sat, 27 Apr 2019 14:53:03 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 35/41] drivers: tty: serial: 8250: add mapsize to platform data
Date: Sat, 27 Apr 2019 14:52:16 +0200
Message-Id: <1556369542-13247-36-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:JcK0nmXUqvVZov6FpygbFCYx2SBIMbt8YBo1Pyu7lLXpjQoFRY+
 pUU91A2VFsC0opVj58fPkR0Q6FJXQi2dkc/wvSXJs1UuyFbz9fA4rXDWaSqNdJmI+Ni3NVN
 GCHT5mxv7iA219z7s0oyXnMLdcGAYrX/sQa9g9+0osWcxqkU8TBbfxVPdIH8z0lkkec4VUA
 Jy3EMpSULncwPlRSUSCNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YDpImvGn3R8=:tgBoeB5JmWkHrPT4D/H2bm
 ke4Q5ukVTCE5Dh1f6v4e0aRP4j6Ev4/57TeKYe9VpFxmrapQ0dWX4RVryt7CL8BOZdUERiFnT
 EfqZCmSPOCkvF7DI1UBcwBtOFo78mnudVVbujkzyeK0kOOnXUUYFU3jin5uwHinOiaT+VSgox
 37Xs5VIaI7hWvLoRn6xwFIu3+DZASQ/0yf03sw06aQcaoyRvKDnnkyGeqEsXuEMN8tilEQVNG
 64P6JtvqI6//joeXrhz9ayj9md5nP2NrHFqch/S1t9x7llzxVDVYnDh5oboQ9HyyOT9bnpDPV
 6K8iQfqBzHG6sKpzPPCo/A7aTNYz3v8hGoBhF9h89K10hft/ZHR+72X8UsL87DgUAlb/We368
 wmcqZP8eZHKQaQjOeZ07ozi/9PICbl0AeSPZ663XRzHSalGy+nWlZ14JzV3w0fl2YcTO8RtUx
 nZQoC5amxNmn7kpUWk6pZeQnIkQ8XhXq3iQEosa9nBMR57L7WhggiAurttYpP18NHXYEp78o5
 yltBNHch9g6KpNyD3Y8e4Nj7ZJPE8gWqZGDQ+erCKIVdWJXL7f7ehe6i2CLEKnJkX5scK9Zv/
 IQa+Nv1uvo+8/7Z9HtdYj1ysjkj3PKQGfoGBiP99Z/Jinw7/2+ZP8bCMwG1qVHh17FlE+g0Nv
 mBoHGzoU9yDNdWh/BVlWpFBAjYMpDyHRSgtix/xw7G/hLbyX424T9N+wZTUK9Yx40NcA6YnAg
 jvq2X4S3DIGaoGdyuuFkJzMkjl+JxdsplJBPpg==
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

Adding a mapsize field for the 8250 port platform data struct,
so we can now set the resource size (eg. *1) and don't need
funny runtime detections like serial8250_port_size() anymore.

For now, serial8250_port_size() is called everytime we need
the io resource size. That function checks which chip we
actually have and returns the appropriate size. This approach
is a bit clumpsy and not entirely easy to understand, and
it's a violation of layers :p

Obviously, that information cannot change after the driver init,
so we can safely do that probing once on driver init and just
use the stored value later.

*1) arch/mips/alchemy/common/platform.c

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/8250/8250_core.c | 1 +
 include/linux/serial_8250.h         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index e441221..71a398b 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -814,6 +814,7 @@ static int serial8250_probe(struct platform_device *dev)
 		uart.port.iotype	= p->iotype;
 		uart.port.flags		= p->flags;
 		uart.port.mapbase	= p->mapbase;
+		uart.port.mapsize	= p->mapsize;
 		uart.port.hub6		= p->hub6;
 		uart.port.private_data	= p->private_data;
 		uart.port.type		= p->type;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 5a655ba..8b8183a 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -22,6 +22,7 @@ struct plat_serial8250_port {
 	unsigned long	iobase;		/* io base address */
 	void __iomem	*membase;	/* ioremap cookie or NULL */
 	resource_size_t	mapbase;	/* resource base */
+	resource_size_t	mapsize;	/* resource size */
 	unsigned int	irq;		/* interrupt number */
 	unsigned long	irqflags;	/* request_irq flags */
 	unsigned int	uartclk;	/* UART clock rate */
-- 
1.9.1

