Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E64374EFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 07:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbMxy0sZ4z30HQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 15:45:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uawYZgue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uawYZgue; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbMxQ4mPGz2ydK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 15:45:29 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id k19so4316720pfu.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 22:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mrgzoIz58auI3YGhEdfQvULCXVTN49CMmSau5OeTjyQ=;
 b=uawYZgueqZibc+iOWJBEPNr4cH9/ysZre09us+Whi+j3TDKg+oZvT5Kv2Al+N5LUM8
 OPI01hWpDNXrhJm+M/XVJYOAPLjbm6FzDLeO++zx+lBIku2KprV1fdC1VSRpj18SNAzG
 Qw0h7bzgqOzEpR43N12JB6Tcj1IeQXxmKKoRAAb4mtdvuV6loGCg0U/oNfw5mKpx7btW
 ptaSsVscE9AnbOZCH5OHUHiltEUID9jzWyggXzrGbASIHd8V3KrAsqXw/aCiK6phe78b
 PPBnyXnkGKeIyTEEcuuJ4nnpRb61RBD2EVZzVxlHHu3rix6wRtyMj0l+ZjPI/1c0ySoq
 YNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mrgzoIz58auI3YGhEdfQvULCXVTN49CMmSau5OeTjyQ=;
 b=HVWfQqVUQH4V7+Yvz6yfRrcV3vn/Llm22PNk1vTO52Ywscocud711e+PAZqatn5Es+
 dAl3VaoDdtESZ/yH2lO171810lnkosDOhEt/vLaFQxKbyEt+uTd/lcnS7y08cTHT9LsJ
 U++gASoprwts4I6a1Ov3lLErzRvI0JoqMsBnp2j6xZEgxB3BpN9fhPQKk8lPeUW9zuEH
 iYqFGx7A+/h8jf4yjAiaruwTGOVlt7DIdQmvhdy3Xr2BI2iOHRSk7aHf9PANhRosTr5W
 fHxSXOwA7xosDcmNOGVM8xp18mWNOAOMxGdMQr3y5vDGhYsF5u+Cf7wtSwK9eEH/wahz
 7q6A==
X-Gm-Message-State: AOAM533kCeFKsX9oOGHCHjZ9p3cL4LxyBlZ+whxhoDe944MxtRcNMwb0
 VPV9f2BZTyDjCeKaaPLuDw7i/c49lZo=
X-Google-Smtp-Source: ABdhPJxzOczM6b2tdJnPF8DgVLayYKJK1NpkITUxp8zgo13ukhMlF1e287BXNX0/zMgi0UeVTqxtcw==
X-Received: by 2002:a05:6a00:1a45:b029:27a:8b43:fa2e with SMTP id
 h5-20020a056a001a45b029027a8b43fa2emr2782345pfv.61.1620279927362; 
 Wed, 05 May 2021 22:45:27 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id h19sm890796pgm.40.2021.05.05.22.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 22:45:27 -0700 (PDT)
Date: Thu, 06 May 2021 15:45:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
To: Bharata B Rao <bharata@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20210505154642.178702-1-bharata@linux.ibm.com>
 <20210505154642.178702-4-bharata@linux.ibm.com>
