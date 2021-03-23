Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3834558A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4FrR5J9Sz3c1s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:37:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=iO5nWtlC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=iO5nWtlC; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Fq37371z30Bk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:35:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Fq26SB4z9sS8; Tue, 23 Mar 2021 13:35:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616466958;
 bh=N89rimpg6MSUiaOv9SYI9x6BFHUIYS1VvYsVCIcQ5C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iO5nWtlC8w1RiSX9UDUsa2merWYjQsmBYCmWoQEn6xdCDOJKRIhvVErDoksZ/cHB/
 ie2eBFUd0MM5j6NZDz3LzxBTA3muHU0HpJC3ByZ/rwrpJzS6RDI+lj2lCnjZUPpBgW
 OmGs5hZTjzTIoZ0aApgEto/PPBCijWTa2xmlTOFE=
Date: Tue, 23 Mar 2021 13:26:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YFlR8BROYwX0i0A9@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-4-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="27Kb1Mwjc5GFA/S8"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-4-bharata@linux.ibm.com>
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


--27Kb1Mwjc5GFA/S8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:36PM +0530, Bharata B Rao wrote:
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

with the exception of one nit noted below.

> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
>  arch/powerpc/include/asm/mmu_context.h        |  11 ++
>  arch/powerpc/kvm/book3s_hv.c                  |  46 ++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 152 +++++++++++++++++-
>  4 files changed, 209 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/p=
owerpc/include/asm/book3s/64/tlbflush-radix.h
> index 8b33601cdb9d..a46fd37ad552 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -4,6 +4,10 @@
> =20
>  #include <asm/hvcall.h>
> =20
> +#define RIC_FLUSH_TLB 0
> +#define RIC_FLUSH_PWC 1
> +#define RIC_FLUSH_ALL 2

Is there a reason for moving these?  You don't appear to be adding a
use of them outside the .c file they were in before.

> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
> index 652ce85f9410..da25aef657c6 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_stru=
ct *mm, unsigned long ea)
> =20
>  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_M=
MU)
>  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> +			     unsigned long type, unsigned long page_size,
> +			     unsigned long psize, unsigned long start,
> +			     unsigned long end);
>  #else
>  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) {=
 }
> +static inline void do_h_rpt_invalidate_prt(unsigned long pid,
> +					   unsigned long lpid,
> +					   unsigned long type,
> +					   unsigned long page_size,
> +					   unsigned long psize,
> +					   unsigned long start,
> +					   unsigned long end) { }
>  #endif
> =20
>  extern void switch_cop(struct mm_struct *next);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 13bad6bf4c95..5d008468347c 100644
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
> @@ -921,6 +922,42 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
cpu)
>  	return yield_count;
>  }
> =20
> +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> +				    unsigned long id, unsigned long target,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	unsigned long psize;
> +	struct mmu_psize_def *def;
> +
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
> +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def =3D &mmu_psize_defs[psize];
> +		if (!(pg_sizes & def->h_rpt_pgsize))
> +			continue;
> +
> +		do_h_rpt_invalidate_prt(id, vcpu->kvm->arch.lpid,
> +					type, (1UL << def->shift),
> +					psize, start, end);
> +	}
> +	return H_SUCCESS;
> +}
> +
>  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> @@ -1129,6 +1166,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
> @@ -1175,6 +1220,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 409e61210789..613198c41006 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -20,10 +20,6 @@
> =20
>  #include "internal.h"
> =20
> -#define RIC_FLUSH_TLB 0
> -#define RIC_FLUSH_PWC 1
> -#define RIC_FLUSH_ALL 2
> -
>  /*
>   * tlbiel instruction for radix, set invalidation
>   * i.e., r=3D1 and is=3D01 or is=3D10 or is=3D11
> @@ -130,6 +126,21 @@ static __always_inline void __tlbie_pid(unsigned lon=
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
> @@ -190,6 +201,23 @@ static __always_inline void __tlbie_va(unsigned long=
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
> @@ -235,6 +263,22 @@ static inline void fixup_tlbie_va_range(unsigned lon=
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
> @@ -254,6 +298,25 @@ static inline void fixup_tlbie_pid(unsigned long pid)
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
> @@ -344,6 +407,31 @@ static inline void _tlbie_pid(unsigned long pid, uns=
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
> @@ -469,6 +557,20 @@ static inline void __tlbie_va_range(unsigned long st=
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
> @@ -549,6 +651,18 @@ static inline void _tlbie_va_range(unsigned long sta=
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
> @@ -1381,4 +1495,34 @@ extern void radix_kvm_prefetch_workaround(struct m=
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
> +			     unsigned long type, unsigned long page_size,
> +			     unsigned long psize, unsigned long start,
> +			     unsigned long end)
> +{
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
> +	if (start =3D=3D 0 && end =3D=3D -1) /* PID */
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> +	else /* EA */
> +		_tlbie_va_range_lpid(start, end, pid, lpid, page_size,
> +				     psize, false);
> +}
> +EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
> +
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--27Kb1Mwjc5GFA/S8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZUfAACgkQbDjKyiDZ
s5KyVRAA1DUYagKEajy7PTvK8lsepxsJcFBhKO2B598Bas/8TZybSly9l+2LK/6+
q/OdO2EfhH7YCaiHLQhPM42Od6TWnVxtRmAh8GVamEh8IOT3VcgRc9ePm5sbvOij
xpcKT0E7oOc7Vzyf1OnL57Caaazv83NstYQsxhPdT3BLaViIIWrSv/dr6Mj7RYHo
jeEpbf2AuGEaOZg4t/fOpccyXdwHj0mQpY7PW6W2mfCqzp1av4BIX05C0DB0WPvI
jRWq0SLKKNfwofkSEYNchc6bvhLr2KAhuDmGfqWU6GEUu3awYUzwzhs2rts/WMM7
NmTkuKfRzZYY/BcJ+6yBx77cxNzhWdEnWxXY/5ISVj3jr+PNhZP2bU7ZeYmDhmK8
/+O2xKQhEsbgWOyUvVbySLOupVp6xKpCuaD7EF+QPlVeasHitmXkwLxITDdiGU5W
XiLDkkkpNDZ5wtHHglaVdxumTZDXTPngZKxxtaLuW7Y6aT/Xzig7twCXOLgGto9x
jlZx9IfiafzBVnLKjSXurwE38Qdkh1t3nWXVw23H7IPUDrdJAPCKFCO43hSdeuPN
MC4lEMun3VYJ/Tyr4Jy0eHWetIkyoBbWHvBkkqy+gH97udOAks2bkdY1JCiCX2E4
gliWNEfcY9RI/Kw9wuDdyVJlxeAkb4/v4b+yWBkMLfkMwOeYAEc=
=UXps
-----END PGP SIGNATURE-----

--27Kb1Mwjc5GFA/S8--
