Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C52DCB87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 04:58:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxJB42bhYzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxJ6y3TczzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 14:55:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=YB7+sPwM; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxJ6y11j6z9sSC; Thu, 17 Dec 2020 14:55:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608177322;
 bh=bzxvxFwbtw5LbfPfDqFGl1KSf8juBPRMQhyox6bJ+gE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YB7+sPwMbKkJLj/wK38OkCmYLSQqKKyFBFNC/YZxnHOwoaypen/4Ji4vjKRyB9QUc
 KQ2IzVlyI88j7Qmb3CUQN0WM96cZq9w0d/cOlYfA1TYv7TjTyjbRQqEDbZItQRweiV
 WImns2BaQhiHj8YhO/X3VJkR168ytPDwIQiPAWGQ=
Date: Thu, 17 Dec 2020 14:42:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <20201217034215.GE310465@yekko.fritz.box>
References: <20201216085447.1265433-1-bharata@linux.ibm.com>
 <20201216085447.1265433-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <20201216085447.1265433-2-bharata@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 02:24:46PM +0530, Bharata B Rao wrote:
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
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst                |  17 +++
>  .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/kvm/book3s_hv.c                  | 121 ++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_nested.c           |  94 ++++++++++++++
>  arch/powerpc/kvm/powerpc.c                    |   3 +
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
>  include/uapi/linux/kvm.h                      |   1 +
>  8 files changed, 257 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index e00a66d72372..5ce237c0d707 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6014,6 +6014,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit not=
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
> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
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
> +
>  static inline int mmu_get_ap(int psize)
>  {
>  	return mmu_psize_defs[psize].ap;
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
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index e3b1839fc251..adf2d1191581 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -904,6 +904,118 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *=
vcpu)
>  	return yield_count;
>  }
> =20
> +static inline void do_tlb_invalidate_all(unsigned long rb, unsigned long=
 rs)
> +{
> +	asm volatile("ptesync" : : : "memory");
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_ALL), "r"(rs)
> +		: "memory");
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
> +
> +static inline void do_tlb_invalidate_pwc(unsigned long rb, unsigned long=
 rs)
> +{
> +	asm volatile("ptesync" : : : "memory");
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_PWC), "r"(rs)
> +		: "memory");
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
> +
> +static inline void do_tlb_invalidate_tlb(unsigned long rb, unsigned long=
 rs)
> +{
> +	asm volatile("ptesync" : : : "memory");
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_TLB), "r"(rs)
> +		: "memory");
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
> +
> +static void do_tlb_invalidate(unsigned long rs, unsigned long target,
> +			      unsigned long type, unsigned long page_size,
> +			      unsigned long ap, unsigned long start,
> +			      unsigned long end)
> +{
> +	unsigned long rb;
> +	unsigned long addr =3D start;
> +
> +	if ((type & H_RPTI_TYPE_ALL) =3D=3D H_RPTI_TYPE_ALL) {
> +		rb =3D PPC_BIT(53); /* IS =3D 1 */
> +		do_tlb_invalidate_all(rb, rs);
> +		return;
> +	}
> +
> +	if (type & H_RPTI_TYPE_PWC) {
> +		rb =3D PPC_BIT(53); /* IS =3D 1 */
> +		do_tlb_invalidate_pwc(rb, rs);
> +	}
> +
> +	if (!addr && end =3D=3D -1) { /* PID */
> +		rb =3D PPC_BIT(53); /* IS =3D 1 */
> +		do_tlb_invalidate_tlb(rb, rs);
> +	} else { /* EA */
> +		do {
> +			rb =3D addr & ~(PPC_BITMASK(52, 63));
> +			rb |=3D ap << PPC_BITLSHIFT(58);
> +			do_tlb_invalidate_tlb(rb, rs);
> +			addr +=3D page_size;
> +		} while (addr < end);
> +	}
> +}
> +
> +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> +				    unsigned long pid, unsigned long target,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	unsigned long rs, ap, psize;
> +
> +	if (!kvm_is_radix(vcpu->kvm))
> +		return H_FUNCTION;

