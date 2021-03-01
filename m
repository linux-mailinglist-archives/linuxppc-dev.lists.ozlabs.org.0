Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980A3279EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 09:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpv9p3s8lz3fL4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=q+LL1CJQ;
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
 header.s=casper.20170209 header.b=q+LL1CJQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpv7q09SMz3f2x
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 19:49:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sw87FH5+MtmWzgYVMVt0jMsWfPmKV2m/YwEy2X/tRXY=; b=q+LL1CJQL0VFWQ6GHXUvJqdm5M
 5OWLtKqr16jhuPslbv4Mud0TLp+nNkLnkP9FPisthtAcZQvjmRdokh8XLIrAuLG5n/LZqrUNIYuqP
 n4SvDQuNsvq7C8D330vMStpWq7/KPohxvyuN3hq7Rv1dDHkaBfmQe2Tv+EJ6GlmXvnuTPGTxO9Oc4
 y3rPzq0cy543oaRZunIF5TQbDhQbYhldaRixwryKDAw7Ao8Vxc6tTukRvzrEpUH/ERdX3riM1k1Q2
 uromnKlNB4wgxXnYvATcnQs8SYrHR8XTvhcxoT8WIJbLsjMBWab4lm0w/gQH5Q/seHJw9+FHCDOlu
 JWKA9PYw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGeEF-00FUvo-7Y; Mon, 01 Mar 2021 08:48:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 16/17] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Date: Mon,  1 Mar 2021 09:42:56 +0100
Message-Id: <20210301084257.945454-17-hch@lst.de>
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c   | 40 +++++++------------------
 drivers/iommu/iommu.c                   |  9 ++++++
 include/linux/iommu.h                   |  9 +++++-
 4 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f184c3dd9d9ec..78d98ab2ee3a68 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,7 +191,7 @@ void adreno_set_llc_attributes(struct iommu_domain *iommu)
 	struct io_pgtable_domain_attr pgtbl_cfg;
 
 	pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
-	iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
+	iommu_domain_set_pgtable_attr(iommu, &pgtbl_cfg);
 }
 
 struct msm_gem_address_space *
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 2e17d990d04481..2858999c86dfd1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1515,40 +1515,22 @@ static int arm_smmu_domain_enable_nesting(struct iommu_domain *domain)
 	return ret;
 }
 
-static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr, void *data)
+static int arm_smmu_domain_set_pgtable_attr(struct iommu_domain *domain,
+		struct io_pgtable_domain_attr *pgtbl_cfg)
 {
-	int ret = 0;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	int ret = -EPERM;
 
-	mutex_lock(&smmu_domain->init_mutex);
-
-	switch(domain->type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		switch (attr) {
-		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
-			struct io_pgtable_domain_attr *pgtbl_cfg = data;
-
-			if (smmu_domain->smmu) {
-				ret = -EPERM;
-				goto out_unlock;
-			}
+	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return -EINVAL;
 
-			smmu_domain->pgtbl_cfg = *pgtbl_cfg;
-			break;
-		}
-		default:
-			ret = -ENODEV;
-		}
-		break;
-	case IOMMU_DOMAIN_DMA:
-		ret = -ENODEV;
-		break;
-	default:
-		ret = -EINVAL;
+	mutex_lock(&smmu_domain->init_mutex);
+	if (!smmu_domain->smmu) {
+		smmu_domain->pgtbl_cfg = *pgtbl_cfg;
+		ret = 0;
 	}
-out_unlock:
 	mutex_unlock(&smmu_domain->init_mutex);
+
 	return ret;
 }
 
@@ -1609,7 +1591,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.device_group		= arm_smmu_device_group,
 	.dma_use_flush_queue	= arm_smmu_dma_use_flush_queue,
 	.dma_enable_flush_queue	= arm_smmu_dma_enable_flush_queue,
-	.domain_set_attr	= arm_smmu_domain_set_attr,
+	.domain_set_pgtable_attr = arm_smmu_domain_set_pgtable_attr,
 	.domain_enable_nesting	= arm_smmu_domain_enable_nesting,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2e9e058501a953..8490aefd4b41f8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2693,6 +2693,15 @@ int iommu_domain_enable_nesting(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_domain_enable_nesting);
 
+int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
+		struct io_pgtable_domain_attr *pgtbl_cfg)
+{
+	if (!domain->ops->domain_set_pgtable_attr)
+		return -EINVAL;
+	return domain->ops->domain_set_pgtable_attr(domain, pgtbl_cfg);
+}
+EXPORT_SYMBOL_GPL(iommu_domain_set_pgtable_attr);
+
 void iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index aed88aa3bd3edf..39d3ed4d2700ac 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -40,6 +40,7 @@ struct iommu_domain;
 struct notifier_block;
 struct iommu_sva;
 struct iommu_fault_event;
+struct io_pgtable_domain_attr;
 
 /* iommu fault flags */
 #define IOMMU_FAULT_READ	0x0
@@ -107,7 +108,6 @@ enum iommu_cap {
  */
 
 enum iommu_attr {
-	DOMAIN_ATTR_IO_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
@@ -196,6 +196,7 @@ struct iommu_iotlb_gather {
  * @dma_enable_flush_queue: Try to enable the DMA flush queue
  * @domain_set_attr: Change domain attributes
  * @domain_enable_nesting: Enable nesting
+ * @domain_set_pgtable_attr: Set io page table attributes
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
  * @apply_resv_region: Temporary helper call-back for iova reserved ranges
@@ -249,6 +250,8 @@ struct iommu_ops {
 	int (*domain_set_attr)(struct iommu_domain *domain,
 			       enum iommu_attr attr, void *data);
 	int (*domain_enable_nesting)(struct iommu_domain *domain);
+	int (*domain_set_pgtable_attr)(struct iommu_domain *domain,
+			struct io_pgtable_domain_attr *pgtbl_cfg);
 
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
@@ -493,9 +496,13 @@ extern int iommu_group_id(struct iommu_group *group);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 
 bool iommu_dma_use_flush_queue(struct iommu_domain *domain);
+int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
+		struct io_pgtable_domain_attr *pgtbl_cfg);
 extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
 				 void *data);
 int iommu_domain_enable_nesting(struct iommu_domain *domain);
+int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
+		struct io_pgtable_domain_attr *pgtbl_cfg);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
-- 
2.29.2

