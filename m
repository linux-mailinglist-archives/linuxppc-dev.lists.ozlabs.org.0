Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0E4F2F6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 14:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXmlW2N42z3cK2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 22:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXmjz1DMWz3bY6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 22:12:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KXmjc28Dpz9sTC;
 Tue,  5 Apr 2022 14:12:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CofwgQZyGDzt; Tue,  5 Apr 2022 14:12:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KXmjY2c54z9sTF;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EE818B77B;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8RvY3MFVix8u; Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08D618B765;
 Tue,  5 Apr 2022 14:12:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 235CCBBJ352492
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 5 Apr 2022 14:12:11 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 235CCBJv352490;
 Tue, 5 Apr 2022 14:12:11 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/5] powerpc/8xx: Convert CPM1 interrupt controller to
 platform_device
Date: Tue,  5 Apr 2022 14:12:02 +0200
Message-Id: <fb80d0b2077312079c49da0296e25591578771cd.1649160685.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649160685.git.christophe.leroy@csgroup.eu>
References: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649160685.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649160722; l=5823; s=20211009;
 h=from:subject:message-id; bh=xqxqeBrgaxS9ROwACOUCccr8atstrvPPHD45jHzNfOg=;
 b=JhhoAoDVyaSmAdBveZOJOXUf7vkG43H9jpOTAMVo62aMMe+flb1BL9Ym1bNd+cRccIvcjKW3ma7V
 wYF+gRPkDE/Az5Tf1wBMrup6gy3rvC97q65u4Wd4C7v7AOlcmXeH
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

