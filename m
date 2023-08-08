Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CD773817
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 08:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKjRp389yz3ddm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 16:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKjNV4HyWz3bdG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 16:05:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RKjN81wcnz9t2v;
	Tue,  8 Aug 2023 08:05:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLuMp5iRbXOZ; Tue,  8 Aug 2023 08:05:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RKjN640pcz9t39;
	Tue,  8 Aug 2023 08:05:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 866C08B763;
	Tue,  8 Aug 2023 08:05:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nk8cZBQx_IvN; Tue,  8 Aug 2023 08:05:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.230])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 347B58B76C;
	Tue,  8 Aug 2023 08:05:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37865Mbv1246317
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 8 Aug 2023 08:05:23 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37865MXv1246316;
	Tue, 8 Aug 2023 08:05:22 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 5/6] powerpc/8xx: Remove immr_map() and immr_unmap()
Date: Tue,  8 Aug 2023 08:04:42 +0200
Message-ID: <633ed46f6015ff44d5599258647ea517f75d6a1d.1691474658.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
References: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691474677; l=7074; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=g2dlefSjjZ3lLgAFce4vTphawlHxlpF+G8RgO/xmm48=; b=1FwpDKJY+UtQx8b2jfXULzK8aNB2fHij3QMvpdAZkzhoDj0JKWgikIh1Ry9GHTTkHTMxsdmIQ 1bOgDE4bCKKA23Fu9+6h/7yEXIYZ+lkSjhsppxidhFQuO6ITgUd8yHT
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit fb533d0c5a97 ("[POWERPC] 8xx: Infrastructure code cleanup.")
immr_map() is just returning mpc8xxx_immr pointer and immr_unmap()
do nothing.

We already have parts of code that use mpc8xxx_immr directly so get rid
of immr_map() and immr_unmap() by using mpc8xxx_immr directly. And avoid
going through local pointers that hide the pointed structure.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/fs_pd.h        |  8 ---
 arch/powerpc/platforms/8xx/cpm1.c       | 10 ++--
 arch/powerpc/platforms/8xx/m8xx_setup.c | 66 +++++++------------------
 3 files changed, 22 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/fs_pd.h b/arch/powerpc/include/asm/fs_pd.h
index d251a55de8b0..82f0e528e21c 100644
--- a/arch/powerpc/include/asm/fs_pd.h
+++ b/arch/powerpc/include/asm/fs_pd.h
@@ -22,14 +22,6 @@
 #define cpm2_unmap(addr) do {} while(0)
 #endif
 
-#ifdef CONFIG_PPC_8xx
-#include <asm/8xx_immap.h>
-
-#define immr_map(member) (&mpc8xx_immr->member)
-#define immr_map_size(member, size) (&mpc8xx_immr->member)
-#define immr_unmap(addr) do {} while (0)
-#endif
-
 static inline int uart_baudrate(void)
 {
         return get_baudrate();
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 34ab29966c8b..ebb5f6a27dbf 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -41,7 +41,7 @@
 #include <asm/rheap.h>
 #include <asm/cpm.h>
 
-#include <asm/fs_pd.h>
+#include <sysdev/fsl_soc.h>
 
 #ifdef CONFIG_8xx_GPIO
 #include <linux/gpio/legacy-of-mm-gpiochip.h>
@@ -54,8 +54,6 @@ immap_t __iomem *mpc8xx_immr = (void __iomem *)VIRT_IMMR_BASE;
 
 void __init cpm_reset(void)
 {
-	sysconf8xx_t __iomem *siu_conf;
-
 	cpmp = &mpc8xx_immr->im_cpm;
 
 #ifndef CONFIG_PPC_EARLY_DEBUG_CPM
@@ -77,12 +75,10 @@ void __init cpm_reset(void)
 	 * manual recommends it.
 	 * Bit 25, FAM can also be set to use FEC aggressive mode (860T).
 	 */
-	siu_conf = immr_map(im_siu_conf);
 	if ((mfspr(SPRN_IMMR) & 0xffff) == 0x0900) /* MPC885 */
-		out_be32(&siu_conf->sc_sdcr, 0x40);
+		out_be32(&mpc8xx_immr->im_siu_conf.sc_sdcr, 0x40);
 	else
-		out_be32(&siu_conf->sc_sdcr, 1);
-	immr_unmap(siu_conf);
+		out_be32(&mpc8xx_immr->im_siu_conf.sc_sdcr, 1);
 }
 
 static DEFINE_SPINLOCK(cmd_lock);
diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index 24f358f86d16..3c5c4e08b6a9 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -22,7 +22,6 @@
 
 #include <asm/io.h>
 #include <asm/8xx_immap.h>
-#include <asm/fs_pd.h>
 #include <mm/mmu_decl.h>
 
 #include "pic.h"
@@ -41,14 +40,11 @@ static irqreturn_t timebase_interrupt(int irq, void *dev)
 void __init __attribute__ ((weak))
 init_internal_rtc(void)
 {
-	sit8xx_t __iomem *sys_tmr = immr_map(im_sit);
-
 	/* Disable the RTC one second and alarm interrupts. */
-	clrbits16(&sys_tmr->sit_rtcsc, (RTCSC_SIE | RTCSC_ALE));
+	clrbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_SIE | RTCSC_ALE));
 
 	/* Enable the RTC */
-	setbits16(&sys_tmr->sit_rtcsc, (RTCSC_RTF | RTCSC_RTE));
-	immr_unmap(sys_tmr);
+	setbits16(&mpc8xx_immr->im_sit.sit_rtcsc, (RTCSC_RTF | RTCSC_RTE));
 }
 
 static int __init get_freq(char *name, unsigned long *val)
