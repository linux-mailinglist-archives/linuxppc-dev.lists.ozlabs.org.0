Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C72344894
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:05:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yVN66y7z3c8t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:05:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XIUQDC15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3306c2f250ce1c08884c+6420+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=XIUQDC15; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yTx3vflz301F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:05:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zwoAIOadvib4Fk28NzWecyeARZbw1KchDa5Vf79yCAs=; b=XIUQDC15mj8AcUAGEoBJjS5hsf
 SuXnqrv+o3x6mJ5k5L7XEx1jyBWLved+5yWhgENK9JeUbrF/VoJuA/zOD+CjJM9HH1eB2DhhH2bZv
 KZ3/UpOIEH6RMZupAwcR/QAweaGm4qnCwq1nb0wkhmbMOEQGleOXxl2ILoM5U7jISBdMGVqY7CGDW
 AHAPGG+fyOEKiHa4F9FU2O2bawW6byEE83RPkHv1p82Bjccubrtw3qf2cVsEfQw+W4P0FLeuDsEx5
 YnLgkJgi45J9cwXSZ8im9TiLnjZihHsgTdDeeFKS9r4ESJIVjtLMM14KPPOS3wl4aNcyEeee2Duhz
 HqYlx+cA==;
Received: from [2001:4bb8:191:f692:8c8d:c425:8476:e5e8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOM4t-008gWU-Iv; Mon, 22 Mar 2021 15:02:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 2/2] powerpc/powernv: remove the nvlink support
Date: Mon, 22 Mar 2021 16:01:55 +0100
Message-Id: <20210322150155.797882-3-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322150155.797882-1-hch@lst.de>
References: <20210322150155.797882-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This code was only used by the vfio-nvlink2 code, which itself had no
proper use.  Drop this huge chunk of code build into every powernv
or generic build.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/opal.h            |   3 -
 arch/powerpc/include/asm/pci-bridge.h      |   1 -
 arch/powerpc/include/asm/pci.h             |   7 -
 arch/powerpc/platforms/powernv/Makefile    |   2 +-
 arch/powerpc/platforms/powernv/npu-dma.c   | 705 ---------------------
 arch/powerpc/platforms/powernv/opal-call.c |   2 -
 arch/powerpc/platforms/powernv/pci-ioda.c  | 185 +-----
 arch/powerpc/platforms/powernv/pci.c       |  11 -
 arch/powerpc/platforms/powernv/pci.h       |  17 +-
 arch/powerpc/platforms/pseries/pci.c       |  23 -
 10 files changed, 8 insertions(+), 948 deletions(-)
 delete mode 100644 arch/powerpc/platforms/powernv/npu-dma.c

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e224..06eaa231697344 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -28,9 +28,6 @@ extern struct device_node *opal_node;
 
 /* API functions */
 int64_t opal_invalid_call(void);
