Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9531D378
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 01:39:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgJrN449Cz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 11:39:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WGNk6k5K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WGNk6k5K; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgJqV4Jc3z30hy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 11:38:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgJqV1S6tz9sVF; Wed, 17 Feb 2021 11:38:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613522326;
 bh=e6e72J43BbBFKa4anYat7mwH8WFwvQF97+Gzai1Lye0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGNk6k5K+6+deSeJsGn7Q5zv6u3dWjXXMqi2KxUEoy2iGfx+H+ebUv6T2NfKA7aOj
 cA/Hse/w35Gh9i7yulJMkXxjx+As3dgCjHGxN/YzjchqhEvnZ25yEpVnSrG+qJJiSJ
 fnN2y7dIgJFN4MvV+iy6sws+ni3hidHRxMgSrKJs=
Date: Wed, 17 Feb 2021 11:38:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YCxlb133Hf6hLjuD@yekko.fritz.box>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
 <20210215063542.3642366-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mf0YK2Ltrr6Rjl9/"
Content-Disposition: inline
In-Reply-To: <20210215063542.3642366-3-bharata@linux.ibm.com>
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


--mf0YK2Ltrr6Rjl9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 12:05:41PM +0530, Bharata B Rao wrote:
> Implement H_RPT_INVALIDATE hcall and add KVM capability
> KVM_CAP_PPC_RPT_INVALIDATE to indicate the support for the same.
>=20
> This hcall does two types of TLB invalidations:
>=20
> 1. Process-scoped invalidations for guests with LPCR[GTSE]=3D0.
>    This is currently not used in KVM as GTSE is not usually
>    disabled in KVM.
> 2. Partition-scoped invalidations that an L1 hypervisor does on
>    behalf of an L2 guest. This replaces the uses of the existing
>    hcall H_TLB_INVALIDATE.
>=20
> In order to handle process scoped invalidations of L2, we
> intercept the nested exit handling code in L0 only to handle
> H_TLB_INVALIDATE hcall.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst         | 17 +++++
>  arch/powerpc/include/asm/kvm_book3s.h  |  3 +
>  arch/powerpc/include/asm/mmu_context.h | 11 +++
>  arch/powerpc/kvm/book3s_hv.c           | 91 ++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_nested.c    | 96 ++++++++++++++++++++++++++
>  arch/powerpc/kvm/powerpc.c             |  3 +
>  arch/powerpc/mm/book3s64/radix_tlb.c   | 25 +++++++
>  include/uapi/linux/kvm.h               |  1 +
>  8 files changed, 247 insertions(+)
>=20
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 99ceb978c8b0..416c36aa35d4 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6038,6 +6038,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit not=
ifications which user space
>  can then handle to implement model specific MSR handling and/or user not=
ifications
>  to inform a user that an MSR was not handled.
> =20
> +7.22 KVM_CAP_PPC_RPT_INVALIDATE
> +------------------------------
> +
> +:Capability: KVM_CAP_PPC_RPT_INVALIDATE
> +:Architectures: ppc
> +:Type: vm
> +
> +This capability indicates that the kernel is capable of handling
> +H_RPT_INVALIDATE hcall.
> +
> +In order to enable the use of H_RPT_INVALIDATE in the guest,
> +user space might have to advertise it for the guest. For example,
> +IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" is
> +present in the "ibm,hypertas-functions" device-tree property.
> +
> +This capability is always enabled.

I guess that means it's always enabled when it's available - I'm
pretty sure it won't be enabled on POWER8 or on PR KVM.

> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index d32ec9ae73bd..0f1c5fa6e8ce 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -298,6 +298,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0,=
 u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			 unsigned long type, unsigned long pg_sizes,
> +			 unsigned long start, unsigned long end);
>  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  			  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr=
);
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
> index d5821834dba9..fbf3b5b45fe9 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_stru=
ct *mm, unsigned long ea)
> =20
>  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_M=
MU)
>  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> +void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
> +			 unsigned long type, unsigned long page_size,
> +			 unsigned long psize, unsigned long start,
> +			 unsigned long end);
>  #else
>  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) {=
 }
