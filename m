Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8961FC2FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 02:52:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mmk41flFzDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 10:52:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 49mmhQ31DFzDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 10:50:45 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CC468AE8000E;
 Tue, 16 Jun 2020 20:48:20 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/powernv/ioda: Return correct error if TCE
 level allocation failed
Date: Wed, 17 Jun 2020 10:38:35 +1000
Message-Id: <20200617003835.48831-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The iommu_table_ops::xchg_no_kill() callback updates TCE. It is quite
possible that not entire table is allocated if it is huge and multilevel
so xchg may also allocate subtables. If failed, it returns H_HARDWARE
for failed allocation and H_TOO_HARD if it needs it but cannot do because
the alloc parameter is "false" (set when called with MMU=off to force
retry with MMU=on).

The problem is that having separate errors only matters in real mode
(MMU=off) but the only caller with alloc="false" does not check the exact
error code and simply returns H_TOO_HARD; and for every other mode
alloc is "true". Also, the function is also called from the ioctl()
handler of the VFIO SPAPR TCE IOMMU subdriver which does not expect
hypervisor error codes (H_xxx) and will expose them to the userspace.

This converts wrong error codes to -ENOMEM.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* return -ENOMEM vs. -1
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index f923359d8afc..5218f5da2737 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -166,7 +166,7 @@ int pnv_tce_xchg(struct iommu_table *tbl, long index,
 	if (!ptce) {
 		ptce = pnv_tce(tbl, false, idx, alloc);
 		if (!ptce)
-			return alloc ? H_HARDWARE : H_TOO_HARD;
+			return -ENOMEM;
 	}
 
 	if (newtce & TCE_PCI_WRITE)
-- 
2.17.1

