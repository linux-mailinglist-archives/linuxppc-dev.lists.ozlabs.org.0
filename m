Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9EDE6E95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 09:57:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471pWF6733zDqmF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 19:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5nPdIZ4"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471pSR1dvkzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 19:54:46 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id r1so6447536pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7H6mKTh9zqXvYcy1Ua/XMd20wDfeej2CMStIpNchhTw=;
 b=N5nPdIZ4q7Aq0XXxne5lc8oSpDsdue75MjJhQbt611aYDKsSLPsg9RDWo6DsU2AcuL
 QVVGogrCKr9KnK9OCLRYj6xH1DrYh3hSSwNdzGRRSd9hBfD1HEIzopHu4xztvApzhvhb
 VrQzeJMGLI8oYIE5Zof0T8gbAqQBMmWfpq2agZopq5IrTD89oh91ZHT3vyvqwtFc4j42
 dmS1qYkH4g/fo4YZBKmJiovXyOKviT+Gd6nynRLB/Saew38voSvgvByDaitfP1EE7XsD
 KcFT9imbXVUvcP9UUSI0PByFW1hj/l/fgS2KAGVr/GbCYNEw/ZzovGeP6UcpfugQLoPD
 a08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7H6mKTh9zqXvYcy1Ua/XMd20wDfeej2CMStIpNchhTw=;
 b=XLYUBrfFdGivd8qVz0vMtQ2MWXyN+K9pX0rdwjyy/f2oS02WQ7KXWqw0AOsJuOiRZl
 9raX5uu6d7YhGkndUiHe7g05ndaLzCa69N1xeCfP0nvo9wgP0BAGtHYG5IL4zC25Uxyh
 fzsEgc+6Gr34WHL8TgWRd6XfP0cDEe1IktyBz64HqVjECIagh7VUSR9Q48WoJil03toL
 5plOjyHWkr/VwJ/LXTiky/wNs39kHqIFWmvSiPJPkLesTqgkNVXrVtqCfr5HmPLZY7Ij
 LdUfEKOcR2IyRK93wvI/B4iNy6tr1EcLXQ374lV0tv5J43djenmJIWKlEUR+6yifF37y
 jRAg==
X-Gm-Message-State: APjAAAXJ6JJ0uu2F16ktJB9yyplLONdzFsCvCOmx1NMyhoYP2NMPgH7E
 5qTo1cOyqAmMdScnrmyqEmL3uFauQaM=
X-Google-Smtp-Source: APXvYqxUV43b7g9mMcqrN31QguLDDNjtEwSPvccNFhr/Ei5Vy6JN7s2fJnlfHWr8ItTacgAdU+8OYg==
X-Received: by 2002:a63:2c2:: with SMTP id 185mr17549116pgc.219.1572252882682; 
 Mon, 28 Oct 2019 01:54:42 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id l24sm10046115pff.151.2019.10.28.01.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 01:54:41 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powernv/iov: Ensure the pdn for VFs always contains a
 valid PE number
Date: Mon, 28 Oct 2019 19:54:22 +1100
Message-Id: <20191028085424.12006-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On pseries there is a bug with adding hotplugged devices to an IOMMU group.
For a number of dumb reasons fixing that bug first requires re-working how
VFs are configured on PowerNV. For background, on PowerNV we use the
pcibios_sriov_enable() hook to do two things:

1. Create a pci_dn structure for each of the VFs, and
2. Configure the PHB's internal BARs so the MMIO range for each VF
   maps to a unique PE.

Roughly speaking a PE is the hardware counterpart to a Linux IOMMU group
since all the devices in a PE share the same IOMMU table. A PE also defines
the set of devices that should be isolated in response to a PCI error (i.e.
bad DMA, UR/CA, AER events, etc). When isolated all MMIO and DMA traffic to
and from devicein the PE is blocked by the root complex until the PE is
recovered by the OS.

The requirement to block MMIO causes a giant headache because the P8 PHB
generally uses a fixed mapping between MMIO addresses and PEs.  As a result
we need to delay configuring the IOMMU groups for device until after MMIO
resources are assigned. For physical devices (i.e. non-VFs) the PE
assignment is done in pcibios_setup_bridge() which is called immediately
after the MMIO resources for downstream devices (and the bridge's windows)
are assigned. For VFs the setup is more complicated because:

a) pcibios_setup_bridge() is not called again when VFs are activated, and
b) The pci_dev for VFs are created by generic code which runs after
   pcibios_sriov_enable() is called.

The work around for this is a two step process:

