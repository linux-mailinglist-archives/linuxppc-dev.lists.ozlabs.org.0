Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EA72D8CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:54:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RmZ05eaH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgGRX65tyz30fC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RmZ05eaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgGPg6SrSz2yyg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 14:52:23 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso5526466b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686631940; x=1689223940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqWfLf6LtNevvyEvLC6aavfBdfafonG2GRYPOTxFkOw=;
        b=RmZ05eaHupikD6lyBI8fxKLA9WPe5Gy2jjeYimvMveK21YLnNcNLJSteglPMqldfTi
         39vv0butoSqIcvvqX46dDf+iQU0mJhFRIObvyh/giodENlVEaPtRjh5B3H6mh7+PK1qp
         aJwpfe8lwzbk+H3eZ1gBDW27/6ZtK+jz3TyBGaSDMXUI5Mua//owLAtuqfLeNmyyIe5K
         eeqG5NWPrxYgNN/9ZEKKmPZJYUKIjArGxrZXMSxJjGoNBzMBurhw+Y5ZgQxPkrkG2KmU
         wWHivsP9QnAkD1umQb7pGKD3mHAuZOuX+qrQBpYEfkrBj+Dys6/izcm5JuFbSEXamam3
         M7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686631940; x=1689223940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqWfLf6LtNevvyEvLC6aavfBdfafonG2GRYPOTxFkOw=;
        b=gfqlbKYO/K/tI+JVyXycOUEdtlzkuDi5IPSX0dOEPaK2XmW/s+G0huY0z/SuZJF0/n
         /UIjviQIrwAwD+TwhNsj8z7Y9zkegF674Z6ZhrG4ZxaZBukOTYU6wP1RVEzFM1mWRprw
         jTnctz7UhFAcISJeDcALI22kYX2CNDhYGf2q8INUbkbkH3o4b6YMVFMuRNKwmkFwpa+w
         ABiUyChTrmyWJ0fbLCSWOdgb2B9CJSkuv3J/tl7sbtAc83KideF0s8ecn1i0IasprrOr
         84HvfkRJbxeUpTd0v5lMrtZoraWgz6uC8XmU8RFytN20JO3HJNPYtKZo1uwqAqTsm1SQ
         5roQ==
X-Gm-Message-State: AC+VfDz+XqDxQg5lgLccaGLIUfhyfPYxi2sAOeTnKVGrIVwUSi4r/3rA
	jjdT2+k3P/aV7J45peyG+TtdH9ak+Z8=
X-Google-Smtp-Source: ACHHUZ4JtAnmFupao2riHFqW4XZa9+p+eW3E25UBxk81732BbNoXtOP15KRjVGbwRFBGGwH7AJhGtA==
X-Received: by 2002:a05:6a21:3993:b0:10e:e58d:ce85 with SMTP id ad19-20020a056a21399300b0010ee58dce85mr12336311pzc.10.1686631939927;
        Mon, 12 Jun 2023 21:52:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id p10-20020a62ab0a000000b00625d84a0194sm7700916pff.107.2023.06.12.21.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:52:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/3] powernv/pci: Remove ioda1 support
Date: Tue, 13 Jun 2023 14:22:00 +0930
Message-Id: <20230613045202.294451-2-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613045202.294451-1-joel@jms.id.au>
References: <20230613045202.294451-1-joel@jms.id.au>
MIME-Version: 1.0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The final "VPL" Power7 boxes that were used for powernv bringup have
been scrapped, meaning there are no machines with ioda1 left.

This patch removes the obvious unused code.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 448 +---------------------
 arch/powerpc/platforms/powernv/pci.c      |   5 -
 arch/powerpc/platforms/powernv/pci.h      |   4 -
 3 files changed, 2 insertions(+), 455 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index a02e9cdb5b5d..2c4e842c2749 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -45,10 +45,6 @@
 #include "pci.h"
 #include "../../../../drivers/pci/pci.h"
 
