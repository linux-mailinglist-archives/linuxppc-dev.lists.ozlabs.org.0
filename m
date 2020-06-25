Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974F209F9F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 15:19:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t0w75g37zDqrN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=8bytes.org (client-ip=2a01:238:4383:600:38bc:a715:4b6d:a889;
 helo=theia.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=8bytes.org
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t0hG0rXTzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:08:45 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3A7BB261; Thu, 25 Jun 2020 15:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 02/13] iommu/vt-d: Use dev_iommu_priv_get/set()
Date: Thu, 25 Jun 2020 15:08:25 +0200
Message-Id: <20200625130836.1916-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
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
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joerg Roedel <jroedel@suse.de>

Remove the use of dev->archdata.iommu and use the private per-device
pointer provided by IOMMU core code instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 .../gpu/drm/i915/selftests/mock_gem_device.c   | 10 ++++++++--
 drivers/iommu/intel/iommu.c                    | 18 +++++++++---------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 9b105b811f1f..e08601905a64 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -24,6 +24,7 @@
 
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/iommu.h>
 
 #include <drm/drm_managed.h>
 
@@ -118,6 +119,9 @@ struct drm_i915_private *mock_gem_device(void)
 {
 	struct drm_i915_private *i915;
 	struct pci_dev *pdev;
+#if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
+	struct dev_iommu iommu;
+#endif
 	int err;
 
 	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
@@ -136,8 +140,10 @@ struct drm_i915_private *mock_gem_device(void)
 	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 
 #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
-	/* hack to disable iommu for the fake device; force identity mapping */
-	pdev->dev.archdata.iommu = (void *)-1;
+	/* HACK HACK HACK to disable iommu for the fake device; force identity mapping */
+	memset(&iommu, 0, sizeof(iommu));
+	iommu.priv = (void *)-1;
+	pdev->dev.iommu = &iommu;
 #endif
 
 	pci_set_drvdata(pdev, i915);
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d759e7234e98..2ce490c2eab8 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -372,7 +372,7 @@ struct device_domain_info *get_domain_info(struct device *dev)
 	if (!dev)
 		return NULL;
 
-	info = dev->archdata.iommu;
+	info = dev_iommu_priv_get(dev);
 	if (unlikely(info == DUMMY_DEVICE_DOMAIN_INFO ||
 		     info == DEFER_DEVICE_DOMAIN_INFO))
 		return NULL;
@@ -743,12 +743,12 @@ struct context_entry *iommu_context_addr(struct intel_iommu *iommu, u8 bus,
 
 static int iommu_dummy(struct device *dev)
 {
-	return dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO;
+	return dev_iommu_priv_get(dev) == DUMMY_DEVICE_DOMAIN_INFO;
 }
 
 static bool attach_deferred(struct device *dev)
 {
-	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
+	return dev_iommu_priv_get(dev) == DEFER_DEVICE_DOMAIN_INFO;
 }
 
 /**
@@ -2420,7 +2420,7 @@ static inline void unlink_domain_info(struct device_domain_info *info)
 	list_del(&info->link);
 	list_del(&info->global);
 	if (info->dev)
-		info->dev->archdata.iommu = NULL;
+		dev_iommu_priv_set(info->dev, NULL);
 }
 
 static void domain_remove_dev_info(struct dmar_domain *domain)
@@ -2453,7 +2453,7 @@ static void do_deferred_attach(struct device *dev)
 {
 	struct iommu_domain *domain;
 
-	dev->archdata.iommu = NULL;
+	dev_iommu_priv_set(dev, NULL);
 	domain = iommu_get_domain_for_dev(dev);
 	if (domain)
 		intel_iommu_attach_device(domain, dev);
@@ -2599,7 +2599,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	list_add(&info->link, &domain->devices);
 	list_add(&info->global, &device_domain_list);
 	if (dev)
-		dev->archdata.iommu = info;
+		dev_iommu_priv_set(dev, info);
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 
 	/* PASID table is mandatory for a PCI device in scalable mode. */
@@ -4004,7 +4004,7 @@ static void quirk_ioat_snb_local_iommu(struct pci_dev *pdev)
 	if (!drhd || drhd->reg_base_addr - vtbar != 0xa000) {
 		pr_warn_once(FW_BUG "BIOS assigned incorrect VT-d unit for Intel(R) QuickData Technology device\n");
 		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
-		pdev->dev.archdata.iommu = DUMMY_DEVICE_DOMAIN_INFO;
+		dev_iommu_priv_set(&pdev->dev, DUMMY_DEVICE_DOMAIN_INFO);
 	}
 }
 DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_IOAT_SNB, quirk_ioat_snb_local_iommu);
@@ -4043,7 +4043,7 @@ static void __init init_no_remapping_devices(void)
 			drhd->ignored = 1;
 			for_each_active_dev_scope(drhd->devices,
 						  drhd->devices_cnt, i, dev)
-				dev->archdata.iommu = DUMMY_DEVICE_DOMAIN_INFO;
+				dev_iommu_priv_set(dev, DUMMY_DEVICE_DOMAIN_INFO);
 		}
 	}
 }
@@ -5665,7 +5665,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 		return ERR_PTR(-ENODEV);
 
 	if (translation_pre_enabled(iommu))
-		dev->archdata.iommu = DEFER_DEVICE_DOMAIN_INFO;
+		dev_iommu_priv_set(dev, DEFER_DEVICE_DOMAIN_INFO);
 
 	return &iommu->iommu;
 }
-- 
2.27.0

