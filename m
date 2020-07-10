Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269721AEC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B31tq244NzDqBL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R2PrRyUc; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31g60fTQzDrJJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:01 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id a6so4565810wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txzUTnQavBi9BfxrVKZrF+NUyag93QtMXSfG7zpFf/A=;
 b=R2PrRyUcfkPHHpHuMx3j0DTmf1Jl5R/RT6FA6qewfYSsCd/VfkAkgzsGY1mHIBGIhE
 COsPIyw35tTZ8LGIBkktiBkohD0JTJpfONO0BFzFe8L7Hnq5puhEt92Xptmlwhoqz4yQ
 XPvrNN+EQseo+UCz5EgTC68Uryf1NTQ5ni/q5qtPzYhjbJTu8yjijOX0bhh7OjKj+XHJ
 Wn/8pEJ+SfA6X8ydkkzCzZPZBM+HjLNzlkwlx0aLrzJRsmV9QvkextAUjcSHUxhJX4oS
 btnlYqf9MisQvL88aIiVwYf2DiIWwA6EzAKsDjM31pBGzQXF34vxpmqQ1xKyyDsHynp+
 Ab1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txzUTnQavBi9BfxrVKZrF+NUyag93QtMXSfG7zpFf/A=;
 b=T7gN+G8fLzda01oeReNMS/8YFoiULYhC0LnCHy+HHqhlx5qAzD8IwbayQhCeUD+wKu
 WjDfH5uwxg0eWnresagjbPSTNfVpkcAIPue3Pb70X5HCFk+9C4GNMeD0zluoI5b4TwIb
 YPpgAIuNEEqpt+9wJSQOOlZnqDYChV4c/7LtPqJxv65dttn721i/uLZbbwopcGZis/H2
 uFZshFyL8bmGObEqIzRudZT+K6SFjlcdtNdOFh1nBPZWPbV5L6D8/vK1Q7MVNahraH5K
 PxCETROa/3aT6/dZ7mXZ2Uv+WmW+xDrF00W7O3f0dvURjv4o7ozu48Rseaw/MXMzNBvr
 AOHw==
X-Gm-Message-State: AOAM533c2NgozVRGwXbfbkE1IlD845ssWSgXNRlBuBj1usnqzvmTsxeH
 rLx8S4Cz/bOZ7U8uDjtG52C8DBqERCA=
X-Google-Smtp-Source: ABdhPJy7lbf6IEI1h0S1H1duRxGYCoSa6vMDwsKHt3TCnEhvRasfqDxQ1mJg/mDPCzARvBo08W2+nw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr70932741wrn.179.1594358636548; 
 Thu, 09 Jul 2020 22:23:56 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:23:56 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/15] powernv/pci: Add pci_bus_to_pnvhb() helper
Date: Fri, 10 Jul 2020 15:23:26 +1000
Message-Id: <20200710052340.737567-2-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
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
explicit.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 88 +++++++----------------
 arch/powerpc/platforms/powernv/pci.c      | 14 ++--
 arch/powerpc/platforms/powernv/pci.h      | 10 +++
 3 files changed, 38 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 31c3e6d58c41..687919db0347 100644
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
@@ -673,8 +671,7 @@ struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn)
 
 struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 
 	if (!pdn)
@@ -1069,8 +1066,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 
 static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 	struct pnv_ioda_pe *pe;
 