-int64_t opal_npu_destroy_context(uint64_t phb_id, uint64_t pid, uint64_t bdf);
-int64_t opal_npu_init_context(uint64_t phb_id, int pasid, uint64_t msr,
-			uint64_t bdf);
 int64_t opal_npu_map_lpar(uint64_t phb_id, uint64_t bdf, uint64_t lparid,
 			uint64_t lpcr);
 int64_t opal_npu_spa_setup(uint64_t phb_id, uint32_t bdfn,
diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index d2a2a14e56f91e..74424c14515ce0 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -126,7 +126,6 @@ struct pci_controller {
 #endif	/* CONFIG_PPC64 */
 
 	void *private_data;
-	struct npu *npu;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 6436f0b41539e3..d1f53260725ca7 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -119,11 +119,4 @@ extern void pcibios_scan_phb(struct pci_controller *hose);
 
 #endif	/* __KERNEL__ */
 
-extern struct pci_dev *pnv_pci_get_gpu_dev(struct pci_dev *npdev);
-extern struct pci_dev *pnv_pci_get_npu_dev(struct pci_dev *gpdev, int index);
-extern int pnv_npu2_init(struct pci_controller *hose);
-extern int pnv_npu2_map_lpar_dev(struct pci_dev *gpdev, unsigned int lparid,
-		unsigned long msr);
-extern int pnv_npu2_unmap_lpar_dev(struct pci_dev *gpdev);
-
 #endif /* __ASM_POWERPC_PCI_H */
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 2eb6ae150d1fd5..be2546b968165e 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
 obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_PRESERVE_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_OPAL_CORE)	+= opal-core.o
-obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
+obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o pci-ioda-tce.o
 obj-$(CONFIG_PCI_IOV)   += pci-sriov.o
 obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
 obj-$(CONFIG_EEH)	+= eeh-powernv.o
diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
deleted file mode 100644
index b711dc3262a308..00000000000000
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ /dev/null
@@ -1,705 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * This file implements the DMA operations for NVLink devices. The NPU
- * devices all point to the same iommu table as the parent PCI device.
- *
- * Copyright Alistair Popple, IBM Corporation 2015.
- */
-
-#include <linux/mmu_notifier.h>
-#include <linux/mmu_context.h>
-#include <linux/of.h>
-#include <linux/pci.h>
-#include <linux/memblock.h>
-#include <linux/sizes.h>
-
-#include <asm/debugfs.h>
-#include <asm/powernv.h>
-#include <asm/ppc-pci.h>
-#include <asm/opal.h>
-
-#include "pci.h"
-
-static struct pci_dev *get_pci_dev(struct device_node *dn)
-{
-	struct pci_dn *pdn = PCI_DN(dn);
-	struct pci_dev *pdev;
-
-	pdev = pci_get_domain_bus_and_slot(pci_domain_nr(pdn->phb->bus),
-					   pdn->busno, pdn->devfn);
-
-	/*
-	 * pci_get_domain_bus_and_slot() increased the reference count of
-	 * the PCI device, but callers don't need that actually as the PE
-	 * already holds a reference to the device. Since callers aren't
-	 * aware of the reference count change, call pci_dev_put() now to
-	 * avoid leaks.
-	 */
-	if (pdev)
-		pci_dev_put(pdev);
-
-	return pdev;
-}
-
-/* Given a NPU device get the associated PCI device. */
-struct pci_dev *pnv_pci_get_gpu_dev(struct pci_dev *npdev)
-{
-	struct device_node *dn;
-	struct pci_dev *gpdev;
-
-	if (WARN_ON(!npdev))
-		return NULL;
-
-	if (WARN_ON(!npdev->dev.of_node))
-		return NULL;
-
-	/* Get assoicated PCI device */
-	dn = of_parse_phandle(npdev->dev.of_node, "ibm,gpu", 0);
-	if (!dn)
-		return NULL;
-
-	gpdev = get_pci_dev(dn);
-	of_node_put(dn);
-
-	return gpdev;
-}
-EXPORT_SYMBOL(pnv_pci_get_gpu_dev);
-
-/* Given the real PCI device get a linked NPU device. */
-struct pci_dev *pnv_pci_get_npu_dev(struct pci_dev *gpdev, int index)
-{
-	struct device_node *dn;
-	struct pci_dev *npdev;
-
-	if (WARN_ON(!gpdev))
-		return NULL;
-
-	/* Not all PCI devices have device-tree nodes */
-	if (!gpdev->dev.of_node)
-		return NULL;
-
-	/* Get assoicated PCI device */
-	dn = of_parse_phandle(gpdev->dev.of_node, "ibm,npu", index);
-	if (!dn)
-		return NULL;
-
-	npdev = get_pci_dev(dn);
-	of_node_put(dn);
-
-	return npdev;
-}
-EXPORT_SYMBOL(pnv_pci_get_npu_dev);
-
-#ifdef CONFIG_IOMMU_API
-/*
- * Returns the PE assoicated with the PCI device of the given
- * NPU. Returns the linked pci device if pci_dev != NULL.
- */
-static struct pnv_ioda_pe *get_gpu_pci_dev_and_pe(struct pnv_ioda_pe *npe,
-						  struct pci_dev **gpdev)
-{
-	struct pnv_phb *phb;
-	struct pci_controller *hose;
-	struct pci_dev *pdev;
-	struct pnv_ioda_pe *pe;
-	struct pci_dn *pdn;
-
-	pdev = pnv_pci_get_gpu_dev(npe->pdev);
-	if (!pdev)
-		return NULL;
-
-	pdn = pci_get_pdn(pdev);
-	if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
-		return NULL;
-
-	hose = pci_bus_to_host(pdev->bus);
-	phb = hose->private_data;
-	pe = &phb->ioda.pe_array[pdn->pe_number];
-
-	if (gpdev)
-		*gpdev = pdev;
-
-	return pe;
-}
-
-static long pnv_npu_unset_window(struct iommu_table_group *table_group,
-		int num);
-
-static long pnv_npu_set_window(struct iommu_table_group *table_group, int num,
-		struct iommu_table *tbl)
-{
-	struct pnv_ioda_pe *npe = container_of(table_group, struct pnv_ioda_pe,
-			table_group);
-	struct pnv_phb *phb = npe->phb;
-	int64_t rc;
-	const unsigned long size = tbl->it_indirect_levels ?
-		tbl->it_level_size : tbl->it_size;
-	const __u64 start_addr = tbl->it_offset << tbl->it_page_shift;
-	const __u64 win_size = tbl->it_size << tbl->it_page_shift;
-	int num2 = (num == 0) ? 1 : 0;
-
-	/* NPU has just one TVE so if there is another table, remove it first */
-	if (npe->table_group.tables[num2])
-		pnv_npu_unset_window(&npe->table_group, num2);
-
-	pe_info(npe, "Setting up window %llx..%llx pg=%lx\n",
-			start_addr, start_addr + win_size - 1,
-			IOMMU_PAGE_SIZE(tbl));
-
-	rc = opal_pci_map_pe_dma_window(phb->opal_id,
-			npe->pe_number,
-			npe->pe_number,
-			tbl->it_indirect_levels + 1,
-			__pa(tbl->it_base),
-			size << 3,
-			IOMMU_PAGE_SIZE(tbl));
-	if (rc) {
-		pe_err(npe, "Failed to configure TCE table, err %lld\n", rc);
-		return rc;
-	}
-	pnv_pci_ioda2_tce_invalidate_entire(phb, false);
-
-	/* Add the table to the list so its TCE cache will get invalidated */
-	pnv_pci_link_table_and_group(phb->hose->node, num,
-			tbl, &npe->table_group);
-
-	return 0;
-}
-
-static long pnv_npu_unset_window(struct iommu_table_group *table_group, int num)
-{
-	struct pnv_ioda_pe *npe = container_of(table_group, struct pnv_ioda_pe,
-			table_group);
-	struct pnv_phb *phb = npe->phb;
-	int64_t rc;
-
-	if (!npe->table_group.tables[num])
-		return 0;
-
-	pe_info(npe, "Removing DMA window\n");
-
-	rc = opal_pci_map_pe_dma_window(phb->opal_id, npe->pe_number,
-			npe->pe_number,
-			0/* levels */, 0/* table address */,
-			0/* table size */, 0/* page size */);
-	if (rc) {
-		pe_err(npe, "Unmapping failed, ret = %lld\n", rc);
-		return rc;
-	}
-	pnv_pci_ioda2_tce_invalidate_entire(phb, false);
-
-	pnv_pci_unlink_table_and_group(npe->table_group.tables[num],
-			&npe->table_group);
-
-	return 0;
-}
-
-/* Switch ownership from platform code to external user (e.g. VFIO) */
-static void pnv_npu_take_ownership(struct iommu_table_group *table_group)
-{
-	struct pnv_ioda_pe *npe = container_of(table_group, struct pnv_ioda_pe,
-			table_group);
-	struct pnv_phb *phb = npe->phb;
-	int64_t rc;
-	struct pci_dev *gpdev = NULL;
-
-	/*
-	 * Note: NPU has just a single TVE in the hardware which means that
-	 * while used by the kernel, it can have either 32bit window or
-	 * DMA bypass but never both. So we deconfigure 32bit window only
-	 * if it was enabled at the moment of ownership change.
-	 */
-	if (npe->table_group.tables[0]) {
-		pnv_npu_unset_window(&npe->table_group, 0);
-		return;
-	}
-
-	/* Disable bypass */
-	rc = opal_pci_map_pe_dma_window_real(phb->opal_id,
-			npe->pe_number, npe->pe_number,
-			0 /* bypass base */, 0);
-	if (rc) {
-		pe_err(npe, "Failed to disable bypass, err %lld\n", rc);
-		return;
-	}
-	pnv_pci_ioda2_tce_invalidate_entire(npe->phb, false);
-
-	get_gpu_pci_dev_and_pe(npe, &gpdev);
-	if (gpdev)
-		pnv_npu2_unmap_lpar_dev(gpdev);
-}
-
-static void pnv_npu_release_ownership(struct iommu_table_group *table_group)
-{
-	struct pnv_ioda_pe *npe = container_of(table_group, struct pnv_ioda_pe,
-			table_group);
-	struct pci_dev *gpdev = NULL;
-
-	get_gpu_pci_dev_and_pe(npe, &gpdev);
-	if (gpdev)
-		pnv_npu2_map_lpar_dev(gpdev, 0, MSR_DR | MSR_PR | MSR_HV);
-}
-
-static struct iommu_table_group_ops pnv_pci_npu_ops = {
-	.set_window = pnv_npu_set_window,
-	.unset_window = pnv_npu_unset_window,
-	.take_ownership = pnv_npu_take_ownership,
-	.release_ownership = pnv_npu_release_ownership,
-};
-#endif /* !CONFIG_IOMMU_API */
-
-/*
- * NPU2 ATS
- */
-/* Maximum possible number of ATSD MMIO registers per NPU */
-#define NV_NMMU_ATSD_REGS 8
-#define NV_NPU_MAX_PE_NUM	16
-
-/*
- * A compound NPU IOMMU group which might consist of 1 GPU + 2xNPUs (POWER8) or
- * up to 3 x (GPU + 2xNPUs) (POWER9).
- */
-struct npu_comp {
-	struct iommu_table_group table_group;
-	int pe_num;
-	struct pnv_ioda_pe *pe[NV_NPU_MAX_PE_NUM];
-};
-
-/* An NPU descriptor, valid for POWER9 only */
-struct npu {
-	int index;
-	struct npu_comp npucomp;
-};
-
-#ifdef CONFIG_IOMMU_API
-static long pnv_npu_peers_create_table_userspace(
-		struct iommu_table_group *table_group,
-		int num, __u32 page_shift, __u64 window_size, __u32 levels,
-		struct iommu_table **ptbl)
-{
-	struct npu_comp *npucomp = container_of(table_group, struct npu_comp,
-			table_group);
-
-	if (!npucomp->pe_num || !npucomp->pe[0] ||
-			!npucomp->pe[0]->table_group.ops ||
-			!npucomp->pe[0]->table_group.ops->create_table)
-		return -EFAULT;
-
-	return npucomp->pe[0]->table_group.ops->create_table(
-			&npucomp->pe[0]->table_group, num, page_shift,
-			window_size, levels, ptbl);
-}
-
-static long pnv_npu_peers_set_window(struct iommu_table_group *table_group,
-		int num, struct iommu_table *tbl)
-{
-	int i, j;
-	long ret = 0;
-	struct npu_comp *npucomp = container_of(table_group, struct npu_comp,
-			table_group);
-
-	for (i = 0; i < npucomp->pe_num; ++i) {
-		struct pnv_ioda_pe *pe = npucomp->pe[i];
-
-		if (!pe->table_group.ops->set_window)
-			continue;
-
-		ret = pe->table_group.ops->set_window(&pe->table_group,
-				num, tbl);
-		if (ret)
-			break;
-	}
-
-	if (ret) {
-		for (j = 0; j < i; ++j) {
-			struct pnv_ioda_pe *pe = npucomp->pe[j];
-
-			if (!pe->table_group.ops->unset_window)
-				continue;
-
-			ret = pe->table_group.ops->unset_window(
-					&pe->table_group, num);
-			if (ret)
-				break;
-		}
-	} else {
-		table_group->tables[num] = iommu_tce_table_get(tbl);
-	}
-
-	return ret;
-}
-
-static long pnv_npu_peers_unset_window(struct iommu_table_group *table_group,
-		int num)
-{
-	int i, j;
-	long ret = 0;
-	struct npu_comp *npucomp = container_of(table_group, struct npu_comp,
-			table_group);
-
-	for (i = 0; i < npucomp->pe_num; ++i) {
-		struct pnv_ioda_pe *pe = npucomp->pe[i];
-
-		WARN_ON(npucomp->table_group.tables[num] !=
-				table_group->tables[num]);
-		if (!npucomp->table_group.tables[num])
-			continue;
-
-		if (!pe->table_group.ops->unset_window)
-			continue;
-
-		ret = pe->table_group.ops->unset_window(&pe->table_group, num);
-		if (ret)
-			break;
-	}
-
-	if (ret) {
-		for (j = 0; j < i; ++j) {
-			struct pnv_ioda_pe *pe = npucomp->pe[j];
-
-			if (!npucomp->table_group.tables[num])
-				continue;
-
-			if (!pe->table_group.ops->set_window)
-				continue;
-
-			ret = pe->table_group.ops->set_window(&pe->table_group,
-					num, table_group->tables[num]);
-			if (ret)
-				break;
-		}
-	} else if (table_group->tables[num]) {
-		iommu_tce_table_put(table_group->tables[num]);
-		table_group->tables[num] = NULL;
-	}
-
-	return ret;
-}
-
-static void pnv_npu_peers_take_ownership(struct iommu_table_group *table_group)
-{
-	int i;
-	struct npu_comp *npucomp = container_of(table_group, struct npu_comp,
-			table_group);
-
-	for (i = 0; i < npucomp->pe_num; ++i) {
-		struct pnv_ioda_pe *pe = npucomp->pe[i];
-
-		if (!pe->table_group.ops ||
-		    !pe->table_group.ops->take_ownership)
-			continue;
-		pe->table_group.ops->take_ownership(&pe->table_group);
-	}
-}
-
-static void pnv_npu_peers_release_ownership(
-		struct iommu_table_group *table_group)
-{
-	int i;
-	struct npu_comp *npucomp = container_of(table_group, struct npu_comp,
-			table_group);
-
-	for (i = 0; i < npucomp->pe_num; ++i) {
-		struct pnv_ioda_pe *pe = npucomp->pe[i];
-
-		if (!pe->table_group.ops ||
-		    !pe->table_group.ops->release_ownership)
-			continue;
-		pe->table_group.ops->release_ownership(&pe->table_group);
-	}
-}
-
-static struct iommu_table_group_ops pnv_npu_peers_ops = {
-	.get_table_size = pnv_pci_ioda2_get_table_size,
-	.create_table = pnv_npu_peers_create_table_userspace,
-	.set_window = pnv_npu_peers_set_window,
-	.unset_window = pnv_npu_peers_unset_window,
-	.take_ownership = pnv_npu_peers_take_ownership,
-	.release_ownership = pnv_npu_peers_release_ownership,
-};
-
-static void pnv_comp_attach_table_group(struct npu_comp *npucomp,
-		struct pnv_ioda_pe *pe)
-{
-	if (WARN_ON(npucomp->pe_num == NV_NPU_MAX_PE_NUM))
-		return;
-
-	npucomp->pe[npucomp->pe_num] = pe;
-	++npucomp->pe_num;
-}
-
-static struct iommu_table_group *
-	pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
-{
-	struct iommu_table_group *compound_group;
-	struct npu_comp *npucomp;
-	struct pci_dev *gpdev = NULL;
-	struct pci_controller *hose;
-	struct pci_dev *npdev = NULL;
-
-	list_for_each_entry(gpdev, &pe->pbus->devices, bus_list) {
-		npdev = pnv_pci_get_npu_dev(gpdev, 0);
-		if (npdev)
-			break;
-	}
-
-	if (!npdev)
-		/* It is not an NPU attached device, skip */
-		return NULL;
-
-	hose = pci_bus_to_host(npdev->bus);
-
-	if (hose->npu) {
-		/* P9 case: compound group is per-NPU (all gpus, all links) */
-		npucomp = &hose->npu->npucomp;
-	} else {
-		/* P8 case: Compound group is per-GPU (1 gpu, 2 links) */
-		npucomp = pe->npucomp = kzalloc(sizeof(*npucomp), GFP_KERNEL);
-	}
-
-	compound_group = &npucomp->table_group;
-	if (!compound_group->group) {
-		compound_group->ops = &pnv_npu_peers_ops;
-		iommu_register_group(compound_group, hose->global_number,
-				pe->pe_number);
-
-		/* Steal capabilities from a GPU PE */
-		compound_group->max_dynamic_windows_supported =
-			pe->table_group.max_dynamic_windows_supported;
-		compound_group->tce32_start = pe->table_group.tce32_start;
-		compound_group->tce32_size = pe->table_group.tce32_size;
-		compound_group->max_levels = pe->table_group.max_levels;
-		if (!compound_group->pgsizes)
-			compound_group->pgsizes = pe->table_group.pgsizes;
-	}
-
-	/*
-	 * The gpu would have been added to the iommu group that's created
-	 * for the PE. Pull it out now.
-	 */
-	iommu_del_device(&gpdev->dev);
-
-       /*
-	* I'm not sure this is strictly required, but it's probably a good idea
-	* since the table_group for the PE is going to be attached to the
-	* compound table group. If we leave the PE's iommu group active then
-	* we might have the same table_group being modifiable via two sepeate
-	* iommu groups.
-	*/
-	iommu_group_put(pe->table_group.group);
-
-	/* now put the GPU into the compound group */
-	pnv_comp_attach_table_group(npucomp, pe);
-	iommu_add_device(compound_group, &gpdev->dev);
-
-	return compound_group;
-}
-
-static struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
-{
-	struct iommu_table_group *table_group;
-	struct npu_comp *npucomp;
-	struct pci_dev *gpdev = NULL;
-	struct pci_dev *npdev;
-	struct pnv_ioda_pe *gpe = get_gpu_pci_dev_and_pe(pe, &gpdev);
-
-	WARN_ON(!(pe->flags & PNV_IODA_PE_DEV));
-	if (!gpe)
-		return NULL;
-
-	/*
-	 * IODA2 bridges get this set up from pci_controller_ops::setup_bridge
-	 * but NPU bridges do not have this hook defined so we do it here.
-	 * We do not setup other table group parameters as they won't be used
-	 * anyway - NVLink bridges are subordinate PEs.
-	 */
-	pe->table_group.ops = &pnv_pci_npu_ops;
-
-	table_group = iommu_group_get_iommudata(
-			iommu_group_get(&gpdev->dev));
-
-	/*
-	 * On P9 NPU PHB and PCI PHB support different page sizes,
-	 * keep only matching. We expect here that NVLink bridge PE pgsizes is
-	 * initialized by the caller.
-	 */
-	table_group->pgsizes &= pe->table_group.pgsizes;
-	npucomp = container_of(table_group, struct npu_comp, table_group);
-	pnv_comp_attach_table_group(npucomp, pe);
-
-	list_for_each_entry(npdev, &pe->phb->hose->bus->devices, bus_list) {
-		struct pci_dev *gpdevtmp = pnv_pci_get_gpu_dev(npdev);
-
-		if (gpdevtmp != gpdev)
-			continue;
-
-		iommu_add_device(table_group, &npdev->dev);
-	}
-
-	return table_group;
-}
-
-void pnv_pci_npu_setup_iommu_groups(void)
-{
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
-	struct pnv_ioda_pe *pe;
-
-	/*
-	 * For non-nvlink devices the IOMMU group is registered when the PE is
-	 * configured and devices are added to the group when the per-device
-	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
-	 * only initialise for "normal" IODA PHBs.
-	 *
-	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
-	 * in the same IOMMU group, so that's handled here.
-	 */
-	list_for_each_entry(hose, &hose_list, list_node) {
-		phb = hose->private_data;
-
-		if (phb->type == PNV_PHB_IODA2)
-			list_for_each_entry(pe, &phb->ioda.pe_list, list)
-				pnv_try_setup_npu_table_group(pe);
-	}
-
-	/*
-	 * Now we have all PHBs discovered, time to add NPU devices to
-	 * the corresponding IOMMU groups.
-	 */
-	list_for_each_entry(hose, &hose_list, list_node) {
-		unsigned long  pgsizes;
-
-		phb = hose->private_data;
-
-		if (phb->type != PNV_PHB_NPU_NVLINK)
-			continue;
-
-		pgsizes = pnv_ioda_parse_tce_sizes(phb);
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			/*
-			 * IODA2 bridges get this set up from
-			 * pci_controller_ops::setup_bridge but NPU bridges
-			 * do not have this hook defined so we do it here.
-			 */
-			pe->table_group.pgsizes = pgsizes;
-			pnv_npu_compound_attach(pe);
-		}
-	}
-}
-#endif /* CONFIG_IOMMU_API */
-
-int pnv_npu2_init(struct pci_controller *hose)
-{
-	static int npu_index;
-	struct npu *npu;
-	int ret;
-
-	npu = kzalloc(sizeof(*npu), GFP_KERNEL);
-	if (!npu)
-		return -ENOMEM;
-
-	npu_index++;
-	if (WARN_ON(npu_index >= NV_MAX_NPUS)) {
-		ret = -ENOSPC;
-		goto fail_exit;
-	}
-	npu->index = npu_index;
-	hose->npu = npu;
-
-	return 0;
-
-fail_exit:
-	kfree(npu);
-	return ret;
-}
-
-int pnv_npu2_map_lpar_dev(struct pci_dev *gpdev, unsigned int lparid,
-		unsigned long msr)
-{
-	int ret;
-	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
-	struct pci_controller *hose;
-	struct pnv_phb *nphb;
-
-	if (!npdev)
-		return -ENODEV;
-
-	hose = pci_bus_to_host(npdev->bus);
-	if (hose->npu == NULL) {
-		dev_info_once(&npdev->dev, "Nvlink1 does not support contexts");
-		return 0;
-	}
-
-	nphb = hose->private_data;
-
-	dev_dbg(&gpdev->dev, "Map LPAR opalid=%llu lparid=%u\n",
-			nphb->opal_id, lparid);
-	/*
-	 * Currently we only support radix and non-zero LPCR only makes sense
-	 * for hash tables so skiboot expects the LPCR parameter to be a zero.
-	 */
-	ret = opal_npu_map_lpar(nphb->opal_id, pci_dev_id(gpdev), lparid,
-				0 /* LPCR bits */);
-	if (ret) {
-		dev_err(&gpdev->dev, "Error %d mapping device to LPAR\n", ret);
-		return ret;
-	}
-
-	dev_dbg(&gpdev->dev, "init context opalid=%llu msr=%lx\n",
-			nphb->opal_id, msr);
-	ret = opal_npu_init_context(nphb->opal_id, 0/*__unused*/, msr,
-				    pci_dev_id(gpdev));
-	if (ret < 0)
-		dev_err(&gpdev->dev, "Failed to init context: %d\n", ret);
-	else
-		ret = 0;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pnv_npu2_map_lpar_dev);
-
-void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe, unsigned long msr)
-{
-	struct pci_dev *gpdev;
-
-	list_for_each_entry(gpdev, &gpe->pbus->devices, bus_list)
-		pnv_npu2_map_lpar_dev(gpdev, 0, msr);
-}
-
-int pnv_npu2_unmap_lpar_dev(struct pci_dev *gpdev)
-{
-	int ret;
-	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
-	struct pci_controller *hose;
-	struct pnv_phb *nphb;
-
-	if (!npdev)
-		return -ENODEV;
-
-	hose = pci_bus_to_host(npdev->bus);
-	if (hose->npu == NULL) {
-		dev_info_once(&npdev->dev, "Nvlink1 does not support contexts");
-		return 0;
-	}
-
-	nphb = hose->private_data;
-
-	dev_dbg(&gpdev->dev, "destroy context opalid=%llu\n",
-			nphb->opal_id);
-	ret = opal_npu_destroy_context(nphb->opal_id, 0/*__unused*/,
-				       pci_dev_id(gpdev));
-	if (ret < 0) {
-		dev_err(&gpdev->dev, "Failed to destroy context: %d\n", ret);
-		return ret;
-	}
-
-	/* Set LPID to 0 anyway, just to be safe */
-	dev_dbg(&gpdev->dev, "Map LPAR opalid=%llu lparid=0\n", nphb->opal_id);
-	ret = opal_npu_map_lpar(nphb->opal_id, pci_dev_id(gpdev), 0 /*LPID*/,
-				0 /* LPCR bits */);
-	if (ret)
-		dev_err(&gpdev->dev, "Error %d mapping device to LPAR\n", ret);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pnv_npu2_unmap_lpar_dev);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f64..01401e3da7ca14 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -267,8 +267,6 @@ OPAL_CALL(opal_xive_get_queue_state,		OPAL_XIVE_GET_QUEUE_STATE);
 OPAL_CALL(opal_xive_set_queue_state,		OPAL_XIVE_SET_QUEUE_STATE);
 OPAL_CALL(opal_xive_get_vp_state,		OPAL_XIVE_GET_VP_STATE);
 OPAL_CALL(opal_signal_system_reset,		OPAL_SIGNAL_SYSTEM_RESET);
