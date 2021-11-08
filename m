Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E851447913
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 05:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HncvB0sC2z3cYS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:04:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hncsx6JMDz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 15:03:33 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id A3A3980C7E;
 Sun,  7 Nov 2021 23:03:30 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 2/3] powerpc/pseries/ddw: simplify enable_ddw()
Date: Mon,  8 Nov 2021 15:03:18 +1100
Message-Id: <20211108040320.3857636-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108040320.3857636-1-aik@ozlabs.ru>
References: <20211108040320.3857636-1-aik@ozlabs.ru>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This drops rather useless ddw_enabled flag as direct_mapping implies
it anyway.

While at this, fix indents in enable_ddw().

This should not cause any behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This replaces "powerpc/pseries/iommu: Fix indentations"
---
 arch/powerpc/platforms/pseries/iommu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 64385d6f33c2..301fa5b3d528 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1229,7 +1229,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct dma_win *window;
 	struct property *win64;
-	bool ddw_enabled = false;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false, direct_mapping = false;
 	bool pmem_present;
@@ -1244,7 +1243,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
 		direct_mapping = (len >= max_ram_len);
-		ddw_enabled = true;
 		goto out_unlock;
 	}
 
@@ -1397,8 +1395,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 				 dn, ret);
 
-		/* Make sure to clean DDW if any TCE was set*/
-		clean_dma_window(pdn, win64->value);
+			/* Make sure to clean DDW if any TCE was set*/
+			clean_dma_window(pdn, win64->value);
 			goto out_del_list;
 		}
 	} else {
@@ -1445,7 +1443,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	spin_unlock(&dma_win_list_lock);
 
 	dev->dev.archdata.dma_offset = win_addr;
-	ddw_enabled = true;
 	goto out_unlock;
 
 out_del_list:
@@ -1481,10 +1478,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * as RAM, then we failed to create a window to cover persistent
 	 * memory and need to set the DMA limit.
 	 */
-	if (pmem_present && ddw_enabled && direct_mapping && len == max_ram_len)
+	if (pmem_present && direct_mapping && len == max_ram_len)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
 
-    return ddw_enabled && direct_mapping;
+	return direct_mapping;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
-- 
2.30.2

