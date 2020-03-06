Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CF17B6E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 07:41:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YdLm4wQqzDr02
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 17:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YdJ01VJ3zDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 17:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=QoURegP1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48YdHx3gnXz9sPK;
 Fri,  6 Mar 2020 17:39:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1583476750;
 bh=uVn6BtSQTkQ6V/W2KpOOF/4sByJ/Xje+tmClUhEcEQA=;
 h=Date:From:To:Cc:Subject:From;
 b=QoURegP1P+6ngYIPMON+pOyEyFtsSBcLCIF7Yo2eVjIagU89dDqvAfIMfUiEMLQWp
 y8mck6A7pcQuxLUr6wIRXcSs40mejSWRUwrgKjhdDfaoxSAZWon1BE4g2JHz0Bxjj6
 qnNfGRPBJBBe+ra3MtfJgfT5fCh9cThQ8kn/H8xt6LKZgKelVtuyrT/vgzraenl7gf
 aBi91jWSbCNu1jlfPo4BPDngRFk1Fz8SxA0T2TXHA+VI23sH2FuIrqaQBwCvZFp8Mw
 VSW/qwqkwSL3Dzq5dUMFBCuWI+iEPIFy2i9cNnX51S8HgDkRk9pUm4G8fWJinFA0r1
 FSvuQVTBw3CnA==
Date: Fri, 6 Mar 2020 17:39:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm tree with the powerpc tree
Message-ID: <20200306173908.770adcaa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CYjuyYbEL502TpSEoe7ie/M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/CYjuyYbEL502TpSEoe7ie/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  arch/powerpc/mm/book3s32/mmu.c
  arch/powerpc/mm/book3s32/tlb.c
  arch/powerpc/mm/kasan/kasan_init_32.c
  arch/powerpc/mm/mem.c
  arch/powerpc/mm/nohash/40x.c
  arch/powerpc/mm/pgtable_32.c

between commits:

  0b1c524caaae ("powerpc/32: refactor pmd_offset(pud_offset(pgd_offset...")
  2efc7c085f05 ("powerpc/32: drop get_pteptr()")

from the powerpc tree and patch:

  "powerpc: add support for folded p4d page tables"

from the akpm tree.

I fixed it up (all the files above no longer need modifiying, and the
extra patch is below) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/powerpc/mm/book3s32/mmu.c
index 39ba53ca5bb5,edef17c97206..000000000000
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
diff --cc arch/powerpc/mm/book3s32/tlb.c
index dc9039a170aa,175bc33b41b7..000000000000
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
diff --cc arch/powerpc/mm/kasan/kasan_init_32.c
index f19526e7d3dc,88e2e16380b5..000000000000
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
diff --cc arch/powerpc/mm/mem.c
index 9b4f5fb719e0,8262b384dcf3..000000000000
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
diff --cc arch/powerpc/mm/nohash/40x.c
index 82862723ab42,7aaf7155e350..000000000000
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
diff --cc arch/powerpc/mm/pgtable_32.c
index f62de06e3d07,5774d4bc94d0..000000000000
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/=
pgtable.h
index df7f63d37b74..74f890d6218c 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -44,12 +44,12 @@ struct mm_struct;
 #ifdef CONFIG_PPC32
 static inline pmd_t *pmd_ptr(struct mm_struct *mm, unsigned long va)
 {
-	return pmd_offset(pud_offset(pgd_offset(mm, va), va), va);
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va) , va), va=
);
 }
=20
 static inline pmd_t *pmd_ptr_k(unsigned long va)
 {
-	return pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va) , va), va);
 }
=20
 static inline pte_t *virt_to_kpte(unsigned long vaddr)

--=20
Cheers,
Stephen Rothwell

Just to be clear, below is the new version of "powerpc: add support for
folded p4d page tables" (I am not sure it is completely correct, but
ppc64_defconfig, 32 and 64 bit allnoconfig, allyesconfig,
ppc44x_defconfig and pseries_le_defconfig all build without new
warnings):

From: Mike Rapoport <rppt@linux.ibm.com>
Date: Wed, 4 Mar 2020 22:32:05 +1100
Subject: [PATCH] powerpc: add support for folded p4d page tables

Implement primitives necessary for the 4th level folding, add walks of p4d
level where appropriate and replace 5level-fixup.h with pgtable-nop4d.h.

Link: http://lkml.kernel.org/r/20200227084608.18223-9-rppt@kernel.org
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>	[8xx and 83xx]
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: James Morse <james.morse@arm.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Julien Thierry <julien.thierry.kdev@gmail.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rich Felker <dalias@libc.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Stephen Rothwell<sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h  |  1 -
 arch/powerpc/include/asm/book3s/64/hash.h     |  4 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h  |  4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 60 ++++++++++---------
 arch/powerpc/include/asm/book3s/64/radix.h    |  6 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  1 -
 arch/powerpc/include/asm/nohash/64/pgalloc.h  |  2 +-
 .../include/asm/nohash/64/pgtable-4k.h        | 32 +++++-----
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  6 +-
 arch/powerpc/include/asm/pgtable.h            | 10 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c        | 30 ++++++----
 arch/powerpc/lib/code-patching.c              |  7 ++-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 26 +++++---
 arch/powerpc/mm/book3s64/subpage_prot.c       |  6 +-
 arch/powerpc/mm/hugetlbpage.c                 | 28 +++++----
 arch/powerpc/mm/nohash/book3e_pgtable.c       | 15 ++---
 arch/powerpc/mm/pgtable.c                     | 30 ++++++----
 arch/powerpc/mm/pgtable_64.c                  | 10 ++--
 arch/powerpc/mm/ptdump/hashpagetable.c        | 20 ++++++-
 arch/powerpc/mm/ptdump/ptdump.c               | 14 +++--
 arch/powerpc/xmon/xmon.c                      | 18 +++---
 22 files changed, 196 insertions(+), 138 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/32/pgtable.h
