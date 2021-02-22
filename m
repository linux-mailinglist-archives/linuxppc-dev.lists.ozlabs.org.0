Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A20EC321108
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 07:52:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkXtW31K3z3cHn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 17:52:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaA6kSVp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KaA6kSVp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkXt41MPFz30QV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 17:52:11 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11M6ig6o181460; Mon, 22 Feb 2021 01:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=4bU8O6VeC5HCUQ/g84Bg+yPcpVPXzrwvztrftIBwMgc=;
 b=KaA6kSVphEEDhCckUBiy50LDK4P94Knp0PghJGMXaRx9GfY5cgw4hJeseJklvXzuLvBj
 0Z8oX6WKAyPXb6CiZGx4A8o0Pt8WxcUNQP1LJDt60qAViGHIOS8TUAIfWyo11G+l64hJ
 /n0PtxXg4K8m0qnhE8Pbsv9/bNv3USc+tMNNoeES6sVZJCSxj3xD9Fo9Vv47J9ei23At
 uNqZYx6fl3/fQxCuk0n0JMQfwq9LI+4eOI3prZGNSeuKXhk4MqYlF7lnBdIPrJGySMuv
 PbbK/KPaAeNglezYOqk48U+mI47KCRNiQ7dA+hk8Gemr9l1Gx+MjlY/OlzflGlMaJgFc 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36v7kyr78p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 01:52:04 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11M6iibt181561;
 Mon, 22 Feb 2021 01:49:55 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36v7kyr2d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 01:49:55 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11M6gkra028535;
 Mon, 22 Feb 2021 06:46:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 36tt289brd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 06:46:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11M6kCs443385320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 06:46:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C4B652050;
 Mon, 22 Feb 2021 06:46:12 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.69.50])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id A12A252054;
 Mon, 22 Feb 2021 06:46:10 +0000 (GMT)
Date: Mon, 22 Feb 2021 12:16:08 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 2/3] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <20210222064608.GB3672042@in.ibm.com>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
 <20210215063542.3642366-3-bharata@linux.ibm.com>
 <YCxlb133Hf6hLjuD@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCxlb133Hf6hLjuD@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-21_14:2021-02-18,
 2021-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220057
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

On Wed, Feb 17, 2021 at 11:38:07AM +1100, David Gibson wrote:
> On Mon, Feb 15, 2021 at 12:05:41PM +0530, Bharata B Rao wrote:
> > Implement H_RPT_INVALIDATE hcall and add KVM capability
> > KVM_CAP_PPC_RPT_INVALIDATE to indicate the support for the same.
> > 
> > This hcall does two types of TLB invalidations:
> > 
> > 1. Process-scoped invalidations for guests with LPCR[GTSE]=0.
> >    This is currently not used in KVM as GTSE is not usually
> >    disabled in KVM.
> > 2. Partition-scoped invalidations that an L1 hypervisor does on
> >    behalf of an L2 guest. This replaces the uses of the existing
> >    hcall H_TLB_INVALIDATE.
> > 
> > In order to handle process scoped invalidations of L2, we
> > intercept the nested exit handling code in L0 only to handle
> > H_TLB_INVALIDATE hcall.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  Documentation/virt/kvm/api.rst         | 17 +++++
> >  arch/powerpc/include/asm/kvm_book3s.h  |  3 +
> >  arch/powerpc/include/asm/mmu_context.h | 11 +++
> >  arch/powerpc/kvm/book3s_hv.c           | 91 ++++++++++++++++++++++++
> >  arch/powerpc/kvm/book3s_hv_nested.c    | 96 ++++++++++++++++++++++++++
> >  arch/powerpc/kvm/powerpc.c             |  3 +
> >  arch/powerpc/mm/book3s64/radix_tlb.c   | 25 +++++++
> >  include/uapi/linux/kvm.h               |  1 +
> >  8 files changed, 247 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 99ceb978c8b0..416c36aa35d4 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6038,6 +6038,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit notifications which user space
> >  can then handle to implement model specific MSR handling and/or user notifications
> >  to inform a user that an MSR was not handled.
> >  
> > +7.22 KVM_CAP_PPC_RPT_INVALIDATE
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
> > +This capability is always enabled.
> 
> I guess that means it's always enabled when it's available - I'm
> pretty sure it won't be enabled on POWER8 or on PR KVM.

