Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54719EF84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:16:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbLH3HFwzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:16:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dbSTcsHt; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb8843wNzDqxX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:08 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id n10so6879053pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEzUTxQIiVlMJU+id3RSb2NzAup+NbwV+Z30ecAcLW8=;
 b=dbSTcsHt2GlK0L75oncuVa6IKvUjEVdxpom4UPKJJViFvI0ACOB9oXasiPj4X5oPzz
 +DugsT+OAC+re4V6mh6jx/RS2UzMjAPoeQ0vUbbVggLt3YJWgt7TsHBsqsf+KJYR4MP0
 jjRj1lZH8TT1Pafd7Rrte+Ey61g4MKc02e15EKmJBIDTIyAp76woFrggBJQ19cE4N7P5
 JRtxDGThBEtETF10EedYap80LiyTf8lYR1iqUoFzYj1mMpU94CSA813kooX88IAx3XLK
 hVEqAx9QQPADhYhsYD5I5NGEUp/90ZLD5khjtJwrhNIWTS+2QQxIQhRlCHxKr1oqzG3Q
 9kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEzUTxQIiVlMJU+id3RSb2NzAup+NbwV+Z30ecAcLW8=;
 b=C+brtwS6AkjcHsTIA1664/P+AZa8zRCYbTrcM9NNLWIsYnXIr7JyGJjHs3XuTI5jjx
 grLEsA9Hb4S+BA5Z3B0AmSn4v5oYbeuyNYKpQsL5mifmeuVzTCLUU3grwjwmdPN+9QWT
 QJBqkKWipKpNFC/JoOH2oT8/xjB7fN9jf8NAtP10p7x/FhHjSi0b1CcT01ysKdxWFVet
 SVIceEJVasbhEaPiAGX2cj3U2OEhY8cbQVaji0LhiBhHgT+K5XxjWAZd7ughM9PM2Qux
 HUWFy/J7ZvQvNSZmgHfhdL4cOoEFOsoT5aG66qdJfofT7yJ71zcpL43pHIPeJvllb0rs
 iEvA==
X-Gm-Message-State: AGi0PubkTezfCTslvRIvlei7Fgjw41NGI1zdkNo6SVIFG2ELIZKqd5cu
 bnHujiCcq/uJkfA3fdDHsrCoNVsD
X-Google-Smtp-Source: APiQypKa2LTVBdgGl0f5uRmhSn41SJXak/kthUAMDMRUKKGLNz4JQDMXhUUdLFJMVd5cIiWF4mRjgg==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr19971478pfr.40.1586142486212; 
 Sun, 05 Apr 2020 20:08:06 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:08:05 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/powernv/pci: Add device to iommu group during
 dma_dev_setup()
Date: Mon,  6 Apr 2020 13:07:42 +1000
Message-Id: <20200406030745.24595-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406030745.24595-1-oohall@gmail.com>
References: <20200406030745.24595-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Historically adding devices to their respective iommu group has been
handled by the post-init phb fixup for most devices. This was done
because:

1) The IOMMU group is tied to the PE (usually) so we can only setup the
   iommu groups after we've done resource allocation since BAR location
   determines the device's PE, and:
2) The sysfs directory for the pci_dev needs to be available since
   iommu_add_device() wants to add an attribute for the iommu group.

However, since commit 30d87ef8b38d ("powerpc/pci: Fix
pcibios_setup_device() ordering") both conditions are met when
hose->ops->dma_dev_setup() is called so there's no real need to do
this in the fixup.

Moving the call to iommu_add_device() into pnv_pci_ioda_dma_setup_dev()
is a nice cleanup since it puts all the per-device IOMMU setup into one
place. It also results in all (non-nvlink) devices getting their iommu
group via a common path rather than relying on the bus notifier hack
in pnv_tce_iommu_bus_notifier() to handle the adding VFs and
hotplugged devices to their group.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c  |  8 ++++
 arch/powerpc/platforms/powernv/pci-ioda.c | 47 +++++++----------------
 arch/powerpc/platforms/powernv/pci.c      | 20 ----------
 3 files changed, 21 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 4fbbdfa8b327..df27b8d7e78f 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -469,6 +469,12 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 			compound_group->pgsizes = pe->table_group.pgsizes;
 	}
 
