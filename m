Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9761367FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:10:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDdW5rsLzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xt7jfWUV; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSk2Km4zDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:30 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id q127so554230pga.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlqZXUq/uHE/EROxU99B6tgbd71bp3wJ2CDh02FIeZk=;
 b=Xt7jfWUV5onAJwNY6tpH8I3p6xEatVv4De4T0O7mVkH9spI3cJ0BG5lXXiHxr9/ZST
 eGY0DOQI0jcu5wwXodrHERA7fEx3cAdaT6hPFN0hNPxs5FkUpVhJ37nQHE3oNwkQypYL
 PN7R+M4AlsVa0LZ3WWKLpyr4cohhy7mo6zSnU0r1KSuIWse5ouXlG2HCbqLZqgI/jMkZ
 ZkudO9if8SL1B3n4bHNPxNaXRZFIfXgB6/F7rwTvx23Pmvf+3+tE1NbbSicvfCf2isEq
 WjNeHmnbUeVS1cgEuZJEYO4SvNbdbAbC0HmAEDj/+d10iTxmvwwE5o4CecM1OLGUYev5
 Ixpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlqZXUq/uHE/EROxU99B6tgbd71bp3wJ2CDh02FIeZk=;
 b=j+5IXrNo1i3SCnUEZEJG6GEaR3xLT5Teo6joUJRsa3wGss0KbyeABi6vdKzMsFYy5q
 RZpPPm04f97f8ZACzznsXsoUi9BZazoEOqYoHDJpoOJHdJppTZRLQ3Jth40fjANVeEI2
 qvV2gdFGFV/gRLKxOCS0qeoNahqVNwjJGgnOwaOJuAIWkh6SCL7vO1H5I4A5glAlTVWc
 QQv695QA8c24A/yEMNEBfawW24hEc1SCiLnboIphcgN0ZgFy5d1hA8fvenjL/qp7OfeX
 /ZPPyBaHazjgLaJ9hN+yiVFJ8E9lpr3EgIDityYi4f9kVVt5Uwb5z/zR1SZlXGx5Zi3C
 f2bw==
X-Gm-Message-State: APjAAAXSZrNzDNer5oW8G1LTJ3BmN6If5PpOEdTDWJ3XLq8G4lQQDMFh
 3OzIxxSrq06qoc7B4ytqIRDs5dnczGA=
X-Google-Smtp-Source: APXvYqxDepE2mLF2e+atzFwBIryussLOwn+F4PuGW04Dj5EJGSW1FaJy85rYnWvzUk8NAgZr2MptbQ==
X-Received: by 2002:a62:258:: with SMTP id 85mr2457221pfc.254.1578639748101;
 Thu, 09 Jan 2020 23:02:28 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:27 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/iov: Move VF pdev fixup into pcibios_fixup_iov()
Date: Fri, 10 Jan 2020 18:02:05 +1100
Message-Id: <20200110070207.439-4-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110070207.439-1-oohall@gmail.com>
References: <20200110070207.439-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An ioda_pe for each VF is allocated in pnv_pci_sriov_enable() before the
pci_dev for the VF is created. We need to set the pe->pdev pointer at
some point after the pci_dev is created. Currently we do that in:

pcibios_bus_add_device()
	pnv_pci_dma_dev_setup() (via phb->ops.dma_dev_setup)
		/* fixup is done here */
		pnv_pci_ioda_dma_dev_setup() (via pnv_phb->dma_dev_setup)

The fixup needs to be done before setting up DMA for for the VF's PE, but
there's no real reason to delay it until this point. Move the fixup into
pnv_pci_ioda_fixup_iov() so the ordering is:

	pcibios_add_device()
		pnv_pci_ioda_fixup_iov() (via ppc_md.pcibios_fixup_sriov)

	pcibios_bus_add_device()
		...

This isn't strictly required, but it's slightly a slightly more logical
place to do the fixup and it simplifies pnv_pci_dma_dev_setup().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 29 +++++++++++++++++++++++++----
 arch/powerpc/platforms/powernv/pci.c      | 14 --------------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 33d4039..ae177ee 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2900,9 +2900,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 	struct pci_dn *pdn;
 	int mul, total_vfs;
 
-	if (!pdev->is_physfn || pci_dev_is_added(pdev))
-		return;
-
 	pdn = pci_get_pdn(pdev);
 	pdn->vfs_expanded = 0;
 	pdn->m64_single_mode = false;
@@ -2977,6 +2974,30 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
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
@@ -3872,7 +3893,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
 
 #ifdef CONFIG_PCI_IOV
-	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov_resources;
+	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
 	ppc_md.pcibios_iov_resource_alignment = pnv_pci_iov_resource_alignment;
 	ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
 	ppc_md.pcibios_sriov_disable = pnv_pcibios_sriov_disable;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index e8e58a2c..8307e1f 100644
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
2.9.5

