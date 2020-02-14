Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8415EAE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 18:17:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K0Rs1yp8zDqGv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 04:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cusW2ucI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jyq55WZ0zDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:03:45 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FEA42082F;
 Fri, 14 Feb 2020 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696221;
 bh=dbHTO3vRSZeNK1+qa30KRzeCXUUCMWdbmz/CWj6bU6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cusW2ucIFoB3HT1W/xyXjwdGcwyDw4viWSUozJGj0S7BH15y5cZiZnQgNBVKpN0sr
 JkSPS9LgiOHAUvT/e6nseVbcwX5REcoksjAodM2OednK/wyWWsS6ZEsxQWJmhbu4z0
 U/wC3pAwPW5RaVOGDL2yalP9w8P8V3Fo+lZgX5Zo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 084/459] powerpc/iov: Move VF pdev fixup into
 pcibios_fixup_iov()
Date: Fri, 14 Feb 2020 10:55:34 -0500
Message-Id: <20200214160149.11681-84-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

[ Upstream commit 965c94f309be58fbcc6c8d3e4f123376c5970d79 ]

An ioda_pe for each VF is allocated in pnv_pci_sriov_enable() before
the pci_dev for the VF is created. We need to set the pe->pdev pointer
at some point after the pci_dev is created. Currently we do that in:

pcibios_bus_add_device()
	pnv_pci_dma_dev_setup() (via phb->ops.dma_dev_setup)
		/* fixup is done here */
		pnv_pci_ioda_dma_dev_setup() (via pnv_phb->dma_dev_setup)

The fixup needs to be done before setting up DMA for for the VF's PE,
but there's no real reason to delay it until this point. Move the
fixup into pnv_pci_ioda_fixup_iov() so the ordering is:

	pcibios_add_device()
		pnv_pci_ioda_fixup_iov() (via ppc_md.pcibios_fixup_sriov)

	pcibios_bus_add_device()
		...

This isn't strictly required, but it's a slightly more logical place
to do the fixup and it simplifies pnv_pci_dma_dev_setup().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200110070207.439-4-oohall@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 29 +++++++++++++++++++----
 arch/powerpc/platforms/powernv/pci.c      | 14 -----------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2432a50d48d58..e9cda7e316a50 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2905,9 +2905,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 	struct pci_dn *pdn;
 	int mul, total_vfs;
 
-	if (!pdev->is_physfn || pci_dev_is_added(pdev))
-		return;
-
 	pdn = pci_get_pdn(pdev);
 	pdn->vfs_expanded = 0;
 	pdn->m64_single_mode = false;
@@ -2982,6 +2979,30 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 		res->end = res->start - 1;
 	}
 }
+
+static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
+{
+	if (WARN_ON(pci_dev_is_added(pdev)))
+		return;
+
+	if (pdev->is_virtfn) {
+		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
+
+		/*
+		 * VF PEs are single-device PEs so their pdev pointer needs to
+		 * be set. The pdev doesn't exist when the PE is allocated (in
+		 * (pcibios_sriov_enable()) so we fix it up here.
+		 */
+		pe->pdev = pdev;
+		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
+	} else if (pdev->is_physfn) {
+		/*
+		 * For PFs adjust their allocated IOV resources to match what
+		 * the PHB can support using it's M64 BAR table.
+		 */
+		pnv_pci_ioda_fixup_iov_resources(pdev);
+	}
+}
 #endif /* CONFIG_PCI_IOV */
 
 static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
@@ -3878,7 +3899,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
 
 #ifdef CONFIG_PCI_IOV
-	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov_resources;
+	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
 	ppc_md.pcibios_iov_resource_alignment = pnv_pci_iov_resource_alignment;
 	ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
 	ppc_md.pcibios_sriov_disable = pnv_pcibios_sriov_disable;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index e8e58a2cccddf..8307e1f4086cb 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -814,20 +814,6 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
 	struct pnv_phb *phb = hose->private_data;
-#ifdef CONFIG_PCI_IOV
-	struct pnv_ioda_pe *pe;
-
-	/* Fix the VF pdn PE number */
-	if (pdev->is_virtfn) {
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			if (pe->rid == ((pdev->bus->number << 8) |
-			    (pdev->devfn & 0xff))) {
-				pe->pdev = pdev;
-				break;
-			}
-		}
-	}
-#endif /* CONFIG_PCI_IOV */
 
 	if (phb && phb->dma_dev_setup)
 		phb->dma_dev_setup(phb, pdev);
-- 
2.20.1

