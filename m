Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17A3240F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 16:58:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm0vl16P0z3cYw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 02:58:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OsAPFgxy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OsAPFgxy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm0vH0LTGz30N7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 02:58:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OFYJpS022690; Wed, 24 Feb 2021 10:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UrVOSvWg0c2dV2deXCUUrxiAWOO+e3PANzUynE73xMk=;
 b=OsAPFgxyq3lJO5DiuDyJ2dzZ/QXc6q6aCLB31VIM7XuaNet/9NW1b64uMaNoJL2pSFPU
 2/ztMbr1VOD5xzIEOE/MdPdAdsP1sjzVtrjxLjBYz7nMdMtn7y5xSk7HXuioWtTH6WQM
 YFuVOyBn9eBF6BcXWskTZne+ZsTE8uOPo2LHbWYUuMlDgv87XSByxz8VxapXPZV2G/S6
 sGh7IEXclclBlkMLPnnVRolgcPw26SyFQCpvap1lGzIFQWDi4aMBdBL4j5h2XNy6xJ9f
 wcgZuzL42r5Mhiu92yLPRKCYtReN0ZUwu3DzcA5UY7jGNk7P+ca/17sahQxjhMI7o2dk /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36waua013d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 10:58:12 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11OFYoeM023854;
 Wed, 24 Feb 2021 10:58:11 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36waua011d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 10:58:11 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OFvRvN020917;
 Wed, 24 Feb 2021 15:58:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 36tt29ynue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 15:58:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OFw5de25231754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 15:58:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A40FD112065;
 Wed, 24 Feb 2021 15:58:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A650E112061;
 Wed, 24 Feb 2021 15:58:04 +0000 (GMT)
Received: from localhost (unknown [9.77.137.15])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Feb 2021 15:58:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
In-Reply-To: <20210224082510.3962423-3-bharata@linux.ibm.com>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
 <20210224082510.3962423-3-bharata@linux.ibm.com>
