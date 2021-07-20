Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDCB3CF9B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 14:36:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTdW359j4z3br7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 22:36:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsWzOQWg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IsWzOQWg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTdV8297Qz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 22:35:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5F6E61186;
 Tue, 20 Jul 2021 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626784542;
 bh=F9par1LOdZWcaYEp+Fsm6nACHy0sgpjKC7cEQSSN6Kk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IsWzOQWgeCT1AYKwtELp1TXCDgnOLCVvxD7X75XcFQe5PScLYsCySiEhWrWsNzIFy
 NU1eCxY9+EtVnyEeY8mYhtZYNtWKq6pwEnYIuUmhq+Xra94KKBJJODpnH81/4MF4Pl
 7uyzd4SqeuJM8/Gemg06n3sL8LVi+LGWAdi3y+rn3xvIoCxR4j6ia9WzfgB8kl+oM5
 2ykDSrOi/oG3+IA+5TyQEfXk1QR+3NhmU29GozMF0aqkga4B/tubtAa6SESVqo3Yru
 cEZWb51tqxOvMK7ctZtnfU8yKwalKFMh4knEqIyj+OBhWfD/KGtJxAT0MoPOPtTKR0
 ibGilJFyngZYg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Revert "powerpc/8xx: add support for huge pages on VMAP
 and VMALLOC"
Date: Tue, 20 Jul 2021 13:35:11 +0100
Message-Id: <20210720123512.8740-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210720123512.8740-1-will@kernel.org>
References: <20210720123512.8740-1-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Marek <jonathan@marek.ca>,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit a6a8f7c4aa7eb50304b5c4e68eccd24313f3a785.

Commit c742199a014d ("mm/pgtable: add stubs for
{pmd/pub}_{set/clear}_huge") breaks the boot for arm64 when block
mappings are used to create the linear map, as this relies on a working
implementation of pXd_set_huge() even if the corresponding page-table
levels have been folded.

Although the problematic patch reverts cleanly, doing so breaks the
build for 32-bit PowerPC 8xx machines, which rely on the default
function definitions when the corresponding page-table levels are
folded:

 | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pud_range':
 | linux/mm/vmalloc.c:362: undefined reference to `pud_clear_huge'
 | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pmd_range':
 | linux/mm/vmalloc.c:337: undefined reference to `pmd_clear_huge'
 | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pud_range':
 | linux/mm/vmalloc.c:362: undefined reference to `pud_clear_huge'
 | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pmd_range':
 | linux/mm/vmalloc.c:337: undefined reference to `pmd_clear_huge'
 | make: *** [Makefile:1177: vmlinux] Error 1

Although Christophe has kindly offered to look into the arm64 breakage,
he's on holiday for another 10 days and there isn't an obvious fix on
the arm64 side which allows us to continue using huge-vmap for affected
configurations.

In the interest of quickly getting things back to a working state as
they were in 5.13, revert the huge-vmap changes for PowerPC 8xx prior to
reverting the change which breaks arm64. We can then work on this
together for 5.15 once Christophe is back.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20210719170615.Horde.Qio1wp3k5ebLo-d9xXHdOg1@messagerie.c-s.fr
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 43 --------------------
 2 files changed, 1 insertion(+), 44 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d01e3401581d..5fc19ac62cb9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -189,7 +189,7 @@ config PPC
 	select GENERIC_VDSO_TIME_NS
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
-	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
+	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 997cec973406..6e4faa0a9b35 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -178,7 +178,6 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/mmdebug.h>
-#include <linux/sizes.h>
 
 void mmu_pin_tlb(unsigned long top, bool readonly);
 
@@ -226,48 +225,6 @@ static inline unsigned int mmu_psize_to_shift(unsigned int mmu_psize)
 	BUG();
 }
 
-static inline bool arch_vmap_try_size(unsigned long addr, unsigned long end, u64 pfn,
-				      unsigned int max_page_shift, unsigned long size)
-{
-	if (end - addr < size)
-		return false;
-
-	if ((1UL << max_page_shift) < size)
-		return false;
-
-	if (!IS_ALIGNED(addr, size))
-		return false;
-
-	if (!IS_ALIGNED(PFN_PHYS(pfn), size))
-		return false;
-
-	return true;
-}
-
-static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
-							 u64 pfn, unsigned int max_page_shift)
-{
-	if (arch_vmap_try_size(addr, end, pfn, max_page_shift, SZ_512K))
-		return SZ_512K;
-	if (PAGE_SIZE == SZ_16K)
-		return SZ_16K;
-	if (arch_vmap_try_size(addr, end, pfn, max_page_shift, SZ_16K))
-		return SZ_16K;
-	return PAGE_SIZE;
-}
-#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
-
-static inline int arch_vmap_pte_supported_shift(unsigned long size)
-{
-	if (size >= SZ_512K)
-		return 19;
-	else if (size >= SZ_16K)
-		return 14;
-	else
-		return PAGE_SHIFT;
-}
-#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
-
 /* patch sites */
 extern s32 patch__itlbmiss_exit_1, patch__dtlbmiss_exit_1;
 extern s32 patch__itlbmiss_perf, patch__dtlbmiss_perf;
-- 
2.32.0.402.g57bb445576-goog

