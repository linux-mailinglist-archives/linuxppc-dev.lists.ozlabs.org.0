Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352A209FB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 15:23:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t11T1jvqzDqm9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:23:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t0hH6rxbzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:08:47 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 821AE412; Thu, 25 Jun 2020 15:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 04/13] iommu/omap: Use dev_iommu_priv_get/set()
Date: Thu, 25 Jun 2020 15:08:27 +0200
Message-Id: <20200625130836.1916-5-joro@8bytes.org>
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
 drivers/iommu/omap-iommu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c8282cc212cb..e84ead6fb234 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -71,7 +71,7 @@ static struct omap_iommu_domain *to_omap_domain(struct iommu_domain *dom)
  **/
 void omap_iommu_save_ctx(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu *obj;
 	u32 *p;
 	int i;
@@ -101,7 +101,7 @@ EXPORT_SYMBOL_GPL(omap_iommu_save_ctx);
  **/
 void omap_iommu_restore_ctx(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu *obj;
 	u32 *p;
 	int i;
@@ -1398,7 +1398,7 @@ static size_t omap_iommu_unmap(struct iommu_domain *domain, unsigned long da,
 
 static int omap_iommu_count(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	int count = 0;
 
 	while (arch_data->iommu_dev) {
@@ -1459,8 +1459,8 @@ static void omap_iommu_detach_fini(struct omap_iommu_domain *odomain)
 static int
 omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
 	struct omap_iommu_device *iommu;
 	struct omap_iommu *oiommu;
 	int ret = 0;
@@ -1524,7 +1524,7 @@ omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 				   struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu_device *iommu = omap_domain->iommus;
 	struct omap_iommu *oiommu;
 	int i;
@@ -1650,7 +1650,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 	int num_iommus, i;
 
 	/*
-	 * Allocate the archdata iommu structure for DT-based devices.
+	 * Allocate the per-device iommu structure for DT-based devices.
 	 *
 	 * TODO: Simplify this when removing non-DT support completely from the
 	 * IOMMU users.
@@ -1698,7 +1698,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 		of_node_put(np);
 	}
 
-	dev->archdata.iommu = arch_data;
+	dev_iommu_priv_set(dev, arch_data);
 
 	/*
 	 * use the first IOMMU alone for the sysfs device linking.
@@ -1712,19 +1712,19 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 
 static void omap_iommu_release_device(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 
 	if (!dev->of_node || !arch_data)
 		return;
 
-	dev->archdata.iommu = NULL;
+	dev_iommu_priv_set(dev, NULL);
 	kfree(arch_data);
 
 }
 
 static struct iommu_group *omap_iommu_device_group(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct iommu_group *group = ERR_PTR(-EINVAL);
 
 	if (!arch_data)
-- 
2.27.0

