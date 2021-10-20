Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F65434C03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 15:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZBDq56Hwz3dhN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 00:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HZBCS2DQMz3cX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:24:04 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3B4F1AE80251;
 Wed, 20 Oct 2021 09:23:30 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 4/4] powerpc/pseries/iommu: Create huge DMA window if
 no MMIO32 is present
Date: Thu, 21 Oct 2021 00:23:15 +1100
Message-Id: <20211020132315.2287178-5-aik@ozlabs.ru>
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

The iommu_init_table() helper takes an address range to reserve in
the IOMMU table being initialized to exclude MMIO addresses, this is
useful if the window stretches far beyond 4GB (although wastes some TCEs).
At the moment the code searches for such MMIO32 range and fails if none
found which is considered a problem while it really is not: it is actually
better as this says there is no MMIO32 to reserve and we can use
usually wasted TCEs. Furthermore PHYP never actually allows creating
windows starting at busaddress=0 so this MMIO32 range is never useful.

This removes error exit and initializes the table with zero range if
no MMIO32 is detected.

Fixes: 381ceda88c4c ("powerpc/pseries/iommu: Make use of DDW for indirect mapping")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9bbcfdece9e3..258e98c10095 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1411,18 +1411,19 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else {
 		struct iommu_table *newtbl;
 		int i;
+		unsigned long start = 0, end = 0;
 
 		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
 			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
 
 			/* Look for MMIO32 */
-			if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM)
+			if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM) {
+				start = pci->phb->mem_resources[i].start;
+				end = pci->phb->mem_resources[i].end;
 				break;
+			}
 		}
 
-		if (i == ARRAY_SIZE(pci->phb->mem_resources))
-			goto out_del_list;
-
 		/* New table for using DDW instead of the default DMA window */
 		newtbl = iommu_pseries_alloc_table(pci->phb->node);
 		if (!newtbl) {
@@ -1432,8 +1433,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 		iommu_table_setparms_common(newtbl, pci->phb->bus->number, create.liobn, win_addr,
 					    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
-		iommu_init_table(newtbl, pci->phb->node, pci->phb->mem_resources[i].start,
-				 pci->phb->mem_resources[i].end);
+		iommu_init_table(newtbl, pci->phb->node, start, end);
 
 		pci->table_group->tables[1] = newtbl;
 
-- 
2.30.2

