Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBBD1AD795
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:41:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493ShK6PbyzDrbx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VlrVZjpF; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493SYV2dydzDrRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:35:26 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id ms17so725798pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kp54Ut9g1mO4SygItfUJGS2Y2CbteAmIuvb7/eyV4t4=;
 b=VlrVZjpFTqGlh4Bt6KulWlZvbhiaBvTTSXML9k5CK3X1FuEnKrksJi8fXiJasEA30D
 FR9M0BMpzqKpW5dbc095ldgKHiL9pYkCGsajAwRUEWgPGVwp78lb2lO6vHsBaeP3tTl6
 tBSD8CU3mhylDzCiegOMG571TkIir0VzXXlF11kVxptS0tNqlOzoo2HNxVKPl8JtsIrc
 9Da3gtHzJhQrO8WcKCbLX648XTpWmq+xv9YOWGqppw/6I2mY4Aa+V8KVDkaqS+AR1LMC
 anE1kxPNM4ABxew6slnjXKaLKdCSlnPzEDsfMky2zwkKTf1vJU33oXgeWeFMbhGif67L
 3IuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kp54Ut9g1mO4SygItfUJGS2Y2CbteAmIuvb7/eyV4t4=;
 b=lHxofglIML/FxvhOlgyoy3m+xUfzwwLSRsWJO9XTYx4Izv3JuEplnsMVuDB8DiE7Yp
 Z/M2RNTcD2SbFvUacUJJRSdcqP25DRpWYrnW77DG1GvXLoplaYbWsQ8HN3ro4rL9uSVs
 xlKzI8Rbs8oHg4BMcCUzQEGLpj5NdA+MUCLSf3hijIj+GOUifq/YfFQF4gD4S3QH4OWE
 z91J/DE56G1HnvnBHDg+QL3Kwoux+Igvd33fGC+6GrMVuMxvbkiHlsk96PtQQWW/8QS/
 YGUgEOTHVVPuRubATrE7wwSeYPKEP44Z1yM38p8kK+sJv8RNTZz9j10B03aFxbJ6zTZU
 x4uw==
X-Gm-Message-State: AGi0PubnzFZstZokvzO47hB1nHo3lMGgJpuPJVnw8MLiW2rtoWssPmTy
 aQoq541QRHI09UnbG1l9O5wkiPvf
X-Google-Smtp-Source: APiQypLNDUwLYkQZcBG2UoD2XVTb+ZBa3CnziMGFlYxyeR04KECrxeIdAMbm51qGLvhH9yyp97meHg==
X-Received: by 2002:a17:90a:23e2:: with SMTP id
 g89mr2826917pje.105.1587108923473; 
 Fri, 17 Apr 2020 00:35:23 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (115-64-37-247.static.tpgi.com.au.
 [115.64.37.247])
 by smtp.gmail.com with ESMTPSA id mq18sm5272438pjb.6.2020.04.17.00.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:35:23 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/powernv/pci: Re-work bus PE configuration
Date: Fri, 17 Apr 2020 17:35:06 +1000
Message-Id: <20200417073508.30356-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200417073508.30356-1-oohall@gmail.com>
References: <20200417073508.30356-1-oohall@gmail.com>
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

For normal PHBs IODA PEs are handled on a per-bus basis so all the devices
on that bus will share a PE. Which PE specificly is determined by the location
of the MMIO BARs for the devices on the bus so we can't actually configure the
bus PEs until after MMIO resources are allocated. As a result PEs are currently
configured by pcibios_setup_bridge(), which is called just before the bridge
windows are programmed into the bus' parent bridge. Configuring the bus PE here
causes a few problems:

1. The root bus doesn't have a parent bridge so setting up the PE for the root
   bus requires some hacks.

2. The PELT-V isn't setup correctly because pnv_ioda_set_peltv() assumes that
   PEs will be configured in root-to-leaf order. This assumption is broken
   because resource assignment is performed depth-first so the leaf bridges
   are setup before their parents are. The hack mentioned in 1) results in
   the "correct" PELT-V for busses immediately below the root port, but not
   for devices below a switch.

3. It's possible to break the sysfs PCI rescan feature by removing all
   the devices on a bus. When the last device is removed from a PE its
   will be de-configured. Rescanning the devices on a bus does not cause
   the bridge to be reconfigured rendering the devices on that bus
   unusable.

We can address most of these problems by moving the PE setup out of
pcibios_setup_bridge() and into pcibios_bus_add_device(). This fixes 1)
and 2) because pcibios_bus_add_device() is called on each device in
root-to-leaf order so PEs for parent buses will always be configured
before their children. It also fixes 3) by ensuring the PE is
configured before initialising DMA for the device. In the event the PE
was de-configured due to removing all the devices in that PE it will
now be reconfigured when a new device is added since there's no
dependecy on the bridge_setup() hook being called.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 81 ++++++++++++-------------------
 1 file changed, 30 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 934cbee..2ba730c 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -51,6 +51,7 @@ static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
 					      "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