-OPAL_CALL(opal_npu_init_context,		OPAL_NPU_INIT_CONTEXT);
-OPAL_CALL(opal_npu_destroy_context,		OPAL_NPU_DESTROY_CONTEXT);
 OPAL_CALL(opal_npu_map_lpar,			OPAL_NPU_MAP_LPAR);
 OPAL_CALL(opal_imc_counters_init,		OPAL_IMC_COUNTERS_INIT);
 OPAL_CALL(opal_imc_counters_start,		OPAL_IMC_COUNTERS_START);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f0f901683a2fe1..5c88d7145a23e0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -47,8 +47,7 @@
 #define PNV_IODA1_M64_SEGS	8	/* Segments per M64 BAR	*/
 #define PNV_IODA1_DMA32_SEGSIZE	0x10000000
 
-static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
-					      "NPU_OCAPI" };
+static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
 static void pnv_pci_configure_bus(struct pci_bus *bus);
@@ -192,8 +191,6 @@ void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
 	unsigned int pe_num = pe->pe_number;
 
 	WARN_ON(pe->pdev);
-	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be freed */
-	kfree(pe->npucomp);
 	memset(pe, 0, sizeof(struct pnv_ioda_pe));
 
 	mutex_lock(&phb->ioda.pe_alloc_mutex);
