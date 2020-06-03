Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA71ECD8D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 12:29:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cQB30ZDbzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 20:28:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cQ7m0BS7zDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 20:27:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=QyulPPnq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cQ7j5Qqqz9sPF;
 Wed,  3 Jun 2020 20:26:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591180017;
 bh=zD33Wup488scavQp90fj5kXT/hdVydyJgVvHiJB0IH8=;
 h=Date:From:To:Cc:Subject:From;
 b=QyulPPnqdk+2gvx4+zfS4Px8oEZizNMo6GDz/S0s99oCd93OgnlHvTd2o8ObLt77t
 tlba7wzT+2z0sEMjGS3oKQ2oktL1PL2XQxWCfmd+3zA543rFGQUZb/B4lZYBPnoFkY
 SSUK9XeHXps4fkagekD9OjKaDwOOha+l9UvdVJOeLNMjht0SYMftt+rNxz/p9D4f8w
 3ezSWhZ9Dc2zLUtIaStVwxWsvEZaOASAJ/PlRmitLo3UoMkxFVZc8V0c4057QRbpVB
 rRZxeRzzgUSJckdKLZJOOAZzApvv/UgBYi8AO+2h9TDqbQveG345WrpTl5gIoT03Ue
 MhXMe3FPnC48g==
Date: Wed, 3 Jun 2020 20:26:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200603202655.0ad0eacc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T+O9YzBbXMkBzqWEdGuULUD";
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
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/T+O9YzBbXMkBzqWEdGuULUD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Some things turned up in the powerpc tree today that required some changes
to patches in the akpm tree and also the following fixup patch provided
(mostly) by Michael. I have applied this as a single patch today, but
parts of it should probably go in some other patches.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jun 2020 20:03:49 +1000
Subject: [PATCH] powerpc fixes for changes clashing with akpm tree changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  6 ++++++
 arch/powerpc/include/asm/nohash/32/pgtable.h | 10 +++++-----
 arch/powerpc/mm/kasan/8xx.c                  |  4 ++--
 arch/powerpc/mm/kasan/book3s_32.c            |  2 +-
 arch/powerpc/mm/nohash/8xx.c                 |  2 +-
 arch/powerpc/mm/pgtable.c                    |  2 +-
 arch/powerpc/mm/pgtable_32.c                 |  2 +-
 7 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index 25c3cb8272c0..a6799723cd98 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1008,6 +1008,12 @@ extern struct page *p4d_page(p4d_t p4d);
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
 #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
=20
+static inline unsigned long pgd_index(unsigned long address)
+{
+	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
+}
+#define pgd_index pgd_index
+
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index c188a6f64bcd..1927e1b653f2 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -205,10 +205,6 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp =3D __pmd(0);
 }
=20
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* to find an entry in a page-table-directory */
 #define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
@@ -241,7 +237,7 @@ static inline pte_basic_t pte_update(struct mm_struct *=
mm, unsigned long addr, p
 	pte_basic_t old =3D pte_val(*p);
 	pte_basic_t new =3D (old & ~(pte_basic_t)clr) | set;
 	int num, i;
-	pmd_t *pmd =3D pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr);
+	pmd_t *pmd =3D pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, addr), add=
r), addr), addr);
=20
 	if (!huge)
 		num =3D PAGE_SIZE / SZ_4K;
@@ -341,6 +337,10 @@ static inline int pte_young(pte_t pte)
 	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 #endif
=20
+#define pte_offset_kernel(dir, addr)	\
+	(pmd_bad(*(dir)) ? NULL : (pte_t *)pmd_page_vaddr(*(dir)) + \
+				  pte_index(addr))
+
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
index db4ef44af22f..569d98a41881 100644
--- a/arch/powerpc/mm/kasan/8xx.c
+++ b/arch/powerpc/mm/kasan/8xx.c
@@ -10,7 +10,7 @@
 static int __init
 kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void *blo=
