Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F76C8A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:18:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2TV072GzDqDt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q2Lr2Xn0zDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:12:20 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 2B03DAE807F0;
 Thu, 18 Jul 2019 01:11:42 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v5 2/4] powerpc/iommu: Allow bypass-only for DMA
Date: Thu, 18 Jul 2019 15:11:37 +1000
Message-Id: <20190718051139.74787-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718051139.74787-1-aik@ozlabs.ru>
References: <20190718051139.74787-1-aik@ozlabs.ru>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER8 and newer support a bypass mode which maps all host memory to
PCI buses so an IOMMU table is not always required. However if we fail to
create such a table, the DMA setup fails and the kernel does not boot.

This skips the 32bit DMA setup check if the bypass is selected.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

This minor thing helped me debugging next 2 patches so it can help
somebody else too.
---
 arch/powerpc/kernel/dma-iommu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index a0879674a9c8..c963d704fa31 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -122,18 +122,17 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 {
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
-	if (!tbl) {
-		dev_info(dev, "Warning: IOMMU dma not supported: mask 0x%08llx"
-			", table unavailable\n", mask);
-		return 0;
-	}
-
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
 		dev->archdata.iommu_bypass = true;
 		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
 
+	if (!tbl) {
+		dev_err(dev, "Warning: IOMMU dma not supported: mask 0x%08llx, table unavailable\n", mask);
+		return 0;
+	}
+
 	if (tbl->it_offset > (mask >> tbl->it_page_shift)) {
 		dev_info(dev, "Warning: IOMMU offset too big for device mask\n");
 		dev_info(dev, "mask: 0x%08llx, table offset: 0x%08lx\n",
-- 
2.17.1