@@ -80,23 +76,14 @@ static int __init get_freq(char *name, unsigned long *val)
 void __init mpc8xx_calibrate_decr(void)
 {
 	struct device_node *cpu;
-	cark8xx_t __iomem *clk_r1;
-	car8xx_t __iomem *clk_r2;
-	sitk8xx_t __iomem *sys_tmr1;
-	sit8xx_t __iomem *sys_tmr2;
 	int irq, virq;
 
-	clk_r1 = immr_map(im_clkrstk);
-
 	/* Unlock the SCCR. */
-	out_be32(&clk_r1->cark_sccrk, ~KAPWR_KEY);
-	out_be32(&clk_r1->cark_sccrk, KAPWR_KEY);
-	immr_unmap(clk_r1);
+	out_be32(&mpc8xx_immr->im_clkrstk.cark_sccrk, ~KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_clkrstk.cark_sccrk, KAPWR_KEY);
 
 	/* Force all 8xx processors to use divide by 16 processor clock. */
-	clk_r2 = immr_map(im_clkrst);
-	setbits32(&clk_r2->car_sccr, 0x02000000);
-	immr_unmap(clk_r2);
+	setbits32(&mpc8xx_immr->im_clkrst.car_sccr, 0x02000000);
 
 	/* Processor frequency is MHz.
 	 */
@@ -123,14 +110,12 @@ void __init mpc8xx_calibrate_decr(void)
 	 * we guarantee the registers are locked, then we unlock them
 	 * for our use.
 	 */
-	sys_tmr1 = immr_map(im_sitk);
-	out_be32(&sys_tmr1->sitk_tbscrk, ~KAPWR_KEY);
-	out_be32(&sys_tmr1->sitk_rtcsck, ~KAPWR_KEY);
-	out_be32(&sys_tmr1->sitk_tbk, ~KAPWR_KEY);
-	out_be32(&sys_tmr1->sitk_tbscrk, KAPWR_KEY);
-	out_be32(&sys_tmr1->sitk_rtcsck, KAPWR_KEY);
-	out_be32(&sys_tmr1->sitk_tbk, KAPWR_KEY);
-	immr_unmap(sys_tmr1);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_tbscrk, ~KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_rtcsck, ~KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_tbk, ~KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_tbscrk, KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_rtcsck, KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_tbk, KAPWR_KEY);
 
 	init_internal_rtc();
 
@@ -144,10 +129,8 @@ void __init mpc8xx_calibrate_decr(void)
 	of_node_put(cpu);
 	irq = virq_to_hw(virq);
 
-	sys_tmr2 = immr_map(im_sit);
-	out_be16(&sys_tmr2->sit_tbscr, ((1 << (7 - (irq/2))) << 8) |
-					(TBSCR_TBF | TBSCR_TBE));
-	immr_unmap(sys_tmr2);
+	out_be16(&mpc8xx_immr->im_sit.sit_tbscr,
+		 ((1 << (7 - (irq / 2))) << 8) | (TBSCR_TBF | TBSCR_TBE));
 
 	if (request_irq(virq, timebase_interrupt, IRQF_NO_THREAD, "tbint",
 			NULL))
@@ -161,47 +144,36 @@ void __init mpc8xx_calibrate_decr(void)
 
 int mpc8xx_set_rtc_time(struct rtc_time *tm)
 {
-	sitk8xx_t __iomem *sys_tmr1;
-	sit8xx_t __iomem *sys_tmr2;
 	time64_t time;
 
-	sys_tmr1 = immr_map(im_sitk);
-	sys_tmr2 = immr_map(im_sit);
 	time = rtc_tm_to_time64(tm);
 
-	out_be32(&sys_tmr1->sitk_rtck, KAPWR_KEY);
-	out_be32(&sys_tmr2->sit_rtc, (u32)time);
-	out_be32(&sys_tmr1->sitk_rtck, ~KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_rtck, KAPWR_KEY);
+	out_be32(&mpc8xx_immr->im_sit.sit_rtc, (u32)time);
+	out_be32(&mpc8xx_immr->im_sitk.sitk_rtck, ~KAPWR_KEY);
 
-	immr_unmap(sys_tmr2);
-	immr_unmap(sys_tmr1);
 	return 0;
 }
 
 void mpc8xx_get_rtc_time(struct rtc_time *tm)
 {
 	unsigned long data;
-	sit8xx_t __iomem *sys_tmr = immr_map(im_sit);
 
 	/* Get time from the RTC. */
-	data = in_be32(&sys_tmr->sit_rtc);
+	data = in_be32(&mpc8xx_immr->im_sit.sit_rtc);
 	rtc_time64_to_tm(data, tm);
-	immr_unmap(sys_tmr);
 	return;
 }
 
 void __noreturn mpc8xx_restart(char *cmd)
 {
-	car8xx_t __iomem *clk_r = immr_map(im_clkrst);
-
-
 	local_irq_disable();
 
-	setbits32(&clk_r->car_plprcr, 0x00000080);
+	setbits32(&mpc8xx_immr->im_clkrst.car_plprcr, 0x00000080);
 	/* Clear the ME bit in MSR to cause checkstop on machine check
 	*/
 	mtmsr(mfmsr() & ~0x1000);
 
-	in_8(&clk_r->res[0]);
+	in_8(&mpc8xx_immr->im_clkrst.res[0]);
 	panic("Restart failed\n");
 }
-- 
2.41.0

