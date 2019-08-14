Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F09098CC57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 09:15:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467gpB6nNbzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:15:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="d8RsycSc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467gls2D50zDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:13:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467gll6dK1z9tynb;
 Wed, 14 Aug 2019 09:13:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=d8RsycSc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VcD11XDerEHW; Wed, 14 Aug 2019 09:13:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467gll5PnDz9tyn4;
 Wed, 14 Aug 2019 09:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565766787; bh=axBgY3KzG18BPxHa2bEjNVnsh2EVXvuyShmPh8pY/jw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d8RsycScbQI6v7tVSdGDPKC95Qw8JInR0lIOAJhpQ8Ew/rXjte0j0gwk1kiWuSyfr
 Ndrx8bAu00aYx+V+4sjk4oF+EgYPfuVLvCiFnER3xWqO3S9H1RfqRIYbJJe1lPbaQj
 egVpXcTVSwBTF4IUCbQPg6p7FjqOxzguHtMMnSqs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D12178B780;
 Wed, 14 Aug 2019 09:13:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wzYJDwtJo_uN; Wed, 14 Aug 2019 09:13:08 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A66588B761;
 Wed, 14 Aug 2019 09:13:08 +0200 (CEST)
Subject: Re: [PATCH] powerpc: remove the ppc44x ocm.c file
To: Christoph Hellwig <hch@lst.de>, alistair@popple.id.au,
 mporter@kernel.crashing.org
References: <20190814063202.18591-1-hch@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9a2f3c51-1c2b-6ff0-765c-ef397dbd154a@c-s.fr>
Date: Wed, 14 Aug 2019 09:13:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814063202.18591-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/08/2019 à 08:32, Christoph Hellwig a écrit :
> The on chip memory allocator is entirely unused in the kernel tree.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Since this driver was added in Linux 3.9, functions ppc4xx_ocm_alloc() 
and ppc4xx_ocm_free() have never been used in any driver, and are not 
even exported to modules.