index 7549393c4c43..6052b72216a6 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_PGTABLE_H
 #define _ASM_POWERPC_BOOK3S_32_PGTABLE_H
=20
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
=20
 #include <asm/book3s/32/hash.h>
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inclu=
de/asm/book3s/64/hash.h
index 2781ebf6add4..876d1528c2cf 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -134,9 +134,9 @@ static inline int get_region_id(unsigned long ea)
=20
 #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
 #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)
-static inline int hash__pgd_bad(pgd_t pgd)
+static inline int hash__p4d_bad(p4d_t p4d)
 {
-	return (pgd_val(pgd) =3D=3D 0);
+	return (p4d_val(p4d) =3D=3D 0);
 }
 #ifdef CONFIG_STRICT_KERNEL_RWX
 extern void hash__mark_rodata_ro(void);
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/in=
clude/asm/book3s/64/pgalloc.h
index a41e91bd0580..69c5b051734f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -85,9 +85,9 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *=
pgd)
 	kmem_cache_free(PGT_CACHE(PGD_INDEX_SIZE), pgd);
 }
=20
-static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pud_t *p=
ud)
+static inline void p4d_populate(struct mm_struct *mm, p4d_t *pgd, pud_t *p=
ud)
 {
-	*pgd =3D  __pgd(__pgtable_ptr_val(pud) | PGD_VAL_BITS);
+	*pgd =3D  __p4d(__pgtable_ptr_val(pud) | PGD_VAL_BITS);
 }
=20
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long add=
r)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index 201a69e6a355..fa60e8594b9f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
 #define _ASM_POWERPC_BOOK3S_64_PGTABLE_H_
=20
-#include <asm-generic/5level-fixup.h>
+#include <asm-generic/pgtable-nop4d.h>
=20
 #ifndef __ASSEMBLY__
 #include <linux/mmdebug.h>
@@ -251,7 +251,7 @@ extern unsigned long __pmd_frag_size_shift;
 /* Bits to mask out from a PUD to get to the PMD page */
 #define PUD_MASKED_BITS		0xc0000000000000ffUL
 /* Bits to mask out from a PGD to get to the PUD page */
-#define PGD_MASKED_BITS		0xc0000000000000ffUL
+#define P4D_MASKED_BITS		0xc0000000000000ffUL
=20
 /*
  * Used as an indicator for rcu callback functions
@@ -949,54 +949,60 @@ static inline bool pud_access_permitted(pud_t pud, bo=
ol write)
 	return pte_access_permitted(pud_pte(pud), write);
 }
=20
-#define pgd_write(pgd)		pte_write(pgd_pte(pgd))
+#define __p4d_raw(x)	((p4d_t) { __pgd_raw(x) })
+static inline __be64 p4d_raw(p4d_t x)
+{
+	return pgd_raw(x.pgd);
+}
+
+#define p4d_write(p4d)		pte_write(p4d_pte(p4d))
=20
-static inline void pgd_clear(pgd_t *pgdp)
+static inline void p4d_clear(p4d_t *p4dp)
 {
-	*pgdp =3D __pgd(0);
+	*p4dp =3D __p4d(0);
 }
=20
-static inline int pgd_none(pgd_t pgd)
+static inline int p4d_none(p4d_t p4d)
 {
-	return !pgd_raw(pgd);
+	return !p4d_raw(p4d);
 }
=20
-static inline int pgd_present(pgd_t pgd)
+static inline int p4d_present(p4d_t p4d)
 {
-	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PRESENT));
+	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PRESENT));
 }
=20
-static inline pte_t pgd_pte(pgd_t pgd)
+static inline pte_t p4d_pte(p4d_t p4d)
 {
-	return __pte_raw(pgd_raw(pgd));
+	return __pte_raw(p4d_raw(p4d));
 }
=20
-static inline pgd_t pte_pgd(pte_t pte)
+static inline p4d_t pte_p4d(pte_t pte)
 {
-	return __pgd_raw(pte_raw(pte));
+	return __p4d_raw(pte_raw(pte));
 }
=20
-static inline int pgd_bad(pgd_t pgd)
+static inline int p4d_bad(p4d_t p4d)
 {
 	if (radix_enabled())
-		return radix__pgd_bad(pgd);
-	return hash__pgd_bad(pgd);
+		return radix__p4d_bad(p4d);
+	return hash__p4d_bad(p4d);
 }
=20
-#define pgd_access_permitted pgd_access_permitted
-static inline bool pgd_access_permitted(pgd_t pgd, bool write)
+#define p4d_access_permitted p4d_access_permitted
+static inline bool p4d_access_permitted(p4d_t p4d, bool write)
 {
-	return pte_access_permitted(pgd_pte(pgd), write);
+	return pte_access_permitted(p4d_pte(p4d), write);
 }
=20
-extern struct page *pgd_page(pgd_t pgd);
+extern struct page *p4d_page(p4d_t p4d);
=20
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
=20
 #define pmd_page_vaddr(pmd)	__va(pmd_val(pmd) & ~PMD_MASKED_BITS)
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
-#define pgd_page_vaddr(pgd)	__va(pgd_val(pgd) & ~PGD_MASKED_BITS)
+#define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
=20
 #define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD -=
 1))
 #define pud_index(address) (((address) >> (PUD_SHIFT)) & (PTRS_PER_PUD - 1=
))
@@ -1010,8 +1016,8 @@ extern struct page *pgd_page(pgd_t pgd);
=20
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
=20
-#define pud_offset(pgdp, addr)	\
-	(((pud_t *) pgd_page_vaddr(*(pgdp))) + pud_index(addr))
+#define pud_offset(p4dp, addr)	\
+	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
 #define pmd_offset(pudp,addr) \
 	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
 #define pte_offset_kernel(dir,addr) \
@@ -1368,11 +1374,11 @@ static inline bool pud_is_leaf(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
=20
-#define pgd_is_leaf pgd_is_leaf
-#define pgd_leaf pgd_is_leaf
-static inline bool pgd_is_leaf(pgd_t pgd)
+#define p4d_is_leaf p4d_is_leaf
+#define p4d_leaf p4d_is_leaf
+static inline bool p4d_is_leaf(p4d_t p4d)
 {
-	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
+	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PTE));
 }
=20
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/incl=
ude/asm/book3s/64/radix.h
index d97db3ad9aae..9bca2ac64220 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -30,7 +30,7 @@
 /* Don't have anything in the reserved bits and leaf bits */
 #define RADIX_PMD_BAD_BITS		0x60000000000000e0UL
 #define RADIX_PUD_BAD_BITS		0x60000000000000e0UL
