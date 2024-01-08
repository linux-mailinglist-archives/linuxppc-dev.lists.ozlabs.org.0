Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE018267CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 06:48:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7jlj5Hv6z3cZP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 16:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 360 seconds by postgrey-1.37 at boromir; Mon, 08 Jan 2024 16:47:50 AEDT
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7jlB44ffz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jan 2024 16:47:50 +1100 (AEDT)
X-QQ-mid: bizesmtp63t1704692456t04n30m0
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jan 2024 13:40:51 +0800 (CST)
X-QQ-SSF: 01400000000000501000000A0000000
X-QQ-FEAT: 1eRl5/SlfYN5JUjhDRm4yZophBcUYpPw5o1VcRkDjUlnr52f/6oai9mHQy4MD
	oacUy8aVDbtg3l3CfqS4iyOW6Nmz9kllTY/IVvi29KOP6tNQlK9Q96U9wux6tLzCR1sMxJx
	+h9rxCInHNgdocJg35T0lC5wfLWzUiE60XCzpLlXxF3ZTzemhXNUflShMKV1Sf8n+uH2YeX
	5dX2f9gIeUVjIZRXtkGM5Rgs4Gmb9+qO+MOyt4Nfq0q8VtlbDCbhkrg/hsQrH+2DggtzSD0
	2KzEeD1+HZ6AgXUXV7DLtzXpCNexsgZQ3WLtg3WZqqDwV0CBjqax9E90BYiqat+bVQd5N61
	/IszZlfvgMqRWC2Br0+fcaOebC4veck2mcR2O/iIcEEnTMrhjKqU0u3PZYBQJxB1GWywiO4
	vEwd4wpmwN0=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5612767180909649861
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v2 1/1] powerpc/powernv: fix non-SMP kernel compile issues
Date: Mon,  8 Jan 2024 13:40:16 +0800
Message-ID: <15983AF00027978D+20240108054016.1849-2-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Non-SMP kernel is quite useful to silicon validation, despite
it is rare to be found in server productions. the fixes are
obvious. Not like IBM pSeries, it may be not necessary
to have powernv SMP forced. It is difficult to compile a
non-SMP kernel for pSerises as I've tried.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
v1->v2: solve powernv nx-common-powernv.c non-SMP kernel compile issue found by lkp bot.
v0->v1: solve powernv vas driver non-SMP kernel compile issue found by lkp bot.
---
 arch/powerpc/platforms/powernv/Kconfig    | 1 -
 arch/powerpc/platforms/powernv/opal-imc.c | 1 +
 arch/powerpc/platforms/powernv/vas.c      | 1 +
 arch/powerpc/platforms/powernv/vas.h      | 1 +
 arch/powerpc/sysdev/xive/common.c         | 2 ++
 arch/powerpc/sysdev/xive/spapr.c          | 5 ++++-
 drivers/crypto/nx/nx-common-powernv.c     | 1 +
 7 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 70a46acc70d6..40b1a49379de 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -15,7 +15,6 @@ config PPC_POWERNV
 	select CPU_FREQ
 	select PPC_DOORBELL
 	select MMU_NOTIFIER
-	select FORCE_SMP
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	default y
 
diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 828fc4d88471..6e9e2b0a5bdc 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/crash_dump.h>
 #include <linux/debugfs.h>
+#include <asm/smp.h>
 #include <asm/opal.h>
 #include <asm/io.h>
 #include <asm/imc-pmu.h>
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index b65256a63e87..c1759135aca5 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <asm/prom.h>
 #include <asm/xive.h>
+#include <asm/smp.h>
 
 #include "vas.h"
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 08d9d3d5a22b..313a8f2c8c7d 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -12,6 +12,7 @@
 #include <linux/dcache.h>
 #include <linux/mutex.h>
 #include <linux/stringify.h>
+#include <linux/interrupt.h>
 
 /*
  * Overview of Virtual Accelerator Switchboard (VAS).
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index a289cb97c1d7..d49b12809c10 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1497,7 +1497,9 @@ static int xive_prepare_cpu(unsigned int cpu)
 				  GFP_KERNEL, cpu_to_node(cpu));
 		if (!xc)
 			return -ENOMEM;
+#ifdef CONFIG_SMP
 		xc->hw_ipi = XIVE_BAD_IRQ;
+#endif
 		xc->chip_id = XIVE_INVALID_CHIP_ID;
 		if (xive_ops->prepare_cpu)
 			xive_ops->prepare_cpu(cpu, xc);
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index e45419264391..7298f57f8416 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -81,6 +81,7 @@ static void xive_irq_bitmap_remove_all(void)
 	}
 }
 
+#ifdef CONFIG_SMP
 static int __xive_irq_bitmap_alloc(struct xive_irq_bitmap *xibm)
 {
 	int irq;
@@ -126,7 +127,7 @@ static void xive_irq_bitmap_free(int irq)
 		}
 	}
 }
-
+#endif 
 
 /* Based on the similar routines in RTAS */
 static unsigned int plpar_busy_delay_time(long rc)
@@ -663,6 +664,7 @@ static void xive_spapr_sync_source(u32 hw_irq)
 	plpar_int_sync(0, hw_irq);
 }
 
+#ifdef CONFIG_SMP
 static int xive_spapr_debug_show(struct seq_file *m, void *private)
 {
 	struct xive_irq_bitmap *xibm;
@@ -680,6 +682,7 @@ static int xive_spapr_debug_show(struct seq_file *m, void *private)
 
 	return 0;
 }
+#endif
 
 static const struct xive_ops xive_spapr_ops = {
 	.populate_irq_data	= xive_spapr_populate_irq_data,
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 8c859872c183..58c42677b448 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -17,6 +17,7 @@
 #include <asm/reg.h>
 #include <asm/opal-api.h>
 #include <asm/opal.h>
+#include <asm/smp.h>
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Dan Streetman <ddstreet@ieee.org>");
-- 
2.42.0.windows.2

