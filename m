Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AC103161
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:06:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmJD73dfzDqCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:06:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hcke8hVM"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVY0KJczDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:57 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z4so13323877pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KAolh+suT5nvf09xY2s17ZgjtmoY1CJ4oQDvMq/uMQ0=;
 b=Hcke8hVMwpTHTAuqTvs/czAVA8XkEXcoocPoVRVDGkKOeMKh48nXB+ORbRF6IvJDxW
 bMajCMt03RzYcIcC7lBbEBp4Giq0VHklxTSsae+j8cIgOaZ2RiVOiTL4CItjH03QmGIG
 juCye3CSCBf2pcDQQDVDjdmRX9r/+dREsiCpQsyRnM3KnR+Mgr7b3ARASbykwp63jPxs
 4r0vNC9JUHLLpZQ1GzBhFavw6mtRKtUaMbElc1X+Tv7umB2W6HyvJiMorwnzEVZHDKHB
 z/y9nn0hVLwke3MKy3lgvU1Agtz+ND8hcZADUTGWTHrMUXRBGTwgiR15opzeiaullCI3
 Jyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAolh+suT5nvf09xY2s17ZgjtmoY1CJ4oQDvMq/uMQ0=;
 b=BSp3JsEGqXhrcKO++eu9Fo/fYhqRwA5ZZzchXoRP6ARVnbS2CbIGLrAhCdYEUjhZRz
 +u02ZFt9V6uyfZEmLXhSr4OKublUhB0nqJeBtySjOkbX/xb7AEw4/kfaeSgrnmC1VIKN
 t7cEDMYdxDX96uacnpny8rxzE9Eee2nDJgoF43TEnzwf65wqXxmlQqLzAPGsIN7cgzQB
 tbGlT11Z6mB2ldrBrvYKZ9hfn+epk1mOc8bE4WEAN68LPjPpvOcYW/ZT58PdGkxk5Ank
 K6EWPVB7USpDabhchks7xnA/wJ2RXiZAHgdI+tahIVkHiwOS6/a9LHJD1oAUU47shkyk
 MqNg==
X-Gm-Message-State: APjAAAXaQUcBrsrNslOimZimqOt9yisas1kiYz3xz9bO0oUiFbzWhDh7
 EuR4XwTNnNNoGAwuwhUzpmNt8tnG
X-Google-Smtp-Source: APXvYqw3saNjPbzc5wXL6tw43dVZ0DSkCADuhKxGJQ3+ze2yoy2S1MuJPcrAMszn0mgPD9MsOVwF6g==
X-Received: by 2002:a63:9247:: with SMTP id s7mr184320pgn.334.1574213394908;
 Tue, 19 Nov 2019 17:29:54 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:54 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 18/46] powernv/pci: Add pci_bus_to_pnvhb() helper
Date: Wed, 20 Nov 2019 12:28:31 +1100
Message-Id: <20191120012859.23300-19-oohall@gmail.com>
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

Add a helper to go from a pci_bus structure to the pnv_phb that hosts that
bus. There's a lot of instances of the following pattern:

	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
	struct pnv_phb *phb = hose->private_data;

Without any other uses of the pci_controller inside the function. This is
hard to read since it requires you to memorise the contents of the
private data fields and kind of error prone since it involves blindly
assigning a void pointer. Add a helper to make it more concise and
explict.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 88 +++++++----------------
 arch/powerpc/platforms/powernv/pci.c      | 18 ++---
 arch/powerpc/platforms/powernv/pci.h      | 10 +++
 3 files changed, 39 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c74521e5f3ab..a1c9315f3208 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -252,8 +252,7 @@ static int pnv_ioda2_init_m64(struct pnv_phb *phb)
 static void pnv_ioda_reserve_dev_m64_pe(struct pci_dev *pdev,
 					 unsigned long *pe_bitmap)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct resource *r;
 	resource_size_t base, sgsz, start, end;
 	int segno, i;
