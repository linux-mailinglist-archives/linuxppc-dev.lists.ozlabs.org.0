Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA3562FBA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 11:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ8n96936z3dw4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 19:20:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.61.248; helo=ssh248.corpemail.net; envelope-from=wangdeming@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 126 seconds by postgrey-1.36 at boromir; Fri, 01 Jul 2022 19:20:03 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ8mg2HGdz3cMq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 19:20:02 +1000 (AEST)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id WIT00036;
        Fri, 01 Jul 2022 17:17:36 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.9; Fri, 1 Jul 2022 17:17:38 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/pseries: Add a null judgment after iommu_pseries_alloc_group
Date: Fri, 1 Jul 2022 05:17:35 -0400
Message-ID: <20220701091735.1584-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 2022701171736651d1779fff6865ab42eefc41774dda2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: Deming Wang <wangdeming@inspur.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We should avoid use the return value directly after  call
iommu_pseries_alloc_group. Because it_may return a null.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index fba64304e859..801eb9d4bdca 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -649,6 +649,9 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 	pci->phb->dma_window_base_cur = 0x8000000ul;
 
 	pci->table_group = iommu_pseries_alloc_group(pci->phb->node);
+	if (!pci->table_group)
+		return;
+
 	tbl = pci->table_group->tables[0];
 
 	iommu_table_setparms(pci->phb, dn, tbl);
@@ -734,6 +737,9 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 
 	if (!ppci->table_group) {
 		ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
+		if (!ppci->table_group)
+			return;
+
 		tbl = ppci->table_group->tables[0];
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
@@ -765,6 +771,9 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 
 		pr_debug(" --> first child, no bridge. Allocating iommu table.\n");
 		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
+		if (!PCI_DN(dn)->table_group)
+			return;
+
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
 
@@ -1521,6 +1530,9 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 	pci = PCI_DN(pdn);
 	if (!pci->table_group) {
 		pci->table_group = iommu_pseries_alloc_group(pci->phb->node);
+		if (!pci->table_group)
+			return;
+
 		tbl = pci->table_group->tables[0];
 		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
 				pci->table_group, dma_window);
-- 
2.27.0