Correct, will reword this and restrict this to POWER9, radix etc

> 
> > +
> >  8. Other capabilities.
> >  ======================
> >  
> > diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> > index d32ec9ae73bd..0f1c5fa6e8ce 100644
> > --- a/arch/powerpc/include/asm/kvm_book3s.h
> > +++ b/arch/powerpc/include/asm/kvm_book3s.h
> > @@ -298,6 +298,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
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
> > index d5821834dba9..fbf3b5b45fe9 100644
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
> > index 6f612d240392..802cb77c39cc 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -904,6 +904,64 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
> >  	return yield_count;
> >  }
> >  
> > +static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long lpid,
> > +				    unsigned long type, unsigned long pg_sizes,
> > +				    unsigned long start, unsigned long end)
> > +{
> > +	unsigned long psize;
> > +
> > +	if (pg_sizes & H_RPTI_PAGE_64K) {
> > +		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
> > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 16), psize,
> > +				    start, end);
> > +	}
> > +
> > +	if (pg_sizes & H_RPTI_PAGE_2M) {
> > +		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
> > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 21), psize,
> > +				    start, end);
> > +	}
> > +
> > +	if (pg_sizes & H_RPTI_PAGE_1G) {
> > +		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
> > +		do_h_rpt_invalidate(pid, lpid, type, (1UL << 30), psize,
> > +				    start, end);
> > +	}
> 
> Hrm.  Here you're stepping through the hcall defined pagesizes, then
> mapping each one to the Linux internal page size defs.
> 
> It might be more elegant to step through mmu_psize_defs table, and
> conditionally performan an invalidate on that pagesize if the
> corresponding bit in pg_sizes is set (as noted earlier you could
> easily add the H_RPTI_PAGE bit to the table).  That way it's a direct
> table lookup rather than a bunch of ifs or switches.

Yes, let me give this a try.

> 
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
> > +	if (kvmhv_on_pseries())
> > +		return H_UNSUPPORTED;
> 
> This doesn't seem quite right.  If you have multiply nested guests,
> won't the L2 be issueing H_RPT_INVALIDATE hcalls to the L1 on behalf
> of the L3?  The L1 would have to implement them by calling the L0, but
> the L1 can't just reject them, no?
> 
> Likewise for the !H_RPTI_TYPE_NESTED case, but on what happens to be a
> nested guest in any case, couldn't this case legitimately arise and
> need to be handled?

The approach is to handle this hcall on behalf of all the nested
guests in L0 only. I am intercepting the nested exit path precisely
for this as shown in the below hunk.

> > @@ -1573,6 +1640,30 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
> >  		if (!xics_on_xive())
> >  			kvmppc_xics_rm_complete(vcpu, 0);
> >  		break;
> > +	case BOOK3S_INTERRUPT_SYSCALL:
> > +	{
> > +		unsigned long req = kvmppc_get_gpr(vcpu, 3);
> > +
> > +		if (req != H_RPT_INVALIDATE) {
> > +			r = RESUME_HOST;
> > +			break;
> > +		}
> > +
> > +		/*
> > +		 * The H_RPT_INVALIDATE hcalls issued by nested
> > +		 * guest for process scoped invalidations when
> > +		 * GTSE=0 are handled here.
> > +		 */
> > +		do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
> > +					vcpu->arch.nested->shadow_lpid,
> > +					kvmppc_get_gpr(vcpu, 5),
> > +					kvmppc_get_gpr(vcpu, 6),
> > +					kvmppc_get_gpr(vcpu, 7),
> > +					kvmppc_get_gpr(vcpu, 8));
> > +		kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> > +		r = RESUME_GUEST;
> > +		break;
> > +	}
> >  	default:
> >  		r = RESUME_HOST;
> >  		break;

Thanks for your review.

Regards,
Bharata.
