Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C969621AECE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:37:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B31yh1kFYzDrLj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X5AF++IA; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gB0cndzDrH8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:05 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id l17so4560573wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UxmXR/WLSBm2vMKnRUFb+GXjgplAREAPNZTS1mltnW0=;
 b=X5AF++IADmf/FVLgRdEYN5Kv0EobeAGKMvu6mYW2btCgM8Q2tqPGJLsRRUVCp/9bmo
 s277tdv5k9s4rrlfkfLWDi7pnnfImquc8EmWJ1fhAlGR813MfNIY0Q57Nbt12rgKPdz6
 kF/VEU7Aal6ZDoWUUfzMoYhKeTELwIfXi2tSWSmFZTo/UHblAUzYubdfUEfnGf1PgkGt
 waM4vo+GIIkmjevpVt19jLDyMeShww/QBLDqNn9f6HYT7v8aBBN3K2YpV5VSEgsBCRpX
 IZy9Vpi9cVG44NK1ADYozr/RoehvYdd3oxaHkrK7WRBnb19gJ5yEMrxcUPk38kdaChMe
 fx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UxmXR/WLSBm2vMKnRUFb+GXjgplAREAPNZTS1mltnW0=;
 b=BQ6DgXMJoh+AEFqqnm+b2vlDDHiDFzPHCvbtpwDBXaEUO+bAEGEuN44R6LSXSEW5fu
 I6Q7E4karlAnASKgc055E+EdtSunaW21cHu3HDpiknW+jpOa2X+JcDM+Tads+Bw6RLEf
 aGimqvMAyhHbSVEb2ZQLIku6szccjaoDKB/I9CeO5dEY9w5QdoNS5caVarQ8UjMO/7E4
 d4DiJWcMvFVgFyZArbPeFhIoolMOQSpyXvechlmJHrcXeCCvZtLUHtMMzmK8eTcABzsM
 0JAYrSAAL3eDF0oLRz0hdtmOYvFfhCUjUc8yLgcTlaHxm7BAhqkGWzz8OWZ7uO4j6yWu
 3Pyw==
X-Gm-Message-State: AOAM532OAv5716awi3sUMTTUSUBsRDcYEPBwpeXjF14u4EfVCTFVrh8B
 24CmxXWVvc0LJyM0wu/HoPBSO79Ttc8=
X-Google-Smtp-Source: ABdhPJybmnVGaxVmuSKYGO5nN1yTJXSRqHXlGijH1z59NyaCp1poypZhwInMooFf1LtCegwXcxINag==
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr3246288wme.171.1594358641939; 
 Thu, 09 Jul 2020 22:24:01 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:01 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the DMA
 setup state
Date: Fri, 10 Jul 2020 15:23:28 +1000
Message-Id: <20200710052340.737567-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's an optimisation in the PE setup which skips performing DMA
setup for a PE if we only have bridges in a PE. The assumption being
that only "real" devices will DMA to system memory, which is probably
fair. However, if we start off with only bridge devices in a PE then
add a non-bridge device the new device won't be able to use DMA because
we never configured it.

Fix this (admittedly pretty weird) edge case by tracking whether we've done
the DMA setup for the PE or not. If a non-bridge device is added to the PE
(via rescan or hotplug, or whatever) we can set up DMA on demand.

This also means the only remaining user of the old "DMA Weight" code is
the IODA1 DMA setup code that it was originally added for, which is good.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
Alexey, do we need to have the IOMMU API stuff set/clear this flag?
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 48 ++++++++++++++---------
 arch/powerpc/platforms/powernv/pci.h      |  7 ++++
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index bfb40607aa0e..bb9c1cc60c33 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -141,6 +141,7 @@ static struct pnv_ioda_pe *pnv_ioda_init_pe(struct pnv_phb *phb, int pe_no)
 
 	phb->ioda.pe_array[pe_no].phb = phb;
 	phb->ioda.pe_array[pe_no].pe_number = pe_no;
+	phb->ioda.pe_array[pe_no].dma_setup_done = false;
 
 	/*
 	 * Clear the PE frozen state as it might be put into frozen state
@@ -1685,6 +1686,12 @@ static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 }
 #endif /* CONFIG_PCI_IOV */
 