-#define PNV_IODA1_M64_NUM	16	/* Number of M64 BARs	*/
-#define PNV_IODA1_M64_SEGS	8	/* Segments per M64 BAR	*/
-#define PNV_IODA1_DMA32_SEGSIZE	0x10000000
-
 static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
@@ -280,86 +276,6 @@ static void pnv_ioda_reserve_dev_m64_pe(struct pci_dev *pdev,
 	}
 }
 
-static int pnv_ioda1_init_m64(struct pnv_phb *phb)
-{
-	struct resource *r;
-	int index;
-
-	/*
-	 * There are 16 M64 BARs, each of which has 8 segments. So
-	 * there are as many M64 segments as the maximum number of
-	 * PEs, which is 128.
-	 */
-	for (index = 0; index < PNV_IODA1_M64_NUM; index++) {
-		unsigned long base, segsz = phb->ioda.m64_segsize;
-		int64_t rc;
-
-		base = phb->ioda.m64_base +
-		       index * PNV_IODA1_M64_SEGS * segsz;
-		rc = opal_pci_set_phb_mem_window(phb->opal_id,
-				OPAL_M64_WINDOW_TYPE, index, base, 0,
-				PNV_IODA1_M64_SEGS * segsz);
-		if (rc != OPAL_SUCCESS) {
-			pr_warn("  Error %lld setting M64 PHB#%x-BAR#%d\n",
-				rc, phb->hose->global_number, index);
-			goto fail;
-		}
-
-		rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				OPAL_M64_WINDOW_TYPE, index,
-				OPAL_ENABLE_M64_SPLIT);
-		if (rc != OPAL_SUCCESS) {
-			pr_warn("  Error %lld enabling M64 PHB#%x-BAR#%d\n",
-				rc, phb->hose->global_number, index);
-			goto fail;
-		}
-	}
-
-	for (index = 0; index < phb->ioda.total_pe_num; index++) {
-		int64_t rc;
-
-		/*
-		 * P7IOC supports M64DT, which helps mapping M64 segment
-		 * to one particular PE#. However, PHB3 has fixed mapping
-		 * between M64 segment and PE#. In order to have same logic
-		 * for P7IOC and PHB3, we enforce fixed mapping between M64
-		 * segment and PE# on P7IOC.
-		 */
-		rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-				index, OPAL_M64_WINDOW_TYPE,
-				index / PNV_IODA1_M64_SEGS,
-				index % PNV_IODA1_M64_SEGS);
-		if (rc != OPAL_SUCCESS) {
-			pr_warn("%s: Error %lld mapping M64 for PHB#%x-PE#%x\n",
-				__func__, rc, phb->hose->global_number,
-				index);
-			goto fail;
-		}
-	}
-
-	/*
-	 * Exclude the segments for reserved and root bus PE, which
-	 * are first or last two PEs.
-	 */
-	r = &phb->hose->mem_resources[1];
-	if (phb->ioda.reserved_pe_idx == 0)
-		r->start += (2 * phb->ioda.m64_segsize);
-	else if (phb->ioda.reserved_pe_idx == (phb->ioda.total_pe_num - 1))
-		r->end -= (2 * phb->ioda.m64_segsize);
-	else
-		WARN(1, "Wrong reserved PE#%x on PHB#%x\n",
-		     phb->ioda.reserved_pe_idx, phb->hose->global_number);
-
-	return 0;
-
-fail:
-	for ( ; index >= 0; index--)
-		opal_pci_phb_mmio_enable(phb->opal_id,
-			OPAL_M64_WINDOW_TYPE, index, OPAL_DISABLE_M64);
-
-	return -EIO;
-}
-
 static void pnv_ioda_reserve_m64_pe(struct pci_bus *bus,
 				    unsigned long *pe_bitmap,
 				    bool all)
@@ -518,10 +434,7 @@ static void __init pnv_ioda_parse_m64_window(struct pnv_phb *phb)
 	 * Setup init functions for M64 based on IODA version, IODA3 uses
 	 * the IODA2 code.
 	 */
