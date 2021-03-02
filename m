Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 472923295F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 05:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqQ0R2GdMz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 15:59:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKjicuKs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GKjicuKs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqPzz3Hkxz30QK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 15:59:10 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1224XA3k010239; Mon, 1 Mar 2021 23:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=HhjjglV1umSyp+FFiS8XQATsTlmNAeQkEInKDra7zl0=;
 b=GKjicuKsqbfRXXJUkDWH8Sf5OWt8iaqNwcNzxma7UKH98j3LEpqOiA5GJiBnOnA2aOO5
 MX3sPY1JMGxhcatVmfmy/H+/H2/iBOlU7W0fdgUL2bcOzXKgrYVd0amloC1wjgegN63G
 N/ereZVODAWxppIPCoFH/5ByI+/2ALjBq43xFq6wewiZmAjdC0SRrWfF3acbVs+6nY6y
 yOfRls5qdlyySr4a4JTQy7uzZMUb863uHsfG81m2eZsxBmUHdtxVSJNGDI/mJBlUh4PA
 i23wNBcYNu2W18+LYj6Y9VDjci6RbeR2sYc19PCFr/Tv+pX0NUmYoNjY0QFQn/fH6Goo ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371cv32pyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 23:59:05 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1224uVMR082301;
 Mon, 1 Mar 2021 23:59:02 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371cv32py2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 23:59:02 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1224x0Ne024288;
 Tue, 2 Mar 2021 04:59:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 371162ghcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 04:59:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1224wvqr20316646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 04:58:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4158FA405C;
 Tue,  2 Mar 2021 04:58:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99E07A4062;
 Tue,  2 Mar 2021 04:58:55 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.51.221])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Mar 2021 04:58:55 +0000 (GMT)
Date: Tue, 2 Mar 2021 10:28:53 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <20210302045853.GC188607@in.ibm.com>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
 <20210224082510.3962423-3-bharata@linux.ibm.com>
 <YD2YrkY0cg+uO+wz@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD2YrkY0cg+uO+wz@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_01:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020034
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
Reply-To: bharata@linux.ibm.com
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 02, 2021 at 12:45:18PM +1100, David Gibson wrote:
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 45fd862ac128..38ce3f21b21f 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6225,6 +6225,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish between them.
> >  This capability can be used to check / enable 2nd DAWR feature provided
> >  by POWER10 processor.
> >  
> > +7.23 KVM_CAP_PPC_RPT_INVALIDATE
> > +------------------------------
> > +
> > +:Capability: KVM_CAP_PPC_RPT_INVALIDATE
> > +:Architectures: ppc
> > +:Type: vm
> > +
> > +This capability indicates that the kernel is capable of handling
> > +H_RPT_INVALIDATE hcall.
> > +
> > +In order to enable the use of H_RPT_INVALIDATE in the guest,
> > +user space might have to advertise it for the guest. For example,
> > +IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" is
> > +present in the "ibm,hypertas-functions" device-tree property.
> > +
> > +This capability is enabled for hypervisors on platforms like POWER9
> > +that support radix MMU.
> 
> Does this mean that KVM will handle the hypercall, even if not
> explicitly enabled by userspace (qemu)?  That's generally not what we
> want, since we need to allow qemu to set up backwards compatible
> guests.

This capability only indicates that hypervisor supports the hcall.

QEMU will check for this and conditionally enable the hcall
(via KVM_CAP_PPC_ENABLE_HCALL ioctl). Enabling the hcall is
conditional to cap-rpt-invalidate sPAPR machine capability being
enabled by the user. Will post a followup QEMU patch shortly.

Older QEMU patch can be found here:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00627.html