ck)
 {
-	pmd_t *pmd =3D pmd_ptr_k(k_start);
+	pmd_t *pmd =3D pmd_off_k(k_start);
 	unsigned long k_cur, k_next;
=20
 	for (k_cur =3D k_start; k_cur !=3D k_end; k_cur =3D k_next, pmd +=3D 2, b=
lock +=3D SZ_8M) {
@@ -59,7 +59,7 @@ int __init kasan_init_region(void *start, size_t size)
 		return ret;
=20
 	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
-		pmd_t *pmd =3D pmd_ptr_k(k_cur);
+		pmd_t *pmd =3D pmd_off_k(k_cur);
 		void *va =3D block + k_cur - k_start;
 		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
=20
diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book=
3s_32.c
index 4bc491a4a1fd..a32b4640b9de 100644
--- a/arch/powerpc/mm/kasan/book3s_32.c
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -46,7 +46,7 @@ int __init kasan_init_region(void *start, size_t size)
 	kasan_update_early_region(k_start, k_cur, __pte(0));
=20
 	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
-		pmd_t *pmd =3D pmd_ptr_k(k_cur);
+		pmd_t *pmd =3D pmd_off_k(k_cur);
 		void *va =3D block + k_cur - k_start;
 		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
=20
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 286441bbbe49..92e8929cbe3e 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -74,7 +74,7 @@ static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *=
pmdp, unsigned long va)
 static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t=
 pa,
 					     pgprot_t prot, int psize, bool new)
 {
-	pmd_t *pmdp =3D pmd_ptr_k(va);
+	pmd_t *pmdp =3D pmd_off_k(va);
 	pte_t *ptep;
=20
 	if (WARN_ON(psize !=3D MMU_PAGE_512K && psize !=3D MMU_PAGE_8M))
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 45a0556089e8..1136257c3a99 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -264,7 +264,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *v=
ma,
 #if defined(CONFIG_PPC_8xx)
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep=
, pte_t pte)
 {
-	pmd_t *pmd =3D pmd_ptr(mm, addr);
+	pmd_t *pmd =3D pmd_off(mm, addr);
 	pte_basic_t val;
 	pte_basic_t *entry =3D &ptep->pte;
 	int num =3D is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index e2d054c9575e..6eb4eab79385 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -40,7 +40,7 @@ notrace void __init early_ioremap_init(void)
 {
 	unsigned long addr =3D ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE);
 	pte_t *ptep =3D (pte_t *)early_fixmap_pagetable;
-	pmd_t *pmdp =3D pmd_ptr_k(addr);
+	pmd_t *pmdp =3D pmd_off_k(addr);
=20
 	for (; (s32)(FIXADDR_TOP - addr) > 0;
 	     addr +=3D PGDIR_SIZE, ptep +=3D PTRS_PER_PTE, pmdp++)
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/T+O9YzBbXMkBzqWEdGuULUD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Xeu8ACgkQAVBC80lX
0Gzfhgf/cPFp2dlvYny+4RY4PCVkyWhX1RA5GNl9ysvabCodQrz+8pncZtOeb4MF
eY4AJ83+Zz7E/4N1eN7mBGLnpBLcA3oLBc8auDIw6KzK26CMX7c5aSB4Q0EWOdCA
VjKOS4St84Hv/BHlPTvEtCiir53gvLlaoWYH0byul1nTIfxSoTdJVHY0rE1FwF7M
RmfMKVuYKhy+cmTW2rfVkYvUhDSwAq92TV7leq8EKvpZEHffOh+05sGozqty+N4g
dUnFEe8oAOg42tKyByzpBjf1Ww6HMywpSVTH55SCIWjQJr34n9sOHvc0lIf/GvMX
C91jjfQi7ZTZHDKK58sahYOxWvm6Fg==
=EU0e
-----END PGP SIGNATURE-----

--Sig_/T+O9YzBbXMkBzqWEdGuULUD--
