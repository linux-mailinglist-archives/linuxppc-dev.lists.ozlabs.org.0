Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB7B3C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:25:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtVN5mk7zDqg3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:25:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbT3WDHzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:17 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mwwhv-1gb3fT0nff-00yOwS; Sat, 27 Apr 2019 14:53:08 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Date: Sat, 27 Apr 2019 14:52:21 +0200
Message-Id: <1556369542-13247-41-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:vc6wGTaQT5uupsAbTreZS+sSZdK+XaJlhvT04A4iLubNRzD5IPf
 YPAFQc5vGV+Pk+jx4AQ39iE2rlAHtPW/QsqfgV74Nxmys/AYDobtR0hEBlUQHBmvYoLL0xR
 XQxKhJsbfgTox/my2891L8/IyJQwk8mMDnx+dEs89rrf/NOEyfUPIMcBkPiwhE0bwqAARyQ
 PkO/tEXnAuNfYoxPG2X+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Owe0da99/6Y=:zYMfT1DD7rjLy/+JENXwDn
 4Bzxk/XsSpWocKCHtCb2/N9FTvFgIE89diDdeScL3VDC0ymnnB19mTfI/yD5ZoImBWnOZmiM4
 HIZzQmuQQuHuMsA/a+yIN7hmiUqCTHlxQvlRoLMO2ssRQlUD0Nwrz+/xn+JeYQ/FhQDnHYLG+
 y9loSt3TEeyTgcECVYETtSsc68jyCBWiOAKMRnX/MVGY+ua/hygOhJdj5ric4wqIAl6tz1WPo
 LJraN0A8h1/eGsZU2ngnCMl/Z8s7nzUFtdIao5WXSeUGXcsPufthRsME/5+RqVQyzGWcBIauh
 55T4Yw/rZsJZXBDxHxlvLMeKIHdwawgwdF0QIbLbviS2J5D4MGp1iHVHuvNfzt18xgvYVtqmW
 rOEAJPWTOind+OFfnA2b6kcW+2a3ZUbqDQibreRbRqfvmF06Pc35ab9lhxr6m1bcTuQFKk7cC
 GH+DNwfwWdDvQU9t1ucYdp7KPeD2xE/jaOCyyvcbdl6fWascXX1kgH48IFIn/ddnsA8ee5y30
 8h5gLQZj+z2VBVIujG6BLFVWorTAQUnXoRICwA2hFnMwpZp3sm1ihP6sIgeDG79Dgp8U4S8zC
 AqJUeJjfjag0CZvWI6ZB9D6vfQhZ1tXbP11PeTAaoa96CoS+BGbakwlJRFuzvc4nAGWTNJMuP
 qjTZRl+mXI7csTA/zQEKdnDxnUbS9NVUMIFxeIMNXtG4MDsfA3OvwkrbZ1rmndXNdtFvTvGhE
 hWALsSNeJLIT1ZsPrrQ63y235Ni4LAFHnd8yqA==
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

Introduce a little helpers for settings the mmio range from an
struct resource or start/len parameters with less code.
(also setting iotype to UPIO_MEM)

Also converting drivers to use these new helpers as well as
fetching mapsize field instead of using hardcoded values.
(the runtime overhead of that should be negligible)

The idea is moving to a consistent scheme, so later common
calls like request+ioremap combination can be done by generic
helpers.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/8250/8250_acorn.c        |  5 ++--
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  4 +--
 drivers/tty/serial/8250/8250_dw.c           |  3 +--
 drivers/tty/serial/8250/8250_em.c           |  2 +-
 drivers/tty/serial/8250/8250_exar.c         |  6 +++--
 drivers/tty/serial/8250/8250_hp300.c        | 11 +++++---
 drivers/tty/serial/8250/8250_of.c           |  9 ++-----
 drivers/tty/serial/meson_uart.c             |  5 ++--
 drivers/tty/serial/mps2-uart.c              |  5 ++--
 drivers/tty/serial/pmac_zilog.c             |  8 ++----
 drivers/tty/serial/vt8500_serial.c          |  4 +--
 drivers/tty/serial/xilinx_uartps.c          |  3 +--
 drivers/tty/serial/zs.c                     | 10 +++++---
 include/linux/serial_core.h                 | 40 +++++++++++++++++++++++++++++
 14 files changed, 76 insertions(+), 39 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_acorn.c b/drivers/tty/serial/8250/8250_acorn.c