@@ -875,7 +872,7 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	 * Release from all parents PELT-V. NPUs don't have a PELTV
 	 * table
 	 */
-	if (phb->type != PNV_PHB_NPU_NVLINK && phb->type != PNV_PHB_NPU_OCAPI)
+	if (phb->type != PNV_PHB_NPU_OCAPI)
 		pnv_ioda_unset_peltv(phb, pe, parent);
 
 	rc = opal_pci_set_pe(phb->opal_id, pe->pe_number, pe->rid,
@@ -946,7 +943,7 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	 * Configure PELTV. NPUs don't have a PELTV table so skip
 	 * configuration on them.
 	 */
-	if (phb->type != PNV_PHB_NPU_NVLINK && phb->type != PNV_PHB_NPU_OCAPI)
+	if (phb->type != PNV_PHB_NPU_OCAPI)
 		pnv_ioda_set_peltv(phb, pe, true);
 
 	/* Setup reverse map */
@@ -1002,8 +999,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 
 	/* NOTE: We don't get a reference for the pointer in the PE
 	 * data structure, both the device and PE structures should be
-	 * destroyed at the same time. However, removing nvlink
-	 * devices will need some work.
+	 * destroyed at the same time.
 	 *
 	 * At some point we want to remove the PDN completely anyways
 	 */
@@ -1099,113 +1095,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 	return pe;
 }
 