In-Reply-To: <20210505154642.178702-4-bharata@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620279244.mpmwjm8qjk.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aneesh.kumar@linux.ibm.com, farosas@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Bharata B Rao's message of May 6, 2021 1:46 am:
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
> int64=C2=A0=C2=A0 /* H_Success: Return code on successful completion */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* H_Busy - repeat the call wi=
th the same */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* H_Parameter, H_P2, H_P3, H_=
P4, H_P5 : Invalid
> 	   parameters */
> hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT
> 					translation
> 					lookaside information */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 id,=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* PID/LPID to invalidate */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 target,=C2=A0=C2=A0=C2=A0 /* Invali=
dation target */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 type,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* Type of lookaside information */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 pg_sizes,  /* Page sizes */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 start,=C2=A0=C2=A0=C2=A0=C2=A0 /* S=
tart of Effective Address (EA)
> 			   range (inclusive) */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64 end)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* End of EA range (exclusive) */
>=20
> Invalidation targets (target)
> -----------------------------
> Core MMU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x01 /* All virtual pr=
ocessors in the
> 			partition */
> Core local MMU=C2=A0 0x02 /* Current virtual processor */
> Nest MMU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04 /* All nest/accel=
erator agents
> 			in use by the partition */
>=20
> A combination of the above can be specified,
> except core and core local.
>=20
> Type of translation to invalidate (type)
> ---------------------------------------
> NESTED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0001=C2=A0 /* invalidate nes=
ted guest partition-scope */
> TLB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0002=C2=
=A0 /* Invalidate TLB */
> PWC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0004=C2=
=A0 /* Invalidate Page Walk Cache */
> PRT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0008=C2=
=A0 /* Invalidate caching of Process Table
> 			Entries if NESTED is clear */
> PAT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0008=C2=
=A0 /* Invalidate caching of Partition Table
> 			Entries if NESTED is set */
>=20
> A combination of the above can be specified.
>=20
> Page size mask (pages)
> ----------------------
> 4K=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x01
> 64K=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x02
> 2M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x04
> 1G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x08
> All sizes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-1UL)
>=20
> A combination of the above can be specified.
> All page sizes can be selected with -1.
>=20
> Semantics: Invalidate radix tree lookaside information
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 matching the=
 parameters given.
> * Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters
>   are different from the defined values.
> * Return H_PARAMETER if NESTED is set and pid is not a valid nested
>   LPID allocated to this partition
> * Return H_P5 if (start, end) doesn't form a valid range. Start and
>   end should be a valid Quadrant address and=C2=A0 end > start.
> * Return H_NotSupported if the partition is not in running in radix
>   translation mode.
> * May invalidate more translation information than requested.
> * If start =3D 0 and end =3D -1, set the range to cover all valid
>   addresses. Else start and end should be aligned to 4kB (lower 11
>   bits clear).
> * If NESTED is clear, then invalidate process scoped lookaside
>   information. Else pid specifies a nested LPID, and the invalidation
>   is performed =C2=A0 on nested guest partition table and nested guest
>   partition scope real addresses.
> * If pid =3D 0 and NESTED is clear, then valid addresses are quadrant 3
>   and quadrant 0 spaces, Else valid addresses are quadrant 0.
> * Pages which are fully covered by the range are to be invalidated.
> =C2=A0 Those which are partially covered are considered outside
>   invalidation range, which allows a caller to optimally invalidate
>   ranges that may =C2=A0 contain mixed page sizes.
> * Return H_SUCCESS on success.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  arch/powerpc/include/asm/mmu_context.h |  11 ++
>  arch/powerpc/kvm/book3s_hv.c           |  46 ++++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c   | 148 +++++++++++++++++++++++++
>  3 files changed, 205 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
> index 4bc45d3ed8b0..128760eb598e 100644
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
> index 28a80d240b76..bcf34246bbe9 100644
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
> @@ -924,6 +925,42 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
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

Not that it really matters but why did you go this approach rather than
use a bitmask iteration over h_rpt_pgsize?

I would actually prefer to put this loop into the TLB invalidation code
itself.

The reason is that not all flush types are based on page size. You only
need to do IS=3D1/2/3 flushes once and it takes out all page sizes.

You don't need to do all these optimisations right now, but it would
be good to make them possible to implement.

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
> @@ -1132,6 +1169,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
> @@ -1178,6 +1223,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 409e61210789..65aad9ce3557 100644
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
> @@ -254,6 +302,25 @@ static inline void fixup_tlbie_pid(unsigned long pid=
)
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
> +static inline void _tlbie_pid_lpid(unsigned long pid, unsigned long lpid=
,
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
> @@ -1381,4 +1499,34 @@ extern void radix_kvm_prefetch_workaround(struct m=
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

At least one thing that is probably needed is to use the=20
single_page_flush_ceiling to flip the va range flush over to a pid=20
flush, so the guest can't cause problems in the hypervisor with an=20
enormous range.

Thanks,
Nick

> +}
> +EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
> +
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> --=20
> 2.26.2
>=20
>=20
