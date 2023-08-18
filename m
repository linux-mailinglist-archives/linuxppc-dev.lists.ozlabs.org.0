Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 957457806B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 09:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRvMM3czlz3cNv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRvLp69xJz2yxg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 17:55:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRvLh446Nz9yYL;
	Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcxylVjVF3Iq; Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRvLh34Trz9yYJ;
	Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6332F8B76C;
	Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kZjxaA0XkgDf; Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 203C48B763;
	Fri, 18 Aug 2023 09:55:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37I7tVsv044178
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 09:55:31 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37I7tT6e044167;
	Fri, 18 Aug 2023 09:55:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] dma-mapping, powerpc: Move arch_dma_set_mask() prototype into dma-map-ops.h
Date: Fri, 18 Aug 2023 09:55:13 +0200
Message-ID: <008c4b0a118d37abac6b1ec89b5677b1c6e347ae.1692345210.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692345312; l=2113; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y8eR5MYIcGQkcPhwL0fVutBBQ/r7VCI5rheBSQoEqXk=; b=XO0T0FdUaUCymsyFZIYpYhC/EYUO1TDuNQGEqyGRodx/ilSA1rtSQB+c2Ub6Pu5R7Xe6/jM+2 QNCruSdjUmcDFBaAS5JI25U06C5tlzYtRASAOEhqv8mPbApsymhu4dx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Arnd Bergmann <arnd@arndb.de>, iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To fix the following error,

  CC      arch/powerpc/kernel/dma-mask.o
arch/powerpc/kernel/dma-mask.c:7:6: error: no previous prototype for 'arch_dma_set_mask' [-Werror=missing-prototypes]
    7 | void arch_dma_set_mask(struct device *dev, u64 dma_mask)
      |      ^~~~~~~~~~~~~~~~~

Move arch_dma_set_mask() definition into dma-map-ops.h and
include it in arch/powerpc/kernel/dma-mask.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/dma-mask.c | 1 +
 include/linux/dma-map-ops.h    | 6 ++++++
 kernel/dma/mapping.c           | 6 ------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/dma-mask.c b/arch/powerpc/kernel/dma-mask.c
index ffbbbc432612..5b07ca7b73aa 100644
--- a/arch/powerpc/kernel/dma-mask.c
+++ b/arch/powerpc/kernel/dma-mask.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <asm/machdep.h>
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 9bf19b5bf755..6bca67e21bc1 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -509,4 +509,10 @@ pci_p2pdma_map_segment(struct pci_p2pdma_map_state *state, struct device *dev,
 }
 #endif /* CONFIG_PCI_P2PDMA */
 
+#ifdef CONFIG_ARCH_HAS_DMA_SET_MASK
+void arch_dma_set_mask(struct device *dev, u64 mask);
+#else
+#define arch_dma_set_mask(dev, mask)	do { } while (0)
+#endif
+
 #endif /* _LINUX_DMA_MAP_OPS_H */
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9a4db5cce600..e323ca48f7f2 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -760,12 +760,6 @@ bool dma_pci_p2pdma_supported(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dma_pci_p2pdma_supported);
 
-#ifdef CONFIG_ARCH_HAS_DMA_SET_MASK
-void arch_dma_set_mask(struct device *dev, u64 mask);
-#else
-#define arch_dma_set_mask(dev, mask)	do { } while (0)
-#endif
-
 int dma_set_mask(struct device *dev, u64 mask)
 {
 	/*
-- 
2.41.0

