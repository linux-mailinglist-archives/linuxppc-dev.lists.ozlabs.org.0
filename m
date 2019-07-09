Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72177633E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 12:06:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jdHy4g5hzDqPS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 20:06:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jdFj636MzDqPB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 20:04:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69A2UdP100145
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jul 2019 06:04:06 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tmq454gvf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 06:04:05 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 9 Jul 2019 11:04:04 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 11:04:01 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69A3xV946923860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 10:03:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87EE8AE045;
 Tue,  9 Jul 2019 10:03:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6954AE056;
 Tue,  9 Jul 2019 10:03:57 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.81.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Jul 2019 10:03:57 +0000 (GMT)
Date: Tue, 9 Jul 2019 15:33:53 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v4 1/6] kvmppc: HMM backend driver to manage pages of
 secure guest
References: <20190528064933.23119-1-bharata@linux.ibm.com>
 <20190528064933.23119-2-bharata@linux.ibm.com>
 <20190617053106.lqwzibpsz4d2464z@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617053106.lqwzibpsz4d2464z@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19070910-0008-0000-0000-000002FB39DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070910-0009-0000-0000-0000226899A5
Message-Id: <20190709100353.GA27933@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090122
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2019 at 03:31:06PM +1000, Paul Mackerras wrote:
> On Tue, May 28, 2019 at 12:19:28PM +0530, Bharata B Rao wrote:
> > HMM driver for KVM PPC to manage page transitions of
> > secure guest via H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> > 
> > H_SVM_PAGE_IN: Move the content of a normal page to secure page
> > H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> 
> Comments below...
> 
> > @@ -4421,6 +4435,7 @@ static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *free,
> >  					struct kvm_memory_slot *dont)
> >  {
> >  	if (!dont || free->arch.rmap != dont->arch.rmap) {
> > +		kvmppc_hmm_release_pfns(free);
> 
> I don't think this is the right place to do this.  The memslot will
> have no pages mapped by this time, because higher levels of code will
> have called kvmppc_core_flush_memslot_hv() before calling this.
> Releasing the pfns should be done in that function.

In fact I can get rid of kvmppc_hmm_release_pfns() totally as we don't
have to do free the HMM pages like this explicitly. During guest shutdown
all these pages are dropped when unmap_vmas() is called.

> 
> > diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c b/arch/powerpc/kvm/book3s_hv_hmm.c
> > new file mode 100644
> > index 000000000000..713806003da3
> 
> ...
> 
> > +#define KVMPPC_PFN_HMM		(0x1ULL << 61)
> > +
> > +static inline bool kvmppc_is_hmm_pfn(unsigned long pfn)
> > +{
> > +	return !!(pfn & KVMPPC_PFN_HMM);
> > +}
> 
> Since you are putting in these values in the rmap entries, you need to
> be careful about overlaps between these values and the other uses of
> rmap entries.  The value you have chosen would be in the middle of the
> LPID field for an rmap entry for a guest that has nested guests, and
> in fact kvmhv_remove_nest_rmap_range() effectively assumes that a
> non-zero rmap entry must be a list of L2 guest mappings.  (This is for
> radix guests; HPT guests use the rmap entry differently, but I am
> assuming that we will enforce that only radix guests can be secure
> guests.)

Worked out with Suraj on sharing the rmap and got a well defined
bit slot for HMM PFNs in rmap.

> 
> Maybe it is true that the rmap entry will be non-zero only for those
> guest pages which are not mapped on the host side, that is,
> kvmppc_radix_flush_memslot() will see !pte_present(*ptep) for any page
> of a secure guest where the rmap entry contains a HMM pfn.  If that is
> so and is a deliberate part of the design, then I would like to see it
> written down in comments and commit messages so it's clear to others
> working on the code in future.

Yes, rmap entry will be non-zero only for those guest pages which are
not mapped on the host side. However as soon as guest becomes secure
we free the HV side partition scoped page tables and hence
kvmppc_radix_flush_memslot() and other such routines which lookup
kvm->arch.pgtable will no longer touch it.

> 
> Suraj is working on support for nested HPT guests, which will involve
> changing the rmap format to indicate more explicitly what sort of
> entry each rmap entry is.  Please work with him to define a format for
> your rmap entries that is clearly distinguishable from the others.
> 
> I think it is reasonable to say that a secure guest can't have nested
> guests, at least for now, but then we should make sure to kill all
> nested guests when a guest goes secure.

Ok. Yet to figure this part out.

> 
> ...
> 
> > +/*
> > + * Move page from normal memory to secure memory.
> > + */
> > +unsigned long
> > +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> > +		     unsigned long flags, unsigned long page_shift)
> > +{
> > +	unsigned long addr, end;
> > +	unsigned long src_pfn, dst_pfn;
> > +	struct kvmppc_hmm_migrate_args args;
> > +	struct vm_area_struct *vma;
> > +	int srcu_idx;
> > +	unsigned long gfn = gpa >> page_shift;
> > +	struct kvm_memory_slot *slot;
> > +	unsigned long *rmap;
> > +	int ret = H_SUCCESS;
> > +
> > +	if (page_shift != PAGE_SHIFT)
> > +		return H_P3;
> > +
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	slot = gfn_to_memslot(kvm, gfn);
> > +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> > +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> > +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> 
> Shouldn't we keep the srcu read lock until we have finished working on
> the page?

I wasn't sure, so keeping it locked till the end in the next version.

> 
> > +	if (kvm_is_error_hva(addr))
> > +		return H_PARAMETER;
> > +
> > +	end = addr + (1UL << page_shift);
> > +
> > +	if (flags)
> > +		return H_P2;
> > +
> > +	args.rmap = rmap;
> > +	args.lpid = kvm->arch.lpid;
> > +	args.gpa = gpa;
> > +	args.page_shift = page_shift;
> > +
> > +	down_read(&kvm->mm->mmap_sem);
> > +	vma = find_vma_intersection(kvm->mm, addr, end);
> > +	if (!vma || vma->vm_start > addr || vma->vm_end < end) {
> > +		ret = H_PARAMETER;
> > +		goto out;
> > +	}
> > +	ret = migrate_vma(&kvmppc_hmm_migrate_ops, vma, addr, end,
> > +			  &src_pfn, &dst_pfn, &args);
> > +	if (ret < 0)
> > +		ret = H_PARAMETER;
> > +out:
> > +	up_read(&kvm->mm->mmap_sem);
> > +	return ret;
> > +}
> 
> ...
> 
> > +/*
> > + * Move page from secure memory to normal memory.
> > + */
> > +unsigned long
> > +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
> > +		      unsigned long flags, unsigned long page_shift)
> > +{
> > +	unsigned long addr, end;
> > +	struct vm_area_struct *vma;
> > +	unsigned long src_pfn, dst_pfn = 0;
> > +	int srcu_idx;
> > +	int ret = H_SUCCESS;
> > +
> > +	if (page_shift != PAGE_SHIFT)
> > +		return H_P3;
> > +
> > +	if (flags)
> > +		return H_P2;
> > +
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> > +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> 
> and likewise here, shouldn't we unlock later, after the migrate_vma()
> call perhaps?

Sure.

Regards,
Bharata.

