Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345F4ED780
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 12:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTf620pHlz3c1Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 21:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTf5Z5n2Nz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 21:03:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KTf5Q5ZxHz9sS8;
 Thu, 31 Mar 2022 12:03:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6sq6hD1DYVJ; Thu, 31 Mar 2022 12:03:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KTf5N5W80z9sSJ;
 Thu, 31 Mar 2022 12:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AADE28B788;
 Thu, 31 Mar 2022 12:03:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0CZHxdw_GTyH; Thu, 31 Mar 2022 12:03:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.54])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DE388B780;
 Thu, 31 Mar 2022 12:03:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22VA3KIk547662
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 12:03:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22VA3Ho2547659;
 Thu, 31 Mar 2022 12:03:17 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Scott Wood <oss@buserror.net>, devicetree@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/85xx: Remove FSL_85XX_CACHE_SRAM
Date: Thu, 31 Mar 2022 12:03:06 +0200
Message-Id: <9949813a6b758903b7bee910f798ba2ca82ff8ee.1648720908.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648720959; l=17869; s=20211009;
 h=from:subject:message-id; bh=G+uiPkIy/NrncVf4wAYoXqjh2bTITTBBD/fwfLjXq0k=;
 b=uV+YEdrp3pyX8GOuv73t/f8F+BKFzTeJLS6f4m3HHR9BipiF8GcIUP3iu8/9g7g9IM/4XphlX7Jb
 eZqDMUE0AvnK+731P84xFxRwUD7Nbr5v+vpoMvZ4pxBpg9y3hOPa
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

CONFIG_FSL_85XX_CACHE_SRAM is an option that is not
user selectable and which is not selected by any driver
nor any defconfig.

Remove it and all associated code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../bindings/powerpc/fsl/cache_sram.txt       |  20 --
 .../powerpc/include/asm/fsl_85xx_cache_sram.h |  35 ---
 arch/powerpc/platforms/85xx/Kconfig           |   9 -
 arch/powerpc/sysdev/Makefile                  |   1 -
 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h     |  88 -------
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c     | 147 ------------
 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c         | 216 ------------------
 7 files changed, 516 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt
 delete mode 100644 arch/powerpc/include/asm/fsl_85xx_cache_sram.h
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_sram.c
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt b/Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt
deleted file mode 100644
index 781955f5217d..000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Freescale PQ3 and QorIQ based Cache SRAM
-
-Freescale's mpc85xx and some QorIQ platforms provide an
-option of configuring a part of (or full) cache memory
-as SRAM. This cache SRAM representation in the device
-tree should be done as under:-
-
-Required properties:
-
-- compatible : should be "fsl,p2020-cache-sram"
-- fsl,cache-sram-ctlr-handle : points to the L2 controller
-- reg : offset and length of the cache-sram.
-
-Example:
-
-cache-sram@fff00000 {
-	fsl,cache-sram-ctlr-handle = <&L2>;
-	reg = <0 0xfff00000 0 0x10000>;
-	compatible = "fsl,p2020-cache-sram";
-};
diff --git a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
deleted file mode 100644
index 0235a0447baa..000000000000
--- a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2009 Freescale Semiconductor, Inc.
- *
- * Cache SRAM handling for QorIQ platform
- *
- * Author: Vivek Mahajan <vivek.mahajan@freescale.com>
-
- * This file is derived from the original work done
- * by Sylvain Munaut for the Bestcomm SRAM allocator.
- */
-
-#ifndef __ASM_POWERPC_FSL_85XX_CACHE_SRAM_H__
-#define __ASM_POWERPC_FSL_85XX_CACHE_SRAM_H__
-
-#include <asm/rheap.h>
-#include <linux/spinlock.h>
-
-/*
- * Cache-SRAM
- */
-
-struct mpc85xx_cache_sram {
-	phys_addr_t base_phys;
-	void *base_virt;
-	unsigned int size;
-	rh_info_t *rh;
-	spinlock_t lock;
-};
-
-extern void mpc85xx_cache_sram_free(void *ptr);
-extern void *mpc85xx_cache_sram_alloc(unsigned int size,
-				  phys_addr_t *phys, unsigned int align);
-
-#endif /* __AMS_POWERPC_FSL_85XX_CACHE_SRAM_H__ */
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 4142ebf01382..2be17ffe8714 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -16,15 +16,6 @@ if FSL_SOC_BOOKE
 
 if PPC32
 
