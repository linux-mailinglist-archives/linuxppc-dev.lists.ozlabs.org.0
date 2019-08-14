Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7BE8CBEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:36:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fx45BrWzDqlj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="NS7zStCr"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467frY30swzDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:32:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBmhrJLYiMOB6I3A4BzDaCdz69rAFAkpL/6yE5SkD48=; b=NS7zStCrT36RB2XpT81H/g1DQ
 /9EaZiykIk3fNChPZ8I0JnSoORspEFWaCmiJw8/5wRQz2kU2vTqEWsm0fjjCxRSgXu2v2+XR4Y9Rc
 SGZyfBF0xaFN5GmrgjMYWmGm8IYhZXcNDdKgmSUeyrIV0mq8AlTb7MZYXkPX9jqAmJYoQTjFqmKIc
 ozHf+v1XYagjha31Af6jLyOzyB3OCukjxyw/PYBHV5KJEZrmkhpfy7VqrEkKGMI3AVJv2jnbqmmCL
 6VAPDId5+NmiVU43A7i8BJuhGmJtySy6LbnJ0UPB4ypGEoT3w1CRASXL3ngljzFApYNZJGmM4MSRM
 fHLtRkJ9g==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxmpL-0003nR-G9; Wed, 14 Aug 2019 06:32:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: alistair@popple.id.au,
	mporter@kernel.crashing.org
Subject: [PATCH] powerpc: remove the ppc44x ocm.c file
Date: Wed, 14 Aug 2019 08:32:02 +0200
Message-Id: <20190814063202.18591-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The on chip memory allocator is entirely unused in the kernel tree.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/configs/ppc40x_defconfig |   1 -
 arch/powerpc/include/asm/ppc4xx_ocm.h |  31 --
 arch/powerpc/platforms/44x/Kconfig    |   8 -
 arch/powerpc/platforms/4xx/Makefile   |   1 -
 arch/powerpc/platforms/4xx/ocm.c      | 390 --------------------------
 5 files changed, 431 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/ppc4xx_ocm.h
 delete mode 100644 arch/powerpc/platforms/4xx/ocm.c

diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
index 8f136b52198b..a5f683aed328 100644
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ b/arch/powerpc/configs/ppc40x_defconfig
@@ -84,4 +84,3 @@ CONFIG_CRYPTO_ECB=y
 CONFIG_CRYPTO_PCBC=y
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_DES=y
-CONFIG_PPC4xx_OCM=y
diff --git a/arch/powerpc/include/asm/ppc4xx_ocm.h b/arch/powerpc/include/asm/ppc4xx_ocm.h
deleted file mode 100644
index fc4db6dcde84..000000000000
--- a/arch/powerpc/include/asm/ppc4xx_ocm.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * PowerPC 4xx OCM memory allocation support
- *
- * (C) Copyright 2009, Applied Micro Circuits Corporation
- * Victor Gallardo (vgallardo@amcc.com)
- *
- * See file CREDITS for list of people who contributed to this
- * project.
- */
-
-#ifndef __ASM_POWERPC_PPC4XX_OCM_H__
-#define __ASM_POWERPC_PPC4XX_OCM_H__
-
-#define PPC4XX_OCM_NON_CACHED 0
-#define PPC4XX_OCM_CACHED     1
-
-#if defined(CONFIG_PPC4xx_OCM)
-
-void *ppc4xx_ocm_alloc(phys_addr_t *phys, int size, int align,
-		  int flags, const char *owner);
-void ppc4xx_ocm_free(const void *virt);
-
-#else
-
-#define ppc4xx_ocm_alloc(phys, size, align, flags, owner)	NULL
-#define ppc4xx_ocm_free(addr)	((void)0)
-
-#endif /* CONFIG_PPC4xx_OCM */
-
-#endif  /* __ASM_POWERPC_PPC4XX_OCM_H__ */
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index b369ed4e3675..25ebe634a661 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -272,14 +272,6 @@ config PPC4xx_GPIO
 	help
 	  Enable gpiolib support for ppc440 based boards
 
-config PPC4xx_OCM
-	bool "PPC4xx On Chip Memory (OCM) support"
-	depends on 4xx
-	select PPC_LIB_RHEAP
-	help
-	  Enable OCM support for PowerPC 4xx platforms with on chip memory,
-	  OCM provides the fast place for memory access to improve performance.
-
 # 44x specific CPU modules, selected based on the board above.
 config 440EP
 	bool
