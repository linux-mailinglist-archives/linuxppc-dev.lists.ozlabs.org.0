Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C26A2348
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 21:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNhsG6DxMz3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 07:52:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C8U0kj7l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=14196aa554=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C8U0kj7l;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNhqR4MR7z3cf6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 07:50:27 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OKZTwl013860;
	Fri, 24 Feb 2023 12:50:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=h4symHpgxhIZiNSLyr4atB/q4/3A22oouzBHDeguyXs=;
 b=C8U0kj7le3oVQJVWd8fsBqHOBnmwYIkjN1rFil1YjrMbbThnyiI6YveVYIDhuMtjq6rh
 i7zk6IMME/h1M6zV4DOnsM82197BnU0Du59i/rice3OGB3zq4+RwP+/uoOGiSFgGCDMT
 NlU3dbcieSxnzyXnGXYP0HnQSSB1kILLi15A/igQctfWpuKAAUCq8rFlNsxrtTq5c9yQ
 mCnJO7wgv2osfIbapI4FXdQmeLiwVR93Ko+ZrcCZJ4UJAFnycWN8jqjLU7EKf30TiUub
 pjp500aTbbg34MYGf/VuTIdEtsc+Q98jR2jXY7//Ne+TLmaja2Y/5wobk8NIIlWGoN9S vA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6x4gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Feb 2023 12:50:14 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 24 Feb 2023 12:50:14 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 24 Feb 2023 12:50:13 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc: drop MPC8272-ADS and PowerQUICC II FADS shared code.
Date: Fri, 24 Feb 2023 15:49:59 -0500
Message-ID: <20230224204959.17425-4-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224204959.17425-1-paul.gortmaker@windriver.com>
References: <20230224204959.17425-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: idO2T5Q0ZOvvqz0-Jdq1ykAxzyafgMgR
X-Proofpoint-GUID: idO2T5Q0ZOvvqz0-Jdq1ykAxzyafgMgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=975 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240166
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the two platforms depending on this shared code, and no others,
we can remove the orphaned code and Kconfigs

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/include/asm/mpc8260.h           |   4 -
 arch/powerpc/platforms/82xx/Kconfig          |   6 -
 arch/powerpc/platforms/82xx/Makefile         |   1 -
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 172 -------------------
 arch/powerpc/platforms/82xx/pq2ads.h         |  40 -----
 5 files changed, 223 deletions(-)
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads.h

diff --git a/arch/powerpc/include/asm/mpc8260.h b/arch/powerpc/include/asm/mpc8260.h
index fd8c5707425b..155114bbd1a2 100644
--- a/arch/powerpc/include/asm/mpc8260.h
+++ b/arch/powerpc/include/asm/mpc8260.h
@@ -13,10 +13,6 @@
 
 #ifdef CONFIG_8260
 
-#if defined(CONFIG_PQ2ADS) || defined (CONFIG_PQ2FADS)
-#include <platforms/82xx/pq2ads.h>
-#endif
-
 #ifdef CONFIG_PCI_8260
 #include <platforms/82xx/m82xx_pci.h>
 #endif
diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
index 62a057c6a356..4eb372bdab70 100644
--- a/arch/powerpc/platforms/82xx/Kconfig
+++ b/arch/powerpc/platforms/82xx/Kconfig
@@ -28,9 +28,6 @@ config MGCOGE
 
 endif
 
-config PQ2ADS
-	bool
-
 config 8260
 	bool
 	depends on PPC_BOOK3S_32
@@ -46,6 +43,3 @@ config 8272
 	help
 	  The MPC8272 CPM has a different internal dpram setup than other CPM2
 	  devices
-
-config PQ2_ADS_PCI_PIC
-	bool
diff --git a/arch/powerpc/platforms/82xx/Makefile b/arch/powerpc/platforms/82xx/Makefile
index a4257f057401..4fa43a5cd582 100644
--- a/arch/powerpc/platforms/82xx/Makefile
+++ b/arch/powerpc/platforms/82xx/Makefile
@@ -3,6 +3,5 @@
 # Makefile for the PowerPC 82xx linux kernel.
 #
 obj-$(CONFIG_CPM2) += pq2.o
