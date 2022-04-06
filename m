Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE14F565E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 08:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYDyL4XdCz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:24:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYDx66cDdz3bbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 16:23:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KYDwr6ZQpz9sT0;
 Wed,  6 Apr 2022 08:23:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlQeOrEeDV-5; Wed,  6 Apr 2022 08:23:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KYDwp4jmjz9sT3;
 Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86A948B77B;
 Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id c3vsQbi2rl_X; Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B13B8B778;
 Wed,  6 Apr 2022 08:23:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2366NRea390702
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Apr 2022 08:23:27 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2366NRxj390701;
 Wed, 6 Apr 2022 08:23:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 4/5] powerpc/8xx: Remove mpc8xx_pics_init()
Date: Wed,  6 Apr 2022 08:23:20 +0200
Message-Id: <9c55a698adb5ba3b7b77023170fcaf0acb5d2d81.1649226186.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649226186.git.christophe.leroy@csgroup.eu>
References: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649226186.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649226200; l=7290; s=20211009;
 h=from:subject:message-id; bh=niNa9fyaDmj++Pd4D5bubfNrBOO5hj3/Df7w+GDTVKU=;
 b=0Q2W9GNAHUYHxZIOBoSby3EwS6U4G9kbbIYjvLMJNxMasHhEyIKFwBQ2OgO2TQI/e7Dt4uWQdiji
 jmUajBNaBoLI0Lty1KEHbR+W4cbHP6Q7elA1Rb485m575+k8fkij
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

mpc8xx_pics_init() is now only a trampoline to
mpc8xx_pic_init().

Remove mpc8xx_pics_init() and use mpc8xx_pic_init()
directly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add missing header (pic.h) and change mpc8xx_pic_init() to void.
---
 arch/powerpc/platforms/8xx/adder875.c        |  3 ++-
 arch/powerpc/platforms/8xx/ep88xc.c          |  3 ++-
 arch/powerpc/platforms/8xx/m8xx_setup.c      | 14 --------------
 arch/powerpc/platforms/8xx/mpc86xads_setup.c |  3 ++-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c |  3 ++-
 arch/powerpc/platforms/8xx/mpc8xx.h          |  1 -
 arch/powerpc/platforms/8xx/pic.c             | 15 ++++-----------
 arch/powerpc/platforms/8xx/pic.h             |  2 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c    |  3 ++-
 9 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 651486acb896..18253bfefcb0 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -18,6 +18,7 @@
 #include <asm/prom.h>
 
 #include "mpc8xx.h"
