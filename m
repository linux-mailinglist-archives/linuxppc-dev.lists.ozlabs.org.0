Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681B2BC46C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Nov 2020 08:40:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cf2J01gHmzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Nov 2020 18:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cf2GM3QfmzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Nov 2020 18:38:46 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 81FF8AE800EC;
 Sun, 22 Nov 2020 02:38:38 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/powernv/npu: Do not attempt NPU2 setup on
 POWER8NVL NPU
Date: Sun, 22 Nov 2020 18:38:28 +1100
Message-Id: <20201122073828.15446-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, stable@vger.kernel.org,
 kvm-ppc@vger.kernel.org,
 =?UTF-8?q?Leonardo=20Augusto=20Guimar=C3=A3es=20Garcia?= <lagarcia@br.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We execute certain NPU2 setup code (such as mapping an LPID to a device
in NPU2) unconditionally if an Nvlink bridge is detected. However this
cannot succeed on POWER8NVL machines and errors appear in dmesg. This is
harmless as skiboot returns an error and the only place we check it is
vfio-pci but that code does not get called on P8+ either.

This adds a check if pnv_npu2_xxx helpers are called on a machine with
NPU2 which initializes pnv_phb::npu in pnv_npu2_init();
pnv_phb::npu==NULL on POWER8/NVL (Naples).

While at this, fix NULL derefencing in pnv_npu_peers_take_ownership/
pnv_npu_peers_release_ownership which occurs when GPUs on mentioned P8s
cause EEH which happens if "vfio-pci" disables devices using
the D3 power state; the vfio-pci's disable_idle_d3 module parameter
controls this and must be set on Naples. The EEH handling clears
the entire pnv_ioda_pe struct in pnv_ioda_free_pe() hence
the NULL derefencing. We cannot recover from that but at least we stop
crashing.

Tested on
- POWER9 pvr=004e1201, Ubuntu 19.04 host, Ubuntu 18.04 vm,
  NVIDIA GV100 10de:1db1 driver 418.39
- POWER8 pvr=004c0100, RHEL 7.6 host, Ubuntu 16.10 vm,
  NVIDIA P100 10de:15f9 driver 396.47

Fixes: 1b785611e119 ("powerpc/powernv/npu: Add release_ownership hook")
Cc: stable@vger.kernel.org # 5.0
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* added checks for !pe->table_group.ops and updated commit log
* added tested configurations
---
 arch/powerpc/platforms/powernv/npu-dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index abeaa533b976..b711dc3262a3 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -385,7 +385,8 @@ static void pnv_npu_peers_take_ownership(struct iommu_table_group *table_group)
 	for (i = 0; i < npucomp->pe_num; ++i) {
 		struct pnv_ioda_pe *pe = npucomp->pe[i];
 
-		if (!pe->table_group.ops->take_ownership)
+		if (!pe->table_group.ops ||
+		    !pe->table_group.ops->take_ownership)
 			continue;
 		pe->table_group.ops->take_ownership(&pe->table_group);
 	}
@@ -401,7 +402,8 @@ static void pnv_npu_peers_release_ownership(
 	for (i = 0; i < npucomp->pe_num; ++i) {
 		struct pnv_ioda_pe *pe = npucomp->pe[i];
 
-		if (!pe->table_group.ops->release_ownership)
+		if (!pe->table_group.ops ||
+		    !pe->table_group.ops->release_ownership)
 			continue;
 		pe->table_group.ops->release_ownership(&pe->table_group);
 	}
@@ -623,6 +625,11 @@ int pnv_npu2_map_lpar_dev(struct pci_dev *gpdev, unsigned int lparid,
 		return -ENODEV;
 
 	hose = pci_bus_to_host(npdev->bus);
+	if (hose->npu == NULL) {
+		dev_info_once(&npdev->dev, "Nvlink1 does not support contexts");
+		return 0;
+	}
+
 	nphb = hose->private_data;
 
 	dev_dbg(&gpdev->dev, "Map LPAR opalid=%llu lparid=%u\n",
@@ -670,6 +677,11 @@ int pnv_npu2_unmap_lpar_dev(struct pci_dev *gpdev)
 		return -ENODEV;
 
 	hose = pci_bus_to_host(npdev->bus);
+	if (hose->npu == NULL) {
+		dev_info_once(&npdev->dev, "Nvlink1 does not support contexts");
+		return 0;
+	}
+
 	nphb = hose->private_data;
 
 	dev_dbg(&gpdev->dev, "destroy context opalid=%llu\n",
-- 
2.17.1

