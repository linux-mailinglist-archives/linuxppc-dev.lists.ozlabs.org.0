Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B235167B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7CS28qkz3fvs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LafK1H4R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+78d50c468b85952dbb35+6430+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=LafK1H4R; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB75T6lNlz3cFk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:53:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wDCpF7eA/jBfJE8TX4WtMtbQcLjyYKphl/5zM+AMN4E=; b=LafK1H4R5CszpawGybodA4QlYz
 djVgVU7nIHYvARbHMtDR3EViy1Cet1N99EQ8Dpy2YiA/KdQtX2BL9Ibiaz0GzoEKwBm0OQxKgWvrl
 mRD7LaUUdCMLrEZblY5EfqmwSCY3BG94IqbKCTD7u8gHB8BJBKXa/98vOrZjoVjOr29NM+ce+aQvZ
 bRd8eyGos7K86FuEDzsy8MzyBCYjmeW61WRBRaoCGKQSTPhZ7lFlZV+2F281ghBIfX40mdPPWC5wP
 +zgDAbAslIshmHmj8X0iesvI5VzGb22t7SAWXCi5XrNYxl1XQGFmhYVbB9YzUdnx62zCxWaFhlLKe
 6ATDquqQ==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzda-00CicQ-Q4; Thu, 01 Apr 2021 15:53:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 11/20] iommu/fsl_pamu: remove the snoop_id field
Date: Thu,  1 Apr 2021 17:52:47 +0200
Message-Id: <20210401155256.298656-12-hch@lst.de>
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

The snoop_id is always set to ~(u32)0.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c | 5 ++---
 drivers/iommu/fsl_pamu_domain.h | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index c2e7e17570e76d..e9c1e0dd68f084 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -97,12 +97,12 @@ static int pamu_set_liodn(struct fsl_dma_domain *dma_domain, struct device *dev,
 		goto out_unlock;
 	ret = pamu_config_ppaace(liodn, geom->aperture_start,
 				 geom->aperture_end + 1, omi_index, 0,
-				 dma_domain->snoop_id, dma_domain->stash_id, 0);
+				 ~(u32)0, dma_domain->stash_id, 0);
 	if (ret)
 		goto out_unlock;
 	ret = pamu_config_ppaace(liodn, geom->aperture_start,
 				 geom->aperture_end + 1, ~(u32)0,
-				 0, dma_domain->snoop_id, dma_domain->stash_id,
+				 0, ~(u32)0, dma_domain->stash_id,
 				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
 out_unlock:
 	spin_unlock_irqrestore(&iommu_lock, flags);
@@ -210,7 +210,6 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 		return NULL;
 
 	dma_domain->stash_id = ~(u32)0;
-	dma_domain->snoop_id = ~(u32)0;
 	INIT_LIST_HEAD(&dma_domain->devices);
 	spin_lock_init(&dma_domain->domain_lock);
 
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index 5f4ed253f61b31..95ac1b3cab3b69 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -13,7 +13,6 @@ struct fsl_dma_domain {
 	/* list of devices associated with the domain */
 	struct list_head		devices;
 	u32				stash_id;
-	u32				snoop_id;
 	struct iommu_domain		iommu_domain;
 	spinlock_t			domain_lock;
 };
-- 
2.30.1

