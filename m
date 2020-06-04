Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC441EE003
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 10:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49czsq0b79zDqSR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49czqf5nXJzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 18:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Tpy3UUKA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49czqf2Rqnz9sSy;
 Thu,  4 Jun 2020 18:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591260302;
 bh=LlZr+htNbQIbe6wiwJmoZRCGLt4C6qq99v+LUf8ZcOE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tpy3UUKALFMtiVfrkXdXfPgJTP2ZljUa60ZO8xsiZ1xwvKXdwN47Rt6kUI2aKhcR4
 jBkZHTNGvOksRNH5HTxJrB+/8SexE/2+0TNF2zPttOfE3pM9HXfrifGhPAnUcP+JuS
 fbEXIF7Aa/+B8IpeEe5hGzx2eXcJPIS85IYuwb93I68xyVMUd5wjbw0NHrJ6UxPafn
 wuB8IyGTOl2HbAzEW/dMGezb8qgoVlUMWZ1FoYdCT/kSvxbygnKO+BJ/Gc9EKDb5l3
 57jWCKshEsv96WS0w4eSCemK3xyjjUS7QS8hKDfsir65XjgO/+LHcOawk1/Gb0Oirw
 Ar4Jas8S7t0nQ==
Date: Thu, 4 Jun 2020 18:45:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200604184501.1ea5ba36@canb.auug.org.au>
In-Reply-To: <20200604165246.436f02ba@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
 <20200604165246.436f02ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eHsh.cfwjZ2F39DrKQkZg7I";
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

--Sig_/eHsh.cfwjZ2F39DrKQkZg7I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Jun 2020 16:52:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
> index db4ef44af22f..569d98a41881 100644
> --- a/arch/powerpc/mm/kasan/8xx.c
> +++ b/arch/powerpc/mm/kasan/8xx.c
> @@ -10,7 +10,7 @@
>  static int __init
>  kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void *b=
lock)
>  {
> -	pmd_t *pmd =3D pmd_ptr_k(k_start);
> +	pmd_t *pmd =3D pmd_off_k(k_start);
>  	unsigned long k_cur, k_next;
> =20
>  	for (k_cur =3D k_start; k_cur !=3D k_end; k_cur =3D k_next, pmd +=3D 2,=
 block +=3D SZ_8M) {
> @@ -59,7 +59,7 @@ int __init kasan_init_region(void *start, size_t size)
>  		return ret;
> =20
>  	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
> -		pmd_t *pmd =3D pmd_ptr_k(k_cur);
> +		pmd_t *pmd =3D pmd_off_k(k_cur);
>  		void *va =3D block + k_cur - k_start;
>  		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
> =20
> diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/bo=
ok3s_32.c
> index 4bc491a4a1fd..a32b4640b9de 100644
> --- a/arch/powerpc/mm/kasan/book3s_32.c
> +++ b/arch/powerpc/mm/kasan/book3s_32.c
> @@ -46,7 +46,7 @@ int __init kasan_init_region(void *start, size_t size)
>  	kasan_update_early_region(k_start, k_cur, __pte(0));
> =20
>  	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
> -		pmd_t *pmd =3D pmd_ptr_k(k_cur);
> +		pmd_t *pmd =3D pmd_off_k(k_cur);
>  		void *va =3D block + k_cur - k_start;
>  		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
> =20
> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index 286441bbbe49..92e8929cbe3e 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -74,7 +74,7 @@ static pte_t __init *early_hugepd_alloc_kernel(hugepd_t=
 *pmdp, unsigned long va)
>  static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr=
_t pa,
>  					     pgprot_t prot, int psize, bool new)
>  {
> -	pmd_t *pmdp =3D pmd_ptr_k(va);
> +	pmd_t *pmdp =3D pmd_off_k(va);
>  	pte_t *ptep;
> =20
>  	if (WARN_ON(psize !=3D MMU_PAGE_512K && psize !=3D MMU_PAGE_8M))
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 45a0556089e8..1136257c3a99 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -264,7 +264,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct =
*vma,
>  #if defined(CONFIG_PPC_8xx)
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *pt=
ep, pte_t pte)
>  {
> -	pmd_t *pmd =3D pmd_ptr(mm, addr);
> +	pmd_t *pmd =3D pmd_off(mm, addr);
>  	pte_basic_t val;
>  	pte_basic_t *entry =3D &ptep->pte;
>  	int num =3D is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index e2d054c9575e..6eb4eab79385 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -40,7 +40,7 @@ notrace void __init early_ioremap_init(void)
>  {
>  	unsigned long addr =3D ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE);
>  	pte_t *ptep =3D (pte_t *)early_fixmap_pagetable;
> -	pmd_t *pmdp =3D pmd_ptr_k(addr);
> +	pmd_t *pmdp =3D pmd_off_k(addr);
> =20
>  	for (; (s32)(FIXADDR_TOP - addr) > 0;
>  	     addr +=3D PGDIR_SIZE, ptep +=3D PTRS_PER_PTE, pmdp++)

I have added the above hunks as to linux-next for tomorrow as a fix for
mm-pgtable-add-shortcuts-for-accessing-kernel-pmd-and-pte.

--=20
Cheers,
Stephen Rothwell

--Sig_/eHsh.cfwjZ2F39DrKQkZg7I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YtI0ACgkQAVBC80lX
0GzQQwgAlMZMllEsSqKLjKU606gkIgqzsKHBa0X8F0ls9Qph/WMXE95rxW5oFDfH
Te0J+/vySQTXkzfuYG/K9DI3be0R8QvXtAl+3AoK2ofI3312PDvkzl7N7mia0hlh
NHu37L3Y5MuM45lWQbWesScyfrhS3thgiUsiZ1DyRvWctokVBNCn2XBIlAlu6kbb
1FGLMEPs3n1lZGRMWdSUxYrMgPzl1P2H+FRRl6QH/q+tCYu02Ebj7YVL+kYz15zd
OZ13aC3IcK7u7GOS6PFeIzysZK5LdZEGiwnuS8vyXkcuVpq+8tFTb9AvK6r1p9Dg
K2Jh2auK0jWAmoSUCofDTsMOzPvyBw==
=0FIL
-----END PGP SIGNATURE-----

--Sig_/eHsh.cfwjZ2F39DrKQkZg7I--
