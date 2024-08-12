Return-Path: <linuxppc-dev+bounces-4-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AD94E82A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:02:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCbU+Pv9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6Rx5gW4z2xQC;
	Mon, 12 Aug 2024 18:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCbU+Pv9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Mon, 12 Aug 2024 17:30:29 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj5lT3JQZz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 17:30:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723447830; x=1754983830;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e0LBAejigITG9AP6jtpikNxNxU3HNaCX57Mb/ZLuVkc=;
  b=cCbU+Pv9qVe0lc/cnTtS6nlX0G0Gjv6T6V1Fy+20pB5/CGVHvSqDbtJj
   ia8UNImu3t1PXAYQ74Slv3sCgeoycPaymF2w+dCr439QEUJY9sbHhMZGu
   8run4ClgifVVS6tfb1M3hhSpr0YE/VcYNugxifK1PjlU5jk9LVfYrK2xU
   NdQTJai7J01xEjkOR8vc4TVJg6DQTJbSnnR4ZoU2uQLQbJ1OmsFztLtwe
   uYQD6UtGFf2hHWVgCWy3XuzegyEJQrVO4a8pIwFcd0ErcWpcuES3AXod4
   SATYqh3kB2N/+jrxEvGsTr6nk21w84IYXo8ZW0jn55gDd2/5UnM3GvF6t
   A==;
X-CSE-ConnectionGUID: yed2NRhmTwG+4GbJSZ0bWw==
X-CSE-MsgGUID: mdzKjFEpSUGyeh3rnK8XjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21686650"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21686650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:29:10 -0700
X-CSE-ConnectionGUID: ftLXCe6zSOeVfNj73MeBtA==
X-CSE-MsgGUID: Haii5Zw9R/2Xjpz6GDYbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58894812"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2024 00:29:06 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 1/1] soc/fsl/qbman: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:25:27 +0800
Message-Id: <20240812072527.9660-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iommu domain is allocated in portal_set_cpu() and is attached to
pcfg->dev in the same function.

Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-14-baolu.lu@linux.intel.com
---
 drivers/soc/fsl/qbman/qman_portal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index e23b60618c1a..456ef5d5c199 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -48,9 +48,10 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 	struct device *dev = pcfg->dev;
 	int ret;
 
-	pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
-	if (!pcfg->iommu_domain) {
+	pcfg->iommu_domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(pcfg->iommu_domain)) {
 		dev_err(dev, "%s(): iommu_domain_alloc() failed", __func__);
+		pcfg->iommu_domain = NULL;
 		goto no_iommu;
 	}
 	ret = fsl_pamu_configure_l1_stash(pcfg->iommu_domain, cpu);
-- 
2.34.1


