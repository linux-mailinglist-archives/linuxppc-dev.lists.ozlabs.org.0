Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F941647C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 19:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFj044NRRz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 03:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ben.widawsky@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFhxq331Dz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 03:30:07 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="222014564"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="222014564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="704832540"
Received: from unknown (HELO bad-guy.kumite) ([10.252.132.140])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:54 -0700
From: Ben Widawsky <ben.widawsky@intel.com>
To: linux-cxl@vger.kernel.org
Subject: [PATCH v2 4/9] cxl/pci: Refactor cxl_pci_setup_regs
Date: Thu, 23 Sep 2021 10:26:42 -0700
Message-Id: <20210923172647.72738-5-ben.widawsky@intel.com>
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
 Frederic Barrat <fbarrat@linux.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for moving parts of register mapping to cxl_core, the
cxl_pci driver is refactored to utilize a new helper to find register
blocks by type.

cxl_pci scanned through all register blocks and mapping the ones that
the driver will use. This logic is inverted so that the driver
specifically requests the register blocks from a new helper. Under the
hood, the same implementation of scanning through all register locator
DVSEC entries exists.

There are 2 behavioral changes (#2 is arguable):
1. A dev_err is introduced if cxl_map_regs fails.
2. The previous logic would try to map component registers and device
   registers multiple times if there were present and keep the mapping
   of the last one found (furthest offset in the register locator).
   While this is disallowed in the spec, CXL 2.0 8.1.9: "Each register
   block identifier shall only occur once in the Register Locator DVSEC
   structure" it was how the driver would respond to the spec violation.
   The new logic will take the first found register block by type and
   move on.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

---
Changes since v1:
---
 drivers/cxl/pci.c | 126 +++++++++++++++++++++++++---------------------
 1 file changed, 70 insertions(+), 56 deletions(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 7256c236fdb3..bbbacbc94fbf 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -428,6 +428,45 @@ static void cxl_decode_register_block(u32 reg_lo, u32 reg_hi,
 	*reg_type = FIELD_GET(CXL_REGLOC_RBI_MASK, reg_lo);
 }
 
+static int find_register_block(struct pci_dev *pdev, enum cxl_regloc_type type,
+			       struct cxl_register_map *map)
+{
+	int regloc, i, rc = -ENODEV;
+	u32 regloc_size, regblocks;
+
+	regloc = cxl_pci_dvsec(pdev, PCI_DVSEC_ID_CXL_REGLOC_DVSEC_ID);
+	if (!regloc)
+		return -ENXIO;
+
+	pci_read_config_dword(pdev, regloc + PCI_DVSEC_HEADER1, &regloc_size);
+	regloc_size = FIELD_GET(PCI_DVSEC_HEADER1_LENGTH_MASK, regloc_size);
+
+	regloc += PCI_DVSEC_ID_CXL_REGLOC_BLOCK1_OFFSET;
+	regblocks = (regloc_size - PCI_DVSEC_ID_CXL_REGLOC_BLOCK1_OFFSET) / 8;
+
+	for (i = 0; i < regblocks; i++, regloc += 8) {
+		u32 reg_lo, reg_hi;
+		u8 reg_type, bar;
+		u64 offset;
+
+		pci_read_config_dword(pdev, regloc, &reg_lo);
+		pci_read_config_dword(pdev, regloc + 4, &reg_hi);
+
+		cxl_decode_register_block(reg_lo, reg_hi, &bar, &offset,
+					  &reg_type);
+
+		if (reg_type == type) {
+			map->barno = bar;
+			map->block_offset = offset;
+			map->reg_type = reg_type;
+			rc = 0;
+			break;
+		}
+	}
+
+	return rc;
+}
+
 /**
  * cxl_pci_setup_regs() - Setup necessary MMIO.
  * @cxlm: The CXL memory device to communicate with.
@@ -440,69 +479,44 @@ static void cxl_decode_register_block(u32 reg_lo, u32 reg_hi,
  */
 static int cxl_pci_setup_regs(struct cxl_mem *cxlm)
 {
-	void __iomem *base;
-	u32 regloc_size, regblocks;
-	int regloc, i, n_maps, ret = 0;
+	int rc, i;
 	struct device *dev = cxlm->dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct cxl_register_map *map, maps[CXL_REGLOC_RBI_TYPES];
+	const enum cxl_regloc_type types[] = { CXL_REGLOC_RBI_MEMDEV,
+					       CXL_REGLOC_RBI_COMPONENT };
 
-	regloc = cxl_pci_dvsec(pdev, PCI_DVSEC_ID_CXL_REGLOC_DVSEC_ID);
-	if (!regloc) {
-		dev_err(dev, "register location dvsec not found\n");
-		return -ENXIO;
-	}
+	for (i = 0; i < ARRAY_SIZE(types); i++) {
+		struct cxl_register_map map;
+		void __iomem *base;
 
-	/* Get the size of the Register Locator DVSEC */
-	pci_read_config_dword(pdev, regloc + PCI_DVSEC_HEADER1, &regloc_size);
-	regloc_size = FIELD_GET(PCI_DVSEC_HEADER1_LENGTH_MASK, regloc_size);
-
-	regloc += PCI_DVSEC_ID_CXL_REGLOC_BLOCK1_OFFSET;
-	regblocks = (regloc_size - PCI_DVSEC_ID_CXL_REGLOC_BLOCK1_OFFSET) / 8;
-
-	for (i = 0, n_maps = 0; i < regblocks; i++, regloc += 8) {
-		u32 reg_lo, reg_hi;
-		u8 reg_type;
-		u64 offset;
-		u8 bar;
-
-		pci_read_config_dword(pdev, regloc, &reg_lo);
-		pci_read_config_dword(pdev, regloc + 4, &reg_hi);
-
-		cxl_decode_register_block(reg_lo, reg_hi, &bar, &offset,
-					  &reg_type);
-
-		/* Ignore unknown register block types */
-		if (reg_type > CXL_REGLOC_RBI_MEMDEV)
-			continue;
-
-		base = cxl_pci_map_regblock(cxlm, bar, offset);
-		if (!base)
-			return -ENOMEM;
-
-		map = &maps[n_maps];
-		map->barno = bar;
-		map->block_offset = offset;
-		map->reg_type = reg_type;
-
-		ret = cxl_probe_regs(cxlm, base + offset, map);
-
-		/* Always unmap the regblock regardless of probe success */
-		cxl_pci_unmap_regblock(cxlm, base);
-
-		if (ret)
-			return ret;
-
-		n_maps++;
-	}
-
-	for (i = 0; i < n_maps; i++) {
-		ret = cxl_map_regs(cxlm, &maps[i]);
-		if (ret)
+		rc = find_register_block(pdev, types[i], &map);
+		if (rc) {
+			dev_err(dev, "Couldn't find %s register block\n",
+				types[i] == CXL_REGLOC_RBI_MEMDEV ?
+					      "device" :
+					      "component");
 			break;
+		}
+
+		base = cxl_pci_map_regblock(cxlm, map.barno, map.block_offset);
+		if (!base) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		rc = cxl_probe_regs(cxlm, base + map.block_offset, &map);
+		cxl_pci_unmap_regblock(cxlm, base);
+		if (rc)
+			break;
+
+		rc = cxl_map_regs(cxlm, &map);
+		if (rc) {
+			dev_err(dev, "Failed to map CXL registers\n");
+			break;
+		}
 	}
 
-	return ret;
+	return rc;
 }
 
 static int cxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-- 
2.33.0