+static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
+				       struct pnv_ioda_pe *pe);
+
+static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
+				       struct pnv_ioda_pe *pe);
+
 static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
@@ -1713,6 +1720,24 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 		pci_info(pdev, "Added to existing PE#%x\n", pe->pe_number);
 	}
 
+	/*
+	 * We assume that bridges *probably* don't need to do any DMA so we can
+	 * skip allocating a TCE table, etc unless we get a non-bridge device.
+	 */
+	if (!pe->dma_setup_done && !pci_is_bridge(pdev)) {
+		switch (phb->type) {
+		case PNV_PHB_IODA1:
+			pnv_pci_ioda1_setup_dma_pe(phb, pe);
+			break;
+		case PNV_PHB_IODA2:
+			pnv_pci_ioda2_setup_dma_pe(phb, pe);
+			break;
+		default:
+			pr_warn("%s: No DMA for PHB#%x (type %d)\n",
+				__func__, phb->hose->global_number, phb->type);
+		}
+	}
+
 	if (pdn)
 		pdn->pe_number = pe->pe_number;
 	pe->device_count++;
@@ -2222,6 +2247,7 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
 	iommu_init_table(tbl, phb->hose->node, 0, 0);
 
+	pe->dma_setup_done = true;
 	return;
  fail:
 	/* XXX Failure: Try to fallback to 64-bit only ? */
@@ -2536,9 +2562,6 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 {
 	int64_t rc;
 
-	if (!pnv_pci_ioda_pe_dma_weight(pe))
-		return;
-
 	/* TVE #1 is selected by PCI address bit 59 */
 	pe->tce_bypass_base = 1ull << 59;
 
@@ -2563,6 +2586,7 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 	iommu_register_group(&pe->table_group, phb->hose->global_number,
 			     pe->pe_number);
 #endif
+	pe->dma_setup_done = true;
 }
 
 int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
@@ -3136,7 +3160,6 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
 
 static void pnv_pci_configure_bus(struct pci_bus *bus)
 {
-	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pci_dev *bridge = bus->self;
 	struct pnv_ioda_pe *pe;
 	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
@@ -3160,17 +3183,6 @@ static void pnv_pci_configure_bus(struct pci_bus *bus)
 		return;
 
 	pnv_ioda_setup_pe_seg(pe);
-	switch (phb->type) {
-	case PNV_PHB_IODA1:
-		pnv_pci_ioda1_setup_dma_pe(phb, pe);
-		break;
-	case PNV_PHB_IODA2:
-		pnv_pci_ioda2_setup_dma_pe(phb, pe);
-		break;
-	default:
-		pr_warn("%s: No DMA for PHB#%x (type %d)\n",
-			__func__, phb->hose->global_number, phb->type);
-	}
 }
 
 static resource_size_t pnv_pci_default_alignment(void)
@@ -3289,11 +3301,10 @@ static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
 
 static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
 {
-	unsigned int weight = pnv_pci_ioda_pe_dma_weight(pe);
 	struct iommu_table *tbl = pe->table_group.tables[0];
 	int64_t rc;
 
-	if (!weight)
+	if (!pe->dma_setup_done)
 		return;
 
 	rc = pnv_pci_ioda1_unset_window(&pe->table_group, 0);
@@ -3313,10 +3324,9 @@ static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
 static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table *tbl = pe->table_group.tables[0];
-	unsigned int weight = pnv_pci_ioda_pe_dma_weight(pe);
 	int64_t rc;
 
-	if (!weight)
+	if (pe->dma_setup_done)
 		return;
 
 	rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 0727dec9a0d1..6aa6aefb637d 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -87,6 +87,13 @@ struct pnv_ioda_pe {
 	bool			tce_bypass_enabled;
 	uint64_t		tce_bypass_base;
 
+	/*
+	 * Used to track whether we've done DMA setup for this PE or not. We
+	 * want to defer allocating TCE tables, etc until we've added a
+	 * non-bridge device to the PE.
+	 */
+	bool			dma_setup_done;
+
 	/* MSIs. MVE index is identical for for 32 and 64 bit MSI
 	 * and -1 if not supported. (It's actually identical to the
 	 * PE number)
-- 
2.26.2