index 758c4aa..359171b 100644
--- a/drivers/tty/serial/8250/8250_acorn.c
+++ b/drivers/tty/serial/8250/8250_acorn.c
@@ -63,14 +63,15 @@ struct serial_card_info {
 	uart.port.irq	= ec->irq;
 	uart.port.flags	= UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
 	uart.port.uartclk	= type->uartclk;
-	uart.port.iotype	= UPIO_MEM;
 	uart.port.regshift	= 2;
 	uart.port.dev	= &ec->dev;
 
 	for (i = 0; i < info->num_ports; i++) {
 		uart.port.membase = info->vaddr + type->offset[i];
-		uart.port.mapbase = bus_addr + type->offset[i];
 
+		/* mapsize is computed by serial8250_register_8250_port() */
+		uart_memres_set_start_len(&uart.port,
+					  bus_addr + type->offset[i], 0);
 		info->ports[i] = serial8250_register_8250_port(&uart);
 	}
 
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 0438d9a..0e06391 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -328,8 +328,6 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	memset(&port, 0, sizeof(port));
 	port.port.private_data = vuart;
 	port.port.membase = vuart->regs;
-	port.port.mapbase = res->start;
-	port.port.mapsize = resource_size(res);
 	port.port.startup = aspeed_vuart_startup;
 	port.port.shutdown = aspeed_vuart_shutdown;
 	port.port.throttle = aspeed_vuart_throttle;
@@ -337,6 +335,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.status = UPSTAT_SYNC_FIFO;
 	port.port.dev = &pdev->dev;
 
+	uart_memres_set_res(&port.port, res);
+
 	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	if (rc < 0)
 		return rc;
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index d31b975..cb65256 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -513,18 +513,17 @@ static int dw8250_probe(struct platform_device *pdev)
 	}
 
 	spin_lock_init(&p->lock);
-	p->mapbase	= regs->start;
 	p->irq		= irq;
 	p->handle_irq	= dw8250_handle_irq;
 	p->pm		= dw8250_do_pm;
 	p->type		= PORT_8250;
 	p->flags	= UPF_SHARE_IRQ | UPF_FIXED_PORT;
 	p->dev		= dev;
-	p->iotype	= UPIO_MEM;
 	p->serial_in	= dw8250_serial_in;
 	p->serial_out	= dw8250_serial_out;
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
+	uart_memres_set_res(p, regs);
 
 	p->membase = devm_ioremap(dev, regs->start, resource_size(regs));
 	if (!p->membase)
diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 2a76e22..7610441 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -100,12 +100,12 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	}
 
 	memset(&up, 0, sizeof(up));
-	up.port.mapbase = regs->start;
 	up.port.irq = irq->start;
 	up.port.type = PORT_UNKNOWN;
 	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
 	up.port.dev = &pdev->dev;
 	up.port.private_data = priv;
