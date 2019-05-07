Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C938215D5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 08:30:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yqTh0CdHzDqHW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 16:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 44yqPq62PFzDqKy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 16:26:39 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id D8680AE80382;
 Tue,  7 May 2019 02:26:06 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 2/2] powerpc/pseries/dma: Enable swiotlb
Date: Tue,  7 May 2019 16:25:59 +1000
Message-Id: <20190507062559.20295-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507062559.20295-1-aik@ozlabs.ru>
References: <20190507062559.20295-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far the pseries platforms has always been using IOMMU making SWIOTLB
unnecessary. Now we want secure guests which means devices can only
access certain areas of guest physical memory; we are going to use
SWIOTLB for this purpose.

This allows SWIOTLB for pseries. By default there is no change in behavior.

This enables SWIOTLB when the "swiotlb" kernel parameter is set to "force".

With the SWIOTLB enabled, the kernel creates a directly mapped DMA window
(using the usual DDW mechanism) and implements SWIOTLB on top of that.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/setup.c | 5 +++++
 arch/powerpc/platforms/pseries/Kconfig | 1 +
 2 files changed, 6 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e4f0dfd4ae33..30d72b587ac5 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -42,6 +42,7 @@
 #include <linux/of.h>
 #include <linux/of_pci.h>
 #include <linux/memblock.h>
+#include <linux/swiotlb.h>
 
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -71,6 +72,7 @@
 #include <asm/isa-bridge.h>
 #include <asm/security_features.h>
 #include <asm/asm-const.h>
+#include <asm/swiotlb.h>
 
 #include "pseries.h"
 #include "../../../../drivers/pci/pci.h"
@@ -797,6 +799,9 @@ static void __init pSeries_setup_arch(void)
 	}
 
 	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
+
+	if (swiotlb_force == SWIOTLB_FORCE)
+		ppc_swiotlb_enable = 1;
 }
 
 static void pseries_panic(char *str)
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 9c6b3d860518..b9e8b608de01 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -23,6 +23,7 @@ config PPC_PSERIES
 	select ARCH_RANDOM
 	select PPC_DOORBELL
 	select FORCE_SMP
+	select SWIOTLB
 	default y
 
 config PPC_SPLPAR
-- 
2.17.1

