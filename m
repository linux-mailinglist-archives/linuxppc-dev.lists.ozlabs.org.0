Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33B84FF9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:34:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463bCW1sjyzDqHX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:34:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ecabc3e5d1f7686a0adb+5827+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="iOmJJbCI"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Zd70LXlzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 01:08:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YtHsude1BtKUvKeAIOmPUNdT3dzZ/aol3UUJ65Tl92I=; b=iOmJJbCI42gvEYVaX/vrNexdq
 JIPgEV1fXxwfPprQZbpc7n7S+0J0au5VSfoNA7fyDiF4STJyeGnMFhr9fvRt/WGDtAtjZtOA07c+e
 sWCidm3rhUzjDD0NDf68aCYpNg6skiJ7sNmUF2ECWXW/3TeknjNerhB4JB66HYNlPRf4q48k4dpXd
 GBFWOTcDkjemw/tisnicazyN1wPe/ppeFG60wo94hAsptupehTNCqx2RtHskDi9c1XpMIIbMrWnD7
 oVQD6l9cEzXYawLH7NP2EJx4NI4lDmukxRRKoOYYVwDqCzQv6SabaW3Q5DClngPfrUg7DxGoqxvIn
 3ZakknADQ==;
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvNXe-0002xa-41; Wed, 07 Aug 2019 15:07:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: benh@kernel.crashing.org,
	paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc: use <asm-generic/dma-mapping.h>
Date: Wed,  7 Aug 2019 18:07:52 +0300
Message-Id: <20190807150752.17894-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc version of dma-mapping.h only contains a version of
get_arch_dma_ops that always return NULL.  Replace it with the
asm-generic version that does the same.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/Kbuild        |  1 +
 arch/powerpc/include/asm/dma-mapping.h | 18 ------------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/dma-mapping.h

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index 9a1d2fc6ceb7..15bb09ad5dc2 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -4,6 +4,7 @@ generated-y += syscall_table_64.h
 generated-y += syscall_table_c32.h
 generated-y += syscall_table_spu.h
 generic-y += div64.h
+generic-y += dma-mapping.h
 generic-y += export.h
 generic-y += irq_regs.h
 generic-y += local64.h
diff --git a/arch/powerpc/include/asm/dma-mapping.h b/arch/powerpc/include/asm/dma-mapping.h
deleted file mode 100644
index 565d6f74b189..000000000000
--- a/arch/powerpc/include/asm/dma-mapping.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2004 IBM
- */
-#ifndef _ASM_DMA_MAPPING_H
-#define _ASM_DMA_MAPPING_H
-
-static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
-{
-	/* We don't handle the NULL dev case for ISA for now. We could
-	 * do it via an out of line call but it is not needed for now. The
-	 * only ISA DMA device we support is the floppy and we have a hack
-	 * in the floppy driver directly to get a device for us.
-	 */
-	return NULL;
-}
-
-#endif	/* _ASM_DMA_MAPPING_H */
-- 
2.20.1