IIUC The cover note said this case was H_NOT_SUPPORTED, rather than H_FUNCT=
ION.

> +
> +	if (end < start)
> +		return H_P5;
> +
> +	if (type & H_RPTI_TYPE_NESTED) {
> +		if (!nesting_enabled(vcpu->kvm))
> +			return H_FUNCTION;

Likewise, I'm not sure that H_FUNCTION is the right choice here.

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
> +	rs =3D pid << PPC_BITLSHIFT(31);
> +	rs |=3D vcpu->kvm->arch.lpid;
> +
> +	if (pg_sizes & H_RPTI_PAGE_64K) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
> +		ap =3D mmu_get_ap(psize);
> +		do_tlb_invalidate(rs, target, type, (1UL << 16), ap, start,
> +				  end);

Should these be conditional on the TLB flag in type?

> +	}
> +
> +	if (pg_sizes & H_RPTI_PAGE_2M) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
> +		ap =3D mmu_get_ap(psize);
> +		do_tlb_invalidate(rs, target, type, (1UL << 21), ap, start,
> +				  end);
> +	}
> +
> +	if (pg_sizes & H_RPTI_PAGE_1G) {
> +		psize =3D rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
> +		ap =3D mmu_get_ap(psize);
> +		do_tlb_invalidate(rs, target, type, (1UL << 30), ap, start,
> +				  end);
> +	}
> +
> +	return H_SUCCESS;
> +}
> +
>  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
> @@ -1112,6 +1224,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
> @@ -1158,6 +1278,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
> =20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 33b58549a9aa..a54ba4b1d4a7 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1149,6 +1149,100 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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
> +	 * Nested KVM issues a L2 lpid flush call when creating
> +	 * partition table entries for L2. This happens even before
> +	 * the corresponding shadow lpid is created in HV. Until
> +	 * this is fixed, ignore such flush requests.
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
> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real addres=
s */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 13999123b735..172a89187116 100644
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
> index b487b489d4b6..3a2b12d1d49b 100644
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
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index ca41220b40b8..c9ece825299e 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_X86_USER_SPACE_MSR 188
>  #define KVM_CAP_X86_MSR_FILTER 189
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
> +#define KVM_CAP_PPC_RPT_INVALIDATE 191
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a05cACgkQbDjKyiDZ
s5J/rRAA177dB03jc65X2MyA5sanYa54+A34mt4egEFiR/u37XpD8MzzKdllLsVm
2sq5qn8xPElMQBWwm82W+XSGzN++BIxvvFl5icwsEs7FKP9qdZyn+0+kbAe1sTg0
gQCBzssbvUlnIQESEu7XoaDeETO1zyju6OAhZcGI/v8+A4+QN9sTawQ6cquvY1F/
OJxsApLGgoNPtGOj1Hk5MrP+fBrMeDNyNjcrcsspurG3xxzyLPh2d0B6plgTT5ak
KS+4ql21pvfp/jmfl0CIVlxS9MNa+yHEUwCdcbqOwrCgUtTbzcLGI3gnPDqhSz7X
D6y5YQBpQWvvzK5Mneqwp5CjdMbLRyZH0oGNDwnpLQ/BcSYfhyMJh+JPrUEORyY2
pMKpjFm63ZlGiJYcCxq5DLQBOnCzpoE7/3jvMaRIwYoBz1WGsd6pKyi5prME8p5J
Qh8KCnR+ij0Zdr2MWPV3MoSO55oRfrv4o+99h/AvzYDXv13TkUVxw381bE7JCo6m
dknz7UV5COCG8NDaIrpNFBi4R6vzPCGtuisLMpwTv19cdpA1EBmFcG+IkbbBHSpq
5cXW4keA+nUidx7s0/I7epzjXWQNuBAuhjPC5BUvJ6W5KBu47mPi8RYBgyZ6yuHD
L/JLHyf3IrikAlUt0toR9PUOjQx+WiaqRibryVRttyL2Wjnxrt8=
=V9xF
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
