Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F25209FA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 15:21:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t0yj5wBhzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:21:17 +1000 (AEST)
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
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t0hH6KJbzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:08:47 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1D4FB391; Thu, 25 Jun 2020 15:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 01/13] iommu/exynos: Use dev_iommu_priv_get/set()
Date: Thu, 25 Jun 2020 15:08:24 +0200
Message-Id: <20200625130836.1916-2-joro@8bytes.org>
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
 drivers/iommu/exynos-iommu.c                  | 20 +++++++++----------
 .../media/platform/s5p-mfc/s5p_mfc_iommu.h    |  4 +++-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 60c8a56e4a3f..6a9b67302369 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -173,7 +173,7 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define REG_V5_FAULT_AR_VA	0x070
 #define REG_V5_FAULT_AW_VA	0x080
 
-#define has_sysmmu(dev)		(dev->archdata.iommu != NULL)
+#define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
 
 static struct device *dma_dev;
 static struct kmem_cache *lv2table_kmem_cache;
@@ -226,7 +226,7 @@ static const struct sysmmu_fault_info sysmmu_v5_faults[] = {
 };
 
 /*
- * This structure is attached to dev.archdata.iommu of the master device
+ * This structure is attached to dev->iommu->priv of the master device
  * on device add, contains a list of SYSMMU controllers defined by device tree,
  * which are bound to given master device. It is usually referenced by 'owner'
  * pointer.
@@ -670,7 +670,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 	struct device *master = data->master;
 
 	if (master) {
-		struct exynos_iommu_owner *owner = master->archdata.iommu;
+		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
 		if (data->domain) {
@@ -688,7 +688,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
 	struct device *master = data->master;
 
 	if (master) {
-		struct exynos_iommu_owner *owner = master->archdata.iommu;
+		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
 		if (data->domain) {
@@ -837,8 +837,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 				    struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
+	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	struct sysmmu_drvdata *data, *next;
 	unsigned long flags;
@@ -875,8 +875,8 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 				   struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
+	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	unsigned long flags;
@@ -1237,7 +1237,7 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 
 static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
+	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
 	if (!has_sysmmu(dev))
@@ -1263,7 +1263,7 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 
 static void exynos_iommu_release_device(struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
+	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
 	if (!has_sysmmu(dev))
@@ -1287,8 +1287,8 @@ static void exynos_iommu_release_device(struct device *dev)
 static int exynos_iommu_of_xlate(struct device *dev,
 				 struct of_phandle_args *spec)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
+	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data, *entry;
 
 	if (!sysmmu)
@@ -1305,7 +1305,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
-		dev->archdata.iommu = owner;
+		dev_iommu_priv_set(dev, owner);
 	}
 
 	list_for_each_entry(entry, &owner->controllers, owner_node)
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
index 152a713fff78..1a32266b7ddc 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
@@ -9,9 +9,11 @@
 
 #if defined(CONFIG_EXYNOS_IOMMU)
 
+#include <linux/iommu.h>
+
 static inline bool exynos_is_iommu_available(struct device *dev)
 {
-	return dev->archdata.iommu != NULL;
+	return dev_iommu_priv_get(dev) != NULL;
 }
 
 #else
-- 
2.27.0

