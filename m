Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601331D37A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 01:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgJsM2LsNz3d3H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 11:40:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=TF5M0SzF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=TF5M0SzF; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgJqW4cN5z30hy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 11:38:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgJqV0mNyz9sTD; Wed, 17 Feb 2021 11:38:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613522326;
 bh=wGQ++iT7JUFjfkLLwJnS3Xl8X/IbXFBjYwfE6sAJFD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TF5M0SzFmZ7uZTtMjcZcqhHlT1eXhGpw1ad5dv+n2UlgF1YnuMZ1vlITcheXNU8E1
 aVsM2Z7mbB9ETeD6sMJoerNIomQ6PNVp7nlp1kIcj5RYa42FaUO/qwFu73yIE+jZ+o
 NOtBYKcfxBkCUx8vZTpWMCHWLICZYKMafTMtfcUQ=
Date: Wed, 17 Feb 2021 11:24:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 1/3] powerpc/book3s64/radix/tlb: tlbie primitives for
 process-scoped invalidations from guests
Message-ID: <YCxiUCm/UCJJGOJD@yekko.fritz.box>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
 <20210215063542.3642366-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7d2ekL/4QIyl31a9"
Content-Disposition: inline
In-Reply-To: <20210215063542.3642366-2-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7d2ekL/4QIyl31a9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 12:05:40PM +0530, Bharata B Rao wrote:
> H_RPT_INVALIDATE hcall needs to perform process scoped tlbie
> invalidations of L1 and nested guests from L0. This needs RS register
> for TLBIE instruction to contain both PID and LPID. Introduce
> primitives that execute tlbie instruction with both PID
> and LPID set in prepartion for H_RPT_INVALIDATE hcall.
>=20
> While we are here, move RIC_FLUSH definitions to header file
> and introduce helper rpti_pgsize_to_psize() that will be needed
> by the upcoming hcall.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 122 +++++++++++++++++-
>  2 files changed, 136 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/p=
owerpc/include/asm/book3s/64/tlbflush-radix.h
> index 94439e0cefc9..aace7e9b2397 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -4,6 +4,10 @@
> =20
>  #include <asm/hvcall.h>
> =20
> +#define RIC_FLUSH_TLB 0
> +#define RIC_FLUSH_PWC 1
> +#define RIC_FLUSH_ALL 2
> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
> @@ -21,6 +25,20 @@ static inline u64 psize_to_rpti_pgsize(unsigned long p=
size)
>  	return H_RPTI_PAGE_ALL;
>  }
> =20
> +static inline int rpti_pgsize_to_psize(unsigned long page_size)
> +{
> +	if (page_size =3D=3D H_RPTI_PAGE_4K)
> +		return MMU_PAGE_4K;
> +	if (page_size =3D=3D H_RPTI_PAGE_64K)
> +		return MMU_PAGE_64K;
> +	if (page_size =3D=3D H_RPTI_PAGE_2M)
> +		return MMU_PAGE_2M;
> +	if (page_size =3D=3D H_RPTI_PAGE_1G)
> +		return MMU_PAGE_1G;
> +	else
> +		return MMU_PAGE_64K; /* Default */
> +}

Would it make sense to put the H_RPT_PAGE_ tags into the
mmu_psize_defs table and scan that here, rather than open coding the
conversion?

