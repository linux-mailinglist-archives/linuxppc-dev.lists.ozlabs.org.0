Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AEF3279A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 09:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpv4m1bSNz3d6j
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:46:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=g2yTR3uS;
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
 header.s=casper.20170209 header.b=g2yTR3uS; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpv301nK0z3ckS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 19:45:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=p0/ZWbsw4++11VUc7VenUuhCWnNpQwnxFKqFPYZ0sEk=; b=g2yTR3uSb35qR6uyNqXEWRISj6
 93Siy2tKCbrEZgo/37Qco2+4I78eqSi6gm6npRNdHUmLArXKluvyoJj/xrDpdymo7gK+kpog+N5tg
 M+awl562FE4CvkIdIHM1eSwllSSMtVxX1sbWdKmgeuyBTQaeY6lxEsr6MlAmN7Iy9sRaSXaOl8llc
 TXZ31uw/eRnAFVoWx8k/J28+Mvyf4LJe3p02ONMivbQ+UOgAobgaH36haGeIvz/GmPiXR8sI4FxZ/
 82J9ytOYFIollioksttfdNFsgt4O+U75PJZyRfcWEjDkokz/s69/oDp4WoP7f7JGdjeQ6F21HqGs0
 3J0NrWyg==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGe9r-00FUYy-Gt; Mon, 01 Mar 2021 08:44:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 06/17] iommu/fsl_pamu: remove ->domain_window_enable
Date: Mon,  1 Mar 2021 09:42:46 +0100
Message-Id: <20210301084257.945454-7-hch@lst.de>
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

The only thing that fsl_pamu_window_enable does for the current caller
is to fill in the prot value in the only dma_window structure, and to
propagate a few values from the iommu_domain_geometry struture into the
dma_window.  Remove the dma_window entirely, hardcode the prot value and
otherwise use the iommu_domain_geometry structure instead.

Remove the now unused ->domain_window_enable iommu method.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/fsl_pamu_domain.c     | 182 +++-------------------------
 drivers/iommu/fsl_pamu_domain.h     |  17 ---
 drivers/iommu/iommu.c               |  11 --
 drivers/soc/fsl/qbman/qman_portal.c |   7 --
 include/linux/iommu.h               |  17 ---
 5 files changed, 14 insertions(+), 220 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index e6bdd38fc18409..fd2bc88b690465 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -54,34 +54,18 @@ static int __init iommu_init_mempool(void)
 	return 0;
 }
 
