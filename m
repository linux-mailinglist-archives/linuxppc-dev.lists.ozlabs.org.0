Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527833D826
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 16:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Hnk4GB3z3bn1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 02:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wO7ZBevc;
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
 header.s=casper.20170209 header.b=wO7ZBevc; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0HnJ2Tdgz300M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 02:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Rw7EzDJS9qw2BQD9ybEsSVHRfrLN5SOhcMfS8kp3ZR4=; b=wO7ZBevcmjJiemSBKSjj4uO268
 KqJjDeIav31h0tTKUvZY27AJEWA560Wj1p1l7UTBYcz0BJeAWkWkkj5/a1W5iB7YfMtLZf8M8gMaa
 xcDgkI08ipECOG9nTB20LOf/J9+jK3qQEtY/V3t/8aSV6+08iXjATWpqr+QbwLUGVms6zRsknZvJ/
 ZaDj8FDBcaN1W2C6pr67cBD62CEjgDK2SWIwU0tGjHa1RVqOPIAc/XXh0xcHou91+QUcif3YjGYh7
 Q5ME8Giltlt3gHu2jbcEhyzpf0o6GtJ/+A+TkQf0ew6b8UPFPRnnH6a5BlhMY/DtVyqZbylYs0nzz
 tWRpCaLg==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBxO-000GJk-5v; Tue, 16 Mar 2021 15:50:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 04/18] iommu/fsl_pamu: merge iommu_alloc_dma_domain into
 fsl_pamu_domain_alloc
Date: Tue, 16 Mar 2021 16:38:10 +0100
Message-Id: <20210316153825.135976-5-hch@lst.de>
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

Keep the functionality to allocate the domain together.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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

