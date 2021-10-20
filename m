Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B222434BF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 15:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZBC801W5z3bmf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 00:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HZBBk47Gdz2yLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:23:25 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3B590AE80212;
 Wed, 20 Oct 2021 09:23:22 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 1/4] powerpc/pseries/iommu: Fix indentations
Date: Thu, 21 Oct 2021 00:23:12 +1100
Message-Id: <20211020132315.2287178-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020132315.2287178-1-aik@ozlabs.ru>
References: <20211020132315.2287178-1-aik@ozlabs.ru>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes broken indentations. The first hunk might suggest that
the introducing patch was applied incorrectly but it is correct.

Fixes: 381ceda88c4c ("powerpc/pseries/iommu: Make use of DDW for indirect mapping")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 269f61d519c2..09d59088864a 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1404,8 +1404,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 				 dn, ret);
 
-		/* Make sure to clean DDW if any TCE was set*/
-		clean_dma_window(pdn, win64->value);
+			/* Make sure to clean DDW if any TCE was set*/
+			clean_dma_window(pdn, win64->value);
 			goto out_del_list;
 		}
 	} else {
@@ -1490,7 +1490,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (pmem_present && ddw_enabled && direct_mapping && len == max_ram_len)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
 
-    return ddw_enabled && direct_mapping;
+	return ddw_enabled && direct_mapping;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
-- 
2.30.2

