Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88111FD8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 05:21:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bp4M3vvCzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 15:21:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47bp2F3kmczDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 15:19:31 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 546B7AE80565;
 Sun, 15 Dec 2019 23:18:21 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 1/4] Revert "powerpc/pseries/iommu: Don't use
 dma_iommu_ops on secure guests"
Date: Mon, 16 Dec 2019 15:19:21 +1100
Message-Id: <20191216041924.42318-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216041924.42318-1-aik@ozlabs.ru>
References: <20191216041924.42318-1-aik@ozlabs.ru>
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
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

This reverts commit edea902c1c1efb855f77e041f9daf1abe7a9768a.

At the time the change allowed direct DMA ops for secure VMs; however
since then we switched on using SWIOTLB backed with IOMMU (direct mapping)
and to make this work, we need dma_iommu_ops which handles all cases
including TCE mapping I/O pages in the presence of an IOMMU.

Fixes: edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests")
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[aik: added "revert" and "fixes:"]
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2
* made it a revert patch, added "fixes:"
---
 arch/powerpc/platforms/pseries/iommu.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6ba081dd61c9..df7db33ca93b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -36,7 +36,6 @@
 #include <asm/udbg.h>
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
-#include <asm/svm.h>
 
 #include "pseries.h"
 
@@ -1320,15 +1319,7 @@ void iommu_init_early_pSeries(void)
 	of_reconfig_notifier_register(&iommu_reconfig_nb);
 	register_memory_notifier(&iommu_mem_nb);
 
-	/*
-	 * Secure guest memory is inacessible to devices so regular DMA isn't
-	 * possible.
-	 *
-	 * In that case keep devices' dma_map_ops as NULL so that the generic
-	 * DMA code path will use SWIOTLB to bounce buffers for DMA.
-	 */
-	if (!is_secure_guest())
-		set_pci_dma_ops(&dma_iommu_ops);
+	set_pci_dma_ops(&dma_iommu_ops);
 }
 
 static int __init disable_multitce(char *str)
-- 
2.17.1

