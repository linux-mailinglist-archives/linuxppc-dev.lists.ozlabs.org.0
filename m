Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5472E7BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYHN3NbCz3c09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 546 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 02:02:02 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYGL6XB1z30Ln
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:02:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD5CA62F3E;
	Tue, 13 Jun 2023 15:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6635C433F1;
	Tue, 13 Jun 2023 15:52:50 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] powerpc: Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Date: Tue, 13 Jun 2023 16:52:43 +0100
Message-Id: <20230613155245.1228274-2-catalin.marinas@arm.com>
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, kernel test robot <lkp@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc architecture defines ARCH_DMA_MINALIGN in asm/page_32.h and
only if CONFIG_NOT_COHERENT_CACHE is enabled (32-bit platforms only).
Move this macro to asm/cache.h to allow a generic ARCH_DMA_MINALIGN
definition in linux/cache.h without redefine errors/warnings.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306131053.1ybvRRhO-lkp@intel.com/
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/cache.h   | 4 ++++
 arch/powerpc/include/asm/page_32.h | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index ae0a68a838e8..69232231d270 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -33,6 +33,10 @@
 
 #define IFETCH_ALIGN_BYTES	(1 << IFETCH_ALIGN_SHIFT)
 
+#ifdef CONFIG_NOT_COHERENT_CACHE
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+#endif
+
 #if !defined(__ASSEMBLY__)
 #ifdef CONFIG_PPC64
 
diff --git a/arch/powerpc/include/asm/page_32.h b/arch/powerpc/include/asm/page_32.h
index 56f217606327..b9ac9e3a771c 100644
--- a/arch/powerpc/include/asm/page_32.h
+++ b/arch/powerpc/include/asm/page_32.h
@@ -12,10 +12,6 @@
 
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_DEFAULT_FLAGS32
 
-#ifdef CONFIG_NOT_COHERENT_CACHE
-#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
-#endif
-
 #if defined(CONFIG_PPC_256K_PAGES) || \
     (defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES))
 #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2 - 2)	/* 1/4 of a page */
