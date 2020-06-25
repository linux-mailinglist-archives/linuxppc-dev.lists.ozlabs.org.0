Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C020A02D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 15:43:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t1Rv548DzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:43:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t0hP1NLfzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:08:53 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5E1104CB; Thu, 25 Jun 2020 15:08:39 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 08/13] iommu/mediatek: Do no use dev->archdata.iommu
Date: Thu, 25 Jun 2020 15:08:31 +0200
Message-Id: <20200625130836.1916-9-joro@8bytes.org>
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

The iommu private pointer is already used in the Mediatek IOMMU v1
driver, so move the dma_iommu_mapping pointer into 'struct
mtk_iommu_data' and do not use dev->archdata.iommu anymore.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/mtk_iommu.h    |  2 ++
 drivers/iommu/mtk_iommu_v1.c | 10 ++++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..1682406e98dc 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -62,6 +62,8 @@ struct mtk_iommu_data {
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
 
+	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
+
 	struct list_head		list;
 	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
 };
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index c9d79cff4d17..82ddfe9170d4 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -269,7 +269,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	int ret;
 
 	/* Only allow the domain created internally. */
-	mtk_mapping = data->dev->archdata.iommu;
+	mtk_mapping = data->mapping;
 	if (mtk_mapping->domain != domain)
 		return 0;
 
@@ -369,7 +369,6 @@ static int mtk_iommu_create_mapping(struct device *dev,
 	struct mtk_iommu_data *data;
 	struct platform_device *m4updev;
 	struct dma_iommu_mapping *mtk_mapping;
-	struct device *m4udev;
 	int ret;
 
 	if (args->args_count != 1) {
@@ -401,8 +400,7 @@ static int mtk_iommu_create_mapping(struct device *dev,
 		return ret;
 
 	data = dev_iommu_priv_get(dev);
-	m4udev = data->dev;
-	mtk_mapping = m4udev->archdata.iommu;
+	mtk_mapping = data->mapping;
 	if (!mtk_mapping) {
 		/* MTK iommu support 4GB iova address space. */
 		mtk_mapping = arm_iommu_create_mapping(&platform_bus_type,
@@ -410,7 +408,7 @@ static int mtk_iommu_create_mapping(struct device *dev,
 		if (IS_ERR(mtk_mapping))
 			return PTR_ERR(mtk_mapping);
 
-		m4udev->archdata.iommu = mtk_mapping;
+		data->mapping = mtk_mapping;
 	}
 
 	return 0;
@@ -459,7 +457,7 @@ static void mtk_iommu_probe_finalize(struct device *dev)
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->dev->archdata.iommu;
+	mtk_mapping = data->mapping;
 
 	err = arm_iommu_attach_device(dev, mtk_mapping);
 	if (err)
-- 
2.27.0