1. A fixup in pcibios_add_device() is used to initialised the cached
   pe_number in pci_dn, then
2. A bus notifier then adds the device to the IOMMU group for the PE
   specified in pci_dn->pe_number.

A side effect fixing the pseries bug mentioned in the first paragraph is
moving the fixup out of pcibios_add_device() and into
pcibios_bus_add_device(), which is called much later. This results in step
2. failing because pci_dn->pe_number won't be initialised when the bus
notifier is run.

We can fix this by removing the need for the fixup. The PE for a VF is
known before the VF is even scanned so we can initialise pci_dn->pe_number
pcibios_sriov_enable() instead. Unfortunately, moving the initialisation
causes two problems:

1. We trip the WARN_ON() in the current fixup code, and
2. The EEH core clears pdn->pe_number when recovering a VF and relies
   on the fixup to correctly re-set it.

The only justification for either of these is a comment in eeh_rmv_device()
suggesting that pdn->pe_number *must* be set to IODA_INVALID_PE in order
for the VF to be scanned. However, this comment appears to have no basis
in reality. Both bugs can be fixed by just deleting the code.

Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Re-wrote commit message, got very depressed about the state of things.

    The real fix here is to move the IOMMU group setup for both VFs and
    PFs into pcibios_bus_add_device() and kill the pcibios_setup_bridge()
    hack and the bus notifier hack, but doing that requires some pretty
    gnarly changes. The fix here is much less invasive.
---
 arch/powerpc/kernel/eeh_driver.c          |  6 ------
 arch/powerpc/platforms/powernv/pci-ioda.c | 19 +++++++++++++++----
 arch/powerpc/platforms/powernv/pci.c      |  4 ----
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index d9279d0..7955fba 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -541,12 +541,6 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 
 		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
 		edev->pdev = NULL;
-
-		/*
-		 * We have to set the VF PE number to invalid one, which is
-		 * required to plug the VF successfully.
-		 */
-		pdn->pe_number = IODA_INVALID_PE;
 #endif
 		if (rmv_data)
 			list_add(&edev->rmv_entry, &rmv_data->removed_vf_list);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 5e3172d..70508b3 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1558,6 +1558,10 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 	/* Reserve PE for each VF */
 	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
+		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
+		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
+		struct pci_dn *vf_pdn;
+
 		if (pdn->m64_single_mode)
 			pe_num = pdn->pe_num_map[vf_index];
 		else
@@ -1570,13 +1574,11 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->pbus = NULL;
 		pe->parent_dev = pdev;
 		pe->mve_number = -1;
-		pe->rid = (pci_iov_virtfn_bus(pdev, vf_index) << 8) |
-			   pci_iov_virtfn_devfn(pdev, vf_index);
+		pe->rid = (vf_bus << 8) | vf_devfn;
 
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
 			hose->global_number, pdev->bus->number,
-			PCI_SLOT(pci_iov_virtfn_devfn(pdev, vf_index)),
-			PCI_FUNC(pci_iov_virtfn_devfn(pdev, vf_index)), pe_num);
+			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
 
 		if (pnv_ioda_configure_pe(phb, pe)) {
 			/* XXX What do we do here ? */
@@ -1590,6 +1592,15 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		list_add_tail(&pe->list, &phb->ioda.pe_list);
 		mutex_unlock(&phb->ioda.pe_list_mutex);
 
+		/* associate this pe to it's pdn */
+		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
+			if (vf_pdn->busno == vf_bus &&
+			    vf_pdn->devfn == vf_devfn) {
+				vf_pdn->pe_number = pe_num;
+				break;
+			}
+		}
+
 		pnv_pci_ioda2_setup_dma_pe(phb, pe);
 #ifdef CONFIG_IOMMU_API
 		iommu_register_group(&pe->table_group,
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 2825d00..b7761e2 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -816,16 +816,12 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 	struct pnv_phb *phb = hose->private_data;
 #ifdef CONFIG_PCI_IOV
 	struct pnv_ioda_pe *pe;
-	struct pci_dn *pdn;
 
 	/* Fix the VF pdn PE number */
 	if (pdev->is_virtfn) {
-		pdn = pci_get_pdn(pdev);
-		WARN_ON(pdn->pe_number != IODA_INVALID_PE);
 		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
 			if (pe->rid == ((pdev->bus->number << 8) |
 			    (pdev->devfn & 0xff))) {
-				pdn->pe_number = pe->pe_number;
 				pe->pdev = pdev;
 				break;
 			}
-- 
2.9.5

