Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6982959476
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:54:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnYv6kq3zDql5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45ZnXM0yZgzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:53:06 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 41744AE800AC;
 Fri, 28 Jun 2019 02:53:02 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/powernv: Fix stale iommu table base after VFIO
Date: Fri, 28 Jun 2019 16:53:00 +1000
Message-Id: <20190628065300.41674-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, Sam Bobroff <sbobroff@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powernv platform uses @dma_iommu_ops for non-bypass DMA. These ops
need an iommu_table pointer which is stored in
dev->archdata.iommu_table_base. It is initialized during
pcibios_setup_device() which handles boot time devices. However when
a device is taken from the system in order to pass it through, the default
IOMMU table is destroyed but the pointer in a device is not updated;
also when a device is returned back to the system, a new table pointer
is not stored in dev->archdata.iommu_table_base either. So when a just
returned device tries using IOMMU, it crashes on accessing stale
iommu_table or its members.

This calls set_iommu_table_base() when the default window is created.
Note it used to be there before but was wrongly removed (see "fixes").
It did not appear before as these days most devices simply use bypass.

This adds set_iommu_table_base(NULL) when a device is taken from
the system to make it clear that IOMMU DMA cannot be used past that point.

Fixes: c4e9d3c1e65a ("powerpc/powernv/pseries: Rework device adding to IOMMU groups")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This needs to be applied before
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=110810
(discovered while testing this on POWER8)
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 10cc42b9e541..0f72c7484824 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2456,6 +2456,14 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	if (!pnv_iommu_bypass_disabled)
 		pnv_pci_ioda2_set_bypass(pe, true);
 
+	/*
+	 * Set table base for the case of IOMMU DMA use. Usually this is done
+	 * from dma_dev_setup() which is not called when a device is returned
+	 * from VFIO so do it here.
+	 */
+	if (pe->pdev)
+		set_iommu_table_base(&pe->pdev->dev, tbl);
+
 	return 0;
 }
 
@@ -2543,6 +2551,8 @@ static void pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 	pnv_pci_ioda2_unset_window(&pe->table_group, 0);
 	if (pe->pbus)
 		pnv_ioda_setup_bus_dma(pe, pe->pbus);
+	else if (pe->pdev)
+		set_iommu_table_base(&pe->pdev->dev, NULL);
 	iommu_tce_table_put(tbl);
 }
 
-- 
2.17.1