> 
> > +
> >  8. Other capabilities.
> >  ======================
> >  
> > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > index 8b33601cdb9d..a46fd37ad552 100644
> > --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > @@ -4,6 +4,10 @@
> >  
> >  #include <asm/hvcall.h>
> >  
> > +#define RIC_FLUSH_TLB 0
> > +#define RIC_FLUSH_PWC 1
> > +#define RIC_FLUSH_ALL 2
> > +
> >  struct vm_area_struct;
> >  struct mm_struct;
> >  struct mmu_gather;
> > diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> > index 2f5f919f6cd3..a1515f94400e 100644
> > --- a/arch/powerpc/include/asm/kvm_book3s.h
> > +++ b/arch/powerpc/include/asm/kvm_book3s.h
> > @@ -305,6 +305,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
> >  void kvmhv_release_all_nested(struct kvm *kvm);
> >  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
> >  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> > +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> > +			 unsigned long type, unsigned long pg_sizes,
> > +			 unsigned long start, unsigned long end);
> >  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
> >  			  u64 time_limit, unsigned long lpcr);
> >  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> > index 652ce85f9410..820caf4e01b7 100644
> > --- a/arch/powerpc/include/asm/mmu_context.h
> > +++ b/arch/powerpc/include/asm/mmu_context.h
> > @@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
> >  
> >  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
> >  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> > +void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
> > +			 unsigned long type, unsigned long page_size,
> > +			 unsigned long psize, unsigned long start,
> > +			 unsigned long end);
> >  #else
> >  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
> > +static inline void do_h_rpt_invalidate(unsigned long pid,
> > +				       unsigned long lpid,
> > +				       unsigned long type,
> > +				       unsigned long page_size,
> > +				       unsigned long psize,
> > +				       unsigned long start,
> > +				       unsigned long end) { }
> >  #endif
> >  
> >  extern void switch_cop(struct mm_struct *next);
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index 13bad6bf4c95..d83f006fc19d 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -921,6 +921,69 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
> >  	return yield_count;
> >  }
> >  
> > +static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long lpid,
> > +				    unsigned long type, unsigned long pg_sizes,
> > +				    unsigned long start, unsigned long end)
> > +{
> > +	unsigned long psize;
> > +	struct mmu_psize_def *def;
> > +
> > +	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> > +		def = &mmu_psize_defs[psize];
> > +		if (pg_sizes & def->h_rpt_pgsize)
> > +			do_h_rpt_invalidate(pid, lpid, type,
> > +					    (1UL << def->shift), psize,
> > +					    start, end);
> > +	}
> > +}
> > +
> > +static void kvmppc_nested_rpt_invalidate(struct kvm_vcpu *vcpu)
> > +{
> > +	do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> > +				vcpu->arch.nested->shadow_lpid,
> > +				kvmppc_get_gpr(vcpu, 5),
> > +				kvmppc_get_gpr(vcpu, 6),
> > +				kvmppc_get_gpr(vcpu, 7),
> > +				kvmppc_get_gpr(vcpu, 8));
> > +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> > +}
> > +
> > +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> > +				    unsigned long pid, unsigned long target,
> > +				    unsigned long type, unsigned long pg_sizes,
> > +				    unsigned long start, unsigned long end)
> > +{
> > +	if (!kvm_is_radix(vcpu->kvm))
> > +		return H_UNSUPPORTED;
> > +
> > +	/*
> > +	 * For nested guests, this hcall is handled in
> > +	 * L0. See kvmppc_handle_nested_exit() for details.
> > +	 */
> > +	if (kvmhv_on_pseries())
> > +		return H_UNSUPPORTED;
> > +
> > +	if (end < start)
> > +		return H_P5;
> > +
> > +	if (type & H_RPTI_TYPE_NESTED) {
> > +		if (!nesting_enabled(vcpu->kvm))
> > +			return H_FUNCTION;
> > +
> > +		/* Support only cores as target */
> > +		if (target != H_RPTI_TARGET_CMMU)
> > +			return H_P2;
> > +
> 
> IIUC, we'll hit this code path if an L1 calls this on behalf of an L2,

Correct.

> whereas we'll hit the nested exit code path going straight to
> kvmhv_h_rpti_nested() if an L2 calls it on behalf of an L3.  Is that
> right?

We will hit the nested exit code path when L2 calls it on behalf
of L3. Looks like I am not handling this case (hcall issued by
L2 on behalf of L3 for handling partition scoped translations)
in the nested exit path.

> 
> > +		return kvmhv_h_rpti_nested(vcpu, pid,
> > +					   (type & ~H_RPTI_TYPE_NESTED),
> > +					    pg_sizes, start, end);
> > +	}
> > +
> > +	do_h_rpt_invalidate_prs(pid, vcpu->kvm->arch.lpid, type, pg_sizes,
> > +				start, end);
> > +	return H_SUCCESS;
> > +}
> > +
> >  int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
> >  {
> >  	unsigned long req = kvmppc_get_gpr(vcpu, 3);
> > @@ -1129,6 +1192,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
> >  		 */
> >  		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
> >  		break;
> > +	case H_RPT_INVALIDATE:
> > +		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
> > +					      kvmppc_get_gpr(vcpu, 5),
> > +					      kvmppc_get_gpr(vcpu, 6),
> > +					      kvmppc_get_gpr(vcpu, 7),
> > +					      kvmppc_get_gpr(vcpu, 8),
> > +					      kvmppc_get_gpr(vcpu, 9));
> > +		break;
> >  
> >  	default:
> >  		return RESUME_HOST;
> > @@ -1175,6 +1246,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
> >  	case H_XIRR_X:
> >  #endif
> >  	case H_PAGE_INIT:
> > +	case H_RPT_INVALIDATE:
> >  		return 1;
> >  	}
> >  
> > @@ -1590,6 +1662,24 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
> >  		if (!xics_on_xive())
> >  			kvmppc_xics_rm_complete(vcpu, 0);
> >  		break;
> > +	case BOOK3S_INTERRUPT_SYSCALL:
> > +	{
> > +		unsigned long req = kvmppc_get_gpr(vcpu, 3);
> > +
> > +		/*
> > +		 * The H_RPT_INVALIDATE hcalls issued by nested
> > +		 * guests for process scoped invalidations when
> > +		 * GTSE=0, are handled here in L0.
> > +		 */
> 
> What if the L2 is not calling this for the GTSE=0 case, but on behalf
> of an L3?

That case would be for flushing partition scoped translations. I am
realizing that I am not handling that case, but it should be handled
here in the nested hcall exit path.

Currently I am handling only the hcall requests for process scoped
translations from nested guests here.

> 
> > +		if (req == H_RPT_INVALIDATE) {
> > +			kvmppc_nested_rpt_invalidate(vcpu);
> > +			r = RESUME_GUEST;
> > +			break;
> > +		}
> > +
> > +		r = RESUME_HOST;
> > +		break;
> > +	}
> >  	default:
> >  		r = RESUME_HOST;
> >  		break;
> > diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> > index 0cd0e7aad588..ca43b2d38dce 100644
> > --- a/arch/powerpc/kvm/book3s_hv_nested.c
> > +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> > @@ -1191,6 +1191,83 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
> >  	return H_SUCCESS;
> >  }
> >  
> > +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> > +					 unsigned long lpid,
> > +					 unsigned long page_size,
> > +					 unsigned long ap,
> > +					 unsigned long start,
> > +					 unsigned long end)
> > +{
> > +	unsigned long addr = start;
> > +	int ret;
> > +
> > +	do {
> > +		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> > +						   get_epn(addr));
> > +		if (ret)
> > +			return ret;
> > +		addr += page_size;
> > +	} while (addr < end);
> > +
> > +	return ret;
> > +}
> > +
> > +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> > +					 unsigned long lpid)
> > +{
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_nested_guest *gp;
> > +
> > +	gp = kvmhv_get_nested(kvm, lpid, false);
> > +	if (gp) {
> > +		kvmhv_emulate_tlbie_lpid(vcpu, gp, RIC_FLUSH_ALL);
> > +		kvmhv_put_nested(gp);
> > +	}
> > +	return H_SUCCESS;
> > +}
> > +
> > +long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
> > +			 unsigned long type, unsigned long pg_sizes,
> > +			 unsigned long start, unsigned long end)
> > +{
> > +	struct kvm_nested_guest *gp;
> > +	long ret;
> > +	unsigned long psize, ap;
> > +
> > +	/*
> > +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> > +	 *
> > +	 * However, nested KVM issues a L2 lpid flush call when creating
> > +	 * partition table entries for L2. This happens even before the
> > +	 * corresponding shadow lpid is created in HV which happens in
> > +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> > +	 * the invalid case, we ignore such flush requests and return success.
> > +	 */
> 
> What if this is being called on behalf of an L3 or deeper?  Do we need
> something to do a translation from L3 to L2 addresses?

I am not sure, I will have to check if gp->shadow_lpid points to
correct nested LPID in all the cases.

> 
> > +	gp = kvmhv_find_nested(vcpu->kvm, lpid);
> > +	if (!gp)
> > +		return H_SUCCESS;

Regards,
Bharata.
