Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8432959C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 03:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqLH32Crhz3d3H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=VhIPrtew;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=VhIPrtew; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqLGc4xtmz30Hs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 13:11:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLGb2S9Xz9s1l; Tue,  2 Mar 2021 13:11:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614651095;
 bh=N5SpZlFa0DvO5VCc2NgpBCWx4y0QoDsKOc+3BmOfvLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VhIPrtewwvWFgQtT/UGnIVwFNpKOWh7nhmIJQgBnFRMrNGkDdElMt2z/DSxjIUBhn
 ROpzgrQDQm8W2TI7ey5GQBCylaVG2rrjllHSqH+SXX3cIK/XY/Pd4r2U+Hd5W0Plqd
 T4gsAujV0aYgNaZoX5Hv7JVAYRxzNOLXUSimjAGQ=
Date: Tue, 2 Mar 2021 12:45:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YD2YrkY0cg+uO+wz@yekko.fritz.box>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
 <20210224082510.3962423-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WHbzqEg2nce2ko86"
Content-Disposition: inline
In-Reply-To: <20210224082510.3962423-3-bharata@linux.ibm.com>
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


--WHbzqEg2nce2ko86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 01:55:09PM +0530, Bharata B Rao wrote:
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
> Process scoped tlbie invalidations from L1 and nested guests
> need RS register for TLBIE instruction to contain both PID and
> LPID.  This patch introduces primitives that execute tlbie
> instruction with both PID and LPID set in prepartion for
> H_RPT_INVALIDATE hcall.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst                |  18 +++
>  .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/include/asm/mmu_context.h        |  11 ++
>  arch/powerpc/kvm/book3s_hv.c                  |  90 +++++++++++
>  arch/powerpc/kvm/book3s_hv_nested.c           |  77 +++++++++
>  arch/powerpc/kvm/powerpc.c                    |   3 +
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 147 +++++++++++++++++-
>  include/uapi/linux/kvm.h                      |   1 +
>  9 files changed, 350 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 45fd862ac128..38ce3f21b21f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6225,6 +6225,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish betwe=
en them.
>  This capability can be used to check / enable 2nd DAWR feature provided
>  by POWER10 processor.
> =20
> +7.23 KVM_CAP_PPC_RPT_INVALIDATE
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
> +This capability is enabled for hypervisors on platforms like POWER9
> +that support radix MMU.

Does this mean that KVM will handle the hypercall, even if not
explicitly enabled by userspace (qemu)?  That's generally not what we
want, since we need to allow qemu to set up backwards compatible
guests.

> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
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
> index 2f5f919f6cd3..a1515f94400e 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -305,6 +305,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0,=
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
> index 652ce85f9410..820caf4e01b7 100644
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
> index 13bad6bf4c95..d83f006fc19d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -921,6 +921,69 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *v=
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
> +	struct mmu_psize_def *def;
> +
> +	for (psize =3D 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def =3D &mmu_psize_defs[psize];
> +		if (pg_sizes & def->h_rpt_pgsize)
> +			do_h_rpt_invalidate(pid, lpid, type,
> +					    (1UL << def->shift), psize,
> +					    start, end);
> +	}
> +}
> +
> +static void kvmppc_nested_rpt_invalidate(struct kvm_vcpu *vcpu)
> +{
> +	do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> +				vcpu->arch.nested->shadow_lpid,
> +				kvmppc_get_gpr(vcpu, 5),
> +				kvmppc_get_gpr(vcpu, 6),
> +				kvmppc_get_gpr(vcpu, 7),
> +				kvmppc_get_gpr(vcpu, 8));
> +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
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
> +	/*
> +	 * For nested guests, this hcall is handled in
> +	 * L0. See kvmppc_handle_nested_exit() for details.
> +	 */
> +	if (kvmhv_on_pseries())
> +		return H_UNSUPPORTED;
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