-static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
-{
-	int pe_num, found_pe = false, rc;
-	long rid;
-	struct pnv_ioda_pe *pe;
-	struct pci_dev *gpu_pdev;
-	struct pci_dn *npu_pdn;
-	struct pnv_phb *phb = pci_bus_to_pnvhb(npu_pdev->bus);
-
-	/*
-	 * Intentionally leak a reference on the npu device (for
-	 * nvlink only; this is not an opencapi path) to make sure it
-	 * never goes away, as it's been the case all along and some
-	 * work is needed otherwise.
-	 */
-	pci_dev_get(npu_pdev);
-
-	/*
-	 * Due to a hardware errata PE#0 on the NPU is reserved for
-	 * error handling. This means we only have three PEs remaining
-	 * which need to be assigned to four links, implying some
-	 * links must share PEs.
-	 *
-	 * To achieve this we assign PEs such that NPUs linking the
-	 * same GPU get assigned the same PE.
-	 */
-	gpu_pdev = pnv_pci_get_gpu_dev(npu_pdev);
-	for (pe_num = 0; pe_num < phb->ioda.total_pe_num; pe_num++) {
-		pe = &phb->ioda.pe_array[pe_num];
-		if (!pe->pdev)
-			continue;
-
-		if (pnv_pci_get_gpu_dev(pe->pdev) == gpu_pdev) {
-			/*
-			 * This device has the same peer GPU so should
-			 * be assigned the same PE as the existing
-			 * peer NPU.
-			 */
-			dev_info(&npu_pdev->dev,
-				"Associating to existing PE %x\n", pe_num);
-			npu_pdn = pci_get_pdn(npu_pdev);
-			rid = npu_pdev->bus->number << 8 | npu_pdn->devfn;
-			npu_pdn->pe_number = pe_num;
-			phb->ioda.pe_rmap[rid] = pe->pe_number;
-			pe->device_count++;
-
-			/* Map the PE to this link */
-			rc = opal_pci_set_pe(phb->opal_id, pe_num, rid,
-					OpalPciBusAll,
-					OPAL_COMPARE_RID_DEVICE_NUMBER,
-					OPAL_COMPARE_RID_FUNCTION_NUMBER,
-					OPAL_MAP_PE);
-			WARN_ON(rc != OPAL_SUCCESS);
-			found_pe = true;
-			break;
-		}
-	}
-
-	if (!found_pe)
-		/*
-		 * Could not find an existing PE so allocate a new
-		 * one.
-		 */
-		return pnv_ioda_setup_dev_PE(npu_pdev);
-	else
-		return pe;
-}
-
-static void pnv_ioda_setup_npu_PEs(struct pci_bus *bus)
-{
-	struct pci_dev *pdev;
-
-	list_for_each_entry(pdev, &bus->devices, bus_list)
-		pnv_ioda_setup_npu_PE(pdev);
-}
-
-static void pnv_pci_ioda_setup_nvlink(void)
-{
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
-	struct pnv_ioda_pe *pe;
-
-	list_for_each_entry(hose, &hose_list, list_node) {
-		phb = hose->private_data;
-		if (phb->type == PNV_PHB_NPU_NVLINK) {
-			/* PE#0 is needed for error reporting */
-			pnv_ioda_reserve_pe(phb, 0);
-			pnv_ioda_setup_npu_PEs(hose->bus);
-			if (phb->model == PNV_PHB_MODEL_NPU2)
-				WARN_ON_ONCE(pnv_npu2_init(hose));
-		}
-	}
-	list_for_each_entry(hose, &hose_list, list_node) {
-		phb = hose->private_data;
-		if (phb->type != PNV_PHB_IODA2)
-			continue;
-
-		list_for_each_entry(pe, &phb->ioda.pe_list, list)
-			pnv_npu2_map_lpar(pe, MSR_DR | MSR_PR | MSR_HV);
-	}
-
-#ifdef CONFIG_IOMMU_API
-	/* setup iommu groups so we can do nvlink pass-thru */
-	pnv_pci_npu_setup_iommu_groups();
-#endif
-}
-
 static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 				       struct pnv_ioda_pe *pe);
 