Date: Wed, 24 Feb 2021 12:58:02 -0300
Message-ID: <87blc9xxth.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_06:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102240121
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> Implement H_RPT_INVALIDATE hcall and add KVM capability
> KVM_CAP_PPC_RPT_INVALIDATE to indicate the support for the same.
>
> This hcall does two types of TLB invalidations:
>
> 1. Process-scoped invalidations for guests with LPCR[GTSE]=0.
>    This is currently not used in KVM as GTSE is not usually
>    disabled in KVM.
> 2. Partition-scoped invalidations that an L1 hypervisor does on
>    behalf of an L2 guest. This replaces the uses of the existing
>    hcall H_TLB_INVALIDATE.
>
> In order to handle process scoped invalidations of L2, we
> intercept the nested exit handling code in L0 only to handle
> H_TLB_INVALIDATE hcall.
>
> Process scoped tlbie invalidations from L1 and nested guests
> need RS register for TLBIE instruction to contain both PID and
> LPID.  This patch introduces primitives that execute tlbie
> instruction with both PID and LPID set in prepartion for
> H_RPT_INVALIDATE hcall.
>
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
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 45fd862ac128..38ce3f21b21f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6225,6 +6225,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish between them.
>  This capability can be used to check / enable 2nd DAWR feature provided
>  by POWER10 processor.
>  
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
> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> index 8b33601cdb9d..a46fd37ad552 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -4,6 +4,10 @@
>  
>  #include <asm/hvcall.h>
>  
> +#define RIC_FLUSH_TLB 0
> +#define RIC_FLUSH_PWC 1
> +#define RIC_FLUSH_ALL 2
> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index 2f5f919f6cd3..a1515f94400e 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -305,6 +305,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			 unsigned long type, unsigned long pg_sizes,
> +			 unsigned long start, unsigned long end);
>  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  			  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 652ce85f9410..820caf4e01b7 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
>  
>  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
>  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> +void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
> +			 unsigned long type, unsigned long page_size,
> +			 unsigned long psize, unsigned long start,
> +			 unsigned long end);
>  #else
>  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
> +static inline void do_h_rpt_invalidate(unsigned long pid,
> +				       unsigned long lpid,
> +				       unsigned long type,
> +				       unsigned long page_size,
> +				       unsigned long psize,
> +				       unsigned long start,
> +				       unsigned long end) { }
>  #endif
>  
>  extern void switch_cop(struct mm_struct *next);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 13bad6bf4c95..d83f006fc19d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -921,6 +921,69 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
>  	return yield_count;
>  }
>  
> +static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long lpid,
> +				    unsigned long type, unsigned long pg_sizes,
> +				    unsigned long start, unsigned long end)
> +{
> +	unsigned long psize;
> +	struct mmu_psize_def *def;
> +
> +	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def = &mmu_psize_defs[psize];
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
> +		if (target != H_RPTI_TARGET_CMMU)
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
>  	unsigned long req = kvmppc_get_gpr(vcpu, 3);
> @@ -1129,6 +1192,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  		 */
>  		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
>  		break;
> +	case H_RPT_INVALIDATE:
> +		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
> +					      kvmppc_get_gpr(vcpu, 5),
> +					      kvmppc_get_gpr(vcpu, 6),
> +					      kvmppc_get_gpr(vcpu, 7),
> +					      kvmppc_get_gpr(vcpu, 8),
> +					      kvmppc_get_gpr(vcpu, 9));
> +		break;
>  
>  	default:
>  		return RESUME_HOST;
> @@ -1175,6 +1246,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  	case H_XIRR_X:
>  #endif
>  	case H_PAGE_INIT:
> +	case H_RPT_INVALIDATE:
>  		return 1;
>  	}
>  
> @@ -1590,6 +1662,24 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
>  		if (!xics_on_xive())
>  			kvmppc_xics_rm_complete(vcpu, 0);
>  		break;
> +	case BOOK3S_INTERRUPT_SYSCALL:
> +	{
> +		unsigned long req = kvmppc_get_gpr(vcpu, 3);
> +
> +		/*
> +		 * The H_RPT_INVALIDATE hcalls issued by nested
> +		 * guests for process scoped invalidations when
> +		 * GTSE=0, are handled here in L0.
> +		 */
> +		if (req == H_RPT_INVALIDATE) {
> +			kvmppc_nested_rpt_invalidate(vcpu);
> +			r = RESUME_GUEST;
> +			break;
> +		}

I'm inclined to say this is a bit too early. We're handling the hcall
before kvmhv_run_single_vcpu has fully finished and we'll skip some
code that has been running in all guest exits:

	if (trap) {
		if (!nested)
			r = kvmppc_handle_exit_hv(vcpu, current);
		else
			r = kvmppc_handle_nested_exit(vcpu);  <--- we're here
	}
	vcpu->arch.ret = r;

        (...)

	vcpu->arch.ceded = 0;

	vc->vcore_state = VCORE_INACTIVE;
	trace_kvmppc_run_core(vc, 1);

 done:
	kvmppc_remove_runnable(vc, vcpu);
	trace_kvmppc_run_vcpu_exit(vcpu);

	return vcpu->arch.ret;

Especially the kvmppc_remove_runnable function because it sets the
vcpu state:

    	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;

which should be the case if we're handling a hypercall.

I suggest we do similarly to the L1 exit code and defer the hcall
handling until after kvmppc_run_single_vcpu has exited, still inside the
is_kvmppc_resume_guest(r) loop.

So we'd set:
case BOOK3S_INTERRUPT_SYSCALL:
	vcpu->run->exit_reason = KVM_EXIT_PAPR_HCALL;
	r = RESUME_HOST;
        break;

and perhaps introduce a new kvmppc_pseries_do_nested_hcall that's called
after kvmppc_run_single_vcpu.

> +
> +		r = RESUME_HOST;
> +		break;
> +	}
>  	default:
>  		r = RESUME_HOST;
>  		break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 0cd0e7aad588..ca43b2d38dce 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1191,6 +1191,83 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
>  	return H_SUCCESS;
>  }
>  
> +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long ap,
> +					 unsigned long start,
> +					 unsigned long end)
> +{
> +	unsigned long addr = start;
> +	int ret;
> +
> +	do {
> +		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> +						   get_epn(addr));
> +		if (ret)
> +			return ret;
> +		addr += page_size;
> +	} while (addr < end);
> +
> +	return ret;
> +}
> +
> +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_nested_guest *gp;
> +
> +	gp = kvmhv_get_nested(kvm, lpid, false);
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
> +	gp = kvmhv_find_nested(vcpu->kvm, lpid);
> +	if (!gp)
> +		return H_SUCCESS;
> +
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid);
> +
> +	if ((type & H_RPTI_TYPE_TLB) == H_RPTI_TYPE_TLB) {
> +		struct mmu_psize_def *def;
> +
> +		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> +			def = &mmu_psize_defs[psize];
> +			if (!(pg_sizes & def->h_rpt_pgsize))
> +				continue;
> +
> +			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << def->shift),
> +							   ap, start, end);
> +			if (ret)
> +				return H_P4;
> +		}
> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real address */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index a2a68a958fa0..be33b5321a76 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -682,6 +682,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = !!(hv_enabled && kvmppc_hv_ops->enable_dawr1 &&
>  		       !kvmppc_hv_ops->enable_dawr1(NULL));
>  		break;
> +	case KVM_CAP_PPC_RPT_INVALIDATE:
> +		r = 1;
> +		break;
>  #endif
>  	default:
>  		r = 0;
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 409e61210789..440d84fffa8c 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -20,10 +20,6 @@
>  
>  #include "internal.h"
>  
> -#define RIC_FLUSH_TLB 0
> -#define RIC_FLUSH_PWC 1
> -#define RIC_FLUSH_ALL 2
> -
>  /*
>   * tlbiel instruction for radix, set invalidation
>   * i.e., r=1 and is=01 or is=10 or is=11
> @@ -130,6 +126,21 @@ static __always_inline void __tlbie_pid(unsigned long pid, unsigned long ric)
>  	trace_tlbie(0, 0, rb, rs, ric, prs, r);
>  }
>  
> +static __always_inline void __tlbie_pid_lpid(unsigned long pid,
> +					     unsigned long lpid,
> +					     unsigned long ric)
> +{
> +	unsigned long rb, rs, prs, r;
> +
> +	rb = PPC_BIT(53); /* IS = 1 */
> +	rs = (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
> +	prs = 1; /* process scoped */
> +	r = 1;   /* radix format */
> +
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
> +	trace_tlbie(0, 0, rb, rs, ric, prs, r);
> +}
>  static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
>  {
>  	unsigned long rb,rs,prs,r;
> @@ -190,6 +201,23 @@ static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
>  	trace_tlbie(0, 0, rb, rs, ric, prs, r);
>  }
>  
> +static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned long pid,
> +					    unsigned long lpid,
> +					    unsigned long ap, unsigned long ric)
> +{
> +	unsigned long rb, rs, prs, r;
> +
> +	rb = va & ~(PPC_BITMASK(52, 63));
> +	rb |= ap << PPC_BITLSHIFT(58);
> +	rs = (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
> +	prs = 1; /* process scoped */
> +	r = 1;   /* radix format */
> +
> +	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
> +		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
> +	trace_tlbie(0, 0, rb, rs, ric, prs, r);
> +}
> +
>  static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
>  					    unsigned long ap, unsigned long ric)
>  {
> @@ -235,6 +263,22 @@ static inline void fixup_tlbie_va_range(unsigned long va, unsigned long pid,
>  	}
>  }
>  
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
>  
> +static inline void fixup_tlbie_pid_lpid(unsigned long pid, unsigned long lpid)
> +{
> +	/*
> +	 * We can use any address for the invalidation, pick one which is
> +	 * probably unused as an optimisation.
> +	 */
> +	unsigned long va = ((1UL << 52) - 1);
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
>  
>  static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long lpid,
>  				       unsigned long ap)
> @@ -344,6 +407,31 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
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
> @@ -469,6 +557,20 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
>  	fixup_tlbie_va_range(addr - page_size, pid, ap);
>  }
>  
> +static inline void __tlbie_va_range_lpid(unsigned long start, unsigned long end,
> +					 unsigned long pid, unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long psize)
> +{
> +	unsigned long addr;
> +	unsigned long ap = mmu_get_ap(psize);
> +
> +	for (addr = start; addr < end; addr += page_size)
> +		__tlbie_va_lpid(addr, pid, lpid, ap, RIC_FLUSH_TLB);
> +
> +	fixup_tlbie_va_range_lpid(addr - page_size, pid, lpid, ap);
> +}
> +
>  static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
>  				      unsigned long psize, unsigned long ric)
>  {
> @@ -549,6 +651,18 @@ static inline void _tlbie_va_range(unsigned long start, unsigned long end,
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
> +static inline void _tlbie_va_range_lpid(unsigned long start, unsigned long end,
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
> @@ -1381,4 +1495,29 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
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
> +	if ((type & H_RPTI_TYPE_ALL) == H_RPTI_TYPE_ALL) {
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
> +		return;
> +	}
> +
> +	if (type & H_RPTI_TYPE_PWC)
> +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> +
> +	if (!start && end == -1) /* PID */
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
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
