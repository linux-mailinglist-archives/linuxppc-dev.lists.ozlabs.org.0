Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B609446235
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:33:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxff2j6Jz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213;
 helo=5.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo548.mail-out.ovh.net (5.mo548.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlxdt3s2Tz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:18 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E14E621087;
 Fri,  5 Nov 2021 10:26:39 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c93136b6-479a-4467-8720-fa544ca55e10,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 02/11] powerpc/xive: Introduce an helper to print out
 interrupt characteristics
Date: Fri, 5 Nov 2021 11:26:27 +0100
Message-ID: <20211105102636.1016378-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3091fe9-3c60-4b71-be2e-1a4e5bcaf63d
X-Ovh-Tracer-Id: 495114485748763613
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

and extend output of debugfs and xmon with addresses of the ESB
management and trigger pages.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 54 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 7280ff3fef2d..3d558cad1f19 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -227,6 +227,19 @@ static void xive_esb_write(struct xive_irq_data *xd, u32 offset, u64 data)
 		out_be64(xd->eoi_mmio + offset, data);
 }
 
+static void xive_irq_data_dump(struct xive_irq_data *xd, char *buffer, size_t size)
+{
+	u64 val = xive_esb_read(xd, XIVE_ESB_GET);
+
+	snprintf(buffer, size, "flags=%c%c%c PQ=%c%c 0x%016llx 0x%016llx",
+		 xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
+		 xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
+		 xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
+		 val & XIVE_ESB_VAL_P ? 'P' : '-',
+		 val & XIVE_ESB_VAL_Q ? 'Q' : '-',
+		 xd->trig_page, xd->eoi_page);
+}
+
 #ifdef CONFIG_XMON
 static notrace void xive_dump_eq(const char *name, struct xive_q *q)
 {
@@ -252,11 +265,10 @@ notrace void xmon_xive_do_dump(int cpu)
 
 #ifdef CONFIG_SMP
 		{
-			u64 val = xive_esb_read(&xc->ipi_data, XIVE_ESB_GET);
+			char buffer[128];
 
-			xmon_printf("IPI=0x%08x PQ=%c%c ", xc->hw_ipi,
-				    val & XIVE_ESB_VAL_P ? 'P' : '-',
-				    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+			xive_irq_data_dump(&xc->ipi_data, buffer, sizeof(buffer));
+			xmon_printf("IPI=0x%08x %s", xc->hw_ipi, buffer);
 		}
 #endif
 		xive_dump_eq("EQ", &xc->queue[xive_irq_priority]);
@@ -291,15 +303,11 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
 		d = xive_get_irq_data(hw_irq);
 
 	if (d) {
-		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
-		u64 val = xive_esb_read(xd, XIVE_ESB_GET);
-
-		xmon_printf("flags=%c%c%c PQ=%c%c",
-			    xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
-			    xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
-			    xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
-			    val & XIVE_ESB_VAL_P ? 'P' : '-',
-			    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+		char buffer[128];
+
+		xive_irq_data_dump(irq_data_get_irq_handler_data(d),
+				   buffer, sizeof(buffer));
+		xmon_printf("%s", buffer);
 	}
 
 	xmon_printf("\n");
@@ -1703,11 +1711,10 @@ static void xive_debug_show_cpu(struct seq_file *m, int cpu)
 
 #ifdef CONFIG_SMP
 		{
-			u64 val = xive_esb_read(&xc->ipi_data, XIVE_ESB_GET);
+			char buffer[128];
 
-			seq_printf(m, "IPI=0x%08x PQ=%c%c ", xc->hw_ipi,
-				   val & XIVE_ESB_VAL_P ? 'P' : '-',
-				   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+			xive_irq_data_dump(&xc->ipi_data, buffer, sizeof(buffer));
+			seq_printf(m, "IPI=0x%08x %s", xc->hw_ipi, buffer);
 		}
 #endif
 		{
@@ -1734,8 +1741,7 @@ static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
 	u32 target;
 	u8 prio;
 	u32 lirq;
-	struct xive_irq_data *xd;
-	u64 val;
+	char buffer[128];
 
 	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
@@ -1746,14 +1752,8 @@ static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
 	seq_printf(m, "IRQ 0x%08x : target=0x%x prio=%02x lirq=0x%x ",
 		   hw_irq, target, prio, lirq);
 
-	xd = irq_data_get_irq_handler_data(d);
-	val = xive_esb_read(xd, XIVE_ESB_GET);
-	seq_printf(m, "flags=%c%c%c PQ=%c%c",
-		   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
-		   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
-		   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
-		   val & XIVE_ESB_VAL_P ? 'P' : '-',
-		   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+	xive_irq_data_dump(irq_data_get_irq_handler_data(d), buffer, sizeof(buffer));
+	seq_puts(m, buffer);
 	seq_puts(m, "\n");
 }
 
-- 
2.31.1

