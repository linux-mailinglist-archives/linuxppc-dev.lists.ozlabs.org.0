Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E814F2F69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 14:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXmkc0NRGz3byP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 22:13:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXmjq2fx8z2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 22:12:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KXmjZ2LPmz9sT7;
 Tue,  5 Apr 2022 14:12:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdQ4MYRGJgtj; Tue,  5 Apr 2022 14:12:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KXmjY2WCtz9sT9;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CE778B77A;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2Ig34h1Zy_oY; Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EE148B776;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 235CCB1L352487
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 5 Apr 2022 14:12:11 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 235CCBZ4352486;
 Tue, 5 Apr 2022 14:12:11 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/5] powerpc/8xx: Convert CPM1 error interrupt handler to
 platform driver
Date: Tue,  5 Apr 2022 14:12:01 +0200
Message-Id: <375a72df6e4a26c5959cc81a6c6d46152efa2306.1649160685.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649160685.git.christophe.leroy@csgroup.eu>
References: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649160685.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649160722; l=3256; s=20211009;
 h=from:subject:message-id; bh=iBfAM7j9zDFlEgqnwHTDh48Q3s/XSmi+wspQbzDZSEI=;
 b=Ofgaf1JdhrxOoLgHu6t1R08TjiE1ORUqWBGiAlfCCPyHbo4rxwMOfnJ2nvxTPyqlPtTEgtCiZuoa
 /i5ao+HlB6MKbQhuXzAV+XomDUHjAL9YoiRPmf69bSNbsew94Kq8
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add CPM error interrupt as a standalone platform driver,
to simplify the init of CPM interrupt handler.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/8xx/cpm1-ic.c | 73 +++++++++++++++++-----------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
index d5cf0ee7c07d..d22b4fc2d4cf 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <asm/cpm1.h>
 
 static cpic8xx_t __iomem *cpic_reg;
@@ -67,17 +68,6 @@ static int cpm_pic_host_map(struct irq_domain *h, unsigned int virq,
 	return 0;
 }
 
-/*
- * The CPM can generate the error interrupt when there is a race condition
- * between generating and masking interrupts.  All we have to do is ACK it
- * and return.  This is a no-op function so we don't need any special
- * tests in the interrupt handler.
- */
-static irqreturn_t cpm_error_interrupt(int irq, void *dev)
-{
-	return IRQ_HANDLED;
-}
-
 static const struct irq_domain_ops cpm_pic_host_ops = {
 	.map = cpm_pic_host_map,
 };
@@ -86,7 +76,7 @@ unsigned int __init cpm_pic_init(void)
 {
 	struct device_node *np = NULL;
 	struct resource res;
-	unsigned int sirq = 0, hwirq, eirq;
+	unsigned int sirq = 0, hwirq;
 	int ret;
 
 	pr_debug("cpm_pic_init\n");
@@ -126,26 +116,51 @@ unsigned int __init cpm_pic_init(void)
 		goto end;
 	}
 
-	/* Install our own error handler. */
-	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1");
-	if (np == NULL)
-		np = of_find_node_by_type(NULL, "cpm");
-	if (np == NULL) {
-		printk(KERN_ERR "CPM PIC init: can not find cpm node\n");
-		goto end;
-	}
-
-	eirq = irq_of_parse_and_map(np, 0);
-	if (!eirq)
-		goto end;
-
-	if (request_irq(eirq, cpm_error_interrupt, IRQF_NO_THREAD, "error",
-			NULL))
-		printk(KERN_ERR "Could not allocate CPM error IRQ!");
-
 	setbits32(&cpic_reg->cpic_cicr, CICR_IEN);
 
 end:
 	of_node_put(np);
 	return sirq;
 }
+
+/*
+ * The CPM can generate the error interrupt when there is a race condition
+ * between generating and masking interrupts.  All we have to do is ACK it
+ * and return.  This is a no-op function so we don't need any special
+ * tests in the interrupt handler.
+ */
+static irqreturn_t cpm_error_interrupt(int irq, void *dev)
+{
+	return IRQ_HANDLED;
+}
+
+static int cpm_error_probe(struct platform_device *pdev)
+{
+	int irq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	return request_irq(irq, cpm_error_interrupt, IRQF_NO_THREAD, "error", NULL);
+}
+
+static const struct of_device_id cpm_error_ids[] = {
+	{ .compatible = "fsl,cpm1" },
+	{ .type = "cpm" },
+	{},
+};
+
+static struct platform_driver cpm_error_driver = {
+	.driver	= {
+		.name		= "cpm-error",
+		.of_match_table	= cpm_error_ids,
+	},
+	.probe	= cpm_error_probe,
+};
+
+static int __init cpm_error_init(void)
+{
+	return platform_driver_register(&cpm_error_driver);
+}
+subsys_initcall(cpm_error_init);
-- 
2.35.1

