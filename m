Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB03BB67A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 06:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJCkW2Lbnz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 14:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=P1ZWiFfU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=P1ZWiFfU; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJCk220HFz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 14:43:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJCk03Nnvz9sXM; Mon,  5 Jul 2021 14:43:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460200;
 bh=Tq1M47EUu05GKZ3ZRLukuT3vBKJvsDynJ59Ygrjk5jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1ZWiFfUgB4jU+Dz3AjsHWLQ8JDhsf1E2qD+jqU0n9blHx4d/fZKYCktdEXewCrg9
 4IEuZ3ze1NS+sUtUvYJ3oaoFf/CjgJdGdpVlnPP64GM7c5cPDkxehNKJTk2dteFc97
 7z8ZovSOwlgXmvC5q/IBnh49XKSe4hH2FKlT2PXs=
Date: Mon, 5 Jul 2021 14:42:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v8 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YOKNub8mS4U4iox0@yekko>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-4-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kmxHPmCrK2EERXPh"
Content-Disposition: inline
In-Reply-To: <20210621085003.904767-4-bharata@linux.ibm.com>
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


--kmxHPmCrK2EERXPh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 02:20:00PM +0530, Bharata B Rao wrote:
> H_RPT_INVALIDATE does two types of TLB invalidations:
>=20
> 1. Process-scoped invalidations for guests when LPCR[GTSE]=3D0.
>    This is currently not used in KVM as GTSE is not usually
>    disabled in KVM.
> 2. Partition-scoped invalidations that an L1 hypervisor does on
>    behalf of an L2 guest. This is currently handled
>    by H_TLB_INVALIDATE hcall and this new replaces the old that.
>=20
> This commit enables process-scoped invalidations for L1 guests.
> Support for process-scoped and partition-scoped invalidations
> from/for nested guests will be added separately.
>=20
> Process scoped tlbie invalidations from L1 and nested guests
> need RS register for TLBIE instruction to contain both PID and
> LPID.  This patch introduces primitives that execute tlbie
> instruction with both PID and LPID set in prepartion for
> H_RPT_INVALIDATE hcall.
>=20
> A description of H_RPT_INVALIDATE follows:
>=20
> int64=A0=A0 /* H_Success: Return code on successful completion */
> =A0=A0=A0=A0=A0=A0=A0 /* H_Busy - repeat the call with the same */
> =A0=A0=A0=A0=A0=A0=A0 /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid
> 	   parameters */
> hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT
> 					translation
> 					lookaside information */
> =A0=A0=A0=A0=A0 uint64 id,=A0 =A0=A0=A0=A0=A0 /* PID/LPID to invalidate */
> =A0=A0=A0=A0=A0 uint64 target,=A0=A0=A0 /* Invalidation target */
> =A0=A0=A0=A0=A0 uint64 type,=A0=A0=A0=A0=A0 /* Type of lookaside informat=
ion */
> =A0=A0=A0=A0=A0 uint64 pg_sizes,  /* Page sizes */
> =A0=A0=A0=A0=A0 uint64 start,=A0=A0=A0=A0 /* Start of Effective Address (=
EA)
> 			   range (inclusive) */
> =A0=A0=A0=A0=A0 uint64 end)=A0=A0=A0=A0=A0=A0 /* End of EA range (exclusi=
ve) */
>=20
> Invalidation targets (target)
> -----------------------------
> Core MMU=A0=A0=A0=A0=A0=A0=A0 0x01 /* All virtual processors in the
> 			partition */
> Core local MMU=A0 0x02 /* Current virtual processor */
> Nest MMU=A0=A0=A0=A0=A0=A0=A0 0x04 /* All nest/accelerator agents
> 			in use by the partition */
>=20
> A combination of the above can be specified,
> except core and core local.
>=20
> Type of translation to invalidate (type)
> ---------------------------------------
> NESTED=A0=A0=A0=A0=A0=A0 0x0001=A0 /* invalidate nested guest partition-s=
cope */
> TLB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0002=A0 /* Invalidate TLB */
> PWC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0004=A0 /* Invalidate Page Walk Cache =
*/
> PRT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0008=A0 /* Invalidate caching of Proce=
ss Table
> 			Entries if NESTED is clear */
> PAT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0008=A0 /* Invalidate caching of Parti=
tion Table
> 			Entries if NESTED is set */
>=20
> A combination of the above can be specified.
>=20
> Page size mask (pages)
> ----------------------
> 4K=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x01
> 64K=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x02
> 2M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x04
> 1G=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x08
> All sizes=A0=A0=A0=A0=A0=A0 (-1UL)
>=20
> A combination of the above can be specified.
> All page sizes can be selected with -1.
>=20
> Semantics: Invalidate radix tree lookaside information
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 matching the parameters given.
> * Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters
>   are different from the defined values.
> * Return H_PARAMETER if NESTED is set and pid is not a valid nested
>   LPID allocated to this partition
> * Return H_P5 if (start, end) doesn't form a valid range. Start and
>   end should be a valid Quadrant address and=A0 end > start.
> * Return H_NotSupported if the partition is not in running in radix
>   translation mode.
> * May invalidate more translation information than requested.
> * If start =3D 0 and end =3D -1, set the range to cover all valid
>   addresses. Else start and end should be aligned to 4kB (lower 11
>   bits clear).
> * If NESTED is clear, then invalidate process scoped lookaside
>   information. Else pid specifies a nested LPID, and the invalidation
>   is performed =A0 on nested guest partition table and nested guest
>   partition scope real addresses.
> * If pid =3D 0 and NESTED is clear, then valid addresses are quadrant 3
>   and quadrant 0 spaces, Else valid addresses are quadrant 0.
> * Pages which are fully covered by the range are to be invalidated.
> =A0 Those which are partially covered are considered outside
>   invalidation range, which allows a caller to optimally invalidate
>   ranges that may =A0 contain mixed page sizes.
> * Return H_SUCCESS on success.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/mmu_context.h |   9 ++
>  arch/powerpc/kvm/book3s_hv.c           |  36 ++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c   | 172 +++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
> index 4bc45d3ed8b0..b44f291fc909 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -124,8 +124,17 @@ static inline bool need_extra_context(struct mm_stru=
ct *mm, unsigned long ea)
> =20
>  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_M=
MU)
>  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end);
>  #else
>  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) {=
 }
