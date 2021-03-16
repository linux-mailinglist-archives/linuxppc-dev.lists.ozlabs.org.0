Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4433D94A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0JXS5cfkz3bp4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 03:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=a9NlqK95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=90.155.50.34;
 helo=casper.infradead.org;
 envelope-from=batv+da3193128de9690cc39e+6414+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=a9NlqK95; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0JX33mSFz2yYf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 03:24:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nmzQgJQP6/DetTH6ZnA1qw8ORAxBI+pbM/MkV+zmkmM=; b=a9NlqK95hTbckfpKvpR6egtslo
 D5Cs2CPLERcnJMpuvBKT6+Fk9+YpL/guhrXme3vHDBoSsqUDEAH65xtcz9BCAiG/0FFzklTz1vkn8
 /I38qdA9QrRTBss/rIBIYuO832voCNt/UzkX8SwtEFkwKxCzseejM9GPWwHpmshqTNl/O4VzUBTMa
 Se2ssSHLo7rOnuausx/YzYs+UJmnpCYrJoXg3c+kIA7uVwe3V1sCuq6KuPYaIZi4vmGmqdM686sAc
 MuRWyTE65hBd/dO7BGLtvXs+fAbNq6+YI1TNHLmyJHNoqVY0tv1YWgPasuYqJ7ATRO4H0JQwViRw2
 28OvVVwA==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCTa-000J9w-2k; Tue, 16 Mar 2021 16:23:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 18/18] iommu: remove iommu_domain_{get,set}_attr
Date: Tue, 16 Mar 2021 16:38:24 +0100
Message-Id: <20210316153825.135976-19-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316153825.135976-1-hch@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
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

Remove the now unused iommu attr infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/iommu.c | 26 --------------------------
 include/linux/iommu.h | 36 ------------------------------------
 2 files changed, 62 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index afd21b37e319ee..d8df26d13c7371 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2662,32 +2662,6 @@ static int __init iommu_init(void)
 }
 core_initcall(iommu_init);
 
-int iommu_domain_get_attr(struct iommu_domain *domain,
-			  enum iommu_attr attr, void *data)
-{
-	if (!domain->ops->domain_get_attr)
-		return -EINVAL;
-	return domain->ops->domain_get_attr(domain, attr, data);
-}
-EXPORT_SYMBOL_GPL(iommu_domain_get_attr);
-
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
 int iommu_enable_nesting(struct iommu_domain *domain)
 {
 	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a53d74f2007b14..9319333ca0b827 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -96,20 +96,6 @@ enum iommu_cap {
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
@@ -191,8 +177,6 @@ struct iommu_iotlb_gather {
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
  * @device_group: find iommu group for a particular device
- * @domain_get_attr: Query domain attributes
- * @domain_set_attr: Change domain attributes
  * @enable_nesting: Enable nesting
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
@@ -243,10 +227,6 @@ struct iommu_ops {
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
-	int (*domain_get_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
-	int (*domain_set_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
 	int (*enable_nesting)(struct iommu_domain *domain);
 	int (*set_pgtable_quirks)(struct iommu_domain *domain,
 				  unsigned long quirks);
@@ -493,10 +473,6 @@ extern int iommu_page_response(struct device *dev,
 extern int iommu_group_id(struct iommu_group *group);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 
-extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
-extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
 int iommu_enable_nesting(struct iommu_domain *domain);
 int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks);
@@ -869,18 +845,6 @@ static inline int iommu_group_id(struct iommu_group *group)
 	return -ENODEV;
 }
 
-static inline int iommu_domain_get_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
-static inline int iommu_domain_set_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
 static inline int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks)
 {
-- 
2.30.1