-	if (phb->type == PNV_PHB_IODA1)
-		phb->init_m64 = pnv_ioda1_init_m64;
-	else
-		phb->init_m64 = pnv_ioda2_init_m64;
+	phb->init_m64 = pnv_ioda2_init_m64;
 }
 
 static void pnv_ioda_freeze_pe(struct pnv_phb *phb, int pe_no)
@@ -1097,9 +1010,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 	return pe;
 }
 
-static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe);
-
 static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
@@ -1134,9 +1044,6 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 	 */
 	if (!pe->dma_setup_done && !pci_is_bridge(pdev)) {
 		switch (phb->type) {
-		case PNV_PHB_IODA1:
-			pnv_pci_ioda1_setup_dma_pe(phb, pe);
-			break;
 		case PNV_PHB_IODA2:
 			pnv_pci_ioda2_setup_dma_pe(phb, pe);
 			break;
@@ -1273,53 +1180,6 @@ static inline __be64 __iomem *pnv_ioda_get_inval_reg(struct pnv_phb *phb)
 	return phb->regs + 0x210;
 }
 
-static void pnv_pci_p7ioc_tce_invalidate(struct iommu_table *tbl,
-		unsigned long index, unsigned long npages)
-{
-	struct iommu_table_group_link *tgl = list_first_entry_or_null(
-			&tbl->it_group_list, struct iommu_table_group_link,
-			next);
-	struct pnv_ioda_pe *pe = container_of(tgl->table_group,
-			struct pnv_ioda_pe, table_group);
-	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb);
-	unsigned long start, end, inc;
-
-	start = __pa(((__be64 *)tbl->it_base) + index - tbl->it_offset);
-	end = __pa(((__be64 *)tbl->it_base) + index - tbl->it_offset +
-			npages - 1);
-
-	/* p7ioc-style invalidation, 2 TCEs per write */
-	start |= (1ull << 63);
-	end |= (1ull << 63);
-	inc = 16;
-        end |= inc - 1;	/* round up end to be different than start */
-
-        mb(); /* Ensure above stores are visible */
-        while (start <= end) {
-		__raw_writeq_be(start, invalidate);
-                start += inc;
-        }
-
-	/*
-	 * The iommu layer will do another mb() for us on build()
-	 * and we don't care on free()
-	 */
-}
-
-static int pnv_ioda1_tce_build(struct iommu_table *tbl, long index,
-		long npages, unsigned long uaddr,
-		enum dma_data_direction direction,
-		unsigned long attrs)
-{
-	int ret = pnv_tce_build(tbl, index, npages, uaddr, direction,
-			attrs);
-
-	if (!ret)
-		pnv_pci_p7ioc_tce_invalidate(tbl, index, npages);
-
-	return ret;
-}
-
 #ifdef CONFIG_IOMMU_API
 /* Common for IODA1 and IODA2 */
 static int pnv_ioda_tce_xchg_no_kill(struct iommu_table *tbl, long index,
@@ -1329,25 +1189,6 @@ static int pnv_ioda_tce_xchg_no_kill(struct iommu_table *tbl, long index,
 }
 #endif
 
-static void pnv_ioda1_tce_free(struct iommu_table *tbl, long index,
-		long npages)
-{
-	pnv_tce_free(tbl, index, npages);
-
-	pnv_pci_p7ioc_tce_invalidate(tbl, index, npages);
-}
-
-static struct iommu_table_ops pnv_ioda1_iommu_ops = {
-	.set = pnv_ioda1_tce_build,
-#ifdef CONFIG_IOMMU_API
-	.xchg_no_kill = pnv_ioda_tce_xchg_no_kill,
-	.tce_kill = pnv_pci_p7ioc_tce_invalidate,
-	.useraddrptr = pnv_tce_useraddrptr,
-#endif
-	.clear = pnv_ioda1_tce_free,
-	.get = pnv_tce_get,
-};
-
 #define PHB3_TCE_KILL_INVAL_ALL		PPC_BIT(0)
 #define PHB3_TCE_KILL_INVAL_PE		PPC_BIT(1)
 #define PHB3_TCE_KILL_INVAL_ONE		PPC_BIT(2)
@@ -1453,182 +1294,6 @@ static struct iommu_table_ops pnv_ioda2_iommu_ops = {
 	.free = pnv_pci_ioda2_table_free_pages,
 };
 
-static int pnv_pci_ioda_dev_dma_weight(struct pci_dev *dev, void *data)
-{
-	unsigned int *weight = (unsigned int *)data;
-
-	/* This is quite simplistic. The "base" weight of a device
-	 * is 10. 0 means no DMA is to be accounted for it.
-	 */
-	if (dev->hdr_type != PCI_HEADER_TYPE_NORMAL)
-		return 0;
-
-	if (dev->class == PCI_CLASS_SERIAL_USB_UHCI ||
-	    dev->class == PCI_CLASS_SERIAL_USB_OHCI ||
-	    dev->class == PCI_CLASS_SERIAL_USB_EHCI)
-		*weight += 3;
-	else if ((dev->class >> 8) == PCI_CLASS_STORAGE_RAID)
-		*weight += 15;
-	else
-		*weight += 10;
-
-	return 0;
-}
-
-static unsigned int pnv_pci_ioda_pe_dma_weight(struct pnv_ioda_pe *pe)
-{
-	unsigned int weight = 0;
-
-	/* SRIOV VF has same DMA32 weight as its PF */
-#ifdef CONFIG_PCI_IOV
-	if ((pe->flags & PNV_IODA_PE_VF) && pe->parent_dev) {
-		pnv_pci_ioda_dev_dma_weight(pe->parent_dev, &weight);
-		return weight;
-	}
-#endif
-
-	if ((pe->flags & PNV_IODA_PE_DEV) && pe->pdev) {
-		pnv_pci_ioda_dev_dma_weight(pe->pdev, &weight);
-	} else if ((pe->flags & PNV_IODA_PE_BUS) && pe->pbus) {
-		struct pci_dev *pdev;
-
-		list_for_each_entry(pdev, &pe->pbus->devices, bus_list)
-			pnv_pci_ioda_dev_dma_weight(pdev, &weight);
-	} else if ((pe->flags & PNV_IODA_PE_BUS_ALL) && pe->pbus) {
-		pci_walk_bus(pe->pbus, pnv_pci_ioda_dev_dma_weight, &weight);
-	}
-
-	return weight;
-}
-
-static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe)
-{
-
-	struct page *tce_mem = NULL;
-	struct iommu_table *tbl;
-	unsigned int weight, total_weight = 0;
-	unsigned int tce32_segsz, base, segs, avail, i;
-	int64_t rc;
-	void *addr;
-
-	/* XXX FIXME: Handle 64-bit only DMA devices */
-	/* XXX FIXME: Provide 64-bit DMA facilities & non-4K TCE tables etc.. */
-	/* XXX FIXME: Allocate multi-level tables on PHB3 */
-	weight = pnv_pci_ioda_pe_dma_weight(pe);
-	if (!weight)
-		return;
-
-	pci_walk_bus(phb->hose->bus, pnv_pci_ioda_dev_dma_weight,
-		     &total_weight);
-	segs = (weight * phb->ioda.dma32_count) / total_weight;
-	if (!segs)
-		segs = 1;
-
-	/*
-	 * Allocate contiguous DMA32 segments. We begin with the expected
-	 * number of segments. With one more attempt, the number of DMA32
-	 * segments to be allocated is decreased by one until one segment
-	 * is allocated successfully.
-	 */
-	do {
-		for (base = 0; base <= phb->ioda.dma32_count - segs; base++) {
-			for (avail = 0, i = base; i < base + segs; i++) {
-				if (phb->ioda.dma32_segmap[i] ==
-				    IODA_INVALID_PE)
-					avail++;
-			}
-
-			if (avail == segs)
-				goto found;
-		}
-	} while (--segs);
-
-	if (!segs) {
-		pe_warn(pe, "No available DMA32 segments\n");
-		return;
-	}
-
-found:
-	tbl = pnv_pci_table_alloc(phb->hose->node);
-	if (WARN_ON(!tbl))
-		return;
-
-#ifdef CONFIG_IOMMU_API
-	pe->table_group.ops = &spapr_tce_table_group_ops;
-	pe->table_group.pgsizes = SZ_4K;
-#endif
-	iommu_register_group(&pe->table_group, phb->hose->global_number,
-			pe->pe_number);
-	pnv_pci_link_table_and_group(phb->hose->node, 0, tbl, &pe->table_group);
-
-	/* Grab a 32-bit TCE table */
-	pe_info(pe, "DMA weight %d (%d), assigned (%d) %d DMA32 segments\n",
-		weight, total_weight, base, segs);
-	pe_info(pe, " Setting up 32-bit TCE table at %08x..%08x\n",
-		base * PNV_IODA1_DMA32_SEGSIZE,
-		(base + segs) * PNV_IODA1_DMA32_SEGSIZE - 1);
-
-	/* XXX Currently, we allocate one big contiguous table for the
-	 * TCEs. We only really need one chunk per 256M of TCE space
-	 * (ie per segment) but that's an optimization for later, it
-	 * requires some added smarts with our get/put_tce implementation
-	 *
-	 * Each TCE page is 4KB in size and each TCE entry occupies 8
-	 * bytes
-	 */
-	tce32_segsz = PNV_IODA1_DMA32_SEGSIZE >> (IOMMU_PAGE_SHIFT_4K - 3);
-	tce_mem = alloc_pages_node(phb->hose->node, GFP_KERNEL,
-				   get_order(tce32_segsz * segs));
-	if (!tce_mem) {
-		pe_err(pe, " Failed to allocate a 32-bit TCE memory\n");
-		goto fail;
-	}
-	addr = page_address(tce_mem);
-	memset(addr, 0, tce32_segsz * segs);
-
-	/* Configure HW */
-	for (i = 0; i < segs; i++) {
-		rc = opal_pci_map_pe_dma_window(phb->opal_id,
-					      pe->pe_number,
-					      base + i, 1,
-					      __pa(addr) + tce32_segsz * i,
-					      tce32_segsz, IOMMU_PAGE_SIZE_4K);
-		if (rc) {
-			pe_err(pe, " Failed to configure 32-bit TCE table, err %lld\n",
-			       rc);
-			goto fail;
-		}
-	}
-
-	/* Setup DMA32 segment mapping */
-	for (i = base; i < base + segs; i++)
-		phb->ioda.dma32_segmap[i] = pe->pe_number;
-
-	/* Setup linux iommu table */
-	pnv_pci_setup_iommu_table(tbl, addr, tce32_segsz * segs,
-				  base * PNV_IODA1_DMA32_SEGSIZE,
-				  IOMMU_PAGE_SHIFT_4K);
-
-	tbl->it_ops = &pnv_ioda1_iommu_ops;
-	pe->table_group.tce32_start = tbl->it_offset << tbl->it_page_shift;
-	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
-	tbl->it_index = (phb->hose->global_number << 16) | pe->pe_number;
-	if (!iommu_init_table(tbl, phb->hose->node, 0, 0))
-		panic("Failed to initialize iommu table");
-
-	pe->dma_setup_done = true;
-	return;
- fail:
-	/* XXX Failure: Try to fallback to 64-bit only ? */
-	if (tce_mem)
-		__free_pages(tce_mem, get_order(tce32_segsz * segs));
-	if (tbl) {
-		pnv_pci_unlink_table_and_group(tbl, &pe->table_group);
-		iommu_tce_table_put(tbl);
-	}
-}
-
 static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
 		int num, struct iommu_table *tbl)
 {
@@ -2707,57 +2372,6 @@ static bool pnv_ocapi_enable_device_hook(struct pci_dev *dev)
 	return true;
 }
 
