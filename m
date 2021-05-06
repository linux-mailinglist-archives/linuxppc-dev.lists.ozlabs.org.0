Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0B374F47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 08:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbNcL4wVHz30KL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 16:15:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r2X0F861;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r2X0F861; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbNbr67qWz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 16:15:19 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id m11so4304766pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 23:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=RYGMKvLdhHaiW+5w8dw4tlxBEo2lnGTqKCN4U8KmnCI=;
 b=r2X0F861nqPFgXtxIp2324xvrAv8G9wkreNoHClbkF++RfzYQgbw0qTG7EaKfJ4Ivs
 +yPQuz5s6G2Q0p7pnqIknxsVDRSKjkgL0Hp8hogf4i9irXg154Bj4OreR3M+Iq0CtTMT
 OEopPasFiuSe4UH4YAkYLUlD2rzaTyuI97fhatqOFzxI4E0MLZBnbpAzQbLRkIqyvK53
 F4uPq2z9D3uXSjXAXUHUd8mB0PI4mb3pXxcoGHzxJE15pQ5AYaiMZUqVf+Sqa7jGUDbC
 tr6MJDwontjd5M3LgMEQbeAL0qCYSFmz9J/bq+lWiV9FK3G2noibfJidve/T/IK1pS/i
 Wvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RYGMKvLdhHaiW+5w8dw4tlxBEo2lnGTqKCN4U8KmnCI=;
 b=OJTiQ/W5rsmuNNX31tXscM89BTPGiynVrRpQwy5Gd30iY2VWyOcWtxnyHw8CiDWs+U
 XkL1WGJVaV0BtaLgALOSdMyZmJIhM1y3QRh07AQiT0f3vk6ypMvmN7EmNAy5MT9T44Cz
 CD4Ceaz30CZ2b5zkuKvDFXogoXMt7C1VAap76MUxPn2be/mPBAPK/rlipGnsqxOrSKov
 u/kSBPwIhsfVfNXVdjluD4QrwWEyLjMYFFFPul36tbLO+47Euk9/RVR1+roU3iQ4slmf
 df61Orq8T2G26b3Z5b7NvUFk6G6WQPii2rf3r3JgJG2vnHaaJe+xkONuPU8aq8HeMQlg
 elBQ==
X-Gm-Message-State: AOAM530jGW3nJt90HM8+Mf00v407j15YP+ILY7pwWwEG+DRHy09ygceM
 B3HigPvibOkaGK9yYVU6AX4=
X-Google-Smtp-Source: ABdhPJyn6jDGzS2a7VaMHpmkTJlrkUTjYHwLokG5QJOl/xSfg/H57irnkdmfbAIyDcGgDavL+Ikb4w==
X-Received: by 2002:a62:18d7:0:b029:28c:fdfa:f95b with SMTP id
 206-20020a6218d70000b029028cfdfaf95bmr2862279pfy.57.1620281716238; 
 Wed, 05 May 2021 23:15:16 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id h36sm974025pgh.63.2021.05.05.23.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:15:15 -0700 (PDT)
Date: Thu, 06 May 2021 16:15:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
To: Bharata B Rao <bharata@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20210505154642.178702-1-bharata@linux.ibm.com>
 <20210505154642.178702-5-bharata@linux.ibm.com>
In-Reply-To: <20210505154642.178702-5-bharata@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620280840.cytifux60q.astroid@bobo.none>
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
> Enable support for process-scoped invalidations from nested
> guests and partition-scoped invalidations for nested guests.
>=20
> Process-scoped invalidations for any level of nested guests
> are handled by implementing H_RPT_INVALIDATE handler in the
> nested guest exit path in L0.
>=20
> Partition-scoped invalidation requests are forwarded to the
> right nested guest, handled there and passed down to L0
> for eventual handling.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 	[Nested guest partition-scoped invalidation changes]
> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/kvm/book3s_hv.c                  |  66 ++++++++++-
>  arch/powerpc/kvm/book3s_hv_nested.c           | 104 ++++++++++++++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
>  5 files changed, 174 insertions(+), 7 deletions(-)
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
> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index a6e9a5585e61..fdf54741c58c 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -307,6 +307,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0,=
 u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end);
>  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  			  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr=
);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index bcf34246bbe9..a2e7fbec796a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -925,6 +925,41 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
cpu)
>  	return yield_count;
>  }
> =20
> +/*
> + * H_RPT_INVALIDATE hcall handler for nested guests.
> + *
> + * Handles only nested process-scoped invalidation requests in L0.
> + */
> +static int kvmppc_nested_h_rpt_invalidate(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long type =3D kvmppc_get_gpr(vcpu, 6);
> +	unsigned long pid, pg_sizes, start, end, psize;
> +	struct mmu_psize_def *def;
> +
> +	/*
> +	 * The partition-scoped invalidations aren't handled here in L0.
> +	 */
> +	if (type & H_RPTI_TYPE_NESTED)
> +		return RESUME_HOST;
> +
> +	pid =3D kvmppc_get_gpr(vcpu, 4);
> +	pg_sizes =3D kvmppc_get_gpr(vcpu, 7);
> +	start =3D kvmppc_get_gpr(vcpu, 8);
> +	end =3D kvmppc_get_gpr(vcpu, 9);
> +
> +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def =3D &mmu_psize_defs[psize];
> +		if (pg_sizes & def->h_rpt_pgsize)
> +			do_h_rpt_invalidate_prt(pid,
> +						vcpu->arch.nested->shadow_lpid,
> +						type, (1UL << def->shift),
> +						psize, start, end);
> +	}
> +
> +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> +	return RESUME_GUEST;
> +}
> +
>  static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
>  				    unsigned long id, unsigned long target,
>  				    unsigned long type, unsigned long pg_sizes,
> @@ -941,10 +976,18 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu=
 *vcpu,
