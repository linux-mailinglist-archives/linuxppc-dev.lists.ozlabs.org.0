Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC37653CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 14:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G1IXjkAL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBVQ319gWz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 22:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G1IXjkAL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBVP73r9tz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 22:26:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE33B61E52;
	Thu, 27 Jul 2023 12:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C7C433C8;
	Thu, 27 Jul 2023 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690460775;
	bh=27hdkgrWFVckIqtGKwcqckK1Jo4k5q7PyN7ZJPYm1Ek=;
	h=From:To:Cc:Subject:Date:From;
	b=G1IXjkALkleX4HzpP/GBUU4jC0fioQoVwq9nLLdOBjMTiQUNvINgLBZWZSKZRzFjp
	 rPNxwdh576pES6qHQaW63U5RrOmgCMISK0DCvCcjlsS0F0CVfpmd2mvuyHNGB8lByr
	 XJfIsEAigySm7RvZBH/ymFF5ooJ7tHkC+pqepI3potipnIRue/OQfyjH3lK2i9qOGw
	 TTMEdeWmERD7kuxrWK/kHWbcAE8fEIeHPV8VUE7PnNQbqQsatYfsLSU+lZHaTQcLP/
	 OLylrNrJgkBI21vtBnota2Sd4H4ehNblQw5px/x0jcXDNPZjKeeOP3wcFTuPwxCxgM
	 gQtvCfdH30sSw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] dma-mapping: move arch_dma_set_mask() declaration to header
Date: Thu, 27 Jul 2023 14:25:42 +0200
Message-Id: <20230727122608.2507415-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

This function has a __weak definition and an override that is only used on
freescale powerpc chips. The powerpc definition however does not see the
declaration that is in a .c file:

arch/powerpc/kernel/dma-mask.c:7:6: error: no previous prototype for 'arch_dma_set_mask' [-Werror=missing-prototypes]

Move it into the linux/dma-map-ops.h header where the other arch_dma_* functions
are declared.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/dma-mask.c | 1 +
 include/linux/dma-map-ops.h    | 6 ++++++
 kernel/dma/mapping.c           | 6 ------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/dma-mask.c b/arch/powerpc/kernel/dma-mask.c
index ffbbbc4326126..5b07ca7b73aac 100644
--- a/arch/powerpc/kernel/dma-mask.c
+++ b/arch/powerpc/kernel/dma-mask.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <asm/machdep.h>
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 9bf19b5bf7559..bb5e06fd359d5 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -343,6 +343,12 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_addr, unsigned long attrs);
 
+#ifdef CONFIG_ARCH_HAS_DMA_SET_MASK
+void arch_dma_set_mask(struct device *dev, u64 mask);
+#else
+#define arch_dma_set_mask(dev, mask)	do { } while (0)
+#endif
+
 #ifdef CONFIG_MMU
 /*
  * Page protection so that devices that can't snoop CPU caches can use the
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9a4db5cce6004..e323ca48f7f2a 100644
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
2.39.2