-static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
-				       int num)
-{
-	struct pnv_ioda_pe *pe = container_of(table_group,
-					      struct pnv_ioda_pe, table_group);
-	struct pnv_phb *phb = pe->phb;
-	unsigned int idx;
-	long rc;
-
-	pe_info(pe, "Removing DMA window #%d\n", num);
-	for (idx = 0; idx < phb->ioda.dma32_count; idx++) {
-		if (phb->ioda.dma32_segmap[idx] != pe->pe_number)
-			continue;
-
-		rc = opal_pci_map_pe_dma_window(phb->opal_id, pe->pe_number,
-						idx, 0, 0ul, 0ul, 0ul);
-		if (rc != OPAL_SUCCESS) {
-			pe_warn(pe, "Failure %ld unmapping DMA32 segment#%d\n",
-				rc, idx);
-			return rc;
-		}
-
-		phb->ioda.dma32_segmap[idx] = IODA_INVALID_PE;
-	}
-
-	pnv_pci_unlink_table_and_group(table_group->tables[num], table_group);
-	return OPAL_SUCCESS;
-}
-
-static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
-{
-	struct iommu_table *tbl = pe->table_group.tables[0];
-	int64_t rc;
-
-	if (!pe->dma_setup_done)
-		return;
-
-	rc = pnv_pci_ioda1_unset_window(&pe->table_group, 0);
-	if (rc != OPAL_SUCCESS)
-		return;
-
-	pnv_pci_p7ioc_tce_invalidate(tbl, tbl->it_offset, tbl->it_size);
-	if (pe->table_group.group) {
-		iommu_group_put(pe->table_group.group);
-		WARN_ON(pe->table_group.group);
-	}
-
-	free_pages(tbl->it_base, get_order(tbl->it_size << 3));
-	iommu_tce_table_put(tbl);
-}
-
 void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table *tbl = pe->table_group.tables[0];