+static void pnv_pci_configure_bus(struct pci_bus *bus);
 
 void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 			    const char *fmt, ...)
@@ -1120,34 +1121,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 	return pe;
 }
 
-static void pnv_ioda_setup_same_PE(struct pci_bus *bus, struct pnv_ioda_pe *pe)
-{
-	struct pci_dev *dev;
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		struct pci_dn *pdn = pci_get_pdn(dev);
-
-		if (pdn == NULL) {
-			pr_warn("%s: No device node associated with device !\n",
-				pci_name(dev));
-			continue;
-		}
-
-		/*
-		 * In partial hotplug case, the PCI device might be still
-		 * associated with the PE and needn't attach it to the PE
-		 * again.
-		 */
-		if (pdn->pe_number != IODA_INVALID_PE)
-			continue;
-
-		pe->device_count++;
-		pdn->pe_number = pe->pe_number;
-		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
-			pnv_ioda_setup_same_PE(dev->subordinate, pe);
-	}
-}
-
 /*
  * There're 2 types of PCI bus sensitive PEs: One that is compromised of
  * single PCI bus. Another one that contains the primary PCI bus and its
@@ -1168,7 +1141,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 	pe_num = phb->ioda.pe_rmap[bus->number << 8];
 	if (pe_num != IODA_INVALID_PE) {
 		pe = &phb->ioda.pe_array[pe_num];
-		pnv_ioda_setup_same_PE(bus, pe);
 		return NULL;
 	}
 
@@ -1212,9 +1184,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 		return NULL;
 	}
 
-	/* Associate it with all child devices */
-	pnv_ioda_setup_same_PE(bus, pe);
-
 	/* Put PE to the list */
 	list_add_tail(&pe->list, &phb->ioda.pe_list);
 
@@ -1772,15 +1741,32 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
-	/*
-	 * The function can be called while the PE#
-	 * hasn't been assigned. Do nothing for the
-	 * case.
-	 */
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
-		return;
+	/* Check if the BDFN for this device is associated with a PE yet */
+	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+	if (!pe) {
+		/* VF PEs should be pre-configured in pnv_pci_sriov_enable() */
+		if (WARN_ON(pdev->is_virtfn))
+			return;
+
+		pnv_pci_configure_bus(pdev->bus);
+		pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+		pci_info(pdev, "Configured PE#%x\n", pe ? pe->pe_number : 0xfffff);
+
+
+		/*
+		 * If we can't setup the IODA PE something has gone horribly
+		 * wrong and we can't enable DMA for the device.
+		 */
+		if (WARN_ON(!pe))
+			return;
+	} else {
+		pci_info(pdev, "Added to existing PE#%x\n", pe->pe_number);
+	}
+
+	if (pdn)
+		pdn->pe_number = pe->pe_number;
+	pe->device_count++;
 
-	pe = &phb->ioda.pe_array[pdn->pe_number];
 	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
 	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
 	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
@@ -2300,9 +2286,6 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
 	iommu_init_table(tbl, phb->hose->node, 0, 0);
 
-	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
-		pnv_ioda_setup_bus_dma(pe, pe->pbus);
-
 	return;
  fail:
 	/* XXX Failure: Try to fallback to 64-bit only ? */
@@ -2633,9 +2616,6 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 	iommu_register_group(&pe->table_group, phb->hose->global_number,
 			     pe->pe_number);
 #endif
-
-	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
-		pnv_ioda_setup_bus_dma(pe, pe->pbus);
 }
 
 int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
@@ -3234,16 +3214,15 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
 	}
 }
 
-static void pnv_pci_setup_bridge(struct pci_bus *bus, unsigned long type)
+static void pnv_pci_configure_bus(struct pci_bus *bus)
 {
 	struct pci_controller *hose = pci_bus_to_host(bus);
 	struct pnv_phb *phb = hose->private_data;
 	struct pci_dev *bridge = bus->self;
 	struct pnv_ioda_pe *pe;
-	bool all = (pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
+	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
 
-	/* Extend bridge's windows if necessary */
-	pnv_pci_fixup_bridge_resources(bus, type);
+	dev_info(&bus->dev, "Configuring PE for bus\n");
 
 	/* The PE for root bus should be realized before any one else */
 	if (!phb->ioda.root_pe_populated) {
@@ -3620,7 +3599,7 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.enable_device_hook	= pnv_pci_enable_device_hook,
 	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
-	.setup_bridge		= pnv_pci_setup_bridge,
+	.setup_bridge		= pnv_pci_fixup_bridge_resources,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
 };
-- 
2.9.5