@@ -1129,8 +1125,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
  */
 static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 {
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *pe = NULL;
 	unsigned int pe_num;
 
@@ -1196,8 +1191,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 	struct pnv_ioda_pe *pe;
 	struct pci_dev *gpu_pdev;
 	struct pci_dn *npu_pdn;
-	struct pci_controller *hose = pci_bus_to_host(npu_pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(npu_pdev->bus);
 
 	/*
 	 * Intentionally leak a reference on the npu device (for
@@ -1300,16 +1294,12 @@ static void pnv_pci_ioda_setup_nvlink(void)
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
@@ -1333,8 +1323,6 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 
 static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 {
-	struct pci_bus        *bus;
-	struct pci_controller *hose;
 	struct pnv_phb        *phb;
 	struct pci_dn         *pdn;
 	unsigned int           win;
@@ -1346,9 +1334,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	int                    pe_num;
 	int                    m64_bars;
 
-	bus = pdev->bus;
-	hose = pci_bus_to_host(bus);
-	phb = hose->private_data;
+	phb = pci_bus_to_pnvhb(pdev->bus);
 	pdn = pci_get_pdn(pdev);
 	total_vfs = pci_sriov_get_totalvfs(pdev);
 
@@ -1459,15 +1445,11 @@ static void pnv_pci_ioda2_release_dma_pe(struct pci_dev *dev, struct pnv_ioda_pe
 
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
@@ -1492,16 +1474,12 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 
 static void pnv_pci_sriov_disable(struct pci_dev *pdev)
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
 
@@ -1535,17 +1513,13 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 				       struct pnv_ioda_pe *pe);
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
@@ -1572,7 +1546,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->rid = (vf_bus << 8) | vf_devfn;
 
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
-			hose->global_number, pdev->bus->number,
+			pci_domain_nr(pdev->bus), pdev->bus->number,
 			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
 
 		if (pnv_ioda_configure_pe(phb, pe)) {
@@ -1602,17 +1576,13 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
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
@@ -1735,8 +1705,7 @@ static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 
 static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -1847,8 +1816,7 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
 static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 		u64 dma_mask)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -2766,8 +2734,7 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
 #ifdef CONFIG_PCI_IOV
 static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
 	struct resource *res;
 	int i;
@@ -3101,10 +3068,9 @@ static void pnv_pci_ioda_fixup(void)
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
@@ -3190,8 +3156,7 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
 
 static void pnv_pci_configure_bus(struct pci_bus *bus)
 {
-	struct pci_controller *hose = pci_bus_to_host(bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pci_dev *bridge = bus->self;
 	struct pnv_ioda_pe *pe;
 	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
@@ -3237,8 +3202,7 @@ static resource_size_t pnv_pci_default_alignment(void)
 static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 						      int resno)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	resource_size_t align;
 
@@ -3274,8 +3238,7 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
  */
 static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn;
 
 	/* The function is probably called while the PEs have
@@ -3488,8 +3451,7 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 
 static void pnv_pci_release_device(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -3534,8 +3496,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 
 static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
 {
-	struct pci_controller *hose = bus->sysdata;
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *pe;
 
 	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
@@ -3873,8 +3834,7 @@ void __init pnv_pci_init_npu2_opencapi_phb(struct device_node *np)
 
 static void pnv_npu2_opencapi_cfg_size_fixup(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 
 	if (!machine_is(powernv))
 		return;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 091fe1cf386b..9b9bca169275 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -162,8 +162,7 @@ EXPORT_SYMBOL_GPL(pnv_pci_set_power_state);
 
 int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct msi_desc *entry;
 	struct msi_msg msg;
 	int hwirq;
@@ -211,8 +210,7 @@ int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 
 void pnv_teardown_msi_irqs(struct pci_dev *pdev)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct msi_desc *entry;
 	irq_hw_number_t hwirq;
 
@@ -824,10 +822,9 @@ EXPORT_SYMBOL(pnv_pci_get_phb_node);
 
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
@@ -835,9 +832,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 	if (!opal_check_token(OPAL_PCI_SET_PBCQ_TUNNEL_BAR))
 		return -ENXIO;
 
-	hose = pci_bus_to_host(dev->bus);
-	phb = hose->private_data;
-
 	mutex_lock(&tunnel_mutex);
 	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, &val);
 	if (rc != OPAL_SUCCESS) {
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 51c254f2f3cb..0727dec9a0d1 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -260,4 +260,14 @@ extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
 
 extern unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
 
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
2.26.2