@@ -351,8 +350,7 @@ static void pnv_ioda_reserve_m64_pe(struct pci_bus *bus,
 
 static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 {
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *master_pe, *pe;
 	unsigned long size, *pe_alloc;
 	int i;
@@ -673,8 +671,7 @@ struct pnv_ioda_pe *__pnv_ioda_get_pe(struct pnv_phb *phb, u16 bdfn)
 
 struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 
 	if (!pdn)
@@ -1053,8 +1050,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 
 static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 	struct pnv_ioda_pe *pe;
 
@@ -1113,8 +1109,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
  */
 static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 {
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *pe = NULL;
 	unsigned int pe_num;
 
@@ -1181,8 +1176,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 	struct pnv_ioda_pe *pe;
 	struct pci_dev *gpu_pdev;
 	struct pci_dn *npu_pdn;
-	struct pci_controller *hose = pci_bus_to_host(npu_pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(npu_pdev->bus);
 
 	/*
 	 * Due to a hardware errata PE#0 on the NPU is reserved for
@@ -1279,16 +1273,12 @@ static void pnv_pci_ioda_setup_PEs(void)
 #ifdef CONFIG_PCI_IOV
 static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pci_dn         *pdn;
 	int                    i, j;
 	int                    m64_bars;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 
 	if (pdn->m64_single_mode)
@@ -1312,8 +1302,6 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 
 static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pci_dn         *pdn;
 	unsigned int           win;
@@ -1325,9 +1313,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	int                    pe_num;
 	int                    m64_bars;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 	total_vfs = pci_sriov_get_totalvfs(pdev);
 
@@ -1438,15 +1424,11 @@ static void pnv_pci_ioda2_release_dma_pe(struct pci_dev *dev, struct pnv_ioda_pe
 
 static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pnv_ioda_pe    *pe, *pe_n;
 	struct pci_dn         *pdn;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 
 	if (!pdev->is_physfn)
@@ -1471,16 +1453,12 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 
 void pnv_pci_sriov_disable(struct pci_dev *pdev)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pnv_ioda_pe    *pe;
 	struct pci_dn         *pdn;
 	u16                    num_vfs, i;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 	num_vfs = pdn->num_vfs;
 
@@ -1519,17 +1497,13 @@ static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
 #endif
 static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pnv_ioda_pe    *pe;
 	int                    pe_num;
 	u16                    vf_index;
 	struct pci_dn         *pdn;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 
 	if (!pdev->is_physfn)
@@ -1556,7 +1530,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->rid = (vf_bus << 8) | vf_devfn;
 
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
-			hose->global_number, pdev->bus->number,
+			pci_domain_nr(pdev->bus), pdev->bus->number,
 			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
 
 		if (pnv_ioda_configure_pe(phb, pe)) {
@@ -1591,17 +1565,13 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pnv_ioda_pe    *pe;
 	struct pci_dn         *pdn;
 	int                    ret;
 	u16                    i;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 
 	if (phb->type == PNV_PHB_IODA2) {
@@ -1816,8 +1786,7 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
 static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 		u64 dma_mask)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -2866,8 +2835,7 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
 #ifdef CONFIG_PCI_IOV
 static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
 	struct resource *res;
 	int i;
@@ -3202,10 +3170,9 @@ static void pnv_pci_ioda_fixup(void)
 static resource_size_t pnv_pci_window_alignment(struct pci_bus *bus,
 						unsigned long type)
 {
-	struct pci_dev *bridge;
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	int num_pci_bridges = 0;
+	struct pci_dev *bridge;
 
 	bridge = bus->self;
 	while (bridge) {
@@ -3291,8 +3258,7 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
 
 static void pnv_pci_configure_bus(struct pci_bus *bus)
 {
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pci_dev *bridge = bus->self;
 	struct pnv_ioda_pe *pe;
 	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
@@ -3354,8 +3320,7 @@ static resource_size_t pnv_pci_default_alignment(void)
 static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 						      int resno)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	resource_size_t align;
 
@@ -3391,8 +3356,7 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
  */
 static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn;
 
 	/* The function is probably called while the PEs have
@@ -3577,8 +3541,7 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 
 static void pnv_pci_release_device(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -3623,8 +3586,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 
 void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -3664,8 +3626,7 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 
 void pnv_pci_dma_bus_setup(struct pci_bus *bus)
 {
-	struct pci_controller *hose = bus->sysdata;
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *pe;
 
 	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
@@ -3999,8 +3960,7 @@ void __init pnv_pci_init_npu2_opencapi_phb(struct device_node *np)
 
 static void pnv_npu2_opencapi_cfg_size_fixup(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 
 	if (!machine_is(powernv))
 		return;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 8b9058b52575..d36dde9777aa 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -158,8 +158,7 @@ EXPORT_SYMBOL_GPL(pnv_pci_set_power_state);
 
 int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct msi_desc *entry;
 	struct msi_msg msg;
 	int hwirq;
@@ -207,8 +206,7 @@ int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 
 void pnv_teardown_msi_irqs(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct msi_desc *entry;
 	irq_hw_number_t hwirq;
 
@@ -820,10 +818,9 @@ EXPORT_SYMBOL(pnv_pci_get_phb_node);
 
 int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 {
-	__be64 val;
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	u64 tunnel_bar;
+	__be64 val;
 	int rc;
 
 	if (!opal_check_token(OPAL_PCI_GET_PBCQ_TUNNEL_BAR))
@@ -831,9 +828,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 	if (!opal_check_token(OPAL_PCI_SET_PBCQ_TUNNEL_BAR))
 		return -ENXIO;
 
-	hose = pci_bus_to_host(dev->bus);
-	phb = hose->private_data;
-
 	mutex_lock(&tunnel_mutex);
 	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, &val);
 	if (rc != OPAL_SUCCESS) {
@@ -937,15 +931,13 @@ static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
 	struct pci_dev *pdev;
 	struct pci_dn *pdn;
 	struct pnv_ioda_pe *pe;
-	struct pci_controller *hose;
 	struct pnv_phb *phb;
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		pdev = to_pci_dev(dev);
 		pdn = pci_get_pdn(pdev);
-		hose = pci_bus_to_host(pdev->bus);
-		phb = hose->private_data;
+		phb = pci_bus_to_pnvhb(pdev->bus);
 
 		WARN_ON_ONCE(!phb);
 		if (!pdn || pdn->pe_number == IODA_INVALID_PE || !phb)
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index a343f3c8e65c..be435a810d19 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -247,4 +247,14 @@ extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
 		void *tce_mem, u64 tce_size,
 		u64 dma_offset, unsigned int page_shift);
 
+static inline struct pnv_phb *pci_bus_to_pnvhb(struct pci_bus *bus)
+{
+	struct pci_controller *hose = bus->sysdata;
+
+	if (hose)
+		return hose->private_data;
+
+	return NULL;
+}
+
 #endif /* __POWERNV_PCI_H */
-- 
2.21.0