Acked-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/configs/ppc40x_defconfig |   1 -
>   arch/powerpc/include/asm/ppc4xx_ocm.h |  31 --
>   arch/powerpc/platforms/44x/Kconfig    |   8 -
>   arch/powerpc/platforms/4xx/Makefile   |   1 -
>   arch/powerpc/platforms/4xx/ocm.c      | 390 --------------------------
>   5 files changed, 431 deletions(-)
>   delete mode 100644 arch/powerpc/include/asm/ppc4xx_ocm.h
>   delete mode 100644 arch/powerpc/platforms/4xx/ocm.c
> 
> diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
> index 8f136b52198b..a5f683aed328 100644
> --- a/arch/powerpc/configs/ppc40x_defconfig
> +++ b/arch/powerpc/configs/ppc40x_defconfig
> @@ -84,4 +84,3 @@ CONFIG_CRYPTO_ECB=y
>   CONFIG_CRYPTO_PCBC=y
>   CONFIG_CRYPTO_MD5=y
>   CONFIG_CRYPTO_DES=y
> -CONFIG_PPC4xx_OCM=y
> diff --git a/arch/powerpc/include/asm/ppc4xx_ocm.h b/arch/powerpc/include/asm/ppc4xx_ocm.h
> deleted file mode 100644
> index fc4db6dcde84..000000000000
> --- a/arch/powerpc/include/asm/ppc4xx_ocm.h
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * PowerPC 4xx OCM memory allocation support
> - *
> - * (C) Copyright 2009, Applied Micro Circuits Corporation
> - * Victor Gallardo (vgallardo@amcc.com)
> - *
> - * See file CREDITS for list of people who contributed to this
> - * project.
> - */
> -
> -#ifndef __ASM_POWERPC_PPC4XX_OCM_H__
> -#define __ASM_POWERPC_PPC4XX_OCM_H__
> -
> -#define PPC4XX_OCM_NON_CACHED 0
> -#define PPC4XX_OCM_CACHED     1
> -
> -#if defined(CONFIG_PPC4xx_OCM)
> -
> -void *ppc4xx_ocm_alloc(phys_addr_t *phys, int size, int align,
> -		  int flags, const char *owner);
> -void ppc4xx_ocm_free(const void *virt);
> -
> -#else
> -
> -#define ppc4xx_ocm_alloc(phys, size, align, flags, owner)	NULL
> -#define ppc4xx_ocm_free(addr)	((void)0)
> -
> -#endif /* CONFIG_PPC4xx_OCM */
> -
> -#endif  /* __ASM_POWERPC_PPC4XX_OCM_H__ */
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
> index b369ed4e3675..25ebe634a661 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -272,14 +272,6 @@ config PPC4xx_GPIO
>   	help
>   	  Enable gpiolib support for ppc440 based boards
>   
> -config PPC4xx_OCM
> -	bool "PPC4xx On Chip Memory (OCM) support"
> -	depends on 4xx
> -	select PPC_LIB_RHEAP
> -	help
> -	  Enable OCM support for PowerPC 4xx platforms with on chip memory,
> -	  OCM provides the fast place for memory access to improve performance.
> -
>   # 44x specific CPU modules, selected based on the board above.
>   config 440EP
>   	bool
> diff --git a/arch/powerpc/platforms/4xx/Makefile b/arch/powerpc/platforms/4xx/Makefile
> index f5ae27ca131b..d009d2e0b9e8 100644
> --- a/arch/powerpc/platforms/4xx/Makefile
> +++ b/arch/powerpc/platforms/4xx/Makefile
> @@ -1,6 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y				+= uic.o machine_check.o
> -obj-$(CONFIG_PPC4xx_OCM)	+= ocm.o
>   obj-$(CONFIG_4xx_SOC)		+= soc.o
>   obj-$(CONFIG_PCI)		+= pci.o
>   obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
> diff --git a/arch/powerpc/platforms/4xx/ocm.c b/arch/powerpc/platforms/4xx/ocm.c
> deleted file mode 100644
> index ba3257406ced..000000000000
> --- a/arch/powerpc/platforms/4xx/ocm.c
> +++ /dev/null
> @@ -1,390 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * PowerPC 4xx OCM memory allocation support
> - *
> - * (C) Copyright 2009, Applied Micro Circuits Corporation
> - * Victor Gallardo (vgallardo@amcc.com)
> - *
> - * See file CREDITS for list of people who contributed to this
> - * project.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <asm/rheap.h>
> -#include <asm/ppc4xx_ocm.h>
> -#include <linux/slab.h>
> -#include <linux/debugfs.h>
> -
> -#define OCM_DISABLED	0
> -#define OCM_ENABLED		1
> -
> -struct ocm_block {
> -	struct list_head	list;
> -	void __iomem		*addr;
> -	int					size;
> -	const char			*owner;
> -};
> -
> -/* non-cached or cached region */
> -struct ocm_region {
> -	phys_addr_t			phys;
> -	void __iomem		*virt;
> -
> -	int					memtotal;
> -	int					memfree;
> -
> -	rh_info_t			*rh;
> -	struct list_head	list;
> -};
> -
> -struct ocm_info {
> -	int					index;
> -	int					status;
> -	int					ready;
> -
> -	phys_addr_t			phys;
> -
> -	int					alignment;
> -	int					memtotal;
> -	int					cache_size;
> -
> -	struct ocm_region	nc;	/* non-cached region */
> -	struct ocm_region	c;	/* cached region */
> -};
> -
> -static struct ocm_info *ocm_nodes;
> -static int ocm_count;
> -
> -static struct ocm_info *ocm_get_node(unsigned int index)
> -{
> -	if (index >= ocm_count) {
> -		printk(KERN_ERR "PPC4XX OCM: invalid index");
> -		return NULL;
> -	}
> -
> -	return &ocm_nodes[index];
> -}
> -
> -static int ocm_free_region(struct ocm_region *ocm_reg, const void *addr)
> -{
> -	struct ocm_block *blk, *tmp;
> -	unsigned long offset;
> -
> -	if (!ocm_reg->virt)
> -		return 0;
> -
> -	list_for_each_entry_safe(blk, tmp, &ocm_reg->list, list) {
> -		if (blk->addr == addr) {
> -			offset = addr - ocm_reg->virt;
> -			ocm_reg->memfree += blk->size;
> -			rh_free(ocm_reg->rh, offset);
> -			list_del(&blk->list);
> -			kfree(blk);
> -			return 1;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static void __init ocm_init_node(int count, struct device_node *node)
> -{
> -	struct ocm_info *ocm;
> -
> -	const unsigned int *cell_index;
> -	const unsigned int *cache_size;
> -	int len;
> -
> -	struct resource rsrc;
> -
> -	ocm = ocm_get_node(count);
> -
> -	cell_index = of_get_property(node, "cell-index", &len);
> -	if (!cell_index) {
> -		printk(KERN_ERR "PPC4XX OCM: missing cell-index property");
> -		return;
> -	}
> -	ocm->index = *cell_index;
> -
> -	if (of_device_is_available(node))
> -		ocm->status = OCM_ENABLED;
> -
> -	cache_size = of_get_property(node, "cached-region-size", &len);
> -	if (cache_size)
> -		ocm->cache_size = *cache_size;
> -
> -	if (of_address_to_resource(node, 0, &rsrc)) {
> -		printk(KERN_ERR "PPC4XX OCM%d: could not get resource address\n",
> -			ocm->index);
> -		return;
> -	}
> -
> -	ocm->phys = rsrc.start;
> -	ocm->memtotal = (rsrc.end - rsrc.start + 1);
> -
> -	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (%s)\n",
> -		ocm->index, ocm->memtotal,
> -		(ocm->status == OCM_DISABLED) ? "disabled" : "enabled");
> -
> -	if (ocm->status == OCM_DISABLED)
> -		return;
> -
> -	/* request region */
> -
> -	if (!request_mem_region(ocm->phys, ocm->memtotal, "ppc4xx_ocm")) {
> -		printk(KERN_ERR "PPC4XX OCM%d: could not request region\n",
> -			ocm->index);
> -		return;
> -	}
> -
> -	/* Configure non-cached and cached regions */
> -
> -	ocm->nc.phys = ocm->phys;
> -	ocm->nc.memtotal = ocm->memtotal - ocm->cache_size;
> -	ocm->nc.memfree = ocm->nc.memtotal;
> -
> -	ocm->c.phys = ocm->phys + ocm->nc.memtotal;
> -	ocm->c.memtotal = ocm->cache_size;
> -	ocm->c.memfree = ocm->c.memtotal;
> -
> -	if (ocm->nc.memtotal == 0)
> -		ocm->nc.phys = 0;
> -
> -	if (ocm->c.memtotal == 0)
> -		ocm->c.phys = 0;
> -
> -	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (non-cached)\n",
> -		ocm->index, ocm->nc.memtotal);
> -
> -	printk(KERN_INFO "PPC4XX OCM%d: %d Bytes (cached)\n",
> -		ocm->index, ocm->c.memtotal);
> -
> -	/* ioremap the non-cached region */
> -	if (ocm->nc.memtotal) {
> -		ocm->nc.virt = __ioremap(ocm->nc.phys, ocm->nc.memtotal,
> -			_PAGE_EXEC | pgprot_val(PAGE_KERNEL_NCG));
> -
> -		if (!ocm->nc.virt) {
> -			printk(KERN_ERR
> -			       "PPC4XX OCM%d: failed to ioremap non-cached memory\n",
> -			       ocm->index);
> -			ocm->nc.memfree = 0;
> -			return;
> -		}
> -	}
> -
> -	/* ioremap the cached region */
> -
> -	if (ocm->c.memtotal) {
> -		ocm->c.virt = __ioremap(ocm->c.phys, ocm->c.memtotal,
> -					_PAGE_EXEC | pgprot_val(PAGE_KERNEL));
> -
> -		if (!ocm->c.virt) {
> -			printk(KERN_ERR
> -			       "PPC4XX OCM%d: failed to ioremap cached memory\n",
> -			       ocm->index);
> -			ocm->c.memfree = 0;
> -			return;
> -		}
> -	}
> -
> -	/* Create Remote Heaps */
> -
> -	ocm->alignment = 4; /* default 4 byte alignment */
> -
> -	if (ocm->nc.virt) {
> -		ocm->nc.rh = rh_create(ocm->alignment);
> -		rh_attach_region(ocm->nc.rh, 0, ocm->nc.memtotal);
> -	}
> -
> -	if (ocm->c.virt) {
> -		ocm->c.rh = rh_create(ocm->alignment);
> -		rh_attach_region(ocm->c.rh, 0, ocm->c.memtotal);
> -	}
> -
> -	INIT_LIST_HEAD(&ocm->nc.list);
> -	INIT_LIST_HEAD(&ocm->c.list);
> -
> -	ocm->ready = 1;
> -}
> -
> -static int ocm_debugfs_show(struct seq_file *m, void *v)
> -{
> -	struct ocm_block *blk, *tmp;
> -	unsigned int i;
> -
> -	for (i = 0; i < ocm_count; i++) {
> -		struct ocm_info *ocm = ocm_get_node(i);
> -
> -		if (!ocm || !ocm->ready)
> -			continue;
> -
> -		seq_printf(m, "PPC4XX OCM   : %d\n", ocm->index);
> -		seq_printf(m, "PhysAddr     : %pa\n", &(ocm->phys));
> -		seq_printf(m, "MemTotal     : %d Bytes\n", ocm->memtotal);
> -		seq_printf(m, "MemTotal(NC) : %d Bytes\n", ocm->nc.memtotal);
> -		seq_printf(m, "MemTotal(C)  : %d Bytes\n\n", ocm->c.memtotal);
> -
> -		seq_printf(m, "NC.PhysAddr  : %pa\n", &(ocm->nc.phys));
> -		seq_printf(m, "NC.VirtAddr  : 0x%p\n", ocm->nc.virt);
> -		seq_printf(m, "NC.MemTotal  : %d Bytes\n", ocm->nc.memtotal);
> -		seq_printf(m, "NC.MemFree   : %d Bytes\n", ocm->nc.memfree);
> -
> -		list_for_each_entry_safe(blk, tmp, &ocm->nc.list, list) {
> -			seq_printf(m, "NC.MemUsed   : %d Bytes (%s)\n",
> -							blk->size, blk->owner);
> -		}
> -
> -		seq_printf(m, "\nC.PhysAddr   : %pa\n", &(ocm->c.phys));
> -		seq_printf(m, "C.VirtAddr   : 0x%p\n", ocm->c.virt);
> -		seq_printf(m, "C.MemTotal   : %d Bytes\n", ocm->c.memtotal);
> -		seq_printf(m, "C.MemFree    : %d Bytes\n", ocm->c.memfree);
> -
> -		list_for_each_entry_safe(blk, tmp, &ocm->c.list, list) {
> -			seq_printf(m, "C.MemUsed    : %d Bytes (%s)\n",
> -						blk->size, blk->owner);
> -		}
> -
> -		seq_putc(m, '\n');
> -	}
> -
> -	return 0;
> -}
> -
> -static int ocm_debugfs_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ocm_debugfs_show, NULL);
> -}
> -
> -static const struct file_operations ocm_debugfs_fops = {
> -	.open = ocm_debugfs_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -};
> -
> -static int ocm_debugfs_init(void)
> -{
> -	struct dentry *junk;
> -
> -	junk = debugfs_create_dir("ppc4xx_ocm", 0);
> -	if (!junk) {
> -		printk(KERN_ALERT "debugfs ppc4xx ocm: failed to create dir\n");
> -		return -1;
> -	}
> -
> -	if (debugfs_create_file("info", 0644, junk, NULL, &ocm_debugfs_fops)) {
> -		printk(KERN_ALERT "debugfs ppc4xx ocm: failed to create file\n");
> -		return -1;
> -	}
> -
> -	return 0;
> -}
> -
> -void *ppc4xx_ocm_alloc(phys_addr_t *phys, int size, int align,
> -			int flags, const char *owner)
> -{
> -	void __iomem *addr = NULL;
> -	unsigned long offset;
> -	struct ocm_info *ocm;
> -	struct ocm_region *ocm_reg;
> -	struct ocm_block *ocm_blk;
> -	int i;
> -
> -	for (i = 0; i < ocm_count; i++) {
> -		ocm = ocm_get_node(i);
> -
> -		if (!ocm || !ocm->ready)
> -			continue;
> -
> -		if (flags == PPC4XX_OCM_NON_CACHED)
> -			ocm_reg = &ocm->nc;
> -		else
> -			ocm_reg = &ocm->c;
> -
> -		if (!ocm_reg->virt)
> -			continue;
> -
> -		if (align < ocm->alignment)
> -			align = ocm->alignment;
> -
> -		offset = rh_alloc_align(ocm_reg->rh, size, align, NULL);
> -
> -		if (IS_ERR_VALUE(offset))
> -			continue;
> -
> -		ocm_blk = kzalloc(sizeof(*ocm_blk), GFP_KERNEL);
> -		if (!ocm_blk) {
> -			rh_free(ocm_reg->rh, offset);
> -			break;
> -		}
> -
> -		*phys = ocm_reg->phys + offset;
> -		addr = ocm_reg->virt + offset;
> -		size = ALIGN(size, align);
> -
> -		ocm_blk->addr = addr;
> -		ocm_blk->size = size;
> -		ocm_blk->owner = owner;
> -		list_add_tail(&ocm_blk->list, &ocm_reg->list);
> -
> -		ocm_reg->memfree -= size;
> -
> -		break;
> -	}
> -
> -	return addr;
> -}
> -
> -void ppc4xx_ocm_free(const void *addr)
> -{
> -	int i;
> -
> -	if (!addr)
> -		return;
> -
> -	for (i = 0; i < ocm_count; i++) {
> -		struct ocm_info *ocm = ocm_get_node(i);
> -
> -		if (!ocm || !ocm->ready)
> -			continue;
> -
> -		if (ocm_free_region(&ocm->nc, addr) ||
> -			ocm_free_region(&ocm->c, addr))
> -			return;
> -	}
> -}
> -
> -static int __init ppc4xx_ocm_init(void)
> -{
> -	struct device_node *np;
> -	int count;
> -
> -	count = 0;
> -	for_each_compatible_node(np, NULL, "ibm,ocm")
> -		count++;
> -
> -	if (!count)
> -		return 0;
> -
> -	ocm_nodes = kzalloc((count * sizeof(struct ocm_info)), GFP_KERNEL);
> -	if (!ocm_nodes)
> -		return -ENOMEM;
> -
> -	ocm_count = count;
> -	count = 0;
> -
> -	for_each_compatible_node(np, NULL, "ibm,ocm") {
> -		ocm_init_node(count, np);
> -		count++;
> -	}
> -
> -	ocm_debugfs_init();
> -
> -	return 0;
> -}
> -
> -arch_initcall(ppc4xx_ocm_init);
> 