diff --git a/arch/powerpc/platforms/4xx/Makefile b/arch/powerpc/platforms/4xx/Makefile
index f5ae27ca131b..d009d2e0b9e8 100644
--- a/arch/powerpc/platforms/4xx/Makefile
+++ b/arch/powerpc/platforms/4xx/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y				+= uic.o machine_check.o
-obj-$(CONFIG_PPC4xx_OCM)	+= ocm.o
 obj-$(CONFIG_4xx_SOC)		+= soc.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
diff --git a/arch/powerpc/platforms/4xx/ocm.c b/arch/powerpc/platforms/4xx/ocm.c
deleted file mode 100644
index ba3257406ced..000000000000
--- a/arch/powerpc/platforms/4xx/ocm.c
+++ /dev/null
@@ -1,390 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * PowerPC 4xx OCM memory allocation support
- *
- * (C) Copyright 2009, Applied Micro Circuits Corporation
- * Victor Gallardo (vgallardo@amcc.com)
- *
- * See file CREDITS for list of people who contributed to this
- * project.
- */
-
-#include <linux/kernel.h>
-#include <linux/dma-mapping.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <asm/rheap.h>
-#include <asm/ppc4xx_ocm.h>
-#include <linux/slab.h>
-#include <linux/debugfs.h>
-
-#define OCM_DISABLED	0
-#define OCM_ENABLED		1
-
-struct ocm_block {
-	struct list_head	list;
-	void __iomem		*addr;
-	int					size;
-	const char			*owner;
-};
-
-/* non-cached or cached region */
-struct ocm_region {
-	phys_addr_t			phys;
-	void __iomem		*virt;
-
-	int					memtotal;
-	int					memfree;
-
-	rh_info_t			*rh;
-	struct list_head	list;
-};
-
-struct ocm_info {
-	int					index;
-	int					status;
-	int					ready;
-
-	phys_addr_t			phys;
-
-	int					alignment;
-	int					memtotal;
-	int					cache_size;
-
-	struct ocm_region	nc;	/* non-cached region */
-	struct ocm_region	c;	/* cached region */
-};
-
-static struct ocm_info *ocm_nodes;
-static int ocm_count;
-
-static struct ocm_info *ocm_get_node(unsigned int index)
-{
-	if (index >= ocm_count) {
-		printk(KERN_ERR "PPC4XX OCM: invalid index");
-		return NULL;
-	}
-
-	return &ocm_nodes[index];
-}
-
-static int ocm_free_region(struct ocm_region *ocm_reg, const void *addr)
-{
-	struct ocm_block *blk, *tmp;
-	unsigned long offset;
-
-	if (!ocm_reg->virt)
-		return 0;
-
-	list_for_each_entry_safe(blk, tmp, &ocm_reg->list, list) {
-		if (blk->addr == addr) {
-			offset = addr - ocm_reg->virt;
-			ocm_reg->memfree += blk->size;
-			rh_free(ocm_reg->rh, offset);
-			list_del(&blk->list);
-			kfree(blk);
-			return 1;
-		}
-	}
-
-	return 0;
-}
-
-static void __init ocm_init_node(int count, struct device_node *node)
-{
-	struct ocm_info *ocm;
-
-	const unsigned int *cell_index;
-	const unsigned int *cache_size;
-	int len;
-
-	struct resource rsrc;
-
-	ocm = ocm_get_node(count);
-
-	cell_index = of_get_property(node, "cell-index", &len);
-	if (!cell_index) {
-		printk(KERN_ERR "PPC4XX OCM: missing cell-index property");
-		return;
-	}
-	ocm->index = *cell_index;
-
-	if (of_device_is_available(node))
-		ocm->status = OCM_ENABLED;
-
-	cache_size = of_get_property(node, "cached-region-size", &len);
-	if (cache_size)
-		ocm->cache_size = *cache_size;
-
-	if (of_address_to_resource(node, 0, &rsrc)) {
-		printk(KERN_ERR "PPC4XX OCM%d: could not get resource address\n",
-			ocm->index);
-		return;
-	}
-
-	ocm->phys = rsrc.start;
-	ocm->memtotal = (rsrc.end - rsrc.start + 1);
-
-	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (%s)\n",
-		ocm->index, ocm->memtotal,
-		(ocm->status == OCM_DISABLED) ? "disabled" : "enabled");
-
-	if (ocm->status == OCM_DISABLED)
-		return;
-
-	/* request region */
-
-	if (!request_mem_region(ocm->phys, ocm->memtotal, "ppc4xx_ocm")) {
-		printk(KERN_ERR "PPC4XX OCM%d: could not request region\n",
-			ocm->index);
-		return;
-	}
-
-	/* Configure non-cached and cached regions */
-
-	ocm->nc.phys = ocm->phys;
-	ocm->nc.memtotal = ocm->memtotal - ocm->cache_size;
-	ocm->nc.memfree = ocm->nc.memtotal;
-
-	ocm->c.phys = ocm->phys + ocm->nc.memtotal;
-	ocm->c.memtotal = ocm->cache_size;
-	ocm->c.memfree = ocm->c.memtotal;
-
-	if (ocm->nc.memtotal == 0)
-		ocm->nc.phys = 0;
-
-	if (ocm->c.memtotal == 0)
-		ocm->c.phys = 0;
-
-	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (non-cached)\n",
-		ocm->index, ocm->nc.memtotal);
-
-	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (cached)\n",
-		ocm->index, ocm->c.memtotal);
-
-	/* ioremap the non-cached region */
-	if (ocm->nc.memtotal) {
-		ocm->nc.virt = __ioremap(ocm->nc.phys, ocm->nc.memtotal,
-			_PAGE_EXEC | pgprot_val(PAGE_KERNEL_NCG));
-
-		if (!ocm->nc.virt) {
-			printk(KERN_ERR
-			       "PPC4XX OCM%d: failed to ioremap non-cached memory\n",
-			       ocm->index);
-			ocm->nc.memfree = 0;
-			return;
-		}
-	}
-
-	/* ioremap the cached region */
-
-	if (ocm->c.memtotal) {
-		ocm->c.virt = __ioremap(ocm->c.phys, ocm->c.memtotal,
-					_PAGE_EXEC | pgprot_val(PAGE_KERNEL));
-
-		if (!ocm->c.virt) {
-			printk(KERN_ERR
-			       "PPC4XX OCM%d: failed to ioremap cached memory\n",
-			       ocm->index);
-			ocm->c.memfree = 0;
-			return;
-		}
-	}
-
-	/* Create Remote Heaps */
-
-	ocm->alignment = 4; /* default 4 byte alignment */
-
-	if (ocm->nc.virt) {
-		ocm->nc.rh = rh_create(ocm->alignment);
-		rh_attach_region(ocm->nc.rh, 0, ocm->nc.memtotal);
-	}
-
-	if (ocm->c.virt) {
-		ocm->c.rh = rh_create(ocm->alignment);
-		rh_attach_region(ocm->c.rh, 0, ocm->c.memtotal);
-	}
-
-	INIT_LIST_HEAD(&ocm->nc.list);
-	INIT_LIST_HEAD(&ocm->c.list);
-
-	ocm->ready = 1;
-}
-
-static int ocm_debugfs_show(struct seq_file *m, void *v)
-{
-	struct ocm_block *blk, *tmp;
-	unsigned int i;
-
-	for (i = 0; i < ocm_count; i++) {
-		struct ocm_info *ocm = ocm_get_node(i);
-
-		if (!ocm || !ocm->ready)
-			continue;
-
-		seq_printf(m, "PPC4XX OCM   : %d\n", ocm->index);
-		seq_printf(m, "PhysAddr     : %pa\n", &(ocm->phys));
-		seq_printf(m, "MemTotal     : %d Bytes\n", ocm->memtotal);
-		seq_printf(m, "MemTotal(NC) : %d Bytes\n", ocm->nc.memtotal);
-		seq_printf(m, "MemTotal(C)  : %d Bytes\n\n", ocm->c.memtotal);
-
-		seq_printf(m, "NC.PhysAddr  : %pa\n", &(ocm->nc.phys));
-		seq_printf(m, "NC.VirtAddr  : 0x%p\n", ocm->nc.virt);
-		seq_printf(m, "NC.MemTotal  : %d Bytes\n", ocm->nc.memtotal);
-		seq_printf(m, "NC.MemFree   : %d Bytes\n", ocm->nc.memfree);
-
-		list_for_each_entry_safe(blk, tmp, &ocm->nc.list, list) {
-			seq_printf(m, "NC.MemUsed   : %d Bytes (%s)\n",
-							blk->size, blk->owner);
-		}
-
-		seq_printf(m, "\nC.PhysAddr   : %pa\n", &(ocm->c.phys));
-		seq_printf(m, "C.VirtAddr   : 0x%p\n", ocm->c.virt);
-		seq_printf(m, "C.MemTotal   : %d Bytes\n", ocm->c.memtotal);
-		seq_printf(m, "C.MemFree    : %d Bytes\n", ocm->c.memfree);
-
-		list_for_each_entry_safe(blk, tmp, &ocm->c.list, list) {
-			seq_printf(m, "C.MemUsed    : %d Bytes (%s)\n",
-						blk->size, blk->owner);
-		}
-
-		seq_putc(m, '\n');
-	}
-
-	return 0;
-}
-
-static int ocm_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, ocm_debugfs_show, NULL);
-}
-
-static const struct file_operations ocm_debugfs_fops = {
-	.open = ocm_debugfs_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int ocm_debugfs_init(void)
-{
-	struct dentry *junk;
-
-	junk = debugfs_create_dir("ppc4xx_ocm", 0);
-	if (!junk) {
-		printk(KERN_ALERT "debugfs ppc4xx ocm: failed to create dir\n");
-		return -1;
-	}
-
-	if (debugfs_create_file("info", 0644, junk, NULL, &ocm_debugfs_fops)) {
-		printk(KERN_ALERT "debugfs ppc4xx ocm: failed to create file\n");
-		return -1;
-	}
-
-	return 0;
-}
-
-void *ppc4xx_ocm_alloc(phys_addr_t *phys, int size, int align,
-			int flags, const char *owner)
-{
-	void __iomem *addr = NULL;
-	unsigned long offset;
-	struct ocm_info *ocm;
-	struct ocm_region *ocm_reg;
-	struct ocm_block *ocm_blk;
-	int i;
-
-	for (i = 0; i < ocm_count; i++) {
-		ocm = ocm_get_node(i);
-
-		if (!ocm || !ocm->ready)
-			continue;
-
-		if (flags == PPC4XX_OCM_NON_CACHED)
-			ocm_reg = &ocm->nc;
-		else
-			ocm_reg = &ocm->c;
-
-		if (!ocm_reg->virt)
-			continue;
-
-		if (align < ocm->alignment)
-			align = ocm->alignment;
-
-		offset = rh_alloc_align(ocm_reg->rh, size, align, NULL);
-
-		if (IS_ERR_VALUE(offset))
-			continue;
-
-		ocm_blk = kzalloc(sizeof(*ocm_blk), GFP_KERNEL);
-		if (!ocm_blk) {
-			rh_free(ocm_reg->rh, offset);
-			break;
-		}
-
-		*phys = ocm_reg->phys + offset;
-		addr = ocm_reg->virt + offset;
-		size = ALIGN(size, align);
-
-		ocm_blk->addr = addr;
-		ocm_blk->size = size;
-		ocm_blk->owner = owner;
-		list_add_tail(&ocm_blk->list, &ocm_reg->list);
-
-		ocm_reg->memfree -= size;
-
-		break;
-	}
-
-	return addr;
-}
-
-void ppc4xx_ocm_free(const void *addr)
-{
-	int i;
-
-	if (!addr)
-		return;
-
-	for (i = 0; i < ocm_count; i++) {
-		struct ocm_info *ocm = ocm_get_node(i);
-
-		if (!ocm || !ocm->ready)
-			continue;
-
-		if (ocm_free_region(&ocm->nc, addr) ||
-			ocm_free_region(&ocm->c, addr))
-			return;
-	}
-}
-
-static int __init ppc4xx_ocm_init(void)
-{
-	struct device_node *np;
-	int count;
-
-	count = 0;
-	for_each_compatible_node(np, NULL, "ibm,ocm")
-		count++;
-
-	if (!count)
-		return 0;
-
-	ocm_nodes = kzalloc((count * sizeof(struct ocm_info)), GFP_KERNEL);
-	if (!ocm_nodes)
-		return -ENOMEM;
-
-	ocm_count = count;
-	count = 0;
-
-	for_each_compatible_node(np, NULL, "ibm,ocm") {
-		ocm_init_node(count, np);
-		count++;
-	}
-
-	ocm_debugfs_init();
-
-	return 0;
-}
-
-arch_initcall(ppc4xx_ocm_init);
-- 
2.20.1

