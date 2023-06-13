Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7FE72E7BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYHv6Mmrz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYGM4nN1z30Ln
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:02:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 950DD637F3;
	Tue, 13 Jun 2023 15:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F14CC433F0;
	Tue, 13 Jun 2023 15:52:56 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] sh: Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Date: Tue, 13 Jun 2023 16:52:45 +0100
Message-Id: <20230613155245.1228274-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613155245.1228274-1-catalin.marinas@arm.com>
References: <20230613155245.1228274-1-catalin.marinas@arm.com>
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sh architecture defines ARCH_DMA_MINALIGN in asm/page.h. Move it to
asm/cache.h to allow a generic ARCH_DMA_MINALIGN definition in
linux/cache.h without redefine errors/warnings.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org
---
 arch/sh/include/asm/cache.h | 6 ++++++
 arch/sh/include/asm/page.h  | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/cache.h b/arch/sh/include/asm/cache.h
index 32dfa6b82ec6..b38dbc975581 100644
--- a/arch/sh/include/asm/cache.h
+++ b/arch/sh/include/asm/cache.h
@@ -14,6 +14,12 @@
 
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
+/*
+ * Some drivers need to perform DMA into kmalloc'ed buffers
+ * and so we have to increase the kmalloc minalign for this.
+ */
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+
 #define __read_mostly __section(".data..read_mostly")
 
 #ifndef __ASSEMBLY__
diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
index 09ac6c7faee0..62f4b9edcb98 100644
--- a/arch/sh/include/asm/page.h
+++ b/arch/sh/include/asm/page.h
@@ -174,10 +174,4 @@ typedef struct page *pgtable_t;
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
-/*
- * Some drivers need to perform DMA into kmalloc'ed buffers
- * and so we have to increase the kmalloc minalign for this.
- */
-#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
-
 #endif /* __ASM_SH_PAGE_H */
