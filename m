Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1315A98C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 10:06:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bR6862gXzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 18:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+47088bf090978edb542c+5788+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="IFVrOqg2"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bR3s6D7YzDqtQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 18:04:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyDgEJSSVfeo/rhxp2C0OHVjUsyHNQM4qw/R4ZApdQY=; b=IFVrOqg2Wg4+b+FilOSB52Ahu
 IqHDA0iOtemW6x2oYylDfDt0NiBfQZLAOCrjtYnykk8eu6xFjqTNprX7PRPWg86qAazglem8dvTQM
 tVAWPNf2eWv/H/kTrWT6SnujY+Wf2Sr2RvrSjrjpQtTs4XR4FA0wABpWt7jTrW0aKwxyJ9Ikz9WmR
 uqZKh/UzvMpiw7Wt/gZemJb1dxkwsQky4BAovC/DgvEAFjlFYEbO96Stp9Bn9LDCW1vIpwgyRHvK4
 evGlg2g7jYYAe2cL70buGTnOdtFFletuOvb7TbZZhxECOw1f162KAXxyNAV++IrJxrYsCRF27kUdo
 24fwNgDQw==;
Received: from 089144214055.atnat0023.highway.a1.net ([89.144.214.55]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hh8L3-0004F7-1z; Sat, 29 Jun 2019 08:04:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc: remove device_to_mask
Date: Sat, 29 Jun 2019 10:03:59 +0200
Message-Id: <20190629080359.23182-1-hch@lst.de>
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

Use the dma_get_mask helper from dma-mapping.h instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/iommu.h     | 8 --------
 arch/powerpc/kernel/dma-iommu.c      | 4 ++--
 arch/powerpc/platforms/pseries/vio.c | 4 ++--
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 0ac52392ed99..f98f2864b66a 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -327,13 +327,5 @@ extern bool iommu_fixed_is_weak;
 
 extern const struct dma_map_ops dma_iommu_ops;
 
-static inline unsigned long device_to_mask(struct device *dev)
-{
-	if (dev->dma_mask && *dev->dma_mask)
-		return *dev->dma_mask;
-	/* Assume devices without mask can take 32 bit addresses */
-	return 0xfffffffful;
-}
-
 #endif /* __KERNEL__ */
 #endif /* _ASM_IOMMU_H */
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 09231ef06d01..168af3a5b4b1 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -71,7 +71,7 @@ static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
 		return dma_direct_map_page(dev, page, offset, size, direction,
 				attrs);
 	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
-			      size, device_to_mask(dev), direction, attrs);
+			      size, dma_get_mask(dev), direction, attrs);
 }
 
 
@@ -92,7 +92,7 @@ static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 	if (dma_iommu_map_bypass(dev, attrs))
 		return dma_direct_map_sg(dev, sglist, nelems, direction, attrs);
 	return ppc_iommu_map_sg(dev, get_iommu_table_base(dev), sglist, nelems,
-				device_to_mask(dev), direction, attrs);
+				dma_get_mask(dev), direction, attrs);
 }
 
 static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 141795275ccb..97c0e3e5eae5 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -524,7 +524,7 @@ static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
 
 	if (vio_cmo_alloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl))))
 		goto out_fail;
-	ret = iommu_map_page(dev, tbl, page, offset, size, device_to_mask(dev),
+	ret = iommu_map_page(dev, tbl, page, offset, size, dma_get_mask(dev),
 			direction, attrs);
 	if (unlikely(ret == DMA_MAPPING_ERROR))
 		goto out_deallocate;
@@ -564,7 +564,7 @@ static int vio_dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	if (vio_cmo_alloc(viodev, alloc_size))
 		goto out_fail;
-	ret = ppc_iommu_map_sg(dev, tbl, sglist, nelems, device_to_mask(dev),
+	ret = ppc_iommu_map_sg(dev, tbl, sglist, nelems, dma_get_mask(dev),
 			direction, attrs);
 	if (unlikely(!ret))
 		goto out_deallocate;
-- 
2.20.1

