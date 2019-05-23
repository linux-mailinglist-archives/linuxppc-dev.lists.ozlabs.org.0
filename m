Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425A2777B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 09:52:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458hYP1N25zDqT8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 17:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c417bddcefb42f015981+5751+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="AWDXzNVl"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458hV91NGXzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 17:49:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Q2p0j43MsF+X9DOOmIlHyGyT1FzOSD7+xv3fn/dl1M=; b=AWDXzNVlHpRylUo6Q8Fo4ZwFpo
 Ymn3vE2zge/sVfgm3TOrIcoDESwXEJNnnuBT+vxT6k4ZBvq+MDLkcCbjmMN1d2SlU0LAwRAxPR2he
 p2mCCXWS+JA1oeo4yMhe62+Z77kaaHSqexyA/qHIEejEce2zW9zvTvi4WJG1a/23DXxbiPHR1zQ69
 5uKxaIwVeJN9GUgh6ycmkTkMFmA7sKUmc0s3xCu8pdh06t75e08laxnnxoz49Q6xuo+pWkb26KKjm
 8szzFOwpCA5rt+0e63smJW+rCQeM7+QGoB1VL03qnkSQhRc4HvdkJEiSiMVPBT60Y1VwjjygAezcu
 Nto+xZiw==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTiTj-00043Y-Pu; Thu, 23 May 2019 07:49:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/4] powerpc/powernv: remove the unused tunneling exports
Date: Thu, 23 May 2019 09:49:22 +0200
Message-Id: <20190523074924.19659-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523074924.19659-1-hch@lst.de>
References: <20190523074924.19659-1-hch@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These have been unused ever since they've been added to the kernel.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/pnv-pci.h        |  4 --
 arch/powerpc/platforms/powernv/pci-ioda.c |  4 +-
 arch/powerpc/platforms/powernv/pci.c      | 71 -----------------------
 arch/powerpc/platforms/powernv/pci.h      |  1 -
 4 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
index 9fcb0bc462c6..1ab4b0111abc 100644
--- a/arch/powerpc/include/asm/pnv-pci.h
+++ b/arch/powerpc/include/asm/pnv-pci.h
@@ -27,12 +27,8 @@ extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
 extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
 				   struct opal_msg *msg);
 
-extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
-extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
 extern int pnv_pci_set_tunnel_bar(struct pci_dev *dev, uint64_t addr,
 				  int enable);
-extern int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid,
-				      u32 *pid, u32 *tid);
 int pnv_phb_to_cxl_mode(struct pci_dev *dev, uint64_t mode);
 int pnv_cxl_ioda_msi_setup(struct pci_dev *dev, unsigned int hwirq,
 			   unsigned int virq);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 126602b4e399..6b0caa2d0425 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -54,6 +54,8 @@
 static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
 					      "NPU_OCAPI" };
 
+static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
+
 void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 			    const char *fmt, ...)
 {
@@ -2360,7 +2362,7 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
 	return 0;
 }
 
-void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
+static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
 {
 	uint16_t window_id = (pe->pe_number << 1 ) + 1;
 	int64_t rc;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 8d28f2932c3b..fc69f5611020 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -868,54 +868,6 @@ struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pnv_pci_get_phb_node);
 
-int pnv_pci_enable_tunnel(struct pci_dev *dev, u64 *asnind)
-{
-	struct device_node *np;
-	const __be32 *prop;
-	struct pnv_ioda_pe *pe;
-	uint16_t window_id;
-	int rc;
-
-	if (!radix_enabled())
-		return -ENXIO;
-
-	if (!(np = pnv_pci_get_phb_node(dev)))
-		return -ENXIO;
-
-	prop = of_get_property(np, "ibm,phb-indications", NULL);
-	of_node_put(np);
-
-	if (!prop || !prop[1])
-		return -ENXIO;
-
-	*asnind = (u64)be32_to_cpu(prop[1]);
-	pe = pnv_ioda_get_pe(dev);
-	if (!pe)
-		return -ENODEV;
-
-	/* Increase real window size to accept as_notify messages. */
-	window_id = (pe->pe_number << 1 ) + 1;
-	rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id, pe->pe_number,
-					     window_id, pe->tce_bypass_base,
-					     (uint64_t)1 << 48);
-	return opal_error_code(rc);
-}
-EXPORT_SYMBOL_GPL(pnv_pci_enable_tunnel);
-
-int pnv_pci_disable_tunnel(struct pci_dev *dev)
-{
-	struct pnv_ioda_pe *pe;
-
-	pe = pnv_ioda_get_pe(dev);
-	if (!pe)
-		return -ENODEV;
-
-	/* Restore default real window size. */
-	pnv_pci_ioda2_set_bypass(pe, true);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pnv_pci_disable_tunnel);
-
 int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 {
 	__be64 val;
@@ -970,29 +922,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 }
 EXPORT_SYMBOL_GPL(pnv_pci_set_tunnel_bar);
 
-#ifdef CONFIG_PPC64	/* for thread.tidr */
-int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid, u32 *pid,
-			       u32 *tid)
-{
-	struct mm_struct *mm = NULL;
-
-	if (task == NULL)
-		return -EINVAL;
-
-	mm = get_task_mm(task);
-	if (mm == NULL)
-		return -EINVAL;
-
-	*pid = mm->context.id;
-	mmput(mm);
-
-	*tid = task->thread.tidr;
-	*lpid = mfspr(SPRN_LPID);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pnv_pci_get_as_notify_info);
-#endif
-
 void pnv_pci_shutdown(void)
 {
 	struct pci_controller *hose;
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 4f11c077af62..469c24463247 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -195,7 +195,6 @@ extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
 extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
 extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
-extern void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
 extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
 		__u64 window_size, __u32 levels);
 extern int pnv_eeh_post_init(void);
-- 
2.20.1