@@ -2806,13 +2420,7 @@ static void pnv_ioda_release_pe_seg(struct pnv_ioda_pe *pe)
 {
 	struct pnv_phb *phb = pe->phb;
 
-	if (phb->type == PNV_PHB_IODA1) {
-		pnv_ioda_free_pe_seg(pe, OPAL_IO_WINDOW_TYPE,
-				     phb->ioda.io_segmap);
-		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
-				     phb->ioda.m32_segmap);
-		/* M64 is pre-configured by pnv_ioda1_init_m64() */
-	} else if (phb->type == PNV_PHB_IODA2) {
+	if (phb->type == PNV_PHB_IODA2) {
 		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
 				     phb->ioda.m32_segmap);
 	}
@@ -2830,9 +2438,6 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 	mutex_unlock(&phb->ioda.pe_list_mutex);
 
 	switch (phb->type) {
-	case PNV_PHB_IODA1:
-		pnv_pci_ioda1_release_pe_dma(pe);
-		break;
 	case PNV_PHB_IODA2:
 		pnv_pci_ioda2_release_pe_dma(pe);
 		break;
@@ -2981,7 +2586,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	struct pci_controller *hose;
 	struct pnv_phb *phb;
 	unsigned long size, m64map_off, m32map_off, pemap_off;
-	unsigned long iomap_off = 0, dma32map_off = 0;
 	struct pnv_ioda_pe *root_pe;
 	struct resource r;
 	const __be64 *prop64;
@@ -3092,10 +2696,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	phb->ioda.io_segsize = phb->ioda.io_size / phb->ioda.total_pe_num;
 	phb->ioda.io_pci_base = 0; /* XXX calculate this ? */
 
-	/* Calculate how many 32-bit TCE segments we have */
-	phb->ioda.dma32_count = phb->ioda.m32_pci_base /
-				PNV_IODA1_DMA32_SEGSIZE;
-
 	/* Allocate aux data & arrays. We don't have IO ports on PHB3 */
 	size = ALIGN(max_t(unsigned, phb->ioda.total_pe_num, 8) / 8,
 			sizeof(unsigned long));
@@ -3103,13 +2703,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	size += phb->ioda.total_pe_num * sizeof(phb->ioda.m64_segmap[0]);
 	m32map_off = size;
 	size += phb->ioda.total_pe_num * sizeof(phb->ioda.m32_segmap[0]);
-	if (phb->type == PNV_PHB_IODA1) {
-		iomap_off = size;
-		size += phb->ioda.total_pe_num * sizeof(phb->ioda.io_segmap[0]);
-		dma32map_off = size;
-		size += phb->ioda.dma32_count *
-			sizeof(phb->ioda.dma32_segmap[0]);
-	}
 	pemap_off = size;
 	size += phb->ioda.total_pe_num * sizeof(struct pnv_ioda_pe);
 	aux = kzalloc(size, GFP_KERNEL);
@@ -3123,15 +2716,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		phb->ioda.m64_segmap[segno] = IODA_INVALID_PE;
 		phb->ioda.m32_segmap[segno] = IODA_INVALID_PE;
 	}