> +static inline void do_h_rpt_invalidate_prt(unsigned long pid,
> +					   unsigned long lpid,
> +					   unsigned long type,
> +					   unsigned long pg_sizes,
> +					   unsigned long start,
> +					   unsigned long end) { }

Since the only plausible caller is in KVM HV code, why do you need the
#else clause.

>  #endif
> =20
>  extern void switch_cop(struct mm_struct *next);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index bc0813644666..7e6da4687d88 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -76,6 +76,7 @@
>  #include <asm/kvm_book3s_uvmem.h>
>  #include <asm/ultravisor.h>
>  #include <asm/dtl.h>
> +#include <asm/plpar_wrappers.h>
> =20
>  #include "book3s.h"
> =20
> @@ -924,6 +925,32 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
cpu)
>  	return yield_count;
>  }
> =20
> +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> +				    unsigned long id, unsigned long target,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	if (!kvm_is_radix(vcpu->kvm))
> +		return H_UNSUPPORTED;
> +
> +	if (end < start)
> +		return H_P5;
> +
> +	/*
> +	 * Partition-scoped invalidation for nested guests.
> +	 * Not yet supported
> +	 */
> +	if (type & H_RPTI_TYPE_NESTED)
> +		return H_P3;
> +
> +	/*
> +	 * Process-scoped invalidation for L1 guests.
> +	 */
> +	do_h_rpt_invalidate_prt(id, vcpu->kvm->arch.lpid,
> +				type, pg_sizes, start, end);
> +	return H_SUCCESS;
> +}
> +
>  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> @@ -1132,6 +1159,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  		 */
>  		ret =3D kvmppc_h_svm_init_abort(vcpu->kvm);
>  		break;
> +	case H_RPT_INVALIDATE:
> +		ret =3D kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
> +					      kvmppc_get_gpr(vcpu, 5),
> +					      kvmppc_get_gpr(vcpu, 6),
> +					      kvmppc_get_gpr(vcpu, 7),
> +					      kvmppc_get_gpr(vcpu, 8),
> +					      kvmppc_get_gpr(vcpu, 9));
> +		break;
> =20
>  	default:
>  		return RESUME_HOST;
> @@ -1178,6 +1213,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 409e61210789..cdd98b9e7b15 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -130,6 +130,21 @@ static __always_inline void __tlbie_pid(unsigned lon=
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
> @@ -190,6 +205,23 @@ static __always_inline void __tlbie_va(unsigned long=
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
> @@ -235,6 +267,22 @@ static inline void fixup_tlbie_va_range(unsigned lon=
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
> @@ -254,6 +302,25 @@ static inline void fixup_tlbie_pid(unsigned long pid)
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
> @@ -344,6 +411,31 @@ static inline void _tlbie_pid(unsigned long pid, uns=
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
> @@ -469,6 +561,20 @@ static inline void __tlbie_va_range(unsigned long st=
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
> @@ -549,6 +655,18 @@ static inline void _tlbie_va_range(unsigned long sta=
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
> @@ -1381,4 +1499,58 @@ extern void radix_kvm_prefetch_workaround(struct m=
m_struct *mm)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
> +
> +/*
> + * Performs process-scoped invalidations for a given LPID
> + * as part of H_RPT_INVALIDATE hcall.
> + */
> +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end)
> +{
> +	unsigned long psize, nr_pages;
> +	struct mmu_psize_def *def;
> +	bool flush_pid;
> +
> +	/*
> +	 * A H_RPTI_TYPE_ALL request implies RIC=3D3, hence
> +	 * do a single IS=3D1 based flush.
> +	 */
> +	if ((type & H_RPTI_TYPE_ALL) =3D=3D H_RPTI_TYPE_ALL) {
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
> +		return;
> +	}
> +
> +	if (type & H_RPTI_TYPE_PWC)
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> +
> +	/* Full PID flush */
> +	if (start =3D=3D 0 && end =3D=3D -1)
> +		return _tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> +
> +	/* Do range invalidation for all the valid page sizes */
> +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def =3D &mmu_psize_defs[psize];
> +		if (!(pg_sizes & def->h_rpt_pgsize))
> +			continue;
> +
> +		nr_pages =3D (end - start) >> def->shift;
> +		flush_pid =3D nr_pages > tlb_single_page_flush_ceiling;
> +
> +		/*
> +		 * If the number of pages spanning the range is above
> +		 * the ceiling, convert the request into a full PID flush.
> +		 * And since PID flush takes out all the page sizes, there
> +		 * is no need to consider remaining page sizes.
> +		 */
> +		if (flush_pid) {
> +			_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> +			return;
> +		}
> +		_tlbie_va_range_lpid(start, end, pid, lpid,
> +				     (1UL << def->shift), psize, false);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
> +
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kmxHPmCrK2EERXPh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDijbcACgkQbDjKyiDZ
s5L2MQ//QAyidiy3+M1WyK2a3cM20vlZD/zwXv+yw6E1q7EvW6ypxSqLOA6zMyOd
/NCECT85byTMlEUraZdajPnpQ9WD/EZ0nR3sOMiY26/MZzWcBl8d5nYGXOycmPAW
nufGLaSRYAc/Rd8sV2aSVGrMlWgpbNYfX3K13qv/2Ca7CFqt1vQ25gUqJRqEqE9x
9YF7vbaUQ8GKvgMyTi0aqPBtConRJg3W15vKJJNIWXU4aMz0kkh60+BZCQleXu+5
CWCzVspk7w/WbL3vLOMWDBx5C82JqNhRqM5OuhieRMtIcmmEZwTIKuMGIPborCk5
pO3RSk9mY0ic01UBpsFta9b68zM9oM2Gc1zZyzgqf6l33eRKRclosymjDxJPaP0R
RWIrwDE4JUCi28SheRwiVM5Q7Ldys75RuG/jD84gVK6nNe7VJrwIuSYA6VvRcphY
VUXFWCE4Kh74zACfwjqKuHVw/xPQrmn72GZ31RkGUC5C0kXJZ467hVHsPTViNDrc
Pu8qJxcwM1t/YHgYeRmj7tpu8mUNJHZOGmlGzqjDPrWOD/jCzJIa3Er4NaawvivY
uu0OT+XJcf4h/obWOpeJVf4WumS8GK72TS+8wN+gbMYRBHFLKtMIp0xDyo1ABSuS
133Jnzza38jbLrK64Jfq7kDYc4n4HmZbBDKcTitd8Jfy9uGqz5s=
=b1Tf
-----END PGP SIGNATURE-----

--kmxHPmCrK2EERXPh--
