Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083010313F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:44:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HlqZ6CGKzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ilnxKFgK"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlV44m6RzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:32 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id s5so13333819pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LnKCTD86Cj4Kjt7kzNRbuOmUonaJTAutzydXAq7YQ8g=;
 b=ilnxKFgK/3OiDBJMK2c4mpulisHLY2SZ2RpzTs7MyQ/KrNI95l9t794SLRJhWmvC7H
 +iWt9QSd3eDyu+HyaNLLy4Y2cpBolUyjsni0Kv8Q2pXDihk9OKZKmCXQSifXtDsCYGFe
 ZclqNZtWqO7NIV18eAO92U1tOIpzZKRI4SVj0oL08RKTwHGznMHdyEvXn4maeQbf1fpj
 Zvi3mw7/GqMfVWz+PbsLocgf67x1AOD/sW6XjIMSHJcfgaEylcxcauEus4VyGSydH+wR
 tlEgiCK74j/t/tt2GgCLhUBkYZ+cdnRYZYuH2ycpaN4Bn1Vi+jBCoLh3XfqyHglZFzwS
 +WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LnKCTD86Cj4Kjt7kzNRbuOmUonaJTAutzydXAq7YQ8g=;
 b=evg803wdFLbD4fkmPR2al53QpmrdxuQ5ZMRoe9Fx48aeuN84V4SnYSqC7GnL3/ZDO5
 9qVucCiaM3Sfx8MDn2ml3EWAbVx3+WxPmBwC29aOQeEBvpEPNn6ljicXXE2xgjKdPcLu
 dE61N6UmWNIDE0K40FUAYM1/6ulzP/Ufn8qxWEv56NMnx6qJAwnGAcV8jTUTVRLz8lbj
 eOOrc5gYGI3+udfyDng7TLJGov1+XhMrMHKwmUaS/w0nJQh+b9nEB5m4C6bAUXw+8tSz
 /kC5AHQhKuByW0+98hCao+R+4vDCzaFWfcdUgmdT5Twg2WSUJEP81DFrpPaSvGJ2ptJp
 /bXw==
X-Gm-Message-State: APjAAAVYiKtLfH3cjxG/P+TMFh+psL3l0REqg5xqUEIeuDSJA7Ggbzzk
 u5oPW9QZk/7bdE1E3U5YAD705qtz
X-Google-Smtp-Source: APXvYqzv1ocLg9SPFLtHsxh23Gh41JHh156ILWATJwyA763JmvkEhDXgEa7AXhB9M4cXHpic5PsvCw==
X-Received: by 2002:a63:b62:: with SMTP id a34mr162056pgl.123.1574213368462;
 Tue, 19 Nov 2019 17:29:28 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:28 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 07/46] powernv/pci: Rework IODA PE device accounting
Date: Wed, 20 Nov 2019 12:28:20 +1100
Message-Id: <20191120012859.23300-8-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current process for configuring the IODA PEs for normal PCI devices is
abit stupid. After assigning MMIO resources for the devices on a bus the
actual PE asignment occurs when pcibios_setup_bridge() is called for the
parent bridge. In pcibios_setup_bridge() we:

1. Assign all 256 devfn's for the subordinate bus to the PE corresponding
   to the bridge window.
2. Initialise the IOMMU tables for that PE.
3. Traverse each device on the bus below the bridge setting the IOMMU table
   pointer to point at the PE's table.
4. Finally, set pci_dn->pe_number to indicate that we've done the
   per-device setup and allow EEH and the platform code to look up
   the PE number.

Although mostly functional, there's a couple of issues with this approach.
The most glaring is that it mixes the per-bus (per-PE really) setup with
the per-device setup in a way that's completely asymmetric to what happens
when tearing down a device.

