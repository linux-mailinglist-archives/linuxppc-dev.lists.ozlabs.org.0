Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF22B1539
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 06:07:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXRKb1HCCzDr0K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 16:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CXRH64NHXzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 16:05:05 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 7DF44AE80053;
 Fri, 13 Nov 2020 00:05:00 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/powernv/npu: Do not attempt NPU2 setup on old
 P8's NPU
Date: Fri, 13 Nov 2020 16:04:57 +1100
Message-Id: <20201113050457.73742-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We execute certain NPU2 setup code (such as mapping an LPID to a device
in NPU2) unconditionally if an Nvlink bridge is detected. However this
cannot succeed on P8+ machines and errors appear in dmesg. This is
harmless as skiboot returns an error and the only place we check it is
vfio-pci but that code does not get called on P8+ either.

This adds a check if pnv_npu2_xxx helpers are called on a machine with
NPU2 which initializes pnv_phb::npu in pnv_npu2_init();
pnv_phb::npu==NULL on P8+.

Fixes: 1b785611e119 ("powerpc/powernv/npu: Add release_ownership hook")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index abeaa533b976..7b28b284a594 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -623,6 +623,11 @@ int pnv_npu2_map_lpar_dev(struct pci_dev *gpdev, unsigned int lparid,
 		return -ENODEV;
 
 	hose = pci_bus_to_host(npdev->bus);
+	if (hose->npu == NULL) {
+		dev_info_once(&npdev->dev, "Nvlink1 does not support contexts");
+		return 0;
+	}
+
 	nphb = hose->private_data;
 
 	dev_dbg(&gpdev->dev, "Map LPAR opalid=%llu lparid=%u\n",
@@ -670,6 +675,11 @@ int pnv_npu2_unmap_lpar_dev(struct pci_dev *gpdev)
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