-#define RADIX_PGD_BAD_BITS		0x60000000000000e0UL
+#define RADIX_P4D_BAD_BITS		0x60000000000000e0UL
=20
 #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
 #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
@@ -227,9 +227,9 @@ static inline int radix__pud_bad(pud_t pud)
 }
=20
=20
-static inline int radix__pgd_bad(pgd_t pgd)
+static inline int radix__p4d_bad(p4d_t p4d)
 {
-	return !!(pgd_val(pgd) & RADIX_PGD_BAD_BITS);
+	return !!(p4d_val(p4d) & RADIX_P4D_BAD_BITS);
 }
=20
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index b04ba257fddb..3d0bc99dd520 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_POWERPC_NOHASH_32_PGTABLE_H
 #define _ASM_POWERPC_NOHASH_32_PGTABLE_H
=20
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
=20
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/include/asm/nohash/64/pgalloc.h b/arch/powerpc/in=
clude/asm/nohash/64/pgalloc.h
index b9534a793293..668aee6017e7 100644
--- a/arch/powerpc/include/asm/nohash/64/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/64/pgalloc.h
@@ -15,7 +15,7 @@ struct vmemmap_backing {
 };
 extern struct vmemmap_backing *vmemmap_list;
=20
-#define pgd_populate(MM, PGD, PUD)	pgd_set(PGD, (unsigned long)PUD)
+#define p4d_populate(MM, P4D, PUD)	p4d_set(P4D, (unsigned long)PUD)
=20
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long add=
r)
 {
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h b/arch/powerpc=
/include/asm/nohash/64/pgtable-4k.h
index c40ec32b8194..81b1c54e3cf1 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_NOHASH_64_PGTABLE_4K_H
 #define _ASM_POWERPC_NOHASH_64_PGTABLE_4K_H
=20
-#include <asm-generic/5level-fixup.h>
+#include <asm-generic/pgtable-nop4d.h>
=20
 /*
  * Entries per page directory level.  The PTE level must use a 64b record
@@ -45,41 +45,41 @@
 #define PMD_MASKED_BITS		0
 /* Bits to mask out from a PUD to get to the PMD page */
 #define PUD_MASKED_BITS		0
-/* Bits to mask out from a PGD to get to the PUD page */
-#define PGD_MASKED_BITS		0
+/* Bits to mask out from a P4D to get to the PUD page */
+#define P4D_MASKED_BITS		0
=20
=20
 /*
  * 4-level page tables related bits
  */
=20
-#define pgd_none(pgd)		(!pgd_val(pgd))
-#define pgd_bad(pgd)		(pgd_val(pgd) =3D=3D 0)
-#define pgd_present(pgd)	(pgd_val(pgd) !=3D 0)
-#define pgd_page_vaddr(pgd)	(pgd_val(pgd) & ~PGD_MASKED_BITS)
+#define p4d_none(p4d)		(!p4d_val(p4d))
+#define p4d_bad(p4d)		(p4d_val(p4d) =3D=3D 0)
+#define p4d_present(p4d)	(p4d_val(p4d) !=3D 0)
+#define p4d_page_vaddr(p4d)	(p4d_val(p4d) & ~P4D_MASKED_BITS)
=20
 #ifndef __ASSEMBLY__
=20
-static inline void pgd_clear(pgd_t *pgdp)
+static inline void p4d_clear(p4d_t *p4dp)
 {
-	*pgdp =3D __pgd(0);
+	*p4dp =3D __p4d(0);
 }
=20
-static inline pte_t pgd_pte(pgd_t pgd)
+static inline pte_t p4d_pte(p4d_t p4d)
 {
-	return __pte(pgd_val(pgd));
+	return __pte(p4d_val(p4d));
 }
=20
-static inline pgd_t pte_pgd(pte_t pte)
+static inline p4d_t pte_p4d(pte_t pte)
 {
-	return __pgd(pte_val(pte));
+	return __p4d(pte_val(pte));
 }
-extern struct page *pgd_page(pgd_t pgd);
+extern struct page *p4d_page(p4d_t p4d);
=20
 #endif /* !__ASSEMBLY__ */
=20
-#define pud_offset(pgdp, addr)	\
-  (((pud_t *) pgd_page_vaddr(*(pgdp))) + \
+#define pud_offset(p4dp, addr)	\
+  (((pud_t *) p4d_page_vaddr(*(p4dp))) + \
     (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1)))
=20
 #define pud_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/64/pgtable.h
index 9a33b8bd842d..b360f262b9c6 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -175,11 +175,11 @@ static inline pud_t pte_pud(pte_t pte)
 	return __pud(pte_val(pte));
 }
 #define pud_write(pud)		pte_write(pud_pte(pud))