@@ -1468,18 +1357,6 @@ static struct iommu_table_ops pnv_ioda1_iommu_ops = {
 #define PHB3_TCE_KILL_INVAL_PE		PPC_BIT(1)
 #define PHB3_TCE_KILL_INVAL_ONE		PPC_BIT(2)
 
-static void pnv_pci_phb3_tce_invalidate_entire(struct pnv_phb *phb, bool rm)
-{
-	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(phb, rm);
-	const unsigned long val = PHB3_TCE_KILL_INVAL_ALL;
-
-	mb(); /* Ensure previous TCE table stores are visible */
-	if (rm)
-		__raw_rm_writeq_be(val, invalidate);
-	else
-		__raw_writeq_be(val, invalidate);
-}
-
 static inline void pnv_pci_phb3_tce_invalidate_pe(struct pnv_ioda_pe *pe)
 {
 	/* 01xb - invalidate TCEs that match the specified PE# */
@@ -1539,20 +1416,6 @@ static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
 		struct pnv_phb *phb = pe->phb;
 		unsigned int shift = tbl->it_page_shift;
 
-		/*
-		 * NVLink1 can use the TCE kill register directly as
-		 * it's the same as PHB3. NVLink2 is different and
-		 * should go via the OPAL call.
-		 */
-		if (phb->model == PNV_PHB_MODEL_NPU) {
-			/*
-			 * The NVLink hardware does not support TCE kill
-			 * per TCE entry so we have to invalidate
-			 * the entire cache for it.
-			 */
-			pnv_pci_phb3_tce_invalidate_entire(phb, rm);
-			continue;
-		}
 		if (phb->model == PNV_PHB_MODEL_PHB3 && phb->regs)
 			pnv_pci_phb3_tce_invalidate(pe, rm, shift,
 						    index, npages);
@@ -1564,14 +1427,6 @@ static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
 	}
 }
 