-	if (phb->type == PNV_PHB_IODA1) {
-		phb->ioda.io_segmap = aux + iomap_off;
-		for (segno = 0; segno < phb->ioda.total_pe_num; segno++)
-			phb->ioda.io_segmap[segno] = IODA_INVALID_PE;
-
-		phb->ioda.dma32_segmap = aux + dma32map_off;
-		for (segno = 0; segno < phb->ioda.dma32_count; segno++)
-			phb->ioda.dma32_segmap[segno] = IODA_INVALID_PE;
-	}
 	phb->ioda.pe_array = aux + pemap_off;
 
 	/*
@@ -3155,10 +2739,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	INIT_LIST_HEAD(&phb->ioda.pe_list);
 	mutex_init(&phb->ioda.pe_list_mutex);
 
-	/* Calculate how many 32-bit TCE segments we have */
-	phb->ioda.dma32_count = phb->ioda.m32_pci_base /
-				PNV_IODA1_DMA32_SEGSIZE;
-
 #if 0 /* We should really do that ... */
 	rc = opal_pci_set_phb_mem_window(opal->phb_id,
 					 window_type,
@@ -3265,27 +2845,3 @@ static void pnv_npu2_opencapi_cfg_size_fixup(struct pci_dev *dev)
 		dev->cfg_size = PCI_CFG_SPACE_EXP_SIZE;
 }
 DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, pnv_npu2_opencapi_cfg_size_fixup);
