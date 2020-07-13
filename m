Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B497021CED7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 07:31:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4shg4pNkzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4sfb0MDwzDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:29:58 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06D51qVj036163; Mon, 13 Jul 2020 01:29:51 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k2q7ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 01:29:51 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D5PZ1n004547;
 Mon, 13 Jul 2020 05:29:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3275281tw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 05:29:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06D5TkEl42336478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 05:29:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3232111C054;
 Mon, 13 Jul 2020 05:29:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6A6411C04C;
 Mon, 13 Jul 2020 05:29:43 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.58.151])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jul 2020 05:29:43 +0000 (GMT)
Date: Mon, 13 Jul 2020 10:59:41 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v3 1/5] KVM: PPC: Book3S HV: Disable page merging in
 H_SVM_INIT_START
Message-ID: <20200713052941.GF7902@in.ibm.com>
References: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
 <1594458827-31866-2-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594458827-31866-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-12_14:2020-07-10,
 2020-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=943 priorityscore=1501 impostorscore=0
 suspectscore=5 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007130034
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

On Sat, Jul 11, 2020 at 02:13:43AM -0700, Ram Pai wrote:
> Merging of pages associated with each memslot of a SVM is
> disabled the page is migrated in H_SVM_PAGE_IN handler.
> 
> This operation should have been done much earlier; the moment the VM
> is initiated for secure-transition. Delaying this operation, increases
> the probability for those pages to acquire new references , making it
> impossible to migrate those pages in H_SVM_PAGE_IN handler.
> 
> Disable page-migration in H_SVM_INIT_START handling.

While it is a good idea to disable KSM merging for all VMAs during
H_SVM_INIT_START, I am curious if you did observe an actual case of
ksm_madvise() failing which resulted in subsequent H_SVM_PAGE_IN
failing to migrate?

> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 96 +++++++++++++++++++++++++++++---------
>  1 file changed, 74 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 3d987b1..bfc3841 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -211,6 +211,65 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
>  	return false;
>  }
>  
> +static int kvmppc_memslot_page_merge(struct kvm *kvm,
> +		struct kvm_memory_slot *memslot, bool merge)
> +{
> +	unsigned long gfn = memslot->base_gfn;
> +	unsigned long end, start = gfn_to_hva(kvm, gfn);
> +	int ret = 0;
> +	struct vm_area_struct *vma;
> +	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
> +
> +	if (kvm_is_error_hva(start))
> +		return H_STATE;

This and other cases below seem to be a new return value from
H_SVM_INIT_START. May be update the documentation too along with
this patch?

> +
> +	end = start + (memslot->npages << PAGE_SHIFT);
> +
> +	down_write(&kvm->mm->mmap_sem);

When you rebase the patches against latest upstream you may want to
replace the above and other instances by mmap_write/read_lock().

> +	do {
> +		vma = find_vma_intersection(kvm->mm, start, end);
> +		if (!vma) {
> +			ret = H_STATE;
> +			break;
> +		}
> +		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> +			  merge_flag, &vma->vm_flags);
> +		if (ret) {
> +			ret = H_STATE;
> +			break;
> +		}
> +		start = vma->vm_end + 1;
> +	} while (end > vma->vm_end);
> +
> +	up_write(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +
> +static int __kvmppc_page_merge(struct kvm *kvm, bool merge)
> +{
> +	struct kvm_memslots *slots;
> +	struct kvm_memory_slot *memslot;
> +	int ret = 0;
> +
> +	slots = kvm_memslots(kvm);
> +	kvm_for_each_memslot(memslot, slots) {
> +		ret = kvmppc_memslot_page_merge(kvm, memslot, merge);
> +		if (ret)
> +			break;
> +	}
> +	return ret;
> +}
> +
> +static inline int kvmppc_disable_page_merge(struct kvm *kvm)
> +{
> +	return __kvmppc_page_merge(kvm, false);
> +}
> +
> +static inline int kvmppc_enable_page_merge(struct kvm *kvm)
> +{
> +	return __kvmppc_page_merge(kvm, true);
> +}
> +
>  unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  {
>  	struct kvm_memslots *slots;
> @@ -232,11 +291,18 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  		return H_AUTHORITY;
>  
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
> +
> +	/* disable page-merging for all memslot */
> +	ret = kvmppc_disable_page_merge(kvm);
> +	if (ret)
> +		goto out;
> +
> +	/* register the memslot */
>  	slots = kvm_memslots(kvm);
>  	kvm_for_each_memslot(memslot, slots) {
>  		if (kvmppc_uvmem_slot_init(kvm, memslot)) {
>  			ret = H_PARAMETER;
> -			goto out;
> +			break;
>  		}
>  		ret = uv_register_mem_slot(kvm->arch.lpid,
>  					   memslot->base_gfn << PAGE_SHIFT,
> @@ -245,9 +311,12 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  		if (ret < 0) {
>  			kvmppc_uvmem_slot_free(kvm, memslot);
>  			ret = H_PARAMETER;
> -			goto out;
> +			break;
>  		}
>  	}
> +
> +	if (ret)
> +		kvmppc_enable_page_merge(kvm);

Is there any use of enabling KSM merging in the failure path here?
Won't UV terminate the VM if H_SVM_INIT_START fails? If there is no need,
you can do away with some extra routines above.

>  out:
>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  	return ret;
> @@ -384,7 +453,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>   */
>  static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  		   unsigned long end, unsigned long gpa, struct kvm *kvm,
> -		   unsigned long page_shift, bool *downgrade)
> +		   unsigned long page_shift)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
>  	struct migrate_vma mig;
> @@ -400,18 +469,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  	mig.src = &src_pfn;
>  	mig.dst = &dst_pfn;
>  
> -	/*
> -	 * We come here with mmap_sem write lock held just for
> -	 * ksm_madvise(), otherwise we only need read mmap_sem.
> -	 * Hence downgrade to read lock once ksm_madvise() is done.
> -	 */
> -	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> -			  MADV_UNMERGEABLE, &vma->vm_flags);

I haven't seen the subsequent patches yet, but guess you are
taking care of disabling KSM mering for hot-plugged memory too.

Regards,
Bharata.
