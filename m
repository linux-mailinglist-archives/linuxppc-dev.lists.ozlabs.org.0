Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57196231
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:16:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CXsl5Tb3zDr7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dWgH7Vnm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfq6pG2zDr45
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfj3jTPz9v0Gc;
 Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dWgH7Vnm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iGhcG5Qf0Q-d; Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfj2Xxmz9v0GZ;
 Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310029; bh=0tP4jaOm4qOyX7NpLYWRuf4kptZ6tmkvFZX3819o0xI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=dWgH7VnmD3U0424OiufD2DPWNk0d1kNGwpU59SUqRr62+sflb17WZaMPzeQf+Of27
 vF4AqWANt0MHqtETaB4OhYDygo+XqaTr0ESHUiImVXnswpmIRz3JMgeM5F3+/UgoO/
 zpR3y9c/vsVdFseGa1+u0qSTZ9Om091CGgNPC98I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B82CD8B7D0;
 Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wXNbG_vw4FKv; Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E9D48B7C9;
 Tue, 20 Aug 2019 16:07:09 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 48B4B6B734; Tue, 20 Aug 2019 14:07:09 +0000 (UTC)
Message-Id: <7b1668941ad1041d08b19167030868de5840b153.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 01/12] powerpc: remove the ppc44x ocm.c file
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:09 +0000 (UTC)
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

From: Christoph Hellwig <hch@lst.de>

The on chip memory allocator is entirely unused in the kernel tree.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/configs/ppc40x_defconfig |   1 -
 arch/powerpc/include/asm/ppc4xx_ocm.h |  31 ---
 arch/powerpc/platforms/44x/Kconfig    |   8 -
 arch/powerpc/platforms/4xx/Makefile   |   1 -
 arch/powerpc/platforms/4xx/ocm.c      | 390 ----------------------------------
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
2.13.3