> +static inline void do_h_rpt_invalidate(unsigned long pid,
> +				       unsigned long lpid,
> +				       unsigned long type,
> +				       unsigned long page_size,
> +				       unsigned long psize,
> +				       unsigned long start,
> +				       unsigned long end) { }
>  #endif
> =20
>  extern void switch_cop(struct mm_struct *next);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6f612d240392..802cb77c39cc 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -904,6 +904,64 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
cpu)
>  	return yield_count;
>  }
> =20
> +static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long lpi=
d,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	unsigned long psize;
> +
> +	if (pg_sizes & H_RPTI_PAGE_64K) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
> +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 16), psize,
> +				    start, end);
> +	}
> +
> +	if (pg_sizes & H_RPTI_PAGE_2M) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
> +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 21), psize,
> +				    start, end);
> +	}
> +
> +	if (pg_sizes & H_RPTI_PAGE_1G) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
> +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 30), psize,
> +				    start, end);
> +	}

Hrm.  Here you're stepping through the hcall defined pagesizes, then
mapping each one to the Linux internal page size defs.

It might be more elegant to step through mmu_psize_defs table, and
conditionally performan an invalidate on that pagesize if the
corresponding bit in pg_sizes is set (as noted earlier you could
easily add the H_RPTI_PAGE bit to the table).  That way it's a direct
table lookup rather than a bunch of ifs or switches.

> +}
> +
> +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> +				    unsigned long pid, unsigned long target,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	if (!kvm_is_radix(vcpu->kvm))
> +		return H_UNSUPPORTED;
> +
> +	if (kvmhv_on_pseries())
> +		return H_UNSUPPORTED;

This doesn't seem quite right.  If you have multiply nested guests,
won't the L2 be issueing H_RPT_INVALIDATE hcalls to the L1 on behalf
of the L3?  The L1 would have to implement them by calling the L0, but
the L1 can't just reject them, no?

Likewise for the !H_RPTI_TYPE_NESTED case, but on what happens to be a
nested guest in any case, couldn't this case legitimately arise and
need to be handled?

> +
> +	if (end < start)
> +		return H_P5;
> +
> +	if (type & H_RPTI_TYPE_NESTED) {
> +		if (!nesting_enabled(vcpu->kvm))
> +			return H_FUNCTION;
> +
> +		/* Support only cores as target */
> +		if (target !=3D H_RPTI_TARGET_CMMU)
> +			return H_P2;
> +
> +		return kvmhv_h_rpti_nested(vcpu, pid,
> +					   (type & ~H_RPTI_TYPE_NESTED),
> +					    pg_sizes, start, end);
> +	}
> +
> +	do_h_rpt_invalidate_prs(pid, vcpu->kvm->arch.lpid, type, pg_sizes,
> +				start, end);
> +	return H_SUCCESS;
> +}
> +
>  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> @@ -1112,6 +1170,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
> @@ -1158,6 +1224,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> @@ -1573,6 +1640,30 @@ static int kvmppc_handle_nested_exit(struct kvm_vc=
pu *vcpu)
>  		if (!xics_on_xive())
>  			kvmppc_xics_rm_complete(vcpu, 0);
>  		break;
> +	case BOOK3S_INTERRUPT_SYSCALL:
> +	{
> +		unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> +
> +		if (req !=3D H_RPT_INVALIDATE) {
> +			r =3D RESUME_HOST;
> +			break;
> +		}
> +
> +		/*
> +		 * The H_RPT_INVALIDATE hcalls issued by nested
> +		 * guest for process scoped invalidations when
> +		 * GTSE=3D0 are handled here.
> +		 */
> +		do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> +					vcpu->arch.nested->shadow_lpid,
> +					kvmppc_get_gpr(vcpu, 5),
> +					kvmppc_get_gpr(vcpu, 6),
> +					kvmppc_get_gpr(vcpu, 7),
> +					kvmppc_get_gpr(vcpu, 8));
> +		kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> +		r =3D RESUME_GUEST;
> +		break;
> +	}
>  	default:
>  		r =3D RESUME_HOST;
>  		break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 33b58549a9aa..40ed4eb80adb 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1149,6 +1149,102 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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
> +
> +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid)
> +{
> +	struct kvm *kvm =3D vcpu->kvm;
> +	struct kvm_nested_guest *gp;
> +
> +	gp =3D kvmhv_get_nested(kvm, lpid, false);
> +	if (gp) {
> +		kvmhv_emulate_tlbie_lpid(vcpu, gp, RIC_FLUSH_ALL);
> +		kvmhv_put_nested(gp);
> +	}
> +	return H_SUCCESS;
> +}
> +
> +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			 unsigned long type, unsigned long pg_sizes,
> +			 unsigned long start, unsigned long end)
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
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) =3D=3D H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid);
> +
> +	if ((type & H_RPTI_TYPE_TLB) =3D=3D H_RPTI_TYPE_TLB) {
> +		if (pg_sizes & H_RPTI_PAGE_64K) {
> +			psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
> +			ap =3D mmu_get_ap(psize);
> +
> +			ret =3D do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << 16),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}
> +
> +		if (pg_sizes & H_RPTI_PAGE_2M) {
> +			psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
> +			ap =3D mmu_get_ap(psize);
> +
> +			ret =3D do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << 21),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}
> +
> +		if (pg_sizes & H_RPTI_PAGE_1G) {
> +			psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
> +			ap =3D mmu_get_ap(psize);
> +
> +			ret =3D do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << 30),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}

