Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2B416485
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 19:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFj2T5lWnz3cLw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 03:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ben.widawsky@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFhxs60Wfz2yb1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 03:30:09 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="222014582"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="222014582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="704832583"
Received: from unknown (HELO bad-guy.kumite) ([10.252.132.140])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:57 -0700
From: Ben Widawsky <ben.widawsky@intel.com>
To: linux-cxl@vger.kernel.org
Subject: [PATCH v2 9/9] iommu/vt-d: Use pci core's DVSEC functionality
Date: Thu, 23 Sep 2021 10:26:47 -0700
Message-Id: <20210923172647.72738-10-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923172647.72738-1-ben.widawsky@intel.com>
References: <20210923172647.72738-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Kan Liang <kan.liang@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce maintenance burden of DVSEC query implementation by using the
centralized PCI core implementation.

Cc: iommu@lists.linux-foundation.org
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 drivers/iommu/intel/iommu.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d75f59ae28e6..30c97181f0ae 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5398,20 +5398,7 @@ static int intel_iommu_disable_sva(struct device *dev)
  */
 static int siov_find_pci_dvsec(struct pci_dev *pdev)
 {
-	int pos;
-	u16 vendor, id;
-
-	pos = pci_find_next_ext_capability(pdev, 0, 0x23);
-	while (pos) {
-		pci_read_config_word(pdev, pos + 4, &vendor);
-		pci_read_config_word(pdev, pos + 8, &id);
-		if (vendor == PCI_VENDOR_ID_INTEL && id == 5)
-			return pos;
-
-		pos = pci_find_next_ext_capability(pdev, pos, 0x23);
-	}
-
-	return 0;
+	return pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_INTEL, 5);
 }
 
 static bool
-- 
2.33.0