+#include "pic.h"
 
 struct cpm_pin {
 	int port, pin, flags;
@@ -104,7 +105,7 @@ define_machine(adder875) {
 	.name = "Adder MPC875",
 	.probe = adder875_probe,
 	.setup_arch = adder875_setup,
-	.init_IRQ = mpc8xx_pics_init,
+	.init_IRQ = mpc8xx_pic_init,
 	.get_irq = mpc8xx_get_irq,
 	.restart = mpc8xx_restart,
 	.calibrate_decr = generic_calibrate_decr,
diff --git a/arch/powerpc/platforms/8xx/ep88xc.c b/arch/powerpc/platforms/8xx/ep88xc.c
index ebcf34a14789..b3b22520b435 100644
--- a/arch/powerpc/platforms/8xx/ep88xc.c
+++ b/arch/powerpc/platforms/8xx/ep88xc.c
@@ -20,6 +20,7 @@
 #include <asm/cpm1.h>
 
 #include "mpc8xx.h"
+#include "pic.h"
 
 struct cpm_pin {
 	int port, pin, flags;
@@ -166,7 +167,7 @@ define_machine(ep88xc) {
 	.name = "Embedded Planet EP88xC",
 	.probe = ep88xc_probe,
 	.setup_arch = ep88xc_setup_arch,
-	.init_IRQ = mpc8xx_pics_init,
+	.init_IRQ = mpc8xx_pic_init,
 	.get_irq	= mpc8xx_get_irq,
 	.restart = mpc8xx_restart,
 	.calibrate_decr = mpc8xx_calibrate_decr,
diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index a03ba0ad7312..15a09b15aaa4 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -204,17 +204,3 @@ void __noreturn mpc8xx_restart(char *cmd)
 	in_8(&clk_r->res[0]);
 	panic("Restart failed\n");
 }
-
-/* Initialize the internal interrupt controllers.  The number of
- * interrupts supported can vary with the processor type, and the
- * 82xx family can have up to 64.
- * External interrupts can be either edge or level triggered, and
- * need to be initialized by the appropriate driver.
- */
-void __init mpc8xx_pics_init(void)
-{
-	if (mpc8xx_pic_init()) {
-		printk(KERN_ERR "Failed interrupt 8xx controller  initialization\n");
-		return;
-	}
-}
diff --git a/arch/powerpc/platforms/8xx/mpc86xads_setup.c b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
index 8d02f5ff4481..03267e4a44a9 100644
--- a/arch/powerpc/platforms/8xx/mpc86xads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
@@ -29,6 +29,7 @@
 
 #include "mpc86xads.h"
 #include "mpc8xx.h"
+#include "pic.h"
 
 struct cpm_pin {
 	int port, pin, flags;
@@ -140,7 +141,7 @@ define_machine(mpc86x_ads) {
 	.name			= "MPC86x ADS",
 	.probe			= mpc86xads_probe,
 	.setup_arch		= mpc86xads_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
+	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
 	.restart		= mpc8xx_restart,
 	.calibrate_decr		= mpc8xx_calibrate_decr,
diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
index a0c83c1905c6..b1e39f96de00 100644
--- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
@@ -42,6 +42,7 @@
 
 #include "mpc885ads.h"
 #include "mpc8xx.h"
+#include "pic.h"
 
 static u32 __iomem *bcsr, *bcsr5;
 
@@ -216,7 +217,7 @@ define_machine(mpc885_ads) {
 	.name			= "Freescale MPC885 ADS",
 	.probe			= mpc885ads_probe,
 	.setup_arch		= mpc885ads_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
+	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
 	.restart		= mpc8xx_restart,
 	.calibrate_decr		= mpc8xx_calibrate_decr,
diff --git a/arch/powerpc/platforms/8xx/mpc8xx.h b/arch/powerpc/platforms/8xx/mpc8xx.h
index 31cc2ecace42..79fae3324866 100644
--- a/arch/powerpc/platforms/8xx/mpc8xx.h
+++ b/arch/powerpc/platforms/8xx/mpc8xx.h
@@ -15,7 +15,6 @@ extern void __noreturn mpc8xx_restart(char *cmd);
 extern void mpc8xx_calibrate_decr(void);
 extern int mpc8xx_set_rtc_time(struct rtc_time *tm);
 extern void mpc8xx_get_rtc_time(struct rtc_time *tm);
-extern void mpc8xx_pics_init(void);
 extern unsigned int mpc8xx_get_irq(void);
 
 #endif /* __MPC8xx_H */
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index eaa16338cc4b..e7f83edbca89 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -123,7 +123,7 @@ static const struct irq_domain_ops mpc8xx_pic_host_ops = {
 	.xlate = mpc8xx_pic_host_xlate,
 };
 
-int __init mpc8xx_pic_init(void)
+void __init mpc8xx_pic_init(void)
 {
 	struct resource res;
 	struct device_node *np;
@@ -134,7 +134,7 @@ int __init mpc8xx_pic_init(void)
 		np = of_find_node_by_type(NULL, "mpc8xx-pic");
 	if (np == NULL) {
 		printk(KERN_ERR "Could not find fsl,pq1-pic node\n");
-		return -ENOMEM;
+		return;
 	}
 
 	ret = of_address_to_resource(np, 0, &res);
@@ -142,20 +142,13 @@ int __init mpc8xx_pic_init(void)
 		goto out;
 
 	siu_reg = ioremap(res.start, resource_size(&res));
-	if (siu_reg == NULL) {
-		ret = -EINVAL;
+	if (!siu_reg)
 		goto out;
-	}
 
 	mpc8xx_pic_host = irq_domain_add_linear(np, 64, &mpc8xx_pic_host_ops, NULL);
-	if (mpc8xx_pic_host == NULL) {
+	if (!mpc8xx_pic_host)
 		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
-		ret = -ENOMEM;
-		goto out;
-	}
 
-	ret = 0;
 out:
 	of_node_put(np);
-	return ret;
 }
diff --git a/arch/powerpc/platforms/8xx/pic.h b/arch/powerpc/platforms/8xx/pic.h
index 9fe00eebdc8b..c70f1b446f94 100644
--- a/arch/powerpc/platforms/8xx/pic.h
+++ b/arch/powerpc/platforms/8xx/pic.h
@@ -4,7 +4,7 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 
-int mpc8xx_pic_init(void);
+void mpc8xx_pic_init(void);
 unsigned int mpc8xx_get_irq(void);
 
 /*
diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
index 4cea8b1afa44..3725d51248df 100644
--- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
@@ -43,6 +43,7 @@
 #include <asm/udbg.h>
 
 #include "mpc8xx.h"
+#include "pic.h"
 
 struct cpm_pin {
 	int port, pin, flags;
@@ -142,7 +143,7 @@ define_machine(tqm8xx) {
 	.name			= "TQM8xx",
 	.probe			= tqm8xx_probe,
 	.setup_arch		= tqm8xx_setup_arch,
-	.init_IRQ		= mpc8xx_pics_init,
+	.init_IRQ		= mpc8xx_pic_init,
 	.get_irq		= mpc8xx_get_irq,
 	.restart		= mpc8xx_restart,
 	.calibrate_decr		= mpc8xx_calibrate_decr,
-- 
2.35.1

