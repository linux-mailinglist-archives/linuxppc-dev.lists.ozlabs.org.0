Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF622065A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 09:37:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B68PJ0ytNzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 17:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B68MT5V3WzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 17:36:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F7WPtr039167; Wed, 15 Jul 2020 03:36:10 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329d9hu0e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 03:36:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F7PPwj020862;
 Wed, 15 Jul 2020 07:36:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgv1w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 07:36:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F7a50A19202220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 07:36:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A714A4060;
 Wed, 15 Jul 2020 07:36:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8F1FA4062;
 Wed, 15 Jul 2020 07:36:02 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.50.82])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 07:36:02 +0000 (GMT)
Date: Wed, 15 Jul 2020 13:06:00 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v3 1/5] KVM: PPC: Book3S HV: Disable page merging in
 H_SVM_INIT_START
Message-ID: <20200715073600.GJ7902@in.ibm.com>
References: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
 <1594458827-31866-2-git-send-email-linuxram@us.ibm.com>
 <20200713052941.GF7902@in.ibm.com>
 <20200715051614.GE7339@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715051614.GE7339@oc0525413822.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_05:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=5 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150059
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 10:16:14PM -0700, Ram Pai wrote:
> On Mon, Jul 13, 2020 at 10:59:41AM +0530, Bharata B Rao wrote:
> > On Sat, Jul 11, 2020 at 02:13:43AM -0700, Ram Pai wrote:
> > > Merging of pages associated with each memslot of a SVM is
> > > disabled the page is migrated in H_SVM_PAGE_IN handler.
> > > 
> > > This operation should have been done much earlier; the moment the VM
> > > is initiated for secure-transition. Delaying this operation, increases
> > > the probability for those pages to acquire new references , making it
> > > impossible to migrate those pages in H_SVM_PAGE_IN handler.
> > > 
> > > Disable page-migration in H_SVM_INIT_START handling.
> > 
> > While it is a good idea to disable KSM merging for all VMAs during
> > H_SVM_INIT_START, I am curious if you did observe an actual case of
> > ksm_madvise() failing which resulted in subsequent H_SVM_PAGE_IN
> > failing to migrate?
> 
> No. I did not find any ksm_madvise() failing.  But it did not make sense
> to ksm_madvise() everytime a page_in was requested. Hence i proposed
> this patch. H_SVM_INIT_START is the right place for ksm_advise().

Indeed yes. Then you may want to update the description which currently
seems to imply that this change is being done to avoid issues arising
out of delayed KSM unmerging advice.

> 
> > 
> > > 
> > > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_uvmem.c | 96 +++++++++++++++++++++++++++++---------
> > >  1 file changed, 74 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > index 3d987b1..bfc3841 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > @@ -211,6 +211,65 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
> > >  	return false;
> > >  }
> > >  
> > > +static int kvmppc_memslot_page_merge(struct kvm *kvm,
> > > +		struct kvm_memory_slot *memslot, bool merge)
> > > +{
> > > +	unsigned long gfn = memslot->base_gfn;
> > > +	unsigned long end, start = gfn_to_hva(kvm, gfn);
> > > +	int ret = 0;
> > > +	struct vm_area_struct *vma;
> > > +	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
> > > +
> > > +	if (kvm_is_error_hva(start))
> > > +		return H_STATE;
> > 
> > This and other cases below seem to be a new return value from
> > H_SVM_INIT_START. May be update the documentation too along with
> > this patch?
> 
> ok.
> 
> > 
> > > +
> > > +	end = start + (memslot->npages << PAGE_SHIFT);
> > > +
> > > +	down_write(&kvm->mm->mmap_sem);
> > 
> > When you rebase the patches against latest upstream you may want to
> > replace the above and other instances by mmap_write/read_lock().
> 
> ok.
> 
> > 
> > > +	do {
> > > +		vma = find_vma_intersection(kvm->mm, start, end);
> > > +		if (!vma) {
> > > +			ret = H_STATE;
> > > +			break;
> > > +		}
> > > +		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > > +			  merge_flag, &vma->vm_flags);
> > > +		if (ret) {
> > > +			ret = H_STATE;
> > > +			break;
> > > +		}
> > > +		start = vma->vm_end + 1;
> > > +	} while (end > vma->vm_end);
> > > +
> > > +	up_write(&kvm->mm->mmap_sem);
> > > +	return ret;
> > > +}
> > > +
> > > +static int __kvmppc_page_merge(struct kvm *kvm, bool merge)
> > > +{
> > > +	struct kvm_memslots *slots;
> > > +	struct kvm_memory_slot *memslot;
> > > +	int ret = 0;
> > > +
> > > +	slots = kvm_memslots(kvm);
> > > +	kvm_for_each_memslot(memslot, slots) {
> > > +		ret = kvmppc_memslot_page_merge(kvm, memslot, merge);
> > > +		if (ret)
> > > +			break;
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +static inline int kvmppc_disable_page_merge(struct kvm *kvm)
> > > +{
> > > +	return __kvmppc_page_merge(kvm, false);
> > > +}
> > > +
> > > +static inline int kvmppc_enable_page_merge(struct kvm *kvm)
> > > +{
> > > +	return __kvmppc_page_merge(kvm, true);
> > > +}
> > > +
> > >  unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> > >  {
> > >  	struct kvm_memslots *slots;
> > > @@ -232,11 +291,18 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> > >  		return H_AUTHORITY;
> > >  
> > >  	srcu_idx = srcu_read_lock(&kvm->srcu);
> > > +
> > > +	/* disable page-merging for all memslot */
> > > +	ret = kvmppc_disable_page_merge(kvm);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	/* register the memslot */
> > >  	slots = kvm_memslots(kvm);
> > >  	kvm_for_each_memslot(memslot, slots) {
> > >  		if (kvmppc_uvmem_slot_init(kvm, memslot)) {
> > >  			ret = H_PARAMETER;
> > > -			goto out;
> > > +			break;
> > >  		}
> > >  		ret = uv_register_mem_slot(kvm->arch.lpid,
> > >  					   memslot->base_gfn << PAGE_SHIFT,
> > > @@ -245,9 +311,12 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> > >  		if (ret < 0) {
> > >  			kvmppc_uvmem_slot_free(kvm, memslot);
> > >  			ret = H_PARAMETER;
> > > -			goto out;
> > > +			break;
> > >  		}
> > >  	}
> > > +
> > > +	if (ret)
> > > +		kvmppc_enable_page_merge(kvm);
> > 
> > Is there any use of enabling KSM merging in the failure path here?
> > Won't UV terminate the VM if H_SVM_INIT_START fails? If there is no need,
> > you can do away with some extra routines above.
> 
> UV will terminate it. But I did not want to tie that assumption into
> this function.

Hmm ok, but having code around which isn't expected to be executed at all
was my concern.

Regards,
Bharata.