+	uart_memres_set_res(&up.port, res);
 
 	clk_prepare_enable(priv->sclk);
 	up.port.uartclk = clk_get_rate(priv->sclk);
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index 0089aa3..f4c1289 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -134,8 +134,10 @@ static int default_setup(struct exar8250 *priv, struct pci_dev *pcidev,
 	const struct exar8250_board *board = priv->board;
 	unsigned int bar = 0;
 
-	port->port.iotype = UPIO_MEM;
-	port->port.mapbase = pci_resource_start(pcidev, bar) + offset;
+	uart_memres_set_start_len(&port->port,
+				  pci_resource_start(pcidev, bar) + offset,
+				  pci_resource_len(pcidev, bar));
+
 	port->port.membase = priv->virt + offset;
 	port->port.regshift = board->reg_shift;
 
diff --git a/drivers/tty/serial/8250/8250_hp300.c b/drivers/tty/serial/8250/8250_hp300.c
index 3012ea0..09f9dd3 100644
--- a/drivers/tty/serial/8250/8250_hp300.c
+++ b/drivers/tty/serial/8250/8250_hp300.c
@@ -114,7 +114,9 @@ int __init hp300_setup_serial_console(void)
 		pr_info("Serial console is HP APCI 1\n");
 
 		port.uartclk = HPAPCI_BAUD_BASE * 16;
-		port.mapbase = (FRODO_BASE + FRODO_APCI_OFFSET(1));
+		uart_memres_set_start_len(
+			&port,
+			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);
 		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
 		port.regshift = 2;
 		add_preferred_console("ttyS", port.line, "9600n8");
@@ -131,7 +133,8 @@ int __init hp300_setup_serial_console(void)
 		pr_info("Serial console is HP DCA at select code %d\n", scode);
 
 		port.uartclk = HPDCA_BAUD_BASE * 16;
-		port.mapbase = (pa + UART_OFFSET);
+
+		uart_memres_set_start_len(&port, (pa + UART_OFFSET));
 		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
 		port.regshift = 1;
 		port.irq = DIO_IPL(pa + DIO_VIRADDRBASE);
@@ -173,7 +176,9 @@ static int hpdca_init_one(struct dio_dev *d,
 	uart.port.flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF;
 	uart.port.irq = d->ipl;
 	uart.port.uartclk = HPDCA_BAUD_BASE * 16;
-	uart.port.mapbase = (d->resource.start + UART_OFFSET);
+	uart_memres_set_start_len(&uart.port,
+				  (d->resource.start + UART_OFFSET),
+				  resource_size(&d->resource));
 	uart.port.membase = (char *)(uart.port.mapbase + DIO_VIRADDRBASE);
 	uart.port.regshift = 1;
 	uart.port.dev = &d->dev;
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 08157a1..1c5896c 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -96,18 +96,13 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 				  UPF_FIXED_TYPE;
 	spin_lock_init(&port->lock);
 
-	if (resource_type(&resource) == IORESOURCE_IO) {
-		port->iotype = UPIO_PORT;
-		port->iobase = resource.start;
-	} else {
-		port->mapbase = resource.start;
-		port->mapsize = resource_size(&resource);
+	uart_memres_set_res(port, &resource);
 
+	if (resource_type(&resource) == IORESOURCE_MEM) {
 		/* Check for shifted address mapping */
 		if (of_property_read_u32(np, "reg-offset", &prop) == 0)
 			port->mapbase += prop;
 
-		port->iotype = UPIO_MEM;
 		if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
 			switch (prop) {
 			case 1:
diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index fbc5bc0..bfcaa2f 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -698,9 +698,8 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	port->iotype = UPIO_MEM;
-	port->mapbase = res_mem->start;
-	port->mapsize = resource_size(res_mem);
+	uart_memset_set_res(port, res_mem);
+
 	port->irq = res_irq->start;
 	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
 	port->dev = &pdev->dev;
diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 587b42f..a4fd1de 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -562,9 +562,8 @@ static int mps2_init_port(struct platform_device *pdev,
 	if (IS_ERR(mps_port->port.membase))
 		return PTR_ERR(mps_port->port.membase);
 
-	mps_port->port.mapbase = res->start;
-	mps_port->port.mapsize = resource_size(res);
-	mps_port->port.iotype = UPIO_MEM;
+	uart_memres_set_res(&mps_port->port, res);
+
 	mps_port->port.flags = UPF_BOOT_AUTOCONF;
 	mps_port->port.fifosize = 1;
 	mps_port->port.ops = &mps2_uart_pops;
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 1fef014..7017dd2 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1412,8 +1412,7 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	 */
 	if (of_address_to_resource(np, 0, &r_ports))
 		return -ENODEV;
-	uap->port.mapbase = r_ports.start;
-	uap->port.mapsize = PMZ_MAPSIZE;
+	uart_memres_set_start_len(&uap->port, r_ports.start, PMZ_MAPSIZE);
 	uap->port.membase = ioremap(uap->port.mapbase, uap->port.mapsize);
 
 	uap->control_reg = uap->port.membase;
@@ -1493,7 +1492,6 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	/*
 	 * Init remaining bits of "port" structure
 	 */
-	uap->port.iotype = UPIO_MEM;
 	uap->port.irq = irq_of_parse_and_map(np, 0);
 	uap->port.uartclk = ZS_CLOCK;
 	uap->port.fifosize = 1;
@@ -1711,10 +1709,8 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	if (!r_ports || irq <= 0)
 		return -ENODEV;
 
-	uap->port.mapbase  = r_ports->start;
-	uap->port.mapsize  = PMZ_MAPSIZE;
+	uart_memres_set_start_len(&uap->port, r_ports->start, PMZ_MAPSIZE);
 	uap->port.membase  = (unsigned char __iomem *) r_ports->start;
-	uap->port.iotype   = UPIO_MEM;
 	uap->port.irq      = irq;
 	uap->port.uartclk  = ZS_CLOCK;
 	uap->port.fifosize = 1;
diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 3d58e9b..b303de4 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -695,8 +695,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 					VT8500_RECOMMENDED_CLK
 				      );
 	vt8500_port->uart.type = PORT_VT8500;
-	vt8500_port->uart.iotype = UPIO_MEM;
-	vt8500_port->uart.mapbase = mmres->start;
 	vt8500_port->uart.irq = irqres->start;
 	vt8500_port->uart.fifosize = 16;
 	vt8500_port->uart.ops = &vt8500_uart_pops;
@@ -704,6 +702,8 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	vt8500_port->uart.dev = &pdev->dev;
 	vt8500_port->uart.flags = UPF_IOREMAP | UPF_BOOT_AUTOCONF;
 
+	uart_memres_set_res(&vt8500_port->uart, mmres);
+
 	/* Serial core uses the magic "16" everywhere - adjust for it */
 	vt8500_port->uart.uartclk = 16 * clk_get_rate(vt8500_port->clk) /
 					vt8500_port->clk_predivisor /
diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index cf8ca66..895c90c 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1626,8 +1626,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	 * This function also registers this device with the tty layer
 	 * and triggers invocation of the config_port() entry point.
 	 */
-	port->mapbase = res->start;
-	port->mapsize = CDNS_UART_REGISTER_SPACE;
+	uart_memres_set_start_len(res->start, CDNS_UART_REGISTER_SPACE);
 	port->irq = irq;
 	port->dev = &pdev->dev;
 	port->uartclk = clk_get_rate(cdns_uart_data->uartclk);
diff --git a/drivers/tty/serial/zs.c b/drivers/tty/serial/zs.c
index ab432ba..87990b1 100644
--- a/drivers/tty/serial/zs.c
+++ b/drivers/tty/serial/zs.c
@@ -1113,10 +1113,12 @@ static int __init zs_probe_sccs(void)
 			uport->flags	= UPF_BOOT_AUTOCONF;
 			uport->ops	= &zs_ops;
 			uport->line	= chip * ZS_NUM_CHAN + side;
-			uport->mapsize	= ZS_CHAN_IO_SIZE;
-			uport->mapbase	= dec_kn_slot_base +
-					  zs_parms.scc[chip] +
-					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
+
+			uart_memres_set_start_len(dec_kn_slot_base +
+						    zs_parms.scc[chip] +
+						    (side ^ ZS_CHAN_B) *
+							ZS_CHAN_IO_SIZE,
+						  ZS_CHAN_IO_SIZE);
 
 			for (i = 0; i < ZS_NUM_REGS; i++)
 				zport->regs[i] = zs_init_regs[i];
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 5fe2b03..d891c8d 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -427,6 +427,46 @@ void uart_console_write(struct uart_port *port, const char *s,
 int uart_match_port(struct uart_port *port1, struct uart_port *port2);
 
 /*
+ * set physical io range from struct resource
+ * if resource is NULL, clear the fields
+ * also set the iotype to UPIO_MEM
+ */
+static inline void uart_memres_set_res(struct uart_port *port,
+				       struct resource *res)
+{
+	if (!res) {
+		port->mapsize = 0;
+		port->mapbase = 0;
+		port->iobase = 0;
+		return;
+	}
+
+	if (resource_type(res) == IORESOURCE_IO) {
+		port->iotype = UPIO_PORT;
+		port->iobase = resource->start;
+		return;
+	}
+
+	uart->mapbase = res->start;
+	uart->mapsize = resource_size(res);
+	uart->iotype  = UPIO_MEM;
+}
+
+/*
+ * set physical io range by start address and length
+ * if resource is NULL, clear the fields
+ * also set the iotype to UPIO_MEM
+ */
+static inline void uart_memres_set_start_len(struct uart_driver *uart,
+					     resource_size_t start,
+					     resource_size_t len)
+{
+	uart->mapbase = start;
+	uart->mapsize = len;
+	uart->iotype  = UPIO_MEM;
+}
+
+/*
  * Power Management
  */
 int uart_suspend_port(struct uart_driver *reg, struct uart_port *port);
-- 
1.9.1