-void pnv_pci_ioda2_tce_invalidate_entire(struct pnv_phb *phb, bool rm)
-{
-	if (phb->model == PNV_PHB_MODEL_NPU || phb->model == PNV_PHB_MODEL_PHB3)
-		pnv_pci_phb3_tce_invalidate_entire(phb, rm);
-	else
-		opal_pci_tce_kill(phb->opal_id, OPAL_PCI_TCE_KILL, 0, 0, 0, 0);
-}
-
 static int pnv_ioda2_tce_build(struct iommu_table *tbl, long index,
 		long npages, unsigned long uaddr,
 		enum dma_data_direction direction,
@@ -2450,7 +2305,6 @@ static void pnv_pci_enable_bridges(void)
 
 static void pnv_pci_ioda_fixup(void)
 {
-	pnv_pci_ioda_setup_nvlink();
 	pnv_pci_ioda_create_dbgfs();
 
 	pnv_pci_enable_bridges();
@@ -2823,15 +2677,6 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 		pnv_ioda_release_pe(pe);
 }
 
-static void pnv_npu_disable_device(struct pci_dev *pdev)
-{
-	struct eeh_dev *edev = pci_dev_to_eeh_dev(pdev);
-	struct eeh_pe *eehpe = edev ? edev->pe : NULL;
-
-	if (eehpe && eeh_ops && eeh_ops->reset)
-		eeh_ops->reset(eehpe, EEH_RESET_HOT);
-}
-
 static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 {
 	struct pnv_phb *phb = hose->private_data;
@@ -2873,16 +2718,6 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.shutdown		= pnv_pci_ioda_shutdown,
 };
 
-static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
-	.setup_msi_irqs		= pnv_setup_msi_irqs,
-	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
-	.enable_device_hook	= pnv_pci_enable_device_hook,
-	.window_alignment	= pnv_pci_window_alignment,
-	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
-	.shutdown		= pnv_pci_ioda_shutdown,
-	.disable_device		= pnv_npu_disable_device,
-};
-
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
 	.enable_device_hook	= pnv_ocapi_enable_device_hook,
 	.release_device		= pnv_pci_release_device,
@@ -2956,10 +2791,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		phb->model = PNV_PHB_MODEL_P7IOC;
 	else if (of_device_is_compatible(np, "ibm,power8-pciex"))
 		phb->model = PNV_PHB_MODEL_PHB3;
-	else if (of_device_is_compatible(np, "ibm,power8-npu-pciex"))
-		phb->model = PNV_PHB_MODEL_NPU;
-	else if (of_device_is_compatible(np, "ibm,power9-npu-pciex"))
-		phb->model = PNV_PHB_MODEL_NPU2;
 	else
 		phb->model = PNV_PHB_MODEL_UNKNOWN;
 
