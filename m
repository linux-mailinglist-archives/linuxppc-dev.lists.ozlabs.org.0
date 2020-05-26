Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AC1CDAD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 15:10:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LLsX5SkVzDqNG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 23:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJXQ1TXtzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJXD4kR8z9ty3l;
 Mon, 11 May 2020 13:25:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eVFjLGWLZzlf; Mon, 11 May 2020 13:25:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJXD3zHGz9ty3g;
 Mon, 11 May 2020 13:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DD1B8B7AE;
 Mon, 11 May 2020 13:25:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HvsRdz-JOdz6; Mon, 11 May 2020 13:25:55 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F140C8B7AD;
 Mon, 11 May 2020 13:25:54 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D5E1B65A09; Mon, 11 May 2020 11:25:54 +0000 (UTC)
Message-Id: <e334b1d870b859fde677988813c5d5c9c72d6907.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 28/45] powerpc/8xx: MM_SLICE is not needed anymore
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:54 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the 8xx now manages 512k pages in standard page tables,
it doesn't need CONFIG_PPC_MM_SLICES anymore.

Don't select it anymore and remove all related code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 64 --------------------
 arch/powerpc/include/asm/nohash/32/slice.h   | 20 ------
 arch/powerpc/include/asm/slice.h             |  2 -
 arch/powerpc/platforms/Kconfig.cputype       |  1 -
 4 files changed, 87 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/nohash/32/slice.h

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 26b7cee34dfe..a092e6434bda 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -176,12 +176,6 @@
  */
 #define SPRN_M_TW	799
 
-#ifdef CONFIG_PPC_MM_SLICES
-#include <asm/nohash/32/slice.h>
-#define SLICE_ARRAY_SIZE	(1 << (32 - SLICE_LOW_SHIFT - 1))
-#define LOW_SLICE_ARRAY_SZ	SLICE_ARRAY_SIZE
-#endif
-
 #if defined(CONFIG_PPC_4K_PAGES)
 #define mmu_virtual_psize	MMU_PAGE_4K
 #elif defined(CONFIG_PPC_16K_PAGES)
@@ -199,71 +193,13 @@
 
 #include <linux/mmdebug.h>
 
-struct slice_mask {
-	u64 low_slices;
-	DECLARE_BITMAP(high_slices, 0);
-};
-
 typedef struct {
 	unsigned int id;
 	unsigned int active;
 	unsigned long vdso_base;
-#ifdef CONFIG_PPC_MM_SLICES
-	u16 user_psize;		/* page size index */
-	unsigned char low_slices_psize[SLICE_ARRAY_SIZE];
-	unsigned char high_slices_psize[0];
-	unsigned long slb_addr_limit;
-	struct slice_mask mask_base_psize; /* 4k or 16k */
-	struct slice_mask mask_512k;
-	struct slice_mask mask_8m;
-#endif
 	void *pte_frag;
 } mm_context_t;
 
-#ifdef CONFIG_PPC_MM_SLICES
-static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
-{
-	return ctx->user_psize;
-}
-
-static inline void mm_ctx_set_user_psize(mm_context_t *ctx, u16 user_psize)
-{
-	ctx->user_psize = user_psize;
-}
-
-static inline unsigned char *mm_ctx_low_slices(mm_context_t *ctx)
-{
-	return ctx->low_slices_psize;
-}
-
-static inline unsigned char *mm_ctx_high_slices(mm_context_t *ctx)
-{
-	return ctx->high_slices_psize;
-}
-
-static inline unsigned long mm_ctx_slb_addr_limit(mm_context_t *ctx)
-{
-	return ctx->slb_addr_limit;
-}
-
-static inline void mm_ctx_set_slb_addr_limit(mm_context_t *ctx, unsigned long limit)
-{
-	ctx->slb_addr_limit = limit;
-}
-
-static inline struct slice_mask *slice_mask_for_size(mm_context_t *ctx, int psize)
-{
-	if (psize == MMU_PAGE_512K)
-		return &ctx->mask_512k;
-	if (psize == MMU_PAGE_8M)
-		return &ctx->mask_8m;
-
-	BUG_ON(psize != mmu_virtual_psize);
-
-	return &ctx->mask_base_psize;
-}
-#endif /* CONFIG_PPC_MM_SLICE */
-
 #define PHYS_IMMR_BASE (mfspr(SPRN_IMMR) & 0xfff80000)
 #define VIRT_IMMR_BASE (__fix_to_virt(FIX_IMMR_BASE))
 
diff --git a/arch/powerpc/include/asm/nohash/32/slice.h b/arch/powerpc/include/asm/nohash/32/slice.h
deleted file mode 100644
index 39eb0154ae2d..000000000000
--- a/arch/powerpc/include/asm/nohash/32/slice.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_NOHASH_32_SLICE_H
-#define _ASM_POWERPC_NOHASH_32_SLICE_H
-
-#ifdef CONFIG_PPC_MM_SLICES
-
-#define SLICE_LOW_SHIFT		26	/* 64 slices */
-#define SLICE_LOW_TOP		(0x100000000ull)
-#define SLICE_NUM_LOW		(SLICE_LOW_TOP >> SLICE_LOW_SHIFT)
-#define GET_LOW_SLICE_INDEX(addr)	((addr) >> SLICE_LOW_SHIFT)
-
-#define SLICE_HIGH_SHIFT	0
-#define SLICE_NUM_HIGH		0ul
-#define GET_HIGH_SLICE_INDEX(addr)	(addr & 0)
-
-#define SLB_ADDR_LIMIT_DEFAULT	DEFAULT_MAP_WINDOW
-
-#endif /* CONFIG_PPC_MM_SLICES */
-
-#endif /* _ASM_POWERPC_NOHASH_32_SLICE_H */
diff --git a/arch/powerpc/include/asm/slice.h b/arch/powerpc/include/asm/slice.h
index c6f466f4c241..0bdd9c62eca0 100644
--- a/arch/powerpc/include/asm/slice.h
+++ b/arch/powerpc/include/asm/slice.h
@@ -4,8 +4,6 @@
 
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/slice.h>
-#elif defined(CONFIG_PPC_MMU_NOHASH_32)
-#include <asm/nohash/32/slice.h>
 #endif
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 27a81c291be8..5774a55a9c58 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -55,7 +55,6 @@ config PPC_8xx
 	select SYS_SUPPORTS_HUGETLBFS
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
-	select PPC_MM_SLICES if HUGETLB_PAGE
 	select HAVE_ARCH_VMAP_STACK
 
 config 40x
-- 
2.25.0