IIUC, we'll hit this code path if an L1 calls this on behalf of an L2,
whereas we'll hit the nested exit code path going straight to
kvmhv_h_rpti_nested() if an L2 calls it on behalf of an L3.  Is that
right?

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
> @@ -1129,6 +1192,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
> @@ -1175,6 +1246,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> @@ -1590,6 +1662,24 @@ static int kvmppc_handle_nested_exit(struct kvm_vc=
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
> +		 * guests for process scoped invalidations when
> +		 * GTSE=3D0, are handled here in L0.
> +		 */

What if the L2 is not calling this for the GTSE=3D0 case, but on behalf
of an L3?

> +		if (req =3D=3D H_RPT_INVALIDATE) {
> +			kvmppc_nested_rpt_invalidate(vcpu);
> +			r =3D RESUME_GUEST;
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
> index 0cd0e7aad588..ca43b2d38dce 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1191,6 +1191,83 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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

What if this is being called on behalf of an L3 or deeper?  Do we need
something to do a translation from L3 to L2 addresses?

> +	gp =3D kvmhv_find_nested(vcpu->kvm, lpid);
> +	if (!gp)
> +		return H_SUCCESS;
> +
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) =3D=3D H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid);
> +
> +	if ((type & H_RPTI_TYPE_TLB) =3D=3D H_RPTI_TYPE_TLB) {
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
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index a2a68a958fa0..be33b5321a76 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -682,6 +682,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		r =3D !!(hv_enabled && kvmppc_hv_ops->enable_dawr1 &&
>  		       !kvmppc_hv_ops->enable_dawr1(NULL));
>  		break;
> +	case KVM_CAP_PPC_RPT_INVALIDATE:
> +		r =3D 1;
> +		break;
>  #endif
>  	default:
>  		r =3D 0;
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 409e61210789..440d84fffa8c 100644
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
> @@ -1381,4 +1495,29 @@ extern void radix_kvm_prefetch_workaround(struct m=
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
> index 8b281f722e5b..f8c84a62e8f3 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1078,6 +1078,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_DIRTY_LOG_RING 192
>  #define KVM_CAP_X86_BUS_LOCK_EXIT 193
>  #define KVM_CAP_PPC_DAWR1 194
> +#define KVM_CAP_PPC_RPT_INVALIDATE 195
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WHbzqEg2nce2ko86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9mKwACgkQbDjKyiDZ
s5KRww/+JyP9CkcSC4QR+sZMpRdwXWcil4BytU7XwRVosgPmqp7B2RLB8dQUd1Nq
f0zM2/oxVc/2RuTJuQAnDANKHLOD4GBkuPOYeP7UYyP/xRB9v46WiQ8pa5tfsC6j
1fnnRa9mmB/Qj3CySWTezkRONbxtXOeSFQWgfFWJkVA9V28jKdA4fhtVXB+543U5
M/Kp6Iv+C4fFSIQW2viyqsdCu5XbbyPezZekSrQFKevwbJhuVk/C/I/3zCTOQX3k
E7nWfktqsXlTJG1/6Msssx8X0Ahe+J2sONsmfolWjuC6RX5blTAS5kbsyhGnLwUd
kF3y5o4D2sybNHeJYPkj9DmXrVfSImUzatNPsKEEZlj1vyIGTrcIU8OXnUtQ9sBo
7XFW2bBpQU0CR/UiS9TvKJdOn1yMzKJQ/4buuTo8ByVhOeIIpdvZlE6HzZIbxmgx
rycpd71Qs9z7QoLPPdg6y4vzNCVmFZ1qwNi+eATokqX6cQNIxPW/w97Db2lgyTJ5
LRw4D9czJWIB34l8oBrpulUok6cy9fsZFpj5nU6PLaPC1M8OXvY5hxZKzyDdPMLe
gGS/cTEVnu21ZcSMj+3MUHrIxcePP2FLFZ9FtyFgAintwx41xyQNrJH5meTcH3h9
XN2ocVCIHQZJl6uF7TcoLaSeZMaNWHqwt4BozxGLknlK8G0xZkw=
=YoLX
-----END PGP SIGNATURE-----

--WHbzqEg2nce2ko86--