@@ -3117,9 +2948,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	ppc_md.pcibios_fixup = pnv_pci_ioda_fixup;
 
 	switch (phb->type) {
-	case PNV_PHB_NPU_NVLINK:
-		hose->controller_ops = pnv_npu_ioda_controller_ops;
-		break;
 	case PNV_PHB_NPU_OCAPI:
 		hose->controller_ops = pnv_npu_ocapi_ioda_controller_ops;
 		break;
@@ -3172,11 +3000,6 @@ void __init pnv_pci_init_ioda2_phb(struct device_node *np)
 	pnv_pci_init_ioda_phb(np, 0, PNV_PHB_IODA2);
 }
 
-void __init pnv_pci_init_npu_phb(struct device_node *np)
-{
-	pnv_pci_init_ioda_phb(np, 0, PNV_PHB_NPU_NVLINK);
-}
-
 void __init pnv_pci_init_npu2_opencapi_phb(struct device_node *np)
 {
 	pnv_pci_init_ioda_phb(np, 0, PNV_PHB_NPU_OCAPI);
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 9b9bca169275a8..b18468dc31ff5b 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -926,17 +926,6 @@ void __init pnv_pci_init(void)
 	for_each_compatible_node(np, NULL, "ibm,ioda3-phb")
 		pnv_pci_init_ioda2_phb(np);
 
-	/* Look for NPU PHBs */
-	for_each_compatible_node(np, NULL, "ibm,ioda2-npu-phb")
-		pnv_pci_init_npu_phb(np);
-
-	/*
-	 * Look for NPU2 PHBs which we treat mostly as NPU PHBs with
-	 * the exception of TCE kill which requires an OPAL call.
-	 */
-	for_each_compatible_node(np, NULL, "ibm,ioda2-npu2-phb")
-		pnv_pci_init_npu_phb(np);
-
 	/* Look for NPU2 OpenCAPI PHBs */
 	for_each_compatible_node(np, NULL, "ibm,ioda2-npu2-opencapi-phb")
 		pnv_pci_init_npu2_opencapi_phb(np);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 36d22920f5a3cb..c8d4f222a86fe3 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -10,10 +10,9 @@
 struct pci_dn;
 
 enum pnv_phb_type {
-	PNV_PHB_IODA1		= 0,
-	PNV_PHB_IODA2		= 1,
-	PNV_PHB_NPU_NVLINK	= 2,
-	PNV_PHB_NPU_OCAPI	= 3,
+	PNV_PHB_IODA1,
+	PNV_PHB_IODA2,
+	PNV_PHB_NPU_OCAPI,
 };
 
 /* Precise PHB model for error management */
@@ -21,8 +20,6 @@ enum pnv_phb_model {
 	PNV_PHB_MODEL_UNKNOWN,
 	PNV_PHB_MODEL_P7IOC,
 	PNV_PHB_MODEL_PHB3,
-	PNV_PHB_MODEL_NPU,
-	PNV_PHB_MODEL_NPU2,
 };
 
 #define PNV_PCI_DIAG_BUF_SIZE	8192
@@ -81,7 +78,6 @@ struct pnv_ioda_pe {
 
 	/* "Base" iommu table, ie, 4K TCEs, 32-bit DMA */
 	struct iommu_table_group table_group;
-	struct npu_comp		*npucomp;
 
 	/* 64-bit TCE bypass region */
 	bool			tce_bypass_enabled;
@@ -289,9 +285,7 @@ extern struct iommu_table *pnv_pci_table_alloc(int nid);
 
 extern void pnv_pci_init_ioda_hub(struct device_node *np);
 extern void pnv_pci_init_ioda2_phb(struct device_node *np);
-extern void pnv_pci_init_npu_phb(struct device_node *np);
 extern void pnv_pci_init_npu2_opencapi_phb(struct device_node *np);
-extern void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe, unsigned long msr);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
@@ -314,11 +308,6 @@ extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 #define pe_info(pe, fmt, ...)					\
 	pe_level_printk(pe, KERN_INFO, fmt, ##__VA_ARGS__)
 
-/* Nvlink functions */
-extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass);
-extern void pnv_pci_ioda2_tce_invalidate_entire(struct pnv_phb *phb, bool rm);
-extern void pnv_pci_npu_setup_iommu_groups(void);
-
 /* pci-ioda-tce.c */
 #define POWERNV_IOMMU_DEFAULT_LEVELS	2
 #define POWERNV_IOMMU_MAX_LEVELS	5
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 1bffbd1c9a94b1..3b6800f774c241 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -224,8 +224,6 @@ static void __init pSeries_request_regions(void)
 
 void __init pSeries_final_fixup(void)
 {
-	struct pci_controller *hose;
-
 	pSeries_request_regions();
 
 	eeh_show_enabled();
@@ -234,27 +232,6 @@ void __init pSeries_final_fixup(void)
 	ppc_md.pcibios_sriov_enable = pseries_pcibios_sriov_enable;
 	ppc_md.pcibios_sriov_disable = pseries_pcibios_sriov_disable;
 #endif
-	list_for_each_entry(hose, &hose_list, list_node) {
-		struct device_node *dn = hose->dn, *nvdn;
-
-		while (1) {
-			dn = of_find_all_nodes(dn);
-			if (!dn)
-				break;
-			nvdn = of_parse_phandle(dn, "ibm,nvlink", 0);
-			if (!nvdn)
-				continue;
-			if (!of_device_is_compatible(nvdn, "ibm,npu-link"))
-				continue;
-			if (!of_device_is_compatible(nvdn->parent,
-						"ibm,power9-npu"))
-				continue;
-#ifdef CONFIG_PPC_POWERNV
-			WARN_ON_ONCE(pnv_npu2_init(hose));
-#endif
-			break;
-		}
-	}
 }
 
 /*
-- 
2.30.1

