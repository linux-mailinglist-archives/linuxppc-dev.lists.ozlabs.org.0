Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5F1D902E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:38:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R5mg6l94zDr8g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:38:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4h74CxpzDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4h30FZbz9txly;
 Tue, 19 May 2020 07:49:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9eqGBEx-SQgL; Tue, 19 May 2020 07:49:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4h256Hmz9txlx;
 Tue, 19 May 2020 07:49:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D42A48B7A7;
 Tue, 19 May 2020 07:49:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s_Y48NOeGnV4; Tue, 19 May 2020 07:49:07 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 94F938B767;
 Tue, 19 May 2020 07:49:07 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7380F65A4A; Tue, 19 May 2020 05:49:07 +0000 (UTC)
Message-Id: <bcc968cda075516eb76e2f25e09821f582c566b4.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 24/45] powerpc/8xx: Drop CONFIG_8xx_COPYBACK option
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:07 +0000 (UTC)
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

CONFIG_8xx_COPYBACK was there to help disabling copyback cache mode
for debuging hardware. But nobody will design new boards with 8xx now.

All 8xx platforms select it, so make it the default and remove
the option.

Also remove the Mx_RESETVAL values which are pretty useless and hide
the real value while reading code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/configs/adder875_defconfig      |  1 -
 arch/powerpc/configs/ep88xc_defconfig        |  1 -
 arch/powerpc/configs/mpc866_ads_defconfig    |  1 -
 arch/powerpc/configs/mpc885_ads_defconfig    |  1 -
 arch/powerpc/configs/tqm8xx_defconfig        |  1 -
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |  2 --
 arch/powerpc/kernel/head_8xx.S               | 15 +--------------
 arch/powerpc/platforms/8xx/Kconfig           |  9 ---------
 8 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/arch/powerpc/configs/adder875_defconfig b/arch/powerpc/configs/adder875_defconfig
index f55e23cb176c..5326bc739279 100644
--- a/arch/powerpc/configs/adder875_defconfig
+++ b/arch/powerpc/configs/adder875_defconfig
@@ -10,7 +10,6 @@ CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_PPC_ADDER875=y
-CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_1000=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/powerpc/configs/ep88xc_defconfig b/arch/powerpc/configs/ep88xc_defconfig
index 0e2e5e81a359..f5c3e72da719 100644
--- a/arch/powerpc/configs/ep88xc_defconfig
+++ b/arch/powerpc/configs/ep88xc_defconfig
@@ -12,7 +12,6 @@ CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_PPC_EP88XC=y
-CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/powerpc/configs/mpc866_ads_defconfig b/arch/powerpc/configs/mpc866_ads_defconfig
index 5320735395e7..5c56d36cdfc5 100644
--- a/arch/powerpc/configs/mpc866_ads_defconfig
+++ b/arch/powerpc/configs/mpc866_ads_defconfig
@@ -12,7 +12,6 @@ CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MPC86XADS=y
-CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_1000=y
 CONFIG_MATH_EMULATION=y
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 82a008c04eae..949ff9ccda5e 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -11,7 +11,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_8xx_COPYBACK=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/powerpc/configs/tqm8xx_defconfig b/arch/powerpc/configs/tqm8xx_defconfig
index eda8bfb2d0a3..77857d513022 100644
--- a/arch/powerpc/configs/tqm8xx_defconfig
+++ b/arch/powerpc/configs/tqm8xx_defconfig
@@ -15,7 +15,6 @@ CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_TQM8XX=y
-CONFIG_8xx_COPYBACK=y
 # CONFIG_8xx_CPU15 is not set
 CONFIG_GEN_RTC=y
 CONFIG_HZ_100=y
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 76af5b0cb16e..26b7cee34dfe 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -19,7 +19,6 @@
 #define MI_RSV4I	0x08000000	/* Reserve 4 TLB entries */
 #define MI_PPCS		0x02000000	/* Use MI_RPN prob/priv state */
 #define MI_IDXMASK	0x00001f00	/* TLB index to be loaded */
-#define MI_RESETVAL	0x00000000	/* Value of register at reset */
 
 /* These are the Ks and Kp from the PowerPC books.  For proper operation,
  * Ks = 0, Kp = 1.
@@ -95,7 +94,6 @@
 #define MD_TWAM		0x04000000	/* Use 4K page hardware assist */
 #define MD_PPCS		0x02000000	/* Use MI_RPN prob/priv state */
 #define MD_IDXMASK	0x00001f00	/* TLB index to be loaded */
-#define MD_RESETVAL	0x04000000	/* Value of register at reset */
 
 #define SPRN_M_CASID	793	/* Address space ID (context) to match */
 #define MC_ASIDMASK	0x0000000f	/* Bits used for ASID value */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 073a651787df..905205c79a25 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -779,10 +779,7 @@ start_here:
 initial_mmu:
 	li	r8, 0
 	mtspr	SPRN_MI_CTR, r8		/* remove PINNED ITLB entries */
-	lis	r10, MD_RESETVAL@h
-#ifndef CONFIG_8xx_COPYBACK
-	oris	r10, r10, MD_WTDEF@h
-#endif
+	lis	r10, MD_TWAM@h
 	mtspr	SPRN_MD_CTR, r10	/* remove PINNED DTLB entries */
 
 	tlbia			/* Invalidate all TLB entries */
@@ -857,17 +854,7 @@ initial_mmu:
 	mtspr	SPRN_DC_CST, r8
 	lis	r8, IDC_ENABLE@h
 	mtspr	SPRN_IC_CST, r8
-#ifdef CONFIG_8xx_COPYBACK
-	mtspr	SPRN_DC_CST, r8
-#else
-	/* For a debug option, I left this here to easily enable
-	 * the write through cache mode
-	 */
-	lis	r8, DC_SFWT@h
 	mtspr	SPRN_DC_CST, r8
-	lis	r8, IDC_ENABLE@h
-	mtspr	SPRN_DC_CST, r8
-#endif
 	/* Disable debug mode entry on breakpoints */
 	mfspr	r8, SPRN_DER
 #ifdef CONFIG_PERF_EVENTS
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index e0fe670f06f6..b37de62d7e7f 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -98,15 +98,6 @@ menu "MPC8xx CPM Options"
 # 8xx specific questions.
 comment "Generic MPC8xx Options"
 
-config 8xx_COPYBACK
-	bool "Copy-Back Data Cache (else Writethrough)"
-	help
-	  Saying Y here will cause the cache on an MPC8xx processor to be used
-	  in Copy-Back mode.  If you say N here, it is used in Writethrough
-	  mode.
-
-	  If in doubt, say Y here.
-
 config 8xx_GPIO
 	bool "GPIO API Support"
 	select GPIOLIB
-- 
2.25.0