In step 4. the number of devices in the PE is counted and stored in the
ioda_pe structure. When releasing a pci_dev the device count is dropped
until it hits zero where the ioda_pe itself is torn down. However, the bus
itself remains active and can be re-scanned to bring back the devices that
were removed. On a rescan we do not re-run the bridge setup so the
per-device setup is never re-done which results in the re-scanned being
unusable.

There are a few other minor issues too. Associating all 256 devfns with
the PE means that config accesses to non-existant PCI devices results
in a spurious PE freezes. We currently prevent this by only allowing config
accesses to a BDFN when there is a corresponding pci_dn structure. We
would like to eliminate that restriction in the future though.

That all said the biggest issue is that the current behaviour is hard to
follow at the best of times. On top of that the behaviour is slightly (or
majorly) different across each PHB type (PCIe, OpenCAPI, NVLink) and the
behaviour for physical devices (described above) and virtual functions is
again different. To address this we want to merge the paths as much as
possible so that the PowerNV specific PCI initialisation steps all occur
at roughly the same point in the PCI device setup path.

We can address most of these problems by moving the PE setup out of
pcibios_setup_bridge() and into pcibios_bus_add_device(). The latter is
called on a per-device basis so we have some symmetry between the setup and
teardown paths. Moving the PE assignments to here should also allow us to
converge how PE assignment works on all PHB types so it's always done in
one place.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 112 +++++++++++-----------
 1 file changed, 58 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c6ea7a504e04..c74521e5f3ab 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -51,6 +51,7 @@ static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
 					      "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
+static void pnv_pci_configure_bus(struct pci_bus *bus);
 
 void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 			    const char *fmt, ...)
@@ -1104,34 +1105,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
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
@@ -1152,7 +1125,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 	pe_num = phb->ioda.pe_rmap[bus->number << 8];
 	if (pe_num != IODA_INVALID_PE) {
 		pe = &phb->ioda.pe_array[pe_num];
-		pnv_ioda_setup_same_PE(bus, pe);
 		return NULL;
 	}
 
@@ -1196,9 +1168,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 		return NULL;
 	}
 
-	/* Associate it with all child devices */
-	pnv_ioda_setup_same_PE(bus, pe);
-
 	/* Put PE to the list */
 	list_add_tail(&pe->list, &phb->ioda.pe_list);
 
@@ -1758,23 +1727,20 @@ static void pnv_pci_ioda_dma_dev_setup(struct pnv_phb *phb, struct pci_dev *pdev
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
-	/*
-	 * The function can be called while the PE#
-	 * hasn't been assigned. Do nothing for the
-	 * case.
-	 */
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
-		return;
-
 	pe = &phb->ioda.pe_array[pdn->pe_number];
 	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
 	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
 	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
+
+	pe->device_count++;
+
 	/*
 	 * Note: iommu_add_device() will fail here as
 	 * for physical PE: the device is already added by now;
 	 * for virtual PE: sysfs entries are not ready yet and
 	 * tce_iommu_bus_notifier will add the device to a group later.
+	 *
+	 * XXX: this is wrong since the re-ordering patch.
 	 */
 }
 
@@ -2288,9 +2254,6 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
 	iommu_init_table(tbl, phb->hose->node, 0, 0);
 
-	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
-		pnv_ioda_setup_bus_dma(pe, pe->pbus);
-
 	return;
  fail:
 	/* XXX Failure: Try to fallback to 64-bit only ? */
@@ -2626,9 +2589,9 @@ static void pnv_pci_ioda_setup_iommu_api(void)
 	/*
 	 * There are 4 types of PEs:
 	 * - PNV_IODA_PE_BUS: a downstream port with an adapter,
-	 *   created from pnv_pci_setup_bridge();
+	 *   created from pnv_pci_configure_bus();
 	 * - PNV_IODA_PE_BUS_ALL: a PCI-PCIX bridge with devices behind it,
-	 *   created from pnv_pci_setup_bridge();
+	 *   created from pnv_pci_configure_bus();
 	 * - PNV_IODA_PE_VF: a SRIOV virtual function,
 	 *   created from pnv_pcibios_sriov_enable();
 	 * - PNV_IODA_PE_DEV: an NPU or OCAPI device,
@@ -2748,8 +2711,10 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 	if (rc)
 		return;
 
-	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
-		pnv_ioda_setup_bus_dma(pe, pe->pbus);
+	/*
+	 * The IOMMU table for the PE is associated with the device in
+	 * pnv_pcibios_bus_add_device()
+	 */
 }
 
 int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
