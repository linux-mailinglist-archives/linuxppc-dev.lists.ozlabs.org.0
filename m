Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0033D7EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 16:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Hh91TN6z3bt9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 02:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YAq24PLF;
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
 header.s=casper.20170209 header.b=YAq24PLF; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Hgc3pNJz3bc8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 02:45:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QN7GVfC8ZM01/BUj2S43wlyrokZblV3LlQxxQPFIb2Y=; b=YAq24PLFLbc+LDhaZbapU2igNS
 Q1hMlEF+wEjEpYOK7BJoKJ8Lr6hwPfOsLhmfkWKv99zfbUDOvKo+t6jKPmcZR3YN+ZpU0tcsMztOl
 YxeEo6+iKYsOKdR3T/pNK0EbucjqREEueoB+U26pBw8iicBpd0dvNGaWTWM7H42V6k4Sbp4twyqi9
 H8qnmJscMf4IqatWdJh1YHhH8OOMCzMzf//lKseCe4fd3Bsh9DZAQcWwLeNTBu7iGohJOMSYkDIew
 VkB07QUW4FzdI6WC6YEiq9+7EVd0Bxp7PyadMxM/vhcPcVFvEtKXql2AM9SDZ3r/P45hfISSHv1YX
 US4gOoFg==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBsf-000FwZ-DA; Tue, 16 Mar 2021 15:45:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 02/18] iommu/fsl_pamu: remove fsl_pamu_get_domain_attr
Date: Tue, 16 Mar 2021 16:38:08 +0100
Message-Id: <20210316153825.135976-3-hch@lst.de>
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

None of the values returned by this function are ever queried.  Also
remove the DOMAIN_ATTR_FSL_PAMUV1 enum value that is not otherwise used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c | 30 ------------------------------
 include/linux/iommu.h           |  4 ----
 2 files changed, 34 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 53380cf1fa452f..e587ec43f7e750 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -832,35 +832,6 @@ static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
 	return ret;
 }
 
-static int fsl_pamu_get_domain_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr_type, void *data)
-{
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	int ret = 0;
-
-	switch (attr_type) {
-	case DOMAIN_ATTR_FSL_PAMU_STASH:
-		memcpy(data, &dma_domain->dma_stash,
-		       sizeof(struct pamu_stash_attribute));
-		break;
-	case DOMAIN_ATTR_FSL_PAMU_ENABLE:
-		*(int *)data = dma_domain->enabled;
-		break;
-	case DOMAIN_ATTR_FSL_PAMUV1:
-		*(int *)data = DOMAIN_ATTR_FSL_PAMUV1;
-		break;
-	case DOMAIN_ATTR_WINDOWS:
-		*(u32 *)data = dma_domain->win_cnt;
-		break;
-	default:
-		pr_debug("Unsupported attribute type\n");
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
 static struct iommu_group *get_device_iommu_group(struct device *dev)
 {
 	struct iommu_group *group;
@@ -987,7 +958,6 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.domain_window_enable = fsl_pamu_window_enable,
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
 	.domain_set_attr = fsl_pamu_set_domain_attr,
-	.domain_get_attr = fsl_pamu_get_domain_attr,
 	.probe_device	= fsl_pamu_probe_device,
 	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 47c8b318d8f523..52874ae164dd60 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -104,9 +104,6 @@ enum iommu_cap {
  *  -the actual size of the mapped region of a window must be power
  *   of 2 starting with 4KB and physical address must be naturally
  *   aligned.
- * DOMAIN_ATTR_FSL_PAMUV1 corresponds to the above mentioned contraints.
- * The caller can invoke iommu_domain_get_attr to check if the underlying
- * iommu implementation supports these constraints.
  */
 
 enum iommu_attr {
@@ -115,7 +112,6 @@ enum iommu_attr {
 	DOMAIN_ATTR_WINDOWS,
 	DOMAIN_ATTR_FSL_PAMU_STASH,
 	DOMAIN_ATTR_FSL_PAMU_ENABLE,
-	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_IO_PGTABLE_CFG,
-- 
2.30.1

