Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6D351679
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7Br61RMz3fn5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:58:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0Mip3kV;
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
 header.s=bombadil.20210309 header.b=c0Mip3kV; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB75R2MbLz3cCk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:53:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rBjgOpr0tzNkPVLnZSe6stElDoTGjZis4zpsufGo8Pc=; b=c0Mip3kVULe6QjvABjE3wLhoHi
 R/D5vtScPvo83qhv3axkBw4kbTEa6bwS3+Do6h8BO9gcmXtwA1+lrFFdjowPelND/sTlkhN+xSdMh
 goOUyVtk7vqmZNWXPWa3x8pETu/KCjKoUX1tPw/n6/Li3c8JO5bkCUkmaAwiC2W3knx5gxSbuj+/S
 nszzVSuD7B/DX1VoqvqCpx+4Rj02N9s1rsUjkr7wsZAvupLT3Gy8oT6DmWLcUOL7rqnQR3zX2fnhL
 ennyvA3k09CWecu1ksSogTTvo9yQdn5q6ylO0U8AIauJ7d0mTW2FDSqFNwb0t85Q1U9FhG9z+Zyqf
 dwa8bw0Q==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdY-00Cic9-4K; Thu, 01 Apr 2021 15:53:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 10/20] iommu/fsl_pamu: enable the liodn when attaching a device
Date: Thu,  1 Apr 2021 17:52:46 +0200
Message-Id: <20210401155256.298656-11-hch@lst.de>
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

Instead of a separate call to enable all devices from the list, just
enable the liodn once the device is attached to the iommu domain.

This also remove the DOMAIN_ATTR_FSL_PAMU_ENABLE iommu_attr.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c     | 47 ++---------------------------
 drivers/iommu/fsl_pamu_domain.h     | 10 ------
 drivers/soc/fsl/qbman/qman_portal.c | 11 -------
 include/linux/iommu.h               |  1 -
 4 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 41927c3c417751..c2e7e17570e76d 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -195,9 +195,6 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
 
 	/* remove all the devices from the device list */
 	detach_device(NULL, dma_domain);
-
-	dma_domain->enabled = 0;
-
 	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
 }
 
@@ -285,6 +282,9 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
 		if (ret)
 			break;
+		ret = pamu_enable_liodn(liodn[i]);
+		if (ret)
+			break;
 	}
 	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 	return ret;
@@ -341,46 +341,6 @@ int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 	return ret;
 }
 
-/* Configure domain dma state i.e. enable/disable DMA */
-static int configure_domain_dma_state(struct fsl_dma_domain *dma_domain, bool enable)
-{
-	struct device_domain_info *info;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	dma_domain->enabled = enable;
-	list_for_each_entry(info, &dma_domain->devices, link) {
-		ret = (enable) ? pamu_enable_liodn(info->liodn) :
-			pamu_disable_liodn(info->liodn);
-		if (ret)
-			pr_debug("Unable to set dma state for liodn %d",
-				 info->liodn);
-	}
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return 0;
-}
-
-static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr_type, void *data)
-{
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	int ret = 0;
-
-	switch (attr_type) {
-	case DOMAIN_ATTR_FSL_PAMU_ENABLE:
-		ret = configure_domain_dma_state(dma_domain, *(int *)data);
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
@@ -505,7 +465,6 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.attach_dev	= fsl_pamu_attach_device,
 	.detach_dev	= fsl_pamu_detach_device,
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
-	.domain_set_attr = fsl_pamu_set_domain_attr,
 	.probe_device	= fsl_pamu_probe_device,
 	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index cd488004acd1b3..5f4ed253f61b31 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -12,16 +12,6 @@
 struct fsl_dma_domain {
 	/* list of devices associated with the domain */
 	struct list_head		devices;
-	/* dma_domain states:
-	 * enabled - DMA has been enabled for the given
-	 * domain. This translates to setting of the
-	 * valid bit for the primary PAACE in the PAMU
-	 * PAACT table. Domain geometry should be set and
-	 * it must have a valid mapping before DMA can be
-	 * enabled for it.
-	 *
-	 */
-	int				enabled;
 	u32				stash_id;
 	u32				snoop_id;
 	struct iommu_domain		iommu_domain;
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 798b3a1ffd0b9c..bf38eb0042ed52 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -46,7 +46,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 {
 #ifdef CONFIG_FSL_PAMU
 	struct device *dev = pcfg->dev;
-	int window_count = 1;
 	int ret;
 
 	pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
@@ -66,14 +65,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 			ret);
 		goto out_domain_free;
 	}
-	ret = iommu_domain_set_attr(pcfg->iommu_domain,
-				    DOMAIN_ATTR_FSL_PAMU_ENABLE,
-				    &window_count);
-	if (ret < 0) {
-		dev_err(dev, "%s(): iommu_domain_set_attr() = %d", __func__,
-			ret);
-		goto out_detach_device;
-	}
 
 no_iommu:
 #endif
@@ -82,8 +73,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 	return;
 
 #ifdef CONFIG_FSL_PAMU
-out_detach_device:
-	iommu_detach_device(pcfg->iommu_domain, NULL);
 out_domain_free:
 	iommu_domain_free(pcfg->iommu_domain);
 	pcfg->iommu_domain = NULL;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 208e570e8d99e7..840864844027dc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -109,7 +109,6 @@ enum iommu_cap {
 enum iommu_attr {
 	DOMAIN_ATTR_GEOMETRY,
 	DOMAIN_ATTR_PAGING,
-	DOMAIN_ATTR_FSL_PAMU_ENABLE,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_IO_PGTABLE_CFG,
-- 
2.30.1