-#define pgd_write(pgd)		pte_write(pgd_pte(pgd))
+#define p4d_write(pgd)		pte_write(p4d_pte(p4d))
=20
-static inline void pgd_set(pgd_t *pgdp, unsigned long val)
+static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 {
-	*pgdp =3D __pgd(val);
+	*p4dp =3D __p4d(val);
 }
=20
 /*
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/=
pgtable.h
index b80bfd41828d..22c24bfed385 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -44,12 +44,12 @@ struct mm_struct;
 #ifdef CONFIG_PPC32
 static inline pmd_t *pmd_ptr(struct mm_struct *mm, unsigned long va)
 {
-	return pmd_offset(pud_offset(pgd_offset(mm, va), va), va);
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va) , va), va=
);
 }
=20
 static inline pmd_t *pmd_ptr_k(unsigned long va)
 {
-	return pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va) , va), va);
 }
=20
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
@@ -156,9 +156,9 @@ static inline bool pud_is_leaf(pud_t pud)
 }
 #endif
=20
-#ifndef pgd_is_leaf
-#define pgd_is_leaf pgd_is_leaf
-static inline bool pgd_is_leaf(pgd_t pgd)
+#ifndef p4d_is_leaf
+#define p4d_is_leaf p4d_is_leaf
+static inline bool p4d_is_leaf(p4d_t p4d)
 {
 	return false;
 }
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book=
3s_64_mmu_radix.c
index 1d75ed684b53..713aca8cc77e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -499,13 +499,14 @@ void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t=
 *pgd, unsigned int lpid)
 	unsigned long ig;
=20
 	for (ig =3D 0; ig < PTRS_PER_PGD; ++ig, ++pgd) {
+		p4d_t *p4d =3D p4d_offset(pgd, 0);
 		pud_t *pud;
=20
-		if (!pgd_present(*pgd))
+		if (!p4d_present(*p4d))
 			continue;
-		pud =3D pud_offset(pgd, 0);
+		pud =3D pud_offset(p4d, 0);
 		kvmppc_unmap_free_pud(kvm, pud, lpid);
-		pgd_clear(pgd);
+		p4d_clear(p4d);
 	}
 }
=20
@@ -566,6 +567,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, =
pte_t pte,
 		      unsigned long *rmapp, struct rmap_nested **n_rmap)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud, *new_pud =3D NULL;
 	pmd_t *pmd, *new_pmd =3D NULL;
 	pte_t *ptep, *new_ptep =3D NULL;
@@ -573,9 +575,11 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable,=
 pte_t pte,
=20
 	/* Traverse the guest's 2nd-level tree, allocate new levels needed */
 	pgd =3D pgtable + pgd_index(gpa);
+	p4d =3D p4d_offset(pgd, gpa);
+
 	pud =3D NULL;
-	if (pgd_present(*pgd))
-		pud =3D pud_offset(pgd, gpa);
+	if (p4d_present(*p4d))
+		pud =3D pud_offset(p4d, gpa);
 	else
 		new_pud =3D pud_alloc_one(kvm->mm, gpa);
=20
@@ -596,13 +600,13 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable=
, pte_t pte,
=20
 	/* Now traverse again under the lock and change the tree */
 	ret =3D -ENOMEM;
