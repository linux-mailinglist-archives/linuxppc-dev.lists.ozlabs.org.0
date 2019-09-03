Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 025FCA7135
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 19:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NCqk6NZzzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 03:00:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+680e2818d6643897e706+5854+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="S3daUb2+"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NCfT4msLzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:52:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LvpBWtVIgybfRt8dClX5c+nTFaEgP5NOqPPGkq3C7hE=; b=S3daUb2++xfMv9DBuUEn+KiRb
 rDGWJhDdSxuyi8LHgCalEJco7OrwhgpVNs5gWBIPSdVJUIoQjIHXNxck0zZC3O1ToA7HxWBLwaD3m
 6JKhhevm/LaZlXaIIZsMZTv+ynO/WuLQ1pFpS+dgWZyDxnuk35McHI30MlMgPdy4vgOiWgOfUL+6p
 TCNE+FhK2S/7vGyEPbqpKC+0jxETu/74AmU32NNeil0Zt93j39eSMlmjN2J1n/x4IZVZBakd80r4G
 02UAYjlqV39IVEqmfq9RGVKBuc6JKVUiFnnflDGzwrq8XeLdSdeTJgnrayY7rMQGbJbz4+VP7WNyY
 G9LUkQotw==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5C25-0002as-8F; Tue, 03 Sep 2019 16:51:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: mpe@ellerman.id.au,
	paulus@samba.org,
	benh@kernel.crashing.org
Subject: [PATCH] powerpc/powernv: remove the unused pnv_npu_try_dma_set_bypass
 function
Date: Tue,  3 Sep 2019 18:51:47 +0200
Message-Id: <20190903165147.11099-1-hch@lst.de>
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

Neither pnv_npu_try_dma_set_bypass nor the pnv_npu_dma_set_32 and
pnv_npu_dma_set_bypass helpers called by it are used anywhere in the
kernel tree, so remove them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 99 ------------------------
 1 file changed, 99 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index c16249d251f1..a570a249edc3 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -192,105 +192,6 @@ static long pnv_npu_unset_window(struct iommu_table_group *table_group, int num)
 	return 0;
 }
 
-/*
- * Enables 32 bit DMA on NPU.
- */
-static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
-{
-	struct pci_dev *gpdev;
-	struct pnv_ioda_pe *gpe;
-	int64_t rc;
-
-	/*
-	 * Find the assoicated PCI devices and get the dma window
-	 * information from there.
-	 */
-	if (!npe->pdev || !(npe->flags & PNV_IODA_PE_DEV))
-		return;
-
-	gpe = get_gpu_pci_dev_and_pe(npe, &gpdev);
-	if (!gpe)
-		return;
-
-	rc = pnv_npu_set_window(&npe->table_group, 0,
-			gpe->table_group.tables[0]);
-
-	/*
-	 * NVLink devices use the same TCE table configuration as
-	 * their parent device so drivers shouldn't be doing DMA
-	 * operations directly on these devices.
-	 */
-	set_dma_ops(&npe->pdev->dev, &dma_dummy_ops);
-}
-
-/*
- * Enables bypass mode on the NPU. The NPU only supports one
- * window per link, so bypass needs to be explicitly enabled or
- * disabled. Unlike for a PHB3 bypass and non-bypass modes can't be
- * active at the same time.
- */
-static int pnv_npu_dma_set_bypass(struct pnv_ioda_pe *npe)
-{
-	struct pnv_phb *phb = npe->phb;
-	int64_t rc = 0;
-	phys_addr_t top = memblock_end_of_DRAM();
-
-	if (phb->type != PNV_PHB_NPU_NVLINK || !npe->pdev)
-		return -EINVAL;
-
-	rc = pnv_npu_unset_window(&npe->table_group, 0);
-	if (rc != OPAL_SUCCESS)
-		return rc;
-
-	/* Enable the bypass window */
-
-	top = roundup_pow_of_two(top);
-	dev_info(&npe->pdev->dev, "Enabling bypass for PE %x\n",
-			npe->pe_number);
-	rc = opal_pci_map_pe_dma_window_real(phb->opal_id,
-			npe->pe_number, npe->pe_number,
-			0 /* bypass base */, top);
-
-	if (rc == OPAL_SUCCESS)
-		pnv_pci_ioda2_tce_invalidate_entire(phb, false);
-
-	return rc;
-}
-
-void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass)
-{
-	int i;
-	struct pnv_phb *phb;
-	struct pci_dn *pdn;
-	struct pnv_ioda_pe *npe;
-	struct pci_dev *npdev;
-
-	for (i = 0; ; ++i) {
-		npdev = pnv_pci_get_npu_dev(gpdev, i);
-
-		if (!npdev)
-			break;
-
-		pdn = pci_get_pdn(npdev);
-		if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
-			return;
-
-		phb = pci_bus_to_host(npdev->bus)->private_data;
-
-		/* We only do bypass if it's enabled on the linked device */
-		npe = &phb->ioda.pe_array[pdn->pe_number];
-
-		if (bypass) {
-			dev_info(&npdev->dev,
-					"Using 64-bit DMA iommu bypass\n");
-			pnv_npu_dma_set_bypass(npe);
-		} else {
-			dev_info(&npdev->dev, "Using 32-bit DMA via iommu\n");
-			pnv_npu_dma_set_32(npe);
-		}
-	}
-}
-
 #ifdef CONFIG_IOMMU_API
 /* Switch ownership from platform code to external user (e.g. VFIO) */
 static void pnv_npu_take_ownership(struct iommu_table_group *table_group)
-- 
2.20.1

