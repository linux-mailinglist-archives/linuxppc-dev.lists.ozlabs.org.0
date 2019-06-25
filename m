Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74F55399
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 17:40:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y9NP34YZzDqHq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Sa7W2q2y"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y8KR3T8pzDqP8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:52:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZXvqhrRGj30jE3rl8vvYoaGzy/GNfSwG37GatAmUr0=; b=Sa7W2q2ypUey1t75I1+Nobq+7p
 TjSahRbL8XEmEWkxo43OaZvZPABGXUHQp8yaeH2sCb+cO36r5FaFzGR6Q2XYKx0aP7ybYfUGslCkI
 cZL3XItqsXKVc5VegWdbQP/CwDRlMwOXqFEoBIh5H7v0idoJ/igFvcIWX8Saj3SKGpH3edOKBwhPo
 5SPISMbelKAMrZ9QawxdDSPlr+I4bhXr4XkAOU1OTiY9J+DQ3vJY8EkOSAk/cUbvBx91vGbzDER6C
 vOFbsm/k2INJgPxznXSlPycQh2QdMHUNken62xtzss8UKWinD+RqsRZZZx2B+aT6DEhShKed7bEbZ
 2yq3SF/A==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmoU-0006lC-Aj; Tue, 25 Jun 2019 14:52:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/4] powerpc/powernv: remove unused NPU DMA code
Date: Tue, 25 Jun 2019 16:52:38 +0200
Message-Id: <20190625145239.2759-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625145239.2759-1-hch@lst.de>
References: <20190625145239.2759-1-hch@lst.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

None of these routines were ever used anywhere in the kernel tree
since they were added to the kernel.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |   2 -
 arch/powerpc/include/asm/powernv.h       |  22 -
 arch/powerpc/mm/book3s64/mmu_context.c   |   1 -
 arch/powerpc/platforms/powernv/npu-dma.c | 556 -----------------------
 4 files changed, 581 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 74d24201fc4f..23b83d3593e2 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -116,8 +116,6 @@ typedef struct {
 	/* Number of users of the external (Nest) MMU */
 	atomic_t copros;
 
-	/* NPU NMMU context */
-	struct npu_context *npu_context;
 	struct hash_mm_context *hash_context;
 
 	unsigned long vdso_base;
diff --git a/arch/powerpc/include/asm/powernv.h b/arch/powerpc/include/asm/powernv.h
index 05b552418519..40f868c5e93c 100644
--- a/arch/powerpc/include/asm/powernv.h
+++ b/arch/powerpc/include/asm/powernv.h
@@ -11,35 +11,13 @@
 #define _ASM_POWERNV_H
 
 #ifdef CONFIG_PPC_POWERNV
-#define NPU2_WRITE 1
 extern void powernv_set_nmmu_ptcr(unsigned long ptcr);
-extern struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
-			unsigned long flags,
-			void (*cb)(struct npu_context *, void *),
-			void *priv);
-extern void pnv_npu2_destroy_context(struct npu_context *context,
-				struct pci_dev *gpdev);
-extern int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
-				unsigned long *flags, unsigned long *status,
-				int count);
 
 void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val);
 
 void pnv_tm_init(void);
 #else
 static inline void powernv_set_nmmu_ptcr(unsigned long ptcr) { }
-static inline struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
-			unsigned long flags,
-			struct npu_context *(*cb)(struct npu_context *, void *),
-			void *priv) { return ERR_PTR(-ENODEV); }
-static inline void pnv_npu2_destroy_context(struct npu_context *context,
-					struct pci_dev *gpdev) { }
-
-static inline int pnv_npu2_handle_fault(struct npu_context *context,
-					uintptr_t *ea, unsigned long *flags,
-					unsigned long *status, int count) {
-	return -ENODEV;
-}
 
 static inline void pnv_tm_init(void) { }
 #endif
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index cb2b08635508..0dd3e631cf3e 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -140,7 +140,6 @@ static int radix__init_new_context(struct mm_struct *mm)
 	 */
 	asm volatile("ptesync;isync" : : : "memory");
 
-	mm->context.npu_context = NULL;
 	mm->context.hash_context = NULL;
 
 	return index;
diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index dc1058efc24f..72b7441029ca 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -22,12 +22,6 @@
 
 #include "pci.h"
 
-/*
- * spinlock to protect initialisation of an npu_context for a particular
- * mm_struct.
- */
-static DEFINE_SPINLOCK(npu_context_lock);
-
 static struct pci_dev *get_pci_dev(struct device_node *dn)
 {
 	struct pci_dn *pdn = PCI_DN(dn);
@@ -375,15 +369,6 @@ struct npu_comp {
 /* An NPU descriptor, valid for POWER9 only */
 struct npu {
 	int index;
-	__be64 *mmio_atsd_regs[NV_NMMU_ATSD_REGS];
-	unsigned int mmio_atsd_count;
-
-	/* Bitmask for MMIO register usage */
-	unsigned long mmio_atsd_usage;
-
-	/* Do we need to explicitly flush the nest mmu? */
-	bool nmmu_flush;
-
 	struct npu_comp npucomp;
 };
 
@@ -640,534 +625,8 @@ struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
 }
 #endif /* CONFIG_IOMMU_API */
 
-/* Maximum number of nvlinks per npu */
-#define NV_MAX_LINKS 6
-
-/* Maximum index of npu2 hosts in the system. Always < NV_MAX_NPUS */
-static int max_npu2_index;
-
-struct npu_context {
-	struct mm_struct *mm;
-	struct pci_dev *npdev[NV_MAX_NPUS][NV_MAX_LINKS];
-	struct mmu_notifier mn;
-	struct kref kref;
-	bool nmmu_flush;
-
-	/* Callback to stop translation requests on a given GPU */
-	void (*release_cb)(struct npu_context *context, void *priv);
-
-	/*
-	 * Private pointer passed to the above callback for usage by
-	 * device drivers.
-	 */
-	void *priv;
-};
-
-struct mmio_atsd_reg {
-	struct npu *npu;
-	int reg;
-};
-
-/*
- * Find a free MMIO ATSD register and mark it in use. Return -ENOSPC
- * if none are available.
- */
-static int get_mmio_atsd_reg(struct npu *npu)
-{
-	int i;
-
-	for (i = 0; i < npu->mmio_atsd_count; i++) {
-		if (!test_bit(i, &npu->mmio_atsd_usage))
-			if (!test_and_set_bit_lock(i, &npu->mmio_atsd_usage))
-				return i;
-	}
-
-	return -ENOSPC;
-}
-
-static void put_mmio_atsd_reg(struct npu *npu, int reg)
-{
-	clear_bit_unlock(reg, &npu->mmio_atsd_usage);
-}
-
-/* MMIO ATSD register offsets */
-#define XTS_ATSD_LAUNCH 0
-#define XTS_ATSD_AVA    1
-#define XTS_ATSD_STAT   2
-
-static unsigned long get_atsd_launch_val(unsigned long pid, unsigned long psize)
-{
-	unsigned long launch = 0;
-
-	if (psize == MMU_PAGE_COUNT) {
-		/* IS set to invalidate entire matching PID */
-		launch |= PPC_BIT(12);
-	} else {
-		/* AP set to invalidate region of psize */
-		launch |= (u64)mmu_get_ap(psize) << PPC_BITLSHIFT(17);
-	}
-
-	/* PRS set to process-scoped */
-	launch |= PPC_BIT(13);
-
-	/* PID */
-	launch |= pid << PPC_BITLSHIFT(38);
-
-	/* Leave "No flush" (bit 39) 0 so every ATSD performs a flush */
-
-	return launch;
-}
-
-static void mmio_atsd_regs_write(struct mmio_atsd_reg
-			mmio_atsd_reg[NV_MAX_NPUS], unsigned long offset,
-			unsigned long val)
-{
-	struct npu *npu;
-	int i, reg;
-
-	for (i = 0; i <= max_npu2_index; i++) {
-		reg = mmio_atsd_reg[i].reg;
-		if (reg < 0)
-			continue;
-
-		npu = mmio_atsd_reg[i].npu;
-		__raw_writeq_be(val, npu->mmio_atsd_regs[reg] + offset);
-	}
-}
-
-static void mmio_invalidate_pid(struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS],
-				unsigned long pid)
-{
-	unsigned long launch = get_atsd_launch_val(pid, MMU_PAGE_COUNT);
-
-	/* Invalidating the entire process doesn't use a va */
-	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_LAUNCH, launch);
-}
-
-static void mmio_invalidate_range(struct mmio_atsd_reg
-			mmio_atsd_reg[NV_MAX_NPUS], unsigned long pid,
-			unsigned long start, unsigned long psize)
-{
-	unsigned long launch = get_atsd_launch_val(pid, psize);
-
-	/* Write all VAs first */
-	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_AVA, start);
-
-	/* Issue one barrier for all address writes */
-	eieio();
-
-	/* Launch */
-	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_LAUNCH, launch);
-}
-
-#define mn_to_npu_context(x) container_of(x, struct npu_context, mn)
-
-static void mmio_invalidate_wait(
-	struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
-{
-	struct npu *npu;
-	int i, reg;
-
-	/* Wait for all invalidations to complete */
-	for (i = 0; i <= max_npu2_index; i++) {
-		if (mmio_atsd_reg[i].reg < 0)
-			continue;
-
-		/* Wait for completion */
-		npu = mmio_atsd_reg[i].npu;
-		reg = mmio_atsd_reg[i].reg;
-		while (__raw_readq(npu->mmio_atsd_regs[reg] + XTS_ATSD_STAT))
-			cpu_relax();
-	}
-}
-
-/*
- * Acquires all the address translation shootdown (ATSD) registers required to
- * launch an ATSD on all links this npu_context is active on.
- */
-static void acquire_atsd_reg(struct npu_context *npu_context,
-			struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
-{
-	int i, j;
-	struct npu *npu;
-	struct pci_dev *npdev;
-
-	for (i = 0; i <= max_npu2_index; i++) {
-		mmio_atsd_reg[i].reg = -1;
-		for (j = 0; j < NV_MAX_LINKS; j++) {
-			/*
-			 * There are no ordering requirements with respect to
-			 * the setup of struct npu_context, but to ensure
-			 * consistent behaviour we need to ensure npdev[][] is
-			 * only read once.
-			 */
-			npdev = READ_ONCE(npu_context->npdev[i][j]);
-			if (!npdev)
-				continue;
-
-			npu = pci_bus_to_host(npdev->bus)->npu;
-			if (!npu)
-				continue;
-
-			mmio_atsd_reg[i].npu = npu;
-			mmio_atsd_reg[i].reg = get_mmio_atsd_reg(npu);
-			while (mmio_atsd_reg[i].reg < 0) {
-				mmio_atsd_reg[i].reg = get_mmio_atsd_reg(npu);
-				cpu_relax();
-			}
-			break;
-		}
-	}
-}
-
-/*
- * Release previously acquired ATSD registers. To avoid deadlocks the registers
- * must be released in the same order they were acquired above in
- * acquire_atsd_reg.
- */
-static void release_atsd_reg(struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
-{
-	int i;
-
-	for (i = 0; i <= max_npu2_index; i++) {
-		/*
-		 * We can't rely on npu_context->npdev[][] being the same here
-		 * as when acquire_atsd_reg() was called, hence we use the
-		 * values stored in mmio_atsd_reg during the acquire phase
-		 * rather than re-reading npdev[][].
-		 */
-		if (mmio_atsd_reg[i].reg < 0)
-			continue;
-
-		put_mmio_atsd_reg(mmio_atsd_reg[i].npu, mmio_atsd_reg[i].reg);
-	}
-}
-
-/*
- * Invalidate a virtual address range
- */
-static void mmio_invalidate(struct npu_context *npu_context,
-			unsigned long start, unsigned long size)
-{
-	struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS];
-	unsigned long pid = npu_context->mm->context.id;
-	unsigned long atsd_start = 0;
-	unsigned long end = start + size - 1;
-	int atsd_psize = MMU_PAGE_COUNT;
-
-	/*
-	 * Convert the input range into one of the supported sizes. If the range
-	 * doesn't fit, use the next larger supported size. Invalidation latency
-	 * is high, so over-invalidation is preferred to issuing multiple
-	 * invalidates.
-	 *
-	 * A 4K page size isn't supported by NPU/GPU ATS, so that case is
-	 * ignored.
-	 */
-	if (size == SZ_64K) {
-		atsd_start = start;
-		atsd_psize = MMU_PAGE_64K;
-	} else if (ALIGN_DOWN(start, SZ_2M) == ALIGN_DOWN(end, SZ_2M)) {
-		atsd_start = ALIGN_DOWN(start, SZ_2M);
-		atsd_psize = MMU_PAGE_2M;
-	} else if (ALIGN_DOWN(start, SZ_1G) == ALIGN_DOWN(end, SZ_1G)) {
-		atsd_start = ALIGN_DOWN(start, SZ_1G);
-		atsd_psize = MMU_PAGE_1G;
-	}
-
-	if (npu_context->nmmu_flush)
-		/*
-		 * Unfortunately the nest mmu does not support flushing specific
-		 * addresses so we have to flush the whole mm once before
-		 * shooting down the GPU translation.
-		 */
-		flush_all_mm(npu_context->mm);
-
-	/*
-	 * Loop over all the NPUs this process is active on and launch
-	 * an invalidate.
-	 */
-	acquire_atsd_reg(npu_context, mmio_atsd_reg);
-
-	if (atsd_psize == MMU_PAGE_COUNT)
-		mmio_invalidate_pid(mmio_atsd_reg, pid);
-	else
-		mmio_invalidate_range(mmio_atsd_reg, pid, atsd_start,
-					atsd_psize);
-
-	mmio_invalidate_wait(mmio_atsd_reg);
-
-	/*
-	 * The GPU requires two flush ATSDs to ensure all entries have been
-	 * flushed. We use PID 0 as it will never be used for a process on the
-	 * GPU.
-	 */
-	mmio_invalidate_pid(mmio_atsd_reg, 0);
-	mmio_invalidate_wait(mmio_atsd_reg);
-	mmio_invalidate_pid(mmio_atsd_reg, 0);
-	mmio_invalidate_wait(mmio_atsd_reg);
-
-	release_atsd_reg(mmio_atsd_reg);
-}
-
-static void pnv_npu2_mn_release(struct mmu_notifier *mn,
-				struct mm_struct *mm)
-{
-	struct npu_context *npu_context = mn_to_npu_context(mn);
-
-	/* Call into device driver to stop requests to the NMMU */
-	if (npu_context->release_cb)
-		npu_context->release_cb(npu_context, npu_context->priv);
-
-	/*
-	 * There should be no more translation requests for this PID, but we
-	 * need to ensure any entries for it are removed from the TLB.
-	 */
-	mmio_invalidate(npu_context, 0, ~0UL);
-}
-
-static void pnv_npu2_mn_invalidate_range(struct mmu_notifier *mn,
-					struct mm_struct *mm,
-					unsigned long start, unsigned long end)
-{
-	struct npu_context *npu_context = mn_to_npu_context(mn);
-	mmio_invalidate(npu_context, start, end - start);
-}
-
-static const struct mmu_notifier_ops nv_nmmu_notifier_ops = {
-	.release = pnv_npu2_mn_release,
-	.invalidate_range = pnv_npu2_mn_invalidate_range,
-};
-
-/*
- * Call into OPAL to setup the nmmu context for the current task in
- * the NPU. This must be called to setup the context tables before the
- * GPU issues ATRs. pdev should be a pointed to PCIe GPU device.
- *
- * A release callback should be registered to allow a device driver to
- * be notified that it should not launch any new translation requests
- * as the final TLB invalidate is about to occur.
- *
- * Returns an error if there no contexts are currently available or a
- * npu_context which should be passed to pnv_npu2_handle_fault().
- *
- * mmap_sem must be held in write mode and must not be called from interrupt
- * context.
- */
-struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
-			unsigned long flags,
-			void (*cb)(struct npu_context *, void *),
-			void *priv)
-{
-	int rc;
-	u32 nvlink_index;
-	struct device_node *nvlink_dn;
-	struct mm_struct *mm = current->mm;
-	struct npu *npu;
-	struct npu_context *npu_context;
-	struct pci_controller *hose;
-
-	/*
-	 * At present we don't support GPUs connected to multiple NPUs and I'm
-	 * not sure the hardware does either.
-	 */
-	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
-
-	if (!npdev)
-		/* No nvlink associated with this GPU device */
-		return ERR_PTR(-ENODEV);
-
-	/* We only support DR/PR/HV in pnv_npu2_map_lpar_dev() */
-	if (flags & ~(MSR_DR | MSR_PR | MSR_HV))
-		return ERR_PTR(-EINVAL);
-
-	nvlink_dn = of_parse_phandle(npdev->dev.of_node, "ibm,nvlink", 0);
-	if (WARN_ON(of_property_read_u32(nvlink_dn, "ibm,npu-link-index",
-							&nvlink_index)))
-		return ERR_PTR(-ENODEV);
-
-	if (!mm || mm->context.id == 0) {
-		/*
-		 * Kernel thread contexts are not supported and context id 0 is
-		 * reserved on the GPU.
-		 */
-		return ERR_PTR(-EINVAL);
-	}
-
-	hose = pci_bus_to_host(npdev->bus);
-	npu = hose->npu;
-	if (!npu)
-		return ERR_PTR(-ENODEV);
-
-	/*
-	 * We store the npu pci device so we can more easily get at the
-	 * associated npus.
-	 */
-	spin_lock(&npu_context_lock);
-	npu_context = mm->context.npu_context;
-	if (npu_context) {
-		if (npu_context->release_cb != cb ||
-			npu_context->priv != priv) {
-			spin_unlock(&npu_context_lock);
-			return ERR_PTR(-EINVAL);
-		}
-
-		WARN_ON(!kref_get_unless_zero(&npu_context->kref));
-	}
-	spin_unlock(&npu_context_lock);
-
-	if (!npu_context) {
-		/*
-		 * We can set up these fields without holding the
-		 * npu_context_lock as the npu_context hasn't been returned to
-		 * the caller meaning it can't be destroyed. Parallel allocation
-		 * is protected against by mmap_sem.
-		 */
-		rc = -ENOMEM;
-		npu_context = kzalloc(sizeof(struct npu_context), GFP_KERNEL);
-		if (npu_context) {
-			kref_init(&npu_context->kref);
-			npu_context->mm = mm;
-			npu_context->mn.ops = &nv_nmmu_notifier_ops;
-			rc = __mmu_notifier_register(&npu_context->mn, mm);
-		}
-
-		if (rc) {
-			kfree(npu_context);
-			return ERR_PTR(rc);
-		}
-
-		mm->context.npu_context = npu_context;
-	}
-
-	npu_context->release_cb = cb;
-	npu_context->priv = priv;
-
-	/*
-	 * npdev is a pci_dev pointer setup by the PCI code. We assign it to
-	 * npdev[][] to indicate to the mmu notifiers that an invalidation
-	 * should also be sent over this nvlink. The notifiers don't use any
-	 * other fields in npu_context, so we just need to ensure that when they
-	 * deference npu_context->npdev[][] it is either a valid pointer or
-	 * NULL.
-	 */
-	WRITE_ONCE(npu_context->npdev[npu->index][nvlink_index], npdev);
-
-	if (!npu->nmmu_flush) {
-		/*
-		 * If we're not explicitly flushing ourselves we need to mark
-		 * the thread for global flushes
-		 */
-		npu_context->nmmu_flush = false;
-		mm_context_add_copro(mm);
-	} else
-		npu_context->nmmu_flush = true;
-
-	return npu_context;
-}
-EXPORT_SYMBOL(pnv_npu2_init_context);
-
-static void pnv_npu2_release_context(struct kref *kref)
-{
-	struct npu_context *npu_context =
-		container_of(kref, struct npu_context, kref);
-
-	if (!npu_context->nmmu_flush)
-		mm_context_remove_copro(npu_context->mm);
-
-	npu_context->mm->context.npu_context = NULL;
-}
-
-/*
- * Destroy a context on the given GPU. May free the npu_context if it is no
- * longer active on any GPUs. Must not be called from interrupt context.
- */
-void pnv_npu2_destroy_context(struct npu_context *npu_context,
-			struct pci_dev *gpdev)
-{
-	int removed;
-	struct npu *npu;
-	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
-	struct device_node *nvlink_dn;
-	u32 nvlink_index;
-	struct pci_controller *hose;
-
-	if (WARN_ON(!npdev))
-		return;
-
-	hose = pci_bus_to_host(npdev->bus);
-	npu = hose->npu;
-	if (!npu)
-		return;
-	nvlink_dn = of_parse_phandle(npdev->dev.of_node, "ibm,nvlink", 0);
-	if (WARN_ON(of_property_read_u32(nvlink_dn, "ibm,npu-link-index",
-							&nvlink_index)))
-		return;
-	WRITE_ONCE(npu_context->npdev[npu->index][nvlink_index], NULL);
-	spin_lock(&npu_context_lock);
-	removed = kref_put(&npu_context->kref, pnv_npu2_release_context);
-	spin_unlock(&npu_context_lock);
-
-	/*
-	 * We need to do this outside of pnv_npu2_release_context so that it is
-	 * outside the spinlock as mmu_notifier_destroy uses SRCU.
-	 */
-	if (removed) {
-		mmu_notifier_unregister(&npu_context->mn,
-					npu_context->mm);
-
-		kfree(npu_context);
-	}
-
-}
-EXPORT_SYMBOL(pnv_npu2_destroy_context);
-
-/*
- * Assumes mmap_sem is held for the contexts associated mm.
- */
-int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
-			unsigned long *flags, unsigned long *status, int count)
-{
-	u64 rc = 0, result = 0;
-	int i, is_write;
-	struct page *page[1];
-	const char __user *u;
-	char c;
-
-	/* mmap_sem should be held so the struct_mm must be present */
-	struct mm_struct *mm = context->mm;
-
-	WARN_ON(!rwsem_is_locked(&mm->mmap_sem));
-
-	for (i = 0; i < count; i++) {
-		is_write = flags[i] & NPU2_WRITE;
-		rc = get_user_pages_remote(NULL, mm, ea[i], 1,
-					is_write ? FOLL_WRITE : 0,
-					page, NULL, NULL);
-
-		if (rc != 1) {
-			status[i] = rc;
-			result = -EFAULT;
-			continue;
-		}
-
-		/* Make sure partition scoped tree gets a pte */
-		u = page_address(page[0]);
-		if (__get_user(c, u))
-			result = -EFAULT;
-
-		status[i] = 0;
-		put_page(page[0]);
-	}
-
-	return result;
-}
-EXPORT_SYMBOL(pnv_npu2_handle_fault);
-
 int pnv_npu2_init(struct pci_controller *hose)
 {
-	unsigned int i;
-	u64 mmio_atsd;
 	static int npu_index;
 	struct npu *npu;
 	int ret;
@@ -1176,33 +635,18 @@ int pnv_npu2_init(struct pci_controller *hose)
 	if (!npu)
 		return -ENOMEM;
 
-	npu->nmmu_flush = of_property_read_bool(hose->dn, "ibm,nmmu-flush");
-
-	for (i = 0; i < ARRAY_SIZE(npu->mmio_atsd_regs) &&
-			!of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
-				i, &mmio_atsd); i++)
-		npu->mmio_atsd_regs[i] = ioremap(mmio_atsd, 32);
-
-	pr_info("NPU%d: Found %d MMIO ATSD registers", hose->global_number, i);
-	npu->mmio_atsd_count = i;
-	npu->mmio_atsd_usage = 0;
 	npu_index++;
 	if (WARN_ON(npu_index >= NV_MAX_NPUS)) {
 		ret = -ENOSPC;
 		goto fail_exit;
 	}
-	max_npu2_index = npu_index;
 	npu->index = npu_index;
 	hose->npu = npu;
 
 	return 0;
 
 fail_exit:
-	for (i = 0; i < npu->mmio_atsd_count; ++i)
-		iounmap(npu->mmio_atsd_regs[i]);
-
 	kfree(npu);
-
 	return ret;
 }
 
-- 
2.20.1