> =20
>  	/*
>  	 * Partition-scoped invalidation for nested guests.
> -	 * Not yet supported
>  	 */
> -	if (type & H_RPTI_TYPE_NESTED)
> -		return H_P3;
> +	if (type & H_RPTI_TYPE_NESTED) {
> +		if (!nesting_enabled(vcpu->kvm))
> +			return H_FUNCTION;
> +
> +		/* Support only cores as target */
> +		if (target !=3D H_RPTI_TARGET_CMMU)
> +			return H_P2;
> +
> +		return do_h_rpt_invalidate_pat(vcpu, id, type, pg_sizes,
> +					       start, end);
> +	}
> =20
>  	/*
>  	 * Process-scoped invalidation for L1 guests.
> @@ -1639,6 +1682,23 @@ static int kvmppc_handle_nested_exit(struct kvm_vc=
pu *vcpu)
>  		if (!xics_on_xive())
>  			kvmppc_xics_rm_complete(vcpu, 0);
>  		break;
> +	case BOOK3S_INTERRUPT_SYSCALL:
> +	{
> +		unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> +
> +		/*
> +		 * The H_RPT_INVALIDATE hcalls issued by nested
> +		 * guests for process-scoped invalidations when
> +		 * GTSE=3D0, are handled here in L0.
> +		 */
> +		if (req =3D=3D H_RPT_INVALIDATE) {
> +			r =3D kvmppc_nested_h_rpt_invalidate(vcpu);
> +			break;
> +		}
> +
> +		r =3D RESUME_HOST;
> +		break;
> +	}
>  	default:
>  		r =3D RESUME_HOST;
>  		break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 60724f674421..91f10290130d 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1214,6 +1214,110 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
>  	return H_SUCCESS;
>  }
> =20
> +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long ap,
> +					 unsigned long start,
> +					 unsigned long end)
> +{
> +	unsigned long addr =3D start;
> +	int ret;
> +
> +	do {
> +		ret =3D kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> +						   get_epn(addr));
> +		if (ret)
> +			return ret;
> +		addr +=3D page_size;
> +	} while (addr < end);
> +
> +	return ret;
> +}

Similar comments for single page thresholds, and multiple page sizes.

> +
> +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid, unsigned long ric)
> +{
> +	struct kvm *kvm =3D vcpu->kvm;
> +	struct kvm_nested_guest *gp;
> +
> +	gp =3D kvmhv_get_nested(kvm, lpid, false);
> +	if (gp) {
> +		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
> +		kvmhv_put_nested(gp);
> +	}
> +	return H_SUCCESS;
> +}
> +
> +/*
> + * Performs partition-scoped invalidations for nested guests
> + * as part of H_RPT_INVALIDATE hcall.
> + */
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct kvm_nested_guest *gp;
> +	long ret;
> +	unsigned long psize, ap;
> +
> +	/*
> +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> +	 *
> +	 * However, nested KVM issues a L2 lpid flush call when creating
> +	 * partition table entries for L2. This happens even before the
> +	 * corresponding shadow lpid is created in HV which happens in
> +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> +	 * the invalid case, we ignore such flush requests and return success.
> +	 */
> +	gp =3D kvmhv_find_nested(vcpu->kvm, lpid);
> +	if (!gp)
> +		return H_SUCCESS;
> +
> +	/*
> +	 * A flush all request can be handled by a full lpid flush only.
> +	 */
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) =3D=3D H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
> +
> +#if 0
> +	/*
> +	 * We don't need to handle a PWC flush like process table here,
> +	 * because intermediate partition scoped table in nested guest doesn't
> +	 * really have PWC. Only level we have PWC is in L0 and for nested
> +	 * invalidate at L0 we always do kvm_flush_lpid() which does
> +	 * radix__flush_all_lpid(). For range invalidate at any level, we
> +	 * are not removing the higher level page tables and hence there is
> +	 * no PWC invalidate needed.
> +	 */
> +	if (type & H_RPTI_TYPE_PWC) {
> +		ret =3D do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
> +		if (ret)
> +			return H_P4;
> +	}
> +#endif

I think removing this #if 0 and the unnecessary code is fine, just a bit=20
more explanation in the comment would help. And "doesn't really" implies
it sort of might a little bit, I think what you want is "really doesn't"=20
:)

As I understand it, the L0 does not cache any intermediate levels of the
nested guest's partition scope at all. Only the nested HV's pte entries
are copied into the shadow page table, so we only care if the PTEs are
changed, and the PWCs that the processor creates for the shadow page
table are managed by the kvmppc_unmap_pte() etc functions... I think?

Thanks,
Nick

> +
> +	if (start =3D=3D 0 && end =3D=3D -1)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
> +
> +	if (type & H_RPTI_TYPE_TLB) {
> +		struct mmu_psize_def *def;
> +
> +		for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +			def =3D &mmu_psize_defs[psize];
> +			if (!(pg_sizes & def->h_rpt_pgsize))
> +				continue;
> +
> +			ret =3D do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << def->shift),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}
> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real addres=
s */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 65aad9ce3557..613198c41006 100644
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
> --=20
> 2.26.2
>=20
>=20