In the same logic as commit be7ecbd240b2 ("soc: fsl: qe: convert QE
interrupt controller to platform_device"), convert CPM1 interrupt
controller to platform_device.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/8xx/cpm1-ic.c    | 90 ++++++++++++++-----------
 arch/powerpc/platforms/8xx/m8xx_setup.c | 14 ----
 arch/powerpc/platforms/8xx/pic.c        |  2 -
 3 files changed, 50 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
index d22b4fc2d4cf..6f9765597a6d 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -7,7 +7,6 @@
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <asm/cpm1.h>
 
@@ -43,7 +42,7 @@ static struct irq_chip cpm_pic = {
 	.irq_eoi = cpm_end_irq,
 };
 
-int cpm_get_irq(void)
+static int cpm_get_irq(void)
 {
 	int cpm_vec;
 
@@ -58,11 +57,14 @@ int cpm_get_irq(void)
 	return irq_linear_revmap(cpm_pic_host, cpm_vec);
 }
 
+static void cpm_cascade(struct irq_desc *desc)
+{
+	generic_handle_irq(cpm_get_irq());
+}
+
 static int cpm_pic_host_map(struct irq_domain *h, unsigned int virq,
 			    irq_hw_number_t hw)
 {
-	pr_debug("cpm_pic_host_map(%d, 0x%lx)\n", virq, hw);
-
 	irq_set_status_flags(virq, IRQ_LEVEL);
 	irq_set_chip_and_handler(virq, &cpm_pic, handle_fasteoi_irq);
 	return 0;
@@ -72,56 +74,64 @@ static const struct irq_domain_ops cpm_pic_host_ops = {
 	.map = cpm_pic_host_map,
 };
 
-unsigned int __init cpm_pic_init(void)
+static int cpm_pic_probe(struct platform_device *pdev)
 {
-	struct device_node *np = NULL;
-	struct resource res;
-	unsigned int sirq = 0, hwirq;
-	int ret;
-
-	pr_debug("cpm_pic_init\n");
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1-pic");
-	if (np == NULL)
-		np = of_find_compatible_node(NULL, "cpm-pic", "CPM");
-	if (np == NULL) {
-		printk(KERN_ERR "CPM PIC init: can not find cpm-pic node\n");
-		return sirq;
-	}
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int irq;
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		goto end;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
 
-	cpic_reg = ioremap(res.start, resource_size(&res));
-	if (cpic_reg == NULL)
-		goto end;
+	cpic_reg = devm_ioremap(dev, res->start, resource_size(res));
+	if (!cpic_reg)
+		return -ENODEV;
 
-	sirq = irq_of_parse_and_map(np, 0);
-	if (!sirq)
-		goto end;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	/* Initialize the CPM interrupt controller. */
-	hwirq = (unsigned int)virq_to_hw(sirq);
 	out_be32(&cpic_reg->cpic_cicr,
-	    (CICR_SCD_SCC4 | CICR_SCC_SCC3 | CICR_SCB_SCC2 | CICR_SCA_SCC1) |
-		((hwirq/2) << 13) | CICR_HP_MASK);
+		 (CICR_SCD_SCC4 | CICR_SCC_SCC3 | CICR_SCB_SCC2 | CICR_SCA_SCC1) |
+		 ((virq_to_hw(irq) / 2) << 13) | CICR_HP_MASK);
 
 	out_be32(&cpic_reg->cpic_cimr, 0);
 
-	cpm_pic_host = irq_domain_add_linear(np, 64, &cpm_pic_host_ops, NULL);
-	if (cpm_pic_host == NULL) {
-		printk(KERN_ERR "CPM2 PIC: failed to allocate irq host!\n");
-		sirq = 0;
-		goto end;
-	}
+	cpm_pic_host = irq_domain_add_linear(dev->of_node, 64, &cpm_pic_host_ops, NULL);
+	if (!cpm_pic_host)
+		return -ENODEV;
+
+	irq_set_chained_handler(irq, cpm_cascade);
 
 	setbits32(&cpic_reg->cpic_cicr, CICR_IEN);
 
-end:
-	of_node_put(np);
-	return sirq;
+	return 0;
+}
+
+static const struct of_device_id cpm_pic_match[] = {
+	{
+		.compatible = "fsl,cpm1-pic",
+	}, {
+		.type = "cpm-pic",
+		.compatible = "CPM",
+	}, {},
+};
+
+static struct platform_driver cpm_pic_driver = {
+	.driver	= {
+		.name		= "cpm-pic",
+		.of_match_table	= cpm_pic_match,
+	},
+	.probe	= cpm_pic_probe,
+};
+
+static int __init cpm_pic_init(void)
+{
+	return platform_driver_register(&cpm_pic_driver);
 }
+arch_initcall(cpm_pic_init);
 
 /*
  * The CPM can generate the error interrupt when there is a race condition
diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index df4d57d07f9a..a03ba0ad7312 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -28,9 +28,6 @@
 
 #include "mpc8xx.h"
 
-extern int cpm_pic_init(void);
-extern int cpm_get_irq(void);
-
 /* A place holder for time base interrupts, if they are ever enabled. */
 static irqreturn_t timebase_interrupt(int irq, void *dev)
 {
@@ -208,11 +205,6 @@ void __noreturn mpc8xx_restart(char *cmd)
 	panic("Restart failed\n");
 }
 
-static void cpm_cascade(struct irq_desc *desc)
-{
-	generic_handle_irq(cpm_get_irq());
-}
-
 /* Initialize the internal interrupt controllers.  The number of
  * interrupts supported can vary with the processor type, and the
  * 82xx family can have up to 64.
@@ -221,14 +213,8 @@ static void cpm_cascade(struct irq_desc *desc)
  */
 void __init mpc8xx_pics_init(void)
 {
-	int irq;
-
 	if (mpc8xx_pic_init()) {
 		printk(KERN_ERR "Failed interrupt 8xx controller  initialization\n");
 		return;
 	}
-
-	irq = cpm_pic_init();
-	if (irq)
-		irq_set_chained_handler(irq, cpm_cascade);
 }
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index 04a6abf14c29..eaa16338cc4b 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -14,8 +14,6 @@
 
 #define PIC_VEC_SPURRIOUS      15
 
-extern int cpm_get_irq(struct pt_regs *regs);
-
 static struct irq_domain *mpc8xx_pic_host;
 static unsigned long mpc8xx_cached_irq_mask;
 static sysconf8xx_t __iomem *siu_reg;
-- 
2.35.1