@@ -3324,16 +3289,13 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
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
-
-	/* Extend bridge's windows if necessary */
-	pnv_pci_fixup_bridge_resources(bus, type);
+	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
 
 	/* The PE for root bus should be realized before any one else */
 	if (!phb->ioda.root_pe_populated) {
@@ -3342,12 +3304,21 @@ static void pnv_pci_setup_bridge(struct pci_bus *bus, unsigned long type)
 			phb->ioda.root_pe_idx = pe->pe_number;
 			phb->ioda.root_pe_populated = true;
 		}
+
+		/* no need to re-configure the root bus */
+		if (bus == phb->hose->bus)
+			return;
 	}
 
 	/* Don't assign PE to PCI bus, which doesn't have subordinate devices */
 	if (list_empty(&bus->devices))
 		return;
 
+	/* PE should never be re-configured */
+	pe = __pnv_ioda_get_pe(phb, bus->number << 8);
+	if (WARN_ON(pe))
+		return;
+
 	/* Reserve PEs according to used M64 resources */
 	pnv_ioda_reserve_m64_pe(bus, NULL, all);
 
@@ -3654,6 +3625,39 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
 	struct pnv_phb *phb = hose->private_data;
+	struct pci_dn *pdn = pci_get_pdn(pdev);
+	struct pnv_ioda_pe *pe;
+
+	/* Check if the BDFN for this device is associated with a PE yet */
+	pe = __pnv_ioda_get_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+	if (!pe) {
+		/*
+		 * We should only hit this path for "normal" PCI PHBs. The
+		 * special PHBs used for OpenCAPI and NVLink don't have to
+		 * deal with eeh-on-mmio so they assign PEs at probe time
+		 * rather than after resources are allocated.
+		 */
+		WARN_ON(phb->type != PNV_PHB_IODA2 && phb->type != PNV_PHB_IODA1);
+		/* PEs for VFs should have been assigned in sriov_enable() */
+		WARN_ON(pdev->is_virtfn);
+
+		pnv_pci_configure_bus(pdev->bus);
+		pe = __pnv_ioda_get_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+		pci_err(pdev, "Configured new pe PE#%x\n", pe ? pe->pe_number : 0xfffff);
+
+
+		/*
+		 * If we can't setup the IODA PE something has gone horribly
+		 * wrong and we can't enable DMA for the device.
+		 */
+		if (WARN_ON(!pe))
+			return;
+	} else {
+		pci_err(pdev, "Added to existing PE#%x\n", pe->pe_number);
+	}
+
+	if (pdn)
+		pdn->pe_number = pe->pe_number;
 
 	pnv_pci_ioda_dma_dev_setup(phb, pdev);
 }
@@ -3680,14 +3684,14 @@ void pnv_pci_dma_bus_setup(struct pci_bus *bus)
 
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.dma_dev_setup		= pnv_pci_dma_dev_setup,
-	.dma_bus_setup		= pnv_pci_dma_bus_setup,
+	.dma_bus_setup		= pnv_pci_dma_bus_setup, /* NB: DMA setup actually happens in dma_dev_setup */
 	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
 	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
 	.enable_device_hook	= pnv_pci_enable_device_hook,
 	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
-	.setup_bridge		= pnv_pci_setup_bridge,
+	.setup_bridge		= pnv_pci_fixup_bridge_resources,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
 };
-- 
2.21.0

