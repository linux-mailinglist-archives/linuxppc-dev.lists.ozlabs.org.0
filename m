Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17082351671
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:55:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB77D0NHMz3djY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:55:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAOLWerY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+78d50c468b85952dbb35+6430+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB75C72Ylz30GN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FM5u+3o8sOcsBcAa20JtCx7CBwzFoNdoMd1Vq/4oPf8=; b=gAOLWerYMtaF8otFLTR3inSr2k
 iFhFuHY0oLrUacCmRKMCd10hWuCAyHJo5MY+KpRjT3Wd0K5lcZJjPRlMjtjbXvM4JwZKQ/U3BUlTk
 tiqVm6BuZlvMihaQ61355ldlra8oe7u7jqH4zm6HTMUlQWCihlFH8eI/10jEB8cS98dpWlR8ZAhoV
 tS77+3+TmE4OnyfBl+hc2jj9otNArnPeyiSNWHaftteVItXDNh8KSgBTauEdjET5dKd/n5k+3Rsfr
 TPz1y+DueUEAM2Ge0zSauF1aLZebsss+tL+XJTqukHZUMFYL8QHPDUcTIzMSNSYe+FpRUG/MKz9tE
 DUHAf7MQ==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdH-00CiaJ-U6; Thu, 01 Apr 2021 15:53:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 04/20] iommu/fsl_pamu: merge iommu_alloc_dma_domain into
 fsl_pamu_domain_alloc
Date: Thu,  1 Apr 2021 17:52:40 +0200
Message-Id: <20210401155256.298656-5-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
References: <20210401155256.298656-1-hch@lst.de>
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keep the functionality to allocate the domain together.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c | 34 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 7bd08ddad07779..a4da5597755d3d 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -292,25 +292,6 @@ static int check_size(u64 size, dma_addr_t iova)
 	return 0;
 }
 
-static struct fsl_dma_domain *iommu_alloc_dma_domain(void)
-{
-	struct fsl_dma_domain *domain;
-
-	domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
-	if (!domain)
-		return NULL;
-
-	domain->stash_id = ~(u32)0;
-	domain->snoop_id = ~(u32)0;
-	domain->win_cnt = pamu_get_max_subwin_cnt();
-
-	INIT_LIST_HEAD(&domain->devices);
-
-	spin_lock_init(&domain->domain_lock);
-
-	return domain;
-}
-
 static void remove_device_ref(struct device_domain_info *info, u32 win_cnt)
 {
 	unsigned long flags;
@@ -412,12 +393,17 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
-	dma_domain = iommu_alloc_dma_domain();
-	if (!dma_domain) {
-		pr_debug("dma_domain allocation failed\n");
+	dma_domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
+	if (!dma_domain)
 		return NULL;
-	}
-	/* defaul geometry 64 GB i.e. maximum system address */
+
+	dma_domain->stash_id = ~(u32)0;
+	dma_domain->snoop_id = ~(u32)0;
+	dma_domain->win_cnt = pamu_get_max_subwin_cnt();
+	INIT_LIST_HEAD(&dma_domain->devices);
+	spin_lock_init(&dma_domain->domain_lock);
+
+	/* default geometry 64 GB i.e. maximum system address */
 	dma_domain->iommu_domain. geometry.aperture_start = 0;
 	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
 	dma_domain->iommu_domain.geometry.force_aperture = true;
-- 
2.30.1