-obj-$(CONFIG_PQ2_ADS_PCI_PIC) += pq2ads-pci-pic.o
 obj-$(CONFIG_EP8248E) += ep8248e.o
 obj-$(CONFIG_MGCOGE) += km82xx.o
diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
deleted file mode 100644
index cf3210042a2e..000000000000
--- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ /dev/null
@@ -1,172 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * PQ2 ADS-style PCI interrupt controller
- *
- * Copyright 2007 Freescale Semiconductor, Inc.
- * Author: Scott Wood <scottwood@freescale.com>
- *
- * Loosely based on mpc82xx ADS support by Vitaly Bordug <vbordug@ru.mvista.com>
- * Copyright (c) 2006 MontaVista Software, Inc.
- */
-
-#include <linux/init.h>
-#include <linux/spinlock.h>
-#include <linux/irq.h>
-#include <linux/types.h>
-#include <linux/slab.h>
-#include <linux/of_irq.h>
-
-#include <asm/io.h>
-#include <asm/cpm2.h>
-
-#include "pq2.h"
-
-static DEFINE_RAW_SPINLOCK(pci_pic_lock);
-
-struct pq2ads_pci_pic {
-	struct device_node *node;
-	struct irq_domain *host;
-
-	struct {
-		u32 stat;
-		u32 mask;
-	} __iomem *regs;
-};
-
-#define NUM_IRQS 32
-
-static void pq2ads_pci_mask_irq(struct irq_data *d)
-{
-	struct pq2ads_pci_pic *priv = irq_data_get_irq_chip_data(d);
-	int irq = NUM_IRQS - irqd_to_hwirq(d) - 1;
-
-	if (irq != -1) {
-		unsigned long flags;
-		raw_spin_lock_irqsave(&pci_pic_lock, flags);
-
-		setbits32(&priv->regs->mask, 1 << irq);
-		mb();
-
-		raw_spin_unlock_irqrestore(&pci_pic_lock, flags);
-	}
-}
-
-static void pq2ads_pci_unmask_irq(struct irq_data *d)
-{
-	struct pq2ads_pci_pic *priv = irq_data_get_irq_chip_data(d);
-	int irq = NUM_IRQS - irqd_to_hwirq(d) - 1;
-
-	if (irq != -1) {
-		unsigned long flags;
-
-		raw_spin_lock_irqsave(&pci_pic_lock, flags);
-		clrbits32(&priv->regs->mask, 1 << irq);
-		raw_spin_unlock_irqrestore(&pci_pic_lock, flags);
-	}
-}
-
-static struct irq_chip pq2ads_pci_ic = {
-	.name = "PQ2 ADS PCI",
-	.irq_mask = pq2ads_pci_mask_irq,
-	.irq_mask_ack = pq2ads_pci_mask_irq,
-	.irq_ack = pq2ads_pci_mask_irq,
-	.irq_unmask = pq2ads_pci_unmask_irq,
-	.irq_enable = pq2ads_pci_unmask_irq,
-	.irq_disable = pq2ads_pci_mask_irq
-};
-
-static void pq2ads_pci_irq_demux(struct irq_desc *desc)
-{
-	struct pq2ads_pci_pic *priv = irq_desc_get_handler_data(desc);
-	u32 stat, mask, pend;
-	int bit;
-
-	for (;;) {
-		stat = in_be32(&priv->regs->stat);
-		mask = in_be32(&priv->regs->mask);
-
-		pend = stat & ~mask;
-
-		if (!pend)
-			break;
-
-		for (bit = 0; pend != 0; ++bit, pend <<= 1) {
-			if (pend & 0x80000000)
-				generic_handle_domain_irq(priv->host, bit);
-		}
-	}
-}
-
-static int pci_pic_host_map(struct irq_domain *h, unsigned int virq,
-			    irq_hw_number_t hw)
-{
-	irq_set_status_flags(virq, IRQ_LEVEL);
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &pq2ads_pci_ic, handle_level_irq);
-	return 0;
-}
-
-static const struct irq_domain_ops pci_pic_host_ops = {
-	.map = pci_pic_host_map,
-};
-
-int __init pq2ads_pci_init_irq(void)
-{
-	struct pq2ads_pci_pic *priv;
-	struct irq_domain *host;
-	struct device_node *np;
-	int ret = -ENODEV;
-	int irq;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,pq2ads-pci-pic");
-	if (!np) {
-		printk(KERN_ERR "No pci pic node in device tree.\n");
-		goto out;
-	}
-
-	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
-		printk(KERN_ERR "No interrupt in pci pic node.\n");
-		goto out_put_node;
-	}
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto out_unmap_irq;
-	}
-
-	/* PCI interrupt controller registers: status and mask */
-	priv->regs = of_iomap(np, 0);
-	if (!priv->regs) {
-		printk(KERN_ERR "Cannot map PCI PIC registers.\n");
-		goto out_free_kmalloc;
-	}
-
-	/* mask all PCI interrupts */
-	out_be32(&priv->regs->mask, ~0);
-	mb();
-
-	host = irq_domain_add_linear(np, NUM_IRQS, &pci_pic_host_ops, priv);
-	if (!host) {
-		ret = -ENOMEM;
-		goto out_unmap_regs;
-	}
-
-	priv->host = host;
-	irq_set_handler_data(irq, priv);
-	irq_set_chained_handler(irq, pq2ads_pci_irq_demux);
-	ret = 0;
-	goto out_put_node;
-
-out_unmap_regs:
-	iounmap(priv->regs);
-out_free_kmalloc:
-	kfree(priv);
-out_unmap_irq:
-	irq_dispose_mapping(irq);
-out_put_node:
-	of_node_put(np);
-out:
-	return ret;
-}
diff --git a/arch/powerpc/platforms/82xx/pq2ads.h b/arch/powerpc/platforms/82xx/pq2ads.h
deleted file mode 100644
index 9d0bf744945c..000000000000
--- a/arch/powerpc/platforms/82xx/pq2ads.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * PQ2/mpc8260 board-specific stuff
- *
- * A collection of structures, addresses, and values associated with
- * the Freescale MPC8260ADS/MPC8266ADS-PCI boards.
- * Copied from the RPX-Classic and SBS8260 stuff.
- *
- * Author: Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * Originally written by Dan Malek for Motorola MPC8260 family
- *
- * Copyright (c) 2001 Dan Malek <dan@embeddedalley.com>
- * Copyright (c) 2006 MontaVista Software, Inc.
- */
-
-#ifdef __KERNEL__
-#ifndef __MACH_ADS8260_DEFS
-#define __MACH_ADS8260_DEFS
-
-#include <linux/seq_file.h>
-
-/* The ADS8260 has 16, 32-bit wide control/status registers, accessed
- * only on word boundaries.
- * Not all are used (yet), or are interesting to us (yet).
- */
-
-/* Things of interest in the CSR.
- */
-#define BCSR0_LED0		((uint)0x02000000)      /* 0 == on */
-#define BCSR0_LED1		((uint)0x01000000)      /* 0 == on */
-#define BCSR1_FETHIEN		((uint)0x08000000)      /* 0 == enable*/
-#define BCSR1_FETH_RST		((uint)0x04000000)      /* 0 == reset */
-#define BCSR1_RS232_EN1		((uint)0x02000000)      /* 0 ==enable */
-#define BCSR1_RS232_EN2		((uint)0x01000000)      /* 0 ==enable */
-#define BCSR3_FETHIEN2		((uint)0x10000000)      /* 0 == enable*/
-#define BCSR3_FETH2_RST		((uint)0x80000000)      /* 0 == reset */
-
-#endif /* __MACH_ADS8260_DEFS */
-#endif /* __KERNEL__ */
-- 
2.17.1