+	/*
+	 * The gpu would have been added to the iommu group that's created
+	 * for the PE. Pull it out now.
+	 */
+	iommu_del_device(&gpdev->dev);
+
        /*
 	* I'm not sure this is strictly required, but it's probably a good idea
 	* since the table_group for the PE is going to be attached to the
@@ -478,7 +484,9 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 	*/
 	iommu_group_put(pe->table_group.group);
 
+	/* now put the GPU into the compound group */
 	pnv_comp_attach_table_group(npucomp, pe);
+	iommu_add_device(compound_group, &gpdev->dev);
 
 	return compound_group;
 }
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index cf0aaef1b8fa..9198b7882b57 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1774,12 +1774,10 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
 	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
 	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
-	/*
-	 * Note: iommu_add_device() will fail here as
-	 * for physical PE: the device is already added by now;
-	 * for virtual PE: sysfs entries are not ready yet and
-	 * tce_iommu_bus_notifier will add the device to a group later.
-	 */
+
+	/* PEs with a DMA weight of zero won't have a group */
+	if (pe->table_group.group)
+		iommu_add_device(&pe->table_group, &pdev->dev);
 }
 
 /*
@@ -2628,39 +2626,20 @@ static void pnv_pci_ioda_setup_iommu_api(void)
 	struct pnv_ioda_pe *pe;
 
 	/*
-	 * There are 4 types of PEs:
-	 * - PNV_IODA_PE_BUS: a downstream port with an adapter,
-	 *   created from pnv_pci_setup_bridge();
-	 * - PNV_IODA_PE_BUS_ALL: a PCI-PCIX bridge with devices behind it,
-	 *   created from pnv_pci_setup_bridge();
-	 * - PNV_IODA_PE_VF: a SRIOV virtual function,
-	 *   created from pnv_pcibios_sriov_enable();
-	 * - PNV_IODA_PE_DEV: an NPU or OCAPI device,
-	 *   created from pnv_pci_ioda_fixup().
+	 * For non-nvlink devices the IOMMU group is registered when the PE is
+	 * configured and devices are added to the group when the per-device
+	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
+	 * only initialise for "normal" IODA PHBs.
 	 *
-	 * Normally a PE is represented by an IOMMU group, however for
-	 * devices with side channels the groups need to be more strict.
+	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
+	 * in the same IOMMU group, so that's handled here.
 	 */
 	list_for_each_entry(hose, &hose_list, list_node) {
 		phb = hose->private_data;
 
-		if (phb->type == PNV_PHB_NPU_NVLINK ||
-		    phb->type == PNV_PHB_NPU_OCAPI)
-			continue;
-
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			struct iommu_table_group *table_group;
-
-			table_group = pnv_try_setup_npu_table_group(pe);
-			if (!table_group) {
-				if (!pnv_pci_ioda_pe_dma_weight(pe))
-					continue;
-
-				table_group = &pe->table_group;
-			}
-			pnv_ioda_setup_bus_iommu_group(pe, table_group,
-					pe->pbus);
-		}
+		if (phb->type == PNV_PHB_IODA2)
+			list_for_each_entry(pe, &phb->ioda.pe_list, list)
+				pnv_try_setup_npu_table_group(pe);
 	}
 
 	/*
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 5bf818246339..091fe1cf386b 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -955,28 +955,8 @@ static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
 		unsigned long action, void *data)
 {
 	struct device *dev = data;
-	struct pci_dev *pdev;
-	struct pci_dn *pdn;
-	struct pnv_ioda_pe *pe;
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
 
 	switch (action) {
-	case BUS_NOTIFY_ADD_DEVICE:
-		pdev = to_pci_dev(dev);
-		pdn = pci_get_pdn(pdev);
-		hose = pci_bus_to_host(pdev->bus);
-		phb = hose->private_data;
-
-		WARN_ON_ONCE(!phb);
-		if (!pdn || pdn->pe_number == IODA_INVALID_PE || !phb)
-			return 0;
-
-		pe = &phb->ioda.pe_array[pdn->pe_number];
-		if (!pe->table_group.group)
-			return 0;
-		iommu_add_device(&pe->table_group, dev);
-		return 0;
 	case BUS_NOTIFY_DEL_DEVICE:
 		iommu_del_device(dev);
 		return 0;
-- 
2.21.1