-
-void __init pnv_pci_init_ioda_hub(struct device_node *np)
-{
-	struct device_node *phbn;
-	const __be64 *prop64;
-	u64 hub_id;
-
-	pr_info("Probing IODA IO-Hub %pOF\n", np);
-
-	prop64 = of_get_property(np, "ibm,opal-hubid", NULL);
-	if (!prop64) {
-		pr_err(" Missing \"ibm,opal-hubid\" property !\n");
-		return;
-	}
-	hub_id = be64_to_cpup(prop64);
-	pr_devel(" HUB-ID : 0x%016llx\n", hub_id);
-
-	/* Count child PHBs */
-	for_each_child_of_node(np, phbn) {
-		/* Look for IODA1 PHBs */
-		if (of_device_is_compatible(phbn, "ibm,ioda-phb"))
-			pnv_pci_init_ioda_phb(phbn, hub_id, PNV_PHB_IODA1);
-	}
-}
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 7725492097b6..35f566aa0424 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -845,11 +845,6 @@ void __init pnv_pci_init(void)
 	pcie_ports_disabled = true;
 #endif
 
-	/* Look for IODA IO-Hubs. */
-	for_each_compatible_node(np, NULL, "ibm,ioda-hub") {
-		pnv_pci_init_ioda_hub(np);
-	}
-
 	/* Look for ioda2 built-in PHB3's */
 	for_each_compatible_node(np, NULL, "ibm,ioda2-phb")
 		pnv_pci_init_ioda2_phb(np);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index f12643958b8d..3353db882e35 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -163,10 +163,6 @@ struct pnv_phb {
 		unsigned int		*m32_segmap;
 		unsigned int		*io_segmap;
 
-		/* DMA32 segment maps - IODA1 only */
-		unsigned int		dma32_count;
-		unsigned int		*dma32_segmap;
-
 		/* IRQ chip */
 		int			irq_chip_init;
 		struct irq_chip		irq_chip;
-- 
2.39.2

