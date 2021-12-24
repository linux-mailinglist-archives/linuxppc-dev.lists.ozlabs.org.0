Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9947EFA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 15:35:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL8k25w7xz3cHf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 01:35:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bp.renesas.com (client-ip=210.160.252.171;
 helo=relmlie5.idc.renesas.com;
 envelope-from=prabhakar.mahadev-lad.rj@bp.renesas.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir;
 Sat, 25 Dec 2021 01:35:16 AEDT
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JL8jc1Xvtz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 01:35:14 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="5.88,232,1635174000"; d="scan'208";a="104623572"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 24 Dec 2021 23:30:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 202D04000AA9;
 Fri, 24 Dec 2021 23:30:04 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 10/10] serial: pmac_zilog: Use platform_get_irq() to get the
 interrupt
Date: Fri, 24 Dec 2021 14:29:16 +0000
Message-Id: <20211224142917.6966-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224142917.6966-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211224142917.6966-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/pmac_zilog.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 12ce150b0ad4..5359236b32d6 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1702,17 +1702,21 @@ extern struct platform_device scc_a_pdev, scc_b_pdev;
 
 static int __init pmz_init_port(struct uart_pmac_port *uap)
 {
-	struct resource *r_ports, *r_irq;
+	struct resource *r_ports;
+	int irq;
 
 	r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
-	r_irq = platform_get_resource(uap->pdev, IORESOURCE_IRQ, 0);
-	if (!r_ports || !r_irq)
+	if (!r_ports)
 		return -ENODEV;
 
+	irq = platform_get_irq(uap->pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	uap->port.mapbase  = r_ports->start;
 	uap->port.membase  = (unsigned char __iomem *) r_ports->start;
 	uap->port.iotype   = UPIO_MEM;
-	uap->port.irq      = r_irq->start;
+	uap->port.irq      = irq;
 	uap->port.uartclk  = ZS_CLOCK;
 	uap->port.fifosize = 1;
 	uap->port.ops      = &pmz_pops;
-- 
2.17.1

