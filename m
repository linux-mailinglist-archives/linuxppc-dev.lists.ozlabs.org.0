Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E176FB6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 09:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHHxs32Fcz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 17:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 454 seconds by postgrey-1.37 at boromir; Fri, 04 Aug 2023 17:52:20 AEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHHxJ4D8Xz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 17:52:20 +1000 (AEST)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHHt04rL7zJrRR;
	Fri,  4 Aug 2023 15:49:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 15:52:12 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<joel@jms.id.au>, <fbarrat@linux.ibm.com>
Subject: [PATCH] powerpc/powernv/pci: use pci_dev_id() to simplify the code
Date: Fri, 4 Aug 2023 16:04:35 +0800
Message-ID: <20230804080435.191196-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, wangxiongfeng2@huawei.com, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI core API pci_dev_id() can be used to get the BDF number for a pci
device. We don't need to compose it mannually. Use pci_dev_id() to
simplify the code a little bit.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index cb637827bc58..28fac4770073 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -997,14 +997,14 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 	struct pnv_ioda_pe *pe;
 
 	/* Check if the BDFN for this device is associated with a PE yet */
-	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+	pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
 	if (!pe) {
 		/* VF PEs should be pre-configured in pnv_pci_sriov_enable() */
 		if (WARN_ON(pdev->is_virtfn))
 			return;
 
 		pnv_pci_configure_bus(pdev->bus);
-		pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+		pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
 		pci_info(pdev, "Configured PE#%x\n", pe ? pe->pe_number : 0xfffff);
 
 
@@ -2526,7 +2526,7 @@ static struct iommu_group *pnv_pci_device_group(struct pci_controller *hose,
 	if (WARN_ON(!phb))
 		return ERR_PTR(-ENODEV);
 
-	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+	pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
 	if (!pe)
 		return ERR_PTR(-ENODEV);
 
-- 
2.20.1

