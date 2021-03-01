Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8343279EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 09:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpvBQ1FHJz3fQY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:51:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GUTHjhjV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=GUTHjhjV; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpv811LnNz3f4T
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 19:49:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xjnrpEXxWqN295Q5FQN/MKyM59zP4it+2k/oCX23gCw=; b=GUTHjhjVLRbJTH2y8N0f5pXfQt
 BpcjyqebHUSqkrTfxo9sNnMxsXXi553XjQV00V9WvEhU+FZoA+NR+7JFRo7V+AcJrTEM2A0/NWoUY
 UQcG1jJvPEvJ62t0+skQ3GOQwTgz9bkJrgJ5bnVxZaxWSLvpKWL69ICJDko8VZPR7xnOkfCwL79i7
 gSKcArm/UWJvBLWZ3LQ2LKR9uhK0zIeUIiMijW/QfWAXEvydnu+GXr4VH9gDQxN7matDN8yNDTwzc
 mzOmEyht23pCYSJg+mpQkr9XEd1UDX2UeQck2jKCZcJqclZ3cNse2Oooee5h2NDsQSuznxuuEfST1
 vhs+o1kA==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGeES-00FUwW-Vk; Mon, 01 Mar 2021 08:48:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 17/17] iommu: remove iommu_domain_set_attr
Date: Mon,  1 Mar 2021 09:42:57 +0100
Message-Id: <20210301084257.945454-18-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/iommu.c | 17 -----------------
 include/linux/iommu.h | 27 ---------------------------
 2 files changed, 44 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8490aefd4b41f8..b04e6cefe8520d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2668,23 +2668,6 @@ bool iommu_dma_use_flush_queue(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_dma_use_flush_queue);
 
-int iommu_domain_set_attr(struct iommu_domain *domain,
-			  enum iommu_attr attr, void *data)
-{
-	int ret = 0;
-
-	switch (attr) {
-	default:
-		if (domain->ops->domain_set_attr == NULL)
-			return -EINVAL;
-
-		ret = domain->ops->domain_set_attr(domain, attr, data);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_domain_set_attr);
-
 int iommu_domain_enable_nesting(struct iommu_domain *domain)
 {
 	if (!domain->ops->domain_enable_nesting)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 39d3ed4d2700ac..62535f563aa491 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -97,20 +97,6 @@ enum iommu_cap {
 	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
 };
 
-/*
- * Following constraints are specifc to FSL_PAMUV1:
- *  -aperture must be power of 2, and naturally aligned
- *  -number of windows must be power of 2, and address space size
- *   of each window is determined by aperture size / # of windows
- *  -the actual size of the mapped region of a window must be power
- *   of 2 starting with 4KB and physical address must be naturally
- *   aligned.
- */
-
-enum iommu_attr {
-	DOMAIN_ATTR_MAX,
-};
-
 /* These are the possible reserved region types */
 enum iommu_resv_type {
 	/* Memory regions which must be mapped 1:1 at all times */
@@ -194,7 +180,6 @@ struct iommu_iotlb_gather {
  * @device_group: find iommu group for a particular device
  * @dma_use_flush_queue: Returns %true if a DMA flush queue is used
  * @dma_enable_flush_queue: Try to enable the DMA flush queue
- * @domain_set_attr: Change domain attributes
  * @domain_enable_nesting: Enable nesting
  * @domain_set_pgtable_attr: Set io page table attributes
  * @get_resv_regions: Request list of reserved regions for a device
@@ -247,8 +232,6 @@ struct iommu_ops {
 	struct iommu_group *(*device_group)(struct device *dev);
 	bool (*dma_use_flush_queue)(struct iommu_domain *domain);
 	void (*dma_enable_flush_queue)(struct iommu_domain *domain);
-	int (*domain_set_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
 	int (*domain_enable_nesting)(struct iommu_domain *domain);
 	int (*domain_set_pgtable_attr)(struct iommu_domain *domain,
 			struct io_pgtable_domain_attr *pgtbl_cfg);
@@ -498,11 +481,7 @@ extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 bool iommu_dma_use_flush_queue(struct iommu_domain *domain);
 int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
 		struct io_pgtable_domain_attr *pgtbl_cfg);
-extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
 int iommu_domain_enable_nesting(struct iommu_domain *domain);
-int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
-		struct io_pgtable_domain_attr *pgtbl_cfg);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
@@ -869,12 +848,6 @@ static inline int iommu_group_id(struct iommu_group *group)
 	return -ENODEV;
 }
 
-static inline int iommu_domain_set_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
 static inline int  iommu_device_register(struct iommu_device *iommu)
 {
 	return -ENODEV;
-- 
2.29.2