> +
>  static inline int mmu_get_ap(int psize)
>  {
>  	return mmu_psize_defs[psize].ap;
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index fb66d154b26c..097402435303 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -18,10 +18,6 @@
>  #include <asm/cputhreads.h>
>  #include <asm/plpar_wrappers.h>
> =20
> -#define RIC_FLUSH_TLB 0
> -#define RIC_FLUSH_PWC 1
> -#define RIC_FLUSH_ALL 2
> -
>  /*
>   * tlbiel instruction for radix, set invalidation
>   * i.e., r=3D1 and is=3D01 or is=3D10 or is=3D11
> @@ -128,6 +124,21 @@ static __always_inline void __tlbie_pid(unsigned lon=
g pid, unsigned long ric)
>  	trace_tlbie(0, 0, rb, rs, ric, prs, r);
>  }
> =20
> +static __always_inline void __tlbie_pid_lpid(unsigned long pid,
> +					     unsigned long lpid,
> +					     unsigned long ric)
> +{
> +	unsigned long rb, rs, prs, r;
> +
> +	rb =3D PPC_BIT(53); /* IS =3D 1 */
> +	rs =3D (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
> +	prs =3D 1; /* process scoped */
> +	r =3D 1;   /* radix format */
> +
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
> +	trace_tlbie(0, 0, rb, rs, ric, prs, r);
> +}
>  static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned lo=
ng ric)
>  {
>  	unsigned long rb,rs,prs,r;
> @@ -188,6 +199,23 @@ static __always_inline void __tlbie_va(unsigned long=
 va, unsigned long pid,
>  	trace_tlbie(0, 0, rb, rs, ric, prs, r);
>  }
> =20
> +static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned l=
ong pid,
> +					    unsigned long lpid,
> +					    unsigned long ap, unsigned long ric)
> +{
> +	unsigned long rb, rs, prs, r;
> +
> +	rb =3D va & ~(PPC_BITMASK(52, 63));
> +	rb |=3D ap << PPC_BITLSHIFT(58);
> +	rs =3D (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
> +	prs =3D 1; /* process scoped */
> +	r =3D 1;   /* radix format */
> +
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
> +	trace_tlbie(0, 0, rb, rs, ric, prs, r);
> +}
> +
>  static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned l=
ong lpid,
>  					    unsigned long ap, unsigned long ric)
>  {
> @@ -233,6 +261,22 @@ static inline void fixup_tlbie_va_range(unsigned lon=
g va, unsigned long pid,
>  	}
>  }
> =20
> +static inline void fixup_tlbie_va_range_lpid(unsigned long va,
> +					     unsigned long pid,
> +					     unsigned long lpid,
> +					     unsigned long ap)
> +{
> +	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
> +		asm volatile("ptesync" : : : "memory");
> +		__tlbie_pid_lpid(0, lpid, RIC_FLUSH_TLB);
> +	}
> +
> +	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
> +		asm volatile("ptesync" : : : "memory");
> +		__tlbie_va_lpid(va, pid, lpid, ap, RIC_FLUSH_TLB);
> +	}
> +}
> +
>  static inline void fixup_tlbie_pid(unsigned long pid)
>  {
>  	/*
> @@ -252,6 +296,25 @@ static inline void fixup_tlbie_pid(unsigned long pid)
>  	}
>  }
> =20
> +static inline void fixup_tlbie_pid_lpid(unsigned long pid, unsigned long=
 lpid)
> +{
> +	/*
> +	 * We can use any address for the invalidation, pick one which is
> +	 * probably unused as an optimisation.
> +	 */
> +	unsigned long va =3D ((1UL << 52) - 1);
> +
> +	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
> +		asm volatile("ptesync" : : : "memory");
> +		__tlbie_pid_lpid(0, lpid, RIC_FLUSH_TLB);
> +	}
> +
> +	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
> +		asm volatile("ptesync" : : : "memory");
> +		__tlbie_va_lpid(va, pid, lpid, mmu_get_ap(MMU_PAGE_64K),
> +				RIC_FLUSH_TLB);
> +	}
> +}
> =20
>  static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long l=
pid,
>  				       unsigned long ap)
> @@ -342,6 +405,31 @@ static inline void _tlbie_pid(unsigned long pid, uns=
igned long ric)
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
> =20
> +static inline void _tlbie_pid_lpid(unsigned long pid, unsigned long lpid,
> +				   unsigned long ric)
> +{
> +	asm volatile("ptesync" : : : "memory");
> +
> +	/*
> +	 * Workaround the fact that the "ric" argument to __tlbie_pid
> +	 * must be a compile-time contraint to match the "i" constraint
> +	 * in the asm statement.
> +	 */
> +	switch (ric) {
> +	case RIC_FLUSH_TLB:
> +		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> +		fixup_tlbie_pid_lpid(pid, lpid);
> +		break;
> +	case RIC_FLUSH_PWC:
> +		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> +		break;
> +	case RIC_FLUSH_ALL:
> +	default:
> +		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
> +		fixup_tlbie_pid_lpid(pid, lpid);
> +	}
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
>  struct tlbiel_pid {
>  	unsigned long pid;
>  	unsigned long ric;
> @@ -467,6 +555,20 @@ static inline void __tlbie_va_range(unsigned long st=
art, unsigned long end,
>  	fixup_tlbie_va_range(addr - page_size, pid, ap);
>  }
> =20
> +static inline void __tlbie_va_range_lpid(unsigned long start, unsigned l=
ong end,
> +					 unsigned long pid, unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long psize)
> +{
> +	unsigned long addr;
> +	unsigned long ap =3D mmu_get_ap(psize);
> +
> +	for (addr =3D start; addr < end; addr +=3D page_size)
> +		__tlbie_va_lpid(addr, pid, lpid, ap, RIC_FLUSH_TLB);
> +
> +	fixup_tlbie_va_range_lpid(addr - page_size, pid, lpid, ap);
> +}
> +
>  static __always_inline void _tlbie_va(unsigned long va, unsigned long pi=
d,
>  				      unsigned long psize, unsigned long ric)
>  {
> @@ -547,6 +649,18 @@ static inline void _tlbie_va_range(unsigned long sta=
rt, unsigned long end,
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
> =20
> +static inline void _tlbie_va_range_lpid(unsigned long start, unsigned lo=
ng end,
> +					unsigned long pid, unsigned long lpid,
> +					unsigned long page_size,
> +					unsigned long psize, bool also_pwc)
> +{
> +	asm volatile("ptesync" : : : "memory");
> +	if (also_pwc)
> +		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> +	__tlbie_va_range_lpid(start, end, pid, lpid, page_size, psize);
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
> +
>  static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
>  				unsigned long start, unsigned long end,
>  				unsigned long pid, unsigned long page_size,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7d2ekL/4QIyl31a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsYlAACgkQbDjKyiDZ
s5IMfxAA1USMoHd8r34NuHAbd1oRZFLmPeF0F6/1qqv4nsNOBU0rrt0kLCC6iPTP
EjzTpBBFuxSg+gr6C+I3YAYU/pROISDKXM0t2CwDw+VlARhSWXArP7Al8fmTiEjJ
nLkHaoR7kHaOa4TIglk0eV9b2Wp0VcD2EC8nZ8SbJ4joQkdsMhjgpLIs8WKiwYOx
cd2eTnJBOBDeSvdQk01Yxg8xku699esd/Vi96Afb3WDORWh+WC52L99GM+2sGnEs
9lREcHoT2WNLJIalkJp9fgnGQlr+iNuG6pVr5mfDUXQm1HWoDPRv3qFBrF3ZO1ED
dfzrp+mLJo2dl7Ft4rvZPVOrar9Xp686U9t1eaBZF5F/Xh+LFZRscwejhcScMt9k
xq26ktzTLhwquV9hGEiCPWnhD+d0aMnnavtgU5e9WjuOKciIfxm8b5rxpUadHHcl
avXvIOHphEZKCQXXm3y9nWha0rKvvweg4VM6hBBUHISPMiXBHxStyiCSyP4wTjuS
79cVoSfJ8Uj7Rz78jgIbt4epzaggCK45RbxS6eRcZ8nQ4uZi4BdBPXvtfo3WZ2/0
k1/NxCIcXON3drARiZSCDpMQyf1MnL6WvhWXhAXVHCcT2XX3lztGC5Gd+1ypBYgQ
J2B1ksnNIayMcDnHE+WQcrjbv9c3Q5shFgLQpeHLRCDCWjU1EgA=
=rpxL
-----END PGP SIGNATURE-----

--7d2ekL/4QIyl31a9--