-static phys_addr_t get_phys_addr(struct fsl_dma_domain *dma_domain, dma_addr_t iova)
-{
-	struct dma_window *win_ptr = &dma_domain->win_arr[0];
-	struct iommu_domain_geometry *geom;
-
-	geom = &dma_domain->iommu_domain.geometry;
-
-	if (win_ptr->valid)
-		return win_ptr->paddr + (iova & (win_ptr->size - 1));
-
-	return 0;
-}
-
 /* Map the DMA window corresponding to the LIODN */
 static int map_liodn(int liodn, struct fsl_dma_domain *dma_domain)
 {
 	int ret;
-	struct dma_window *wnd = &dma_domain->win_arr[0];
-	phys_addr_t wnd_addr = dma_domain->iommu_domain.geometry.aperture_start;
+	struct iommu_domain_geometry *geom = &dma_domain->iommu_domain.geometry;
 	unsigned long flags;
 
 	spin_lock_irqsave(&iommu_lock, flags);
-	ret = pamu_config_ppaace(liodn, wnd_addr,
-				 wnd->size,
-				 ~(u32)0,
-				 wnd->paddr >> PAMU_PAGE_SHIFT,
-				 dma_domain->snoop_id, dma_domain->stash_id,
-				 wnd->prot);
+	ret = pamu_config_ppaace(liodn, geom->aperture_start,
+				 geom->aperture_end - 1, ~(u32)0,
+				 0, dma_domain->snoop_id, dma_domain->stash_id,
+				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
 	spin_unlock_irqrestore(&iommu_lock, flags);
 	if (ret)
 		pr_debug("PAACE configuration failed for liodn %d\n", liodn);
@@ -89,33 +73,6 @@ static int map_liodn(int liodn, struct fsl_dma_domain *dma_domain)
 	return ret;
 }
 
-/* Update window/subwindow mapping for the LIODN */
-static int update_liodn(int liodn, struct fsl_dma_domain *dma_domain, u32 wnd_nr)
-{
-	int ret;
-	struct dma_window *wnd = &dma_domain->win_arr[wnd_nr];
-	phys_addr_t wnd_addr;
-	unsigned long flags;
-
-	spin_lock_irqsave(&iommu_lock, flags);
-
-	wnd_addr = dma_domain->iommu_domain.geometry.aperture_start;
-
-	ret = pamu_config_ppaace(liodn, wnd_addr,
-				 wnd->size,
-				 ~(u32)0,
-				 wnd->paddr >> PAMU_PAGE_SHIFT,
-				 dma_domain->snoop_id, dma_domain->stash_id,
-				 wnd->prot);
-	if (ret)
-		pr_debug("Window reconfiguration failed for liodn %d\n",
-			 liodn);
-
-	spin_unlock_irqrestore(&iommu_lock, flags);
-
-	return ret;
-}
-
 static int update_liodn_stash(int liodn, struct fsl_dma_domain *dma_domain,
 			      u32 val)
 {
@@ -172,26 +129,6 @@ static int pamu_set_liodn(int liodn, struct device *dev,
 	return ret;
 }
 
-static int check_size(u64 size, dma_addr_t iova)
-{
-	/*
-	 * Size must be a power of two and at least be equal
-	 * to PAMU page size.
-	 */
-	if ((size & (size - 1)) || size < PAMU_PAGE_SIZE) {
-		pr_debug("Size too small or not a power of two\n");
-		return -EINVAL;
-	}
-
-	/* iova must be page size aligned */
-	if (iova & (size - 1)) {
-		pr_debug("Address is not aligned with window size\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static void remove_device_ref(struct device_domain_info *info)
 {
 	unsigned long flags;
@@ -257,13 +194,10 @@ static void attach_device(struct fsl_dma_domain *dma_domain, int liodn, struct d
 static phys_addr_t fsl_pamu_iova_to_phys(struct iommu_domain *domain,
 					 dma_addr_t iova)
 {
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-
 	if (iova < domain->geometry.aperture_start ||
 	    iova > domain->geometry.aperture_end)
 		return 0;
-
-	return get_phys_addr(dma_domain, iova);
+	return iova;
 }
 
 static bool fsl_pamu_capable(enum iommu_cap cap)
@@ -279,7 +213,6 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
 	detach_device(NULL, dma_domain);
 
 	dma_domain->enabled = 0;
-	dma_domain->mapped = 0;
 
 	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
 }
@@ -323,84 +256,6 @@ static int update_domain_stash(struct fsl_dma_domain *dma_domain, u32 val)
 	return ret;
 }
 
-/* Update domain mappings for all LIODNs associated with the domain */
-static int update_domain_mapping(struct fsl_dma_domain *dma_domain, u32 wnd_nr)
-{
-	struct device_domain_info *info;
-	int ret = 0;
-
-	list_for_each_entry(info, &dma_domain->devices, link) {
-		ret = update_liodn(info->liodn, dma_domain, wnd_nr);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-
-
-static int fsl_pamu_window_enable(struct iommu_domain *domain, u32 wnd_nr,
-				  phys_addr_t paddr, u64 size, int prot)
-{
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	struct dma_window *wnd;
-	int pamu_prot = 0;
-	int ret;
-	unsigned long flags;
-	u64 win_size;
-
-	if (prot & IOMMU_READ)
-		pamu_prot |= PAACE_AP_PERMS_QUERY;
-	if (prot & IOMMU_WRITE)
-		pamu_prot |= PAACE_AP_PERMS_UPDATE;
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	if (wnd_nr > 0) {
-		pr_debug("Invalid window index\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -EINVAL;
-	}
-
-	win_size = (domain->geometry.aperture_end + 1) >> ilog2(1);
-	if (size > win_size) {
-		pr_debug("Invalid window size\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -EINVAL;
-	}
-
-	if (dma_domain->enabled) {
-		pr_debug("Disable the window before updating the mapping\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -EBUSY;
-	}
-
-	ret = check_size(size, domain->geometry.aperture_start);
-	if (ret) {
-		pr_debug("Aperture start not aligned to the size\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -EINVAL;
-	}
-
-	wnd = &dma_domain->win_arr[wnd_nr];
-	if (!wnd->valid) {
-		wnd->paddr = paddr;
-		wnd->size = size;
-		wnd->prot = pamu_prot;
-
-		ret = update_domain_mapping(dma_domain, wnd_nr);
-		if (!ret) {
-			wnd->valid = 1;
-			dma_domain->mapped++;
-		}
-	} else {
-		pr_debug("Disable the window before updating the mapping\n");
-		ret = -EBUSY;
-	}
-
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return ret;
-}
-
 /*
  * Attach the LIODN to the DMA domain and configure the geometry
  * and window mappings.
@@ -434,15 +289,14 @@ static int handle_attach_device(struct fsl_dma_domain *dma_domain,
 				     &domain->geometry);
 		if (ret)
 			break;
-		if (dma_domain->mapped) {
-			/*
-			 * Create window/subwindow mapping for
-			 * the LIODN.
-			 */
-			ret = map_liodn(liodn[i], dma_domain);
-			if (ret)
-				break;
-		}
+
+		/*
+		 * Create window/subwindow mapping for
+		 * the LIODN.
+		 */
+		ret = map_liodn(liodn[i], dma_domain);
+		if (ret)
+			break;
 	}
 	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 
@@ -552,13 +406,6 @@ static int configure_domain_dma_state(struct fsl_dma_domain *dma_domain, bool en
 	int ret;
 
 	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-
-	if (enable && !dma_domain->mapped) {
-		pr_debug("Can't enable DMA domain without valid mapping\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -ENODEV;
-	}
-
 	dma_domain->enabled = enable;
 	list_for_each_entry(info, &dma_domain->devices, link) {
 		ret = (enable) ? pamu_enable_liodn(info->liodn) :
@@ -717,7 +564,6 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.domain_free    = fsl_pamu_domain_free,
 	.attach_dev	= fsl_pamu_attach_device,
 	.detach_dev	= fsl_pamu_detach_device,
-	.domain_window_enable = fsl_pamu_window_enable,
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
 	.domain_set_attr = fsl_pamu_set_domain_attr,
 	.probe_device	= fsl_pamu_probe_device,
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index b9236fb5a8f82e..13ee06e0ef0136 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -9,26 +9,10 @@
 
 #include "fsl_pamu.h"
 
-struct dma_window {
-	phys_addr_t paddr;
-	u64 size;
-	int valid;
-	int prot;
-};
-
 struct fsl_dma_domain {
-	/*
-	 * win_arr contains information of the configured
-	 * windows for a domain. This is allocated only
-	 * when the number of windows for the domain are
-	 * set.
-	 */
-	struct dma_window		win_arr[1];
 	/* list of devices associated with the domain */
 	struct list_head		devices;
 	/* dma_domain states:
-	 * mapped - A particular mapping has been created
-	 * within the configured geometry.
 	 * enabled - DMA has been enabled for the given
 	 * domain. This translates to setting of the
 	 * valid bit for the primary PAACE in the PAMU
@@ -37,7 +21,6 @@ struct fsl_dma_domain {
 	 * enabled for it.
 	 *
 	 */
-	int				mapped;
 	int				enabled;
 	/* stash_id obtained from the stash attribute details */
 	u32				stash_id;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d0b0a15dba8413..b212bf0261820b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2610,17 +2610,6 @@ size_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long iova,
 	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_ATOMIC);
 }
 
-int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
-			       phys_addr_t paddr, u64 size, int prot)
-{
-	if (unlikely(domain->ops->domain_window_enable == NULL))
-		return -ENODEV;
-
-	return domain->ops->domain_window_enable(domain, wnd_nr, paddr, size,
-						 prot);
-}
-EXPORT_SYMBOL_GPL(iommu_domain_window_enable);
-
 /**
  * report_iommu_fault() - report about an IOMMU fault to the IOMMU framework
  * @domain: the iommu domain where the fault has happened
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 3d56ec4b373b4b..9ee1663f422cbf 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -65,13 +65,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 			__func__, ret);
 		goto out_domain_free;
 	}
-	ret = iommu_domain_window_enable(pcfg->iommu_domain, 0, 0, 1ULL << 36,
-					 IOMMU_READ | IOMMU_WRITE);
-	if (ret < 0) {
-		dev_err(dev, "%s(): iommu_domain_window_enable() = %d",
-			__func__, ret);
-		goto out_domain_free;
-	}
 	ret = iommu_attach_device(pcfg->iommu_domain, dev);
 	if (ret < 0) {
 		dev_err(dev, "%s(): iommu_device_attach() = %d", __func__,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 861c3558c878bf..f7baa81887a8bc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -203,7 +203,6 @@ struct iommu_iotlb_gather {
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
  * @apply_resv_region: Temporary helper call-back for iova reserved ranges
- * @domain_window_enable: Configure and enable a particular window for a domain
  * @of_xlate: add OF master IDs to iommu grouping
  * @is_attach_deferred: Check if domain attach should be deferred from iommu
  *                      driver init to device driver init (default no)
@@ -261,10 +260,6 @@ struct iommu_ops {
 				  struct iommu_domain *domain,
 				  struct iommu_resv_region *region);
 
-	/* Window handling functions */
-	int (*domain_window_enable)(struct iommu_domain *domain, u32 wnd_nr,
-				    phys_addr_t paddr, u64 size, int prot);
-
 	int (*of_xlate)(struct device *dev, struct of_phandle_args *args);
 	bool (*is_attach_deferred)(struct iommu_domain *domain, struct device *dev);
 
@@ -505,11 +500,6 @@ extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
 extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
 				 void *data);
 
-/* Window handling function prototypes */
-extern int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
-				      phys_addr_t offset, u64 size,
-				      int prot);
-
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
 
@@ -735,13 +725,6 @@ static inline void iommu_iotlb_sync(struct iommu_domain *domain,
 {
 }
 
-static inline int iommu_domain_window_enable(struct iommu_domain *domain,
-					     u32 wnd_nr, phys_addr_t paddr,
-					     u64 size, int prot)
-{
-	return -ENODEV;
-}
-
 static inline phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 {
 	return 0;
-- 
2.29.2