Again it might be more elegant to step through the pagesizes from the
mmu_psize_defs side, rather than from the pg_sizes side.

> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real addres=
s */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index cf52d26f49cd..5388cd4a206a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -678,6 +678,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		r =3D hv_enabled && kvmppc_hv_ops->enable_svm &&
>  			!kvmppc_hv_ops->enable_svm(NULL);
>  		break;
> +	case KVM_CAP_PPC_RPT_INVALIDATE:
> +		r =3D 1;
> +		break;
>  #endif
>  	default:
>  		r =3D 0;
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 097402435303..4f746d34b420 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1400,4 +1400,29 @@ extern void radix_kvm_prefetch_workaround(struct m=
m_struct *mm)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
> +
> +/*
> + * Process-scoped invalidations for a given LPID.
> + */
> +void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
> +			 unsigned long type, unsigned long page_size,
> +			 unsigned long psize, unsigned long start,
> +			 unsigned long end)
> +{
> +	if ((type & H_RPTI_TYPE_ALL) =3D=3D H_RPTI_TYPE_ALL) {
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
> +		return;
> +	}
> +
> +	if (type & H_RPTI_TYPE_PWC)
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> +
> +	if (!start && end =3D=3D -1) /* PID */
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> +	else /* EA */
> +		_tlbie_va_range_lpid(start, end, pid, lpid, page_size,
> +				     psize, false);
> +}
> +EXPORT_SYMBOL_GPL(do_h_rpt_invalidate);
> +
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 374c67875cdb..6fd530fae452 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1058,6 +1058,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>  #define KVM_CAP_DIRTY_LOG_RING 192
> +#define KVM_CAP_PPC_RPT_INVALIDATE 193
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mf0YK2Ltrr6Rjl9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsZW0ACgkQbDjKyiDZ
s5KPAA//X0R/LsJLqKI0+qn1XLnnWyNdbQCYS9MxLmLWd5E2OxvbHOz+wi1tY8BN
7jUIjzXCmT+92B5xTRS5fc2uBKPU7V2v3oNqdT3HsQLeMYNlRXw0SR/dF9+kle9t
wL12xLV9TL9w44IGE4j54k+6a0+gMEXQYPMdamv18kLpY72+r0emnrWV51HFfby9
+3dIedyUapYw9TCjBdZ2fw2VsLzlzkigbMVNcRq2xB4Win+hHJryCZaL//5MbXR3
5hDzKtwHXkwptK4IkLl/K2VZVeKICEDP+y1TaAZ3kRdwW+wxSGn7cfASBHgIaykX
A6LRKLNTIYbDzD265AFFyRekbb2He+04MVttDLAHv5nZDJOhotM6RIjbs2XG1ntm
QvxQUTazEFfNXP7GAtvk/iBQMaZvunfgpp+cmWz44hpM63cNXJhD8XqpQ5H303Ee
Uoc5cElpHjDQp1V2651N7CPD0vhczLE89jSt9qimd5Fn0EqPRGC1FThydFBCAt3o
8PQkGHrF6l4Fw3Qn/eLsleuvW70WNj6LS47vC1leqCIUdqT97hufKTJIhqO+MXbv
IlQZjaWK6z4R3uuIKwo+7dD0H/XAj7Ej6DJ9G0g2aOlrdqIuDHXhjwz5T2Tk86cq
CAlmgiVH7N9tiWLi1164JEMMdPz86Xx9rQ0x1l7ZDearS0Ugwv0=
=WVl6
-----END PGP SIGNATURE-----

--mf0YK2Ltrr6Rjl9/--