-config FSL_85XX_CACHE_SRAM
-	bool
-	select PPC_LIB_RHEAP
-	help
-	  When selected, this option enables cache-sram support
-	  for memory allocation on P1/P2 QorIQ platforms.
-	  cache-sram-size and cache-sram-offset kernel boot
-	  parameters should be passed when this option is enabled.
-
 config BSC9131_RDB
 	bool "Freescale BSC9131RDB"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 026b3f01a991..9cb1d029511a 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_FSL_PMC)		+= fsl_pmc.o
 obj-$(CONFIG_FSL_CORENET_RCPM)	+= fsl_rcpm.o
 obj-$(CONFIG_FSL_LBC)		+= fsl_lbc.o
 obj-$(CONFIG_FSL_GTM)		+= fsl_gtm.o
-obj-$(CONFIG_FSL_85XX_CACHE_SRAM)	+= fsl_85xx_l2ctlr.o fsl_85xx_cache_sram.o
 obj-$(CONFIG_FSL_RIO)		+= fsl_rio.o fsl_rmu.o
 obj-$(CONFIG_TSI108_BRIDGE)	+= tsi108_pci.o tsi108_dev.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc_cmos_setup.o
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h b/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
deleted file mode 100644
index ce370749add9..000000000000
--- a/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2009-2010, 2012 Freescale Semiconductor, Inc
- *
- * QorIQ based Cache Controller Memory Mapped Registers
- *
- * Author: Vivek Mahajan <vivek.mahajan@freescale.com>
- */
-
-#ifndef __FSL_85XX_CACHE_CTLR_H__
-#define __FSL_85XX_CACHE_CTLR_H__
-
-#define L2CR_L2FI		0x40000000	/* L2 flash invalidate */
-#define L2CR_L2IO		0x00200000	/* L2 instruction only */
-#define L2CR_SRAM_ZERO		0x00000000	/* L2SRAM zero size */
-#define L2CR_SRAM_FULL		0x00010000	/* L2SRAM full size */
-#define L2CR_SRAM_HALF		0x00020000	/* L2SRAM half size */
-#define L2CR_SRAM_TWO_HALFS	0x00030000	/* L2SRAM two half sizes */
-#define L2CR_SRAM_QUART		0x00040000	/* L2SRAM one quarter size */
-#define L2CR_SRAM_TWO_QUARTS	0x00050000	/* L2SRAM two quarter size */
-#define L2CR_SRAM_EIGHTH	0x00060000	/* L2SRAM one eighth size */
-#define L2CR_SRAM_TWO_EIGHTH	0x00070000	/* L2SRAM two eighth size */
-
-#define L2SRAM_OPTIMAL_SZ_SHIFT	0x00000003	/* Optimum size for L2SRAM */
-
-#define L2SRAM_BAR_MSK_LO18	0xFFFFC000	/* Lower 18 bits */
-#define L2SRAM_BARE_MSK_HI4	0x0000000F	/* Upper 4 bits */
-
-enum cache_sram_lock_ways {
-	LOCK_WAYS_ZERO,
-	LOCK_WAYS_EIGHTH,
-	LOCK_WAYS_TWO_EIGHTH,
-	LOCK_WAYS_HALF = 4,
-	LOCK_WAYS_FULL = 8,
-};
-
-struct mpc85xx_l2ctlr {
-	u32	ctl;		/* 0x000 - L2 control */
-	u8	res1[0xC];
-	u32	ewar0;		/* 0x010 - External write address 0 */
-	u32	ewarea0;	/* 0x014 - External write address extended 0 */
-	u32	ewcr0;		/* 0x018 - External write ctrl */
-	u8	res2[4];
-	u32	ewar1;		/* 0x020 - External write address 1 */
-	u32	ewarea1;	/* 0x024 - External write address extended 1 */
-	u32	ewcr1;		/* 0x028 - External write ctrl 1 */
-	u8	res3[4];
-	u32	ewar2;		/* 0x030 - External write address 2 */
-	u32	ewarea2;	/* 0x034 - External write address extended 2 */
-	u32	ewcr2;		/* 0x038 - External write ctrl 2 */
-	u8	res4[4];
-	u32	ewar3;		/* 0x040 - External write address 3 */
-	u32	ewarea3;	/* 0x044 - External write address extended 3 */
-	u32	ewcr3;		/* 0x048 - External write ctrl 3 */
-	u8	res5[0xB4];
-	u32	srbar0;		/* 0x100 - SRAM base address 0 */
-	u32	srbarea0;	/* 0x104 - SRAM base addr reg ext address 0 */
-	u32	srbar1;		/* 0x108 - SRAM base address 1 */
-	u32	srbarea1;	/* 0x10C - SRAM base addr reg ext address 1 */
-	u8	res6[0xCF0];
-	u32	errinjhi;	/* 0xE00 - Error injection mask high */
-	u32	errinjlo;	/* 0xE04 - Error injection mask low */
-	u32	errinjctl;	/* 0xE08 - Error injection tag/ecc control */
-	u8	res7[0x14];
-	u32	captdatahi;	/* 0xE20 - Error data high capture */
-	u32	captdatalo;	/* 0xE24 - Error data low capture */
-	u32	captecc;	/* 0xE28 - Error syndrome */
-	u8	res8[0x14];
-	u32	errdet;		/* 0xE40 - Error detect */
-	u32	errdis;		/* 0xE44 - Error disable */
-	u32	errinten;	/* 0xE48 - Error interrupt enable */
-	u32	errattr;	/* 0xE4c - Error attribute capture */
-	u32	erradrrl;	/* 0xE50 - Error address capture low */
-	u32	erradrrh;	/* 0xE54 - Error address capture high */
-	u32	errctl;		/* 0xE58 - Error control */
-	u8	res9[0x1A4];
-};
-
-struct sram_parameters {
-	unsigned int sram_size;
-	phys_addr_t sram_offset;
-};
-
-extern int instantiate_cache_sram(struct platform_device *dev,
-		struct sram_parameters sram_params);
-extern void remove_cache_sram(struct platform_device *dev);
-
-#endif /* __FSL_85XX_CACHE_CTLR_H__ */
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
deleted file mode 100644
index a3aeaa5f0f1b..000000000000
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ /dev/null
@@ -1,147 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2009-2010 Freescale Semiconductor, Inc.
- *
- * Simple memory allocator abstraction for QorIQ (P1/P2) based Cache-SRAM
- *
- * Author: Vivek Mahajan <vivek.mahajan@freescale.com>
- *
- * This file is derived from the original work done
- * by Sylvain Munaut for the Bestcomm SRAM allocator.
- */
-
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/slab.h>
-#include <linux/err.h>
-#include <linux/of_platform.h>
-#include <linux/pgtable.h>
-#include <asm/fsl_85xx_cache_sram.h>
-
-#include "fsl_85xx_cache_ctlr.h"
-
-struct mpc85xx_cache_sram *cache_sram;
-
-void *mpc85xx_cache_sram_alloc(unsigned int size,
-				phys_addr_t *phys, unsigned int align)
-{
-	unsigned long offset;
-	unsigned long flags;
-
-	if (unlikely(cache_sram == NULL))
-		return NULL;
-
-	if (!size || (size > cache_sram->size) || (align > cache_sram->size)) {
-		pr_err("%s(): size(=%x) or align(=%x) zero or too big\n",
-			__func__, size, align);
-		return NULL;
-	}
-
-	if ((align & (align - 1)) || align <= 1) {
-		pr_err("%s(): align(=%x) must be power of two and >1\n",
-			__func__, align);
-		return NULL;
-	}
-
-	spin_lock_irqsave(&cache_sram->lock, flags);
-	offset = rh_alloc_align(cache_sram->rh, size, align, NULL);
-	spin_unlock_irqrestore(&cache_sram->lock, flags);
-
-	if (IS_ERR_VALUE(offset))
-		return NULL;
-
-	*phys = cache_sram->base_phys + offset;
-
-	return (unsigned char *)cache_sram->base_virt + offset;
-}
-EXPORT_SYMBOL(mpc85xx_cache_sram_alloc);
-
-void mpc85xx_cache_sram_free(void *ptr)
-{
-	unsigned long flags;
-	BUG_ON(!ptr);
-
-	spin_lock_irqsave(&cache_sram->lock, flags);
-	rh_free(cache_sram->rh, ptr - cache_sram->base_virt);
-	spin_unlock_irqrestore(&cache_sram->lock, flags);
-}
-EXPORT_SYMBOL(mpc85xx_cache_sram_free);
-
-int __init instantiate_cache_sram(struct platform_device *dev,
-		struct sram_parameters sram_params)
-{
-	int ret = 0;
-
-	if (cache_sram) {
-		dev_err(&dev->dev, "Already initialized cache-sram\n");
-		return -EBUSY;
-	}
-
-	cache_sram = kzalloc(sizeof(struct mpc85xx_cache_sram), GFP_KERNEL);
-	if (!cache_sram) {
-		dev_err(&dev->dev, "Out of memory for cache_sram structure\n");
-		return -ENOMEM;
-	}
-
-	cache_sram->base_phys = sram_params.sram_offset;
-	cache_sram->size = sram_params.sram_size;
-
-	if (!request_mem_region(cache_sram->base_phys, cache_sram->size,
-						"fsl_85xx_cache_sram")) {
-		dev_err(&dev->dev, "%pOF: request memory failed\n",
-				dev->dev.of_node);
-		ret = -ENXIO;
-		goto out_free;
-	}
-
-	cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
-						 cache_sram->size);
-	if (!cache_sram->base_virt) {
-		dev_err(&dev->dev, "%pOF: ioremap_coherent failed\n",
-			dev->dev.of_node);
-		ret = -ENOMEM;
-		goto out_release;
-	}
-
-	cache_sram->rh = rh_create(sizeof(unsigned int));
-	if (IS_ERR(cache_sram->rh)) {
-		dev_err(&dev->dev, "%pOF: Unable to create remote heap\n",
-				dev->dev.of_node);
-		ret = PTR_ERR(cache_sram->rh);
-		goto out_unmap;
-	}
-
-	rh_attach_region(cache_sram->rh, 0, cache_sram->size);
-	spin_lock_init(&cache_sram->lock);
-
-	dev_info(&dev->dev, "[base:0x%llx, size:0x%x] configured and loaded\n",
-		(unsigned long long)cache_sram->base_phys, cache_sram->size);
-
-	return 0;
-
-out_unmap:
-	iounmap(cache_sram->base_virt);
-
-out_release:
-	release_mem_region(cache_sram->base_phys, cache_sram->size);
-
-out_free:
-	kfree(cache_sram);
-	return ret;
-}
-
-void remove_cache_sram(struct platform_device *dev)
-{
-	BUG_ON(!cache_sram);
-
-	rh_detach_region(cache_sram->rh, 0, cache_sram->size);
-	rh_destroy(cache_sram->rh);
-
-	iounmap(cache_sram->base_virt);
-	release_mem_region(cache_sram->base_phys, cache_sram->size);
-
-	kfree(cache_sram);
-	cache_sram = NULL;
-
-	dev_info(&dev->dev, "MPC85xx Cache-SRAM driver unloaded\n");
-}
diff --git a/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c b/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
deleted file mode 100644
index 2d0af0c517bb..000000000000
--- a/arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
+++ /dev/null
@@ -1,216 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2009-2010, 2012 Freescale Semiconductor, Inc.
- *
- * QorIQ (P1/P2) L2 controller init for Cache-SRAM instantiation
- *
- * Author: Vivek Mahajan <vivek.mahajan@freescale.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of_platform.h>
-#include <asm/io.h>
-
-#include "fsl_85xx_cache_ctlr.h"
-
-static char *sram_size;
-static char *sram_offset;
-struct mpc85xx_l2ctlr __iomem *l2ctlr;
-
-static int get_cache_sram_params(struct sram_parameters *sram_params)
-{
-	unsigned long long addr;
-	unsigned int size;
-
-	if (!sram_size || (kstrtouint(sram_size, 0, &size) < 0))
-		return -EINVAL;
-
-	if (!sram_offset || (kstrtoull(sram_offset, 0, &addr) < 0))
-		return -EINVAL;
-
-	sram_params->sram_offset = addr;
-	sram_params->sram_size = size;
-
-	return 0;
-}
-
-static int __init get_size_from_cmdline(char *str)
-{
-	if (!str)
-		return 0;
-
-	sram_size = str;
-	return 1;
-}
-
-static int __init get_offset_from_cmdline(char *str)
-{
-	if (!str)
-		return 0;
-
-	sram_offset = str;
-	return 1;
-}
-
-__setup("cache-sram-size=", get_size_from_cmdline);
-__setup("cache-sram-offset=", get_offset_from_cmdline);
-
-static int mpc85xx_l2ctlr_of_probe(struct platform_device *dev)
-{
-	long rval;
-	unsigned int rem;
-	unsigned char ways;
-	const unsigned int *prop;
-	unsigned int l2cache_size;
-	struct sram_parameters sram_params;
-
-	if (!dev->dev.of_node) {
-		dev_err(&dev->dev, "Device's OF-node is NULL\n");
-		return -EINVAL;
-	}
-
-	prop = of_get_property(dev->dev.of_node, "cache-size", NULL);
-	if (!prop) {
-		dev_err(&dev->dev, "Missing L2 cache-size\n");
-		return -EINVAL;
-	}
-	l2cache_size = *prop;
-
-	if (get_cache_sram_params(&sram_params))
-		return 0; /* fall back to L2 cache only */
-
-	rem = l2cache_size % sram_params.sram_size;
-	ways = LOCK_WAYS_FULL * sram_params.sram_size / l2cache_size;
-	if (rem || (ways & (ways - 1))) {
-		dev_err(&dev->dev, "Illegal cache-sram-size in command line\n");
-		return -EINVAL;
-	}
-
-	l2ctlr = of_iomap(dev->dev.of_node, 0);
-	if (!l2ctlr) {
-		dev_err(&dev->dev, "Can't map L2 controller\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Write bits[0-17] to srbar0
-	 */
-	out_be32(&l2ctlr->srbar0,
-		lower_32_bits(sram_params.sram_offset) & L2SRAM_BAR_MSK_LO18);
-
-	/*
-	 * Write bits[18-21] to srbare0
-	 */
-#ifdef CONFIG_PHYS_64BIT
-	out_be32(&l2ctlr->srbarea0,
-		upper_32_bits(sram_params.sram_offset) & L2SRAM_BARE_MSK_HI4);
-#endif
-
-	clrsetbits_be32(&l2ctlr->ctl, L2CR_L2E, L2CR_L2FI);
-
-	switch (ways) {
-	case LOCK_WAYS_EIGHTH:
-		setbits32(&l2ctlr->ctl,
-			L2CR_L2E | L2CR_L2FI | L2CR_SRAM_EIGHTH);
-		break;
-
-	case LOCK_WAYS_TWO_EIGHTH:
-		setbits32(&l2ctlr->ctl,
-			L2CR_L2E | L2CR_L2FI | L2CR_SRAM_QUART);
-		break;
-
-	case LOCK_WAYS_HALF:
-		setbits32(&l2ctlr->ctl,
-			L2CR_L2E | L2CR_L2FI | L2CR_SRAM_HALF);
-		break;
-
-	case LOCK_WAYS_FULL:
-	default:
-		setbits32(&l2ctlr->ctl,
-			L2CR_L2E | L2CR_L2FI | L2CR_SRAM_FULL);
-		break;
-	}
-	eieio();
-
-	rval = instantiate_cache_sram(dev, sram_params);
-	if (rval < 0) {
-		dev_err(&dev->dev, "Can't instantiate Cache-SRAM\n");
-		iounmap(l2ctlr);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int mpc85xx_l2ctlr_of_remove(struct platform_device *dev)
-{
-	BUG_ON(!l2ctlr);
-
-	iounmap(l2ctlr);
-	remove_cache_sram(dev);
-	dev_info(&dev->dev, "MPC85xx L2 controller unloaded\n");
-
-	return 0;
-}
-
-static const struct of_device_id mpc85xx_l2ctlr_of_match[] = {
-	{
-		.compatible = "fsl,p2020-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,p2010-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,p1020-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,p1011-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,p1013-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,p1022-l2-cache-controller",
-	},
-	{
-		.compatible = "fsl,mpc8548-l2-cache-controller",
-	},
-	{	.compatible = "fsl,mpc8544-l2-cache-controller",},
-	{	.compatible = "fsl,mpc8572-l2-cache-controller",},
-	{	.compatible = "fsl,mpc8536-l2-cache-controller",},
-	{	.compatible = "fsl,p1021-l2-cache-controller",},
-	{	.compatible = "fsl,p1012-l2-cache-controller",},
-	{	.compatible = "fsl,p1025-l2-cache-controller",},
-	{	.compatible = "fsl,p1016-l2-cache-controller",},
-	{	.compatible = "fsl,p1024-l2-cache-controller",},
-	{	.compatible = "fsl,p1015-l2-cache-controller",},
-	{	.compatible = "fsl,p1010-l2-cache-controller",},
-	{	.compatible = "fsl,bsc9131-l2-cache-controller",},
-	{},
-};
-
-static struct platform_driver mpc85xx_l2ctlr_of_platform_driver = {
-	.driver	= {
-		.name		= "fsl-l2ctlr",
-		.of_match_table	= mpc85xx_l2ctlr_of_match,
-	},
-	.probe		= mpc85xx_l2ctlr_of_probe,
-	.remove		= mpc85xx_l2ctlr_of_remove,
-};
-
-static __init int mpc85xx_l2ctlr_of_init(void)
-{
-	return platform_driver_register(&mpc85xx_l2ctlr_of_platform_driver);
-}
-
-static void __exit mpc85xx_l2ctlr_of_exit(void)
-{
-	platform_driver_unregister(&mpc85xx_l2ctlr_of_platform_driver);
-}
-
-subsys_initcall(mpc85xx_l2ctlr_of_init);
-module_exit(mpc85xx_l2ctlr_of_exit);
-
-MODULE_DESCRIPTION("Freescale MPC85xx L2 controller init");
-MODULE_LICENSE("GPL v2");
-- 
2.35.1