-	if (pgd_none(*pgd)) {
+	if (p4d_none(*p4d)) {
 		if (!new_pud)
 			goto out_unlock;
-		pgd_populate(kvm->mm, pgd, new_pud);
+		p4d_populate(kvm->mm, p4d, new_pud);
 		new_pud =3D NULL;
 	}
-	pud =3D pud_offset(pgd, gpa);
+	pud =3D pud_offset(p4d, gpa);
 	if (pud_is_leaf(*pud)) {
 		unsigned long hgpa =3D gpa & PUD_MASK;
=20
@@ -1220,6 +1224,7 @@ static ssize_t debugfs_radix_read(struct file *file, =
char __user *buf,
 	pgd_t *pgt;
 	struct kvm_nested_guest *nested;
 	pgd_t pgd, *pgdp;
+	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
 	pte_t *ptep;
@@ -1292,13 +1297,14 @@ static ssize_t debugfs_radix_read(struct file *file=
, char __user *buf,
 		}
=20
 		pgdp =3D pgt + pgd_index(gpa);
-		pgd =3D READ_ONCE(*pgdp);
-		if (!(pgd_val(pgd) & _PAGE_PRESENT)) {
-			gpa =3D (gpa & PGDIR_MASK) + PGDIR_SIZE;
+		p4dp =3D p4d_offset(pgdp, gpa);
+		p4d =3D READ_ONCE(*p4dp);
+		if (!(p4d_val(p4d) & _PAGE_PRESENT)) {
+			gpa =3D (gpa & P4D_MASK) + P4D_SIZE;
 			continue;
 		}
=20
-		pudp =3D pud_offset(&pgd, gpa);
+		pudp =3D pud_offset(&p4d, gpa);
 		pud =3D READ_ONCE(*pudp);
 		if (!(pud_val(pud) & _PAGE_PRESENT)) {
 			gpa =3D (gpa & PUD_MASK) + PUD_SIZE;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patch=
ing.c
index 3345f039a876..7a59f6863cec 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -107,13 +107,18 @@ static inline int unmap_patch_area(unsigned long addr)
 	pte_t *ptep;
 	pmd_t *pmdp;
 	pud_t *pudp;
+	p4d_t *p4dp;
 	pgd_t *pgdp;
=20
 	pgdp =3D pgd_offset_k(addr);
 	if (unlikely(!pgdp))
 		return -EINVAL;
=20
-	pudp =3D pud_offset(pgdp, addr);
+	p4dp =3D p4d_offset(pgdp, addr);
+	if (unlikely(!p4dp))
+		return -EINVAL;
+
+	pudp =3D pud_offset(p4dp, addr);
 	if (unlikely(!pudp))
 		return -EINVAL;
=20
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book=
3s64/hash_pgtable.c
index 64733b9cb20a..9cd15937e88a 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -148,6 +148,7 @@ void hash__vmemmap_remove_mapping(unsigned long start,
 int hash__map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t pro=
t)
 {
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -155,7 +156,8 @@ int hash__map_kernel_page(unsigned long ea, unsigned lo=
ng pa, pgprot_t prot)
 	BUILD_BUG_ON(TASK_SIZE_USER64 > H_PGTABLE_RANGE);
 	if (slab_is_available()) {
 		pgdp =3D pgd_offset_k(ea);
-		pudp =3D pud_alloc(&init_mm, pgdp, ea);
+		p4dp =3D p4d_offset(pgdp, ea);
+		pudp =3D pud_alloc(&init_mm, p4dp, ea);
 		if (!pudp)
 			return -ENOMEM;
 		pmdp =3D pmd_alloc(&init_mm, pudp, ea);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/boo=
k3s64/radix_pgtable.c
index dd1bea45325c..fc3d0b0460b0 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -64,17 +64,19 @@ static int early_map_kernel_page(unsigned long ea, unsi=
gned long pa,
 {
 	unsigned long pfn =3D pa >> PAGE_SHIFT;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
=20
 	pgdp =3D pgd_offset_k(ea);
-	if (pgd_none(*pgdp)) {
+	p4dp =3D p4d_offset(pgdp, ea);
+	if (p4d_none(*p4dp)) {
 		pudp =3D early_alloc_pgtable(PUD_TABLE_SIZE, nid,
 						region_start, region_end);
-		pgd_populate(&init_mm, pgdp, pudp);
+		p4d_populate(&init_mm, p4dp, pudp);
 	}
-	pudp =3D pud_offset(pgdp, ea);
+	pudp =3D pud_offset(p4dp, ea);
 	if (map_page_size =3D=3D PUD_SIZE) {
 		ptep =3D (pte_t *)pudp;
 		goto set_the_pte;
@@ -114,6 +116,7 @@ static int __map_kernel_page(unsigned long ea, unsigned=
 long pa,
 {
 	unsigned long pfn =3D pa >> PAGE_SHIFT;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -136,7 +139,8 @@ static int __map_kernel_page(unsigned long ea, unsigned=
 long pa,
 	 * boot.
 	 */
 	pgdp =3D pgd_offset_k(ea);
-	pudp =3D pud_alloc(&init_mm, pgdp, ea);
+	p4dp =3D p4d_offset(pgdp, ea);
+	pudp =3D pud_alloc(&init_mm, p4dp, ea);
 	if (!pudp)
 		return -ENOMEM;
 	if (map_page_size =3D=3D PUD_SIZE) {
@@ -173,6 +177,7 @@ void radix__change_memory_range(unsigned long start, un=
signed long end,
 {
 	unsigned long idx;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -185,7 +190,8 @@ void radix__change_memory_range(unsigned long start, un=
signed long end,
=20
 	for (idx =3D start; idx < end; idx +=3D PAGE_SIZE) {
 		pgdp =3D pgd_offset_k(idx);
-		pudp =3D pud_alloc(&init_mm, pgdp, idx);
+		p4dp =3D p4d_offset(pgdp, idx);
+		pudp =3D pud_alloc(&init_mm, p4dp, idx);
 		if (!pudp)
 			continue;
 		if (pud_is_leaf(*pudp)) {
@@ -847,6 +853,7 @@ static void __meminit remove_pagetable(unsigned long st=
art, unsigned long end)
 	unsigned long addr, next;
 	pud_t *pud_base;
 	pgd_t *pgd;
+	p4d_t *p4d;
=20
 	spin_lock(&init_mm.page_table_lock);
=20
@@ -854,15 +861,16 @@ static void __meminit remove_pagetable(unsigned long =
start, unsigned long end)
 		next =3D pgd_addr_end(addr, end);
=20
 		pgd =3D pgd_offset_k(addr);
-		if (!pgd_present(*pgd))
+		p4d =3D p4d_offset(pgd, addr);
+		if (!p4d_present(*p4d))
 			continue;
=20
-		if (pgd_is_leaf(*pgd)) {
-			split_kernel_mapping(addr, end, PGDIR_SIZE, (pte_t *)pgd);
+		if (p4d_is_leaf(*p4d)) {
+			split_kernel_mapping(addr, end, P4D_SIZE, (pte_t *)p4d);
 			continue;
 		}
=20
-		pud_base =3D (pud_t *)pgd_page_vaddr(*pgd);
+		pud_base =3D (pud_t *)p4d_page_vaddr(*p4d);
 		remove_pud_table(pud_base, addr, next);
 	}
=20
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book=
3s64/subpage_prot.c
index 2ef24a53f4c9..25a0c044bd93 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -54,15 +54,17 @@ static void hpte_flush_range(struct mm_struct *mm, unsi=
gned long addr,
 			     int npages)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
 	spinlock_t *ptl;
=20
 	pgd =3D pgd_offset(mm, addr);
-	if (pgd_none(*pgd))
+	p4d =3D p4d_offset(pgd, addr);
+	if (p4d_none(*p4d))
 		return;
-	pud =3D pud_offset(pgd, addr);
+	pud =3D pud_offset(p4d, addr);
 	if (pud_none(*pud))
 		return;
 	pmd =3D pmd_offset(pud, addr);
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 33b3461d91e8..54f5994d4cbb 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -119,6 +119,7 @@ static int __hugepte_alloc(struct mm_struct *mm, hugepd=
_t *hpdp,
 pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned l=
ong sz)
 {
 	pgd_t *pg;
+	p4d_t *p4;
 	pud_t *pu;
 	pmd_t *pm;
 	hugepd_t *hpdp =3D NULL;
@@ -128,20 +129,21 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned =
long addr, unsigned long sz
=20
 	addr &=3D ~(sz-1);
 	pg =3D pgd_offset(mm, addr);
+	p4 =3D p4d_offset(pg, addr);
=20
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (pshift =3D=3D PGDIR_SHIFT)
 		/* 16GB huge page */
-		return (pte_t *) pg;
+		return (pte_t *) p4;
 	else if (pshift > PUD_SHIFT) {
 		/*
 		 * We need to use hugepd table
 		 */
 		ptl =3D &mm->page_table_lock;
-		hpdp =3D (hugepd_t *)pg;
+		hpdp =3D (hugepd_t *)p4;
 	} else {
 		pdshift =3D PUD_SHIFT;
-		pu =3D pud_alloc(mm, pg, addr);
+		pu =3D pud_alloc(mm, p4, addr);
 		if (!pu)
 			return NULL;
 		if (pshift =3D=3D PUD_SHIFT)
@@ -166,10 +168,10 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned =
long addr, unsigned long sz
 #else
 	if (pshift >=3D PGDIR_SHIFT) {
 		ptl =3D &mm->page_table_lock;
-		hpdp =3D (hugepd_t *)pg;
+		hpdp =3D (hugepd_t *)p4;
 	} else {
 		pdshift =3D PUD_SHIFT;
-		pu =3D pud_alloc(mm, pg, addr);
+		pu =3D pud_alloc(mm, p4, addr);
 		if (!pu)
 			return NULL;
 		if (pshift >=3D PUD_SHIFT) {
@@ -390,7 +392,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *t=
lb, pud_t *pud,
 	mm_dec_nr_pmds(tlb->mm);
 }
=20
-static void hugetlb_free_pud_range(struct mmu_gather *tlb, pgd_t *pgd,
+static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
 				   unsigned long addr, unsigned long end,
 				   unsigned long floor, unsigned long ceiling)
 {
@@ -400,7 +402,7 @@ static void hugetlb_free_pud_range(struct mmu_gather *t=
lb, pgd_t *pgd,
=20
 	start =3D addr;
 	do {
-		pud =3D pud_offset(pgd, addr);
+		pud =3D pud_offset(p4d, addr);
 		next =3D pud_addr_end(addr, end);
 		if (!is_hugepd(__hugepd(pud_val(*pud)))) {
 			if (pud_none_or_clear_bad(pud))
@@ -435,8 +437,8 @@ static void hugetlb_free_pud_range(struct mmu_gather *t=
lb, pgd_t *pgd,
 	if (end - 1 > ceiling - 1)
 		return;
=20
-	pud =3D pud_offset(pgd, start);
-	pgd_clear(pgd);
+	pud =3D pud_offset(p4d, start);
+	p4d_clear(p4d);
 	pud_free_tlb(tlb, pud, start);
 	mm_dec_nr_puds(tlb->mm);
 }
@@ -449,6 +451,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			    unsigned long floor, unsigned long ceiling)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	unsigned long next;
=20
 	/*
@@ -471,10 +474,11 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 	do {
 		next =3D pgd_addr_end(addr, end);
 		pgd =3D pgd_offset(tlb->mm, addr);
+		p4d =3D p4d_offset(pgd, addr);
 		if (!is_hugepd(__hugepd(pgd_val(*pgd)))) {
-			if (pgd_none_or_clear_bad(pgd))
+			if (p4d_none_or_clear_bad(p4d))
 				continue;
-			hugetlb_free_pud_range(tlb, pgd, addr, next, floor, ceiling);
+			hugetlb_free_pud_range(tlb, p4d, addr, next, floor, ceiling);
 		} else {
 			unsigned long more;
 			/*
@@ -487,7 +491,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			if (more > next)
 				next =3D more;
=20
-			free_hugepd_range(tlb, (hugepd_t *)pgd, PGDIR_SHIFT,
+			free_hugepd_range(tlb, (hugepd_t *)p4d, PGDIR_SHIFT,
 					  addr, next, floor, ceiling);
 		}
 	} while (addr =3D next, addr !=3D end);
diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c b/arch/powerpc/mm/noha=
sh/book3e_pgtable.c
index 4637fdd469cf..77884e24281d 100644
--- a/arch/powerpc/mm/nohash/book3e_pgtable.c
+++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
@@ -73,6 +73,7 @@ static void __init *early_alloc_pgtable(unsigned long siz=
e)
 int __ref map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t pro=
t)
 {
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -80,7 +81,8 @@ int __ref map_kernel_page(unsigned long ea, unsigned long=
 pa, pgprot_t prot)
 	BUILD_BUG_ON(TASK_SIZE_USER64 > PGTABLE_RANGE);
 	if (slab_is_available()) {
 		pgdp =3D pgd_offset_k(ea);
-		pudp =3D pud_alloc(&init_mm, pgdp, ea);
+		p4dp =3D p4d_offset(pgdp, ea);
+		pudp =3D pud_alloc(&init_mm, p4dp, ea);
 		if (!pudp)
 			return -ENOMEM;
 		pmdp =3D pmd_alloc(&init_mm, pudp, ea);
@@ -91,13 +93,12 @@ int __ref map_kernel_page(unsigned long ea, unsigned lo=
ng pa, pgprot_t prot)
 			return -ENOMEM;
 	} else {
 		pgdp =3D pgd_offset_k(ea);
-#ifndef __PAGETABLE_PUD_FOLDED
-		if (pgd_none(*pgdp)) {
-			pudp =3D early_alloc_pgtable(PUD_TABLE_SIZE);
-			pgd_populate(&init_mm, pgdp, pudp);
+		p4dp =3D p4d_offset(pgdp, ea);
+		if (p4d_none(*p4dp)) {
+			pmdp =3D early_alloc_pgtable(PMD_TABLE_SIZE);
+			p4d_populate(&init_mm, p4dp, pmdp);
 		}
-#endif /* !__PAGETABLE_PUD_FOLDED */
-		pudp =3D pud_offset(pgdp, ea);
+		pudp =3D pud_offset(p4dp, ea);
 		if (pud_none(*pudp)) {
 			pmdp =3D early_alloc_pgtable(PMD_TABLE_SIZE);
 			pud_populate(&init_mm, pudp, pmdp);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index e3759b69f81b..c2499271f6c1 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -265,6 +265,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *v=
ma,
 void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
=20
@@ -272,7 +273,9 @@ void assert_pte_locked(struct mm_struct *mm, unsigned l=
ong addr)
 		return;
 	pgd =3D mm->pgd + pgd_index(addr);
 	BUG_ON(pgd_none(*pgd));
-	pud =3D pud_offset(pgd, addr);
+	p4d =3D p4d_offset(pgd, addr);
+	BUG_ON(p4d_none(*p4d));
+	pud =3D pud_offset(p4d, addr);
 	BUG_ON(pud_none(*pud));
 	pmd =3D pmd_offset(pud, addr);
 	/*
@@ -312,12 +315,13 @@ EXPORT_SYMBOL_GPL(vmalloc_to_phys);
 pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 			bool *is_thp, unsigned *hpage_shift)
 {
-	pgd_t pgd, *pgdp;
+	pgd_t *pgdp;
+	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
 	pte_t *ret_pte;
 	hugepd_t *hpdp =3D NULL;
-	unsigned pdshift =3D PGDIR_SHIFT;
+	unsigned pdshift;
=20
 	if (hpage_shift)
 		*hpage_shift =3D 0;
@@ -325,24 +329,28 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long e=
a,
 	if (is_thp)
 		*is_thp =3D false;
=20
-	pgdp =3D pgdir + pgd_index(ea);
-	pgd  =3D READ_ONCE(*pgdp);
 	/*
 	 * Always operate on the local stack value. This make sure the
 	 * value don't get updated by a parallel THP split/collapse,
 	 * page fault or a page unmap. The return pte_t * is still not
 	 * stable. So should be checked there for above conditions.
+	 * Top level is an exception because it is folded into p4d.
 	 */
-	if (pgd_none(pgd))
+	pgdp =3D pgdir + pgd_index(ea);
+	p4dp =3D p4d_offset(pgdp, ea);
+	p4d  =3D READ_ONCE(*p4dp);
+	pdshift =3D P4D_SHIFT;
+
+	if (p4d_none(p4d))
 		return NULL;
=20
-	if (pgd_is_leaf(pgd)) {
-		ret_pte =3D (pte_t *)pgdp;
+	if (p4d_is_leaf(p4d)) {
+		ret_pte =3D (pte_t *)p4dp;
 		goto out;
 	}
=20
-	if (is_hugepd(__hugepd(pgd_val(pgd)))) {
-		hpdp =3D (hugepd_t *)&pgd;
+	if (is_hugepd(__hugepd(p4d_val(p4d)))) {
+		hpdp =3D (hugepd_t *)&p4d;
 		goto out_huge;
 	}
=20
@@ -352,7 +360,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	 * irq disabled
 	 */
 	pdshift =3D PUD_SHIFT;
-	pudp =3D pud_offset(&pgd, ea);
+	pudp =3D pud_offset(&p4d, ea);
 	pud  =3D READ_ONCE(*pudp);
=20
 	if (pud_none(pud))
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index e78832dce7bb..1f86a88fd4bb 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -101,13 +101,13 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
=20
 #ifndef __PAGETABLE_PUD_FOLDED
 /* 4 level page table */
-struct page *pgd_page(pgd_t pgd)
+struct page *p4d_page(p4d_t p4d)
 {
-	if (pgd_is_leaf(pgd)) {
-		VM_WARN_ON(!pgd_huge(pgd));
-		return pte_page(pgd_pte(pgd));
+	if (p4d_is_leaf(p4d)) {
+		VM_WARN_ON(!p4d_huge(p4d));
+		return pte_page(p4d_pte(p4d));
 	}
-	return virt_to_page(pgd_page_vaddr(pgd));
+	return virt_to_page(p4d_page_vaddr(p4d));
 }
 #endif
=20
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdum=
p/hashpagetable.c
index b6ed9578382f..6aaeb1eb3b9c 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -417,9 +417,9 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, u=
nsigned long start)
 	}
 }
=20
-static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
+static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
 {
-	pud_t *pud =3D pud_offset(pgd, 0);
+	pud_t *pud =3D pud_offset(p4d, 0);
 	unsigned long addr;
 	unsigned int i;
=20
@@ -431,6 +431,20 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, =
unsigned long start)
 	}
 }
=20
+static void walk_p4d(struct pg_state *st, pgd_t *pgd, unsigned long start)
+{
+	p4d_t *p4d =3D p4d_offset(pgd, 0);
+	unsigned long addr;
+	unsigned int i;
+
+	for (i =3D 0; i < PTRS_PER_P4D; i++, p4d++) {
+		addr =3D start + i * P4D_SIZE;
+		if (!p4d_none(*p4d))
+			/* p4d exists */
+			walk_pud(st, p4d, addr);
+	}
+}
+
 static void walk_pagetables(struct pg_state *st)
 {
 	pgd_t *pgd =3D pgd_offset_k(0UL);
@@ -445,7 +459,7 @@ static void walk_pagetables(struct pg_state *st)
 		addr =3D KERN_VIRT_START + i * PGDIR_SIZE;
 		if (!pgd_none(*pgd))
 			/* pgd exists */
-			walk_pud(st, pgd, addr);
+			walk_p4d(st, pgd, addr);
 	}
 }
=20
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdum=
p.c
index d92bb8ea229c..507cb9793b26 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -277,9 +277,9 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, u=
nsigned long start)
 	}
 }
=20
-static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
+static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
 {
-	pud_t *pud =3D pud_offset(pgd, 0);
+	pud_t *pud =3D pud_offset(p4d, 0);
 	unsigned long addr;
 	unsigned int i;
=20
@@ -304,11 +304,13 @@ static void walk_pagetables(struct pg_state *st)
 	 * the hash pagetable.
 	 */
 	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGDIR=
_SIZE) {
-		if (!pgd_none(*pgd) && !pgd_is_leaf(*pgd))
-			/* pgd exists */
-			walk_pud(st, pgd, addr);
+		p4d_t *p4d =3D p4d_offset(pgd, 0);
+
+		if (!p4d_none(*p4d) && !p4d_is_leaf(*p4d))
+			/* p4d exists */
+			walk_pud(st, p4d, addr);
 		else
-			note_page(st, addr, 1, pgd_val(*pgd));
+			note_page(st, addr, 1, p4d_val(*p4d));
 	}
 }
=20
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0ec9640335bb..3e29128c58cc 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3130,6 +3130,7 @@ static void show_pte(unsigned long addr)
 	struct task_struct *tsk =3D NULL;
 	struct mm_struct *mm;
 	pgd_t *pgdp, *pgdir;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -3161,20 +3162,21 @@ static void show_pte(unsigned long addr)
 		pgdir =3D pgd_offset(mm, 0);
 	}
=20
-	if (pgd_none(*pgdp)) {
-		printf("no linux page table for address\n");
+	p4dp =3D p4d_offset(pgdp, addr);
+
+	if (p4d_none(*p4dp)) {
+		printf("No valid P4D\n");
 		return;
 	}
=20
-	printf("pgd  @ 0x%px\n", pgdir);
-
-	if (pgd_is_leaf(*pgdp)) {
-		format_pte(pgdp, pgd_val(*pgdp));
+	if (p4d_is_leaf(*p4dp)) {
+		format_pte(p4dp, p4d_val(*p4dp));
 		return;
 	}
-	printf("pgdp @ 0x%px =3D 0x%016lx\n", pgdp, pgd_val(*pgdp));
=20
-	pudp =3D pud_offset(pgdp, addr);
+	printf("p4dp @ 0x%px =3D 0x%016lx\n", p4dp, p4d_val(*p4dp));
+
+	pudp =3D pud_offset(p4dp, addr);
=20
 	if (pud_none(*pudp)) {
 		printf("No valid PUD\n");
--=20
2.25.0


--Sig_/CYjuyYbEL502TpSEoe7ie/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5h8AwACgkQAVBC80lX
0Gx0Wwf8DS1hLDpynaXTGElyU/W8WnXPcBNiAS4L7xO2Dz+njr9hEVjBy5q+H2HK
iX64q+VioduQVUS/3L4svVWvhctHQiEEr1hHkMxplNuJ4t00Znih8fdFkSrgtpPa
4cGFnXTc53xVMxhnR3r15eg2l+4qaJZVlRlqTKRYGd2s6Q8+dm7MuJgvz1rDCGAG
lTfEXe4lSknjFlkIca72t1i2xyMk7SEIUfxkSPy/JByq4WHV20mnlj2IkVrTg/3K
D70lRBD+5013Y28x89oBu0wLxMjy97/FTTYax6UG7RvyQxI8ZLqWnadFPbcrj4mj
MGm/tvDHch4kbQefk1anbmWEv39t6g==
=0fdw
-----END PGP SIGNATURE-----

--Sig_/CYjuyYbEL502TpSEoe7ie/M--
