Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6020C8FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 18:22:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vwrP4y2vzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 02:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vwpl449zzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 02:21:03 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05SG2oQc125770; Sun, 28 Jun 2020 12:20:57 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31x63a307q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jun 2020 12:20:57 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05SGGC0l003582;
 Sun, 28 Jun 2020 16:20:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgrnfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jun 2020 16:20:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05SGKqOo8978812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 28 Jun 2020 16:20:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D4FF42042;
 Sun, 28 Jun 2020 16:20:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F13414203F;
 Sun, 28 Jun 2020 16:20:49 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.74.221])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 28 Jun 2020 16:20:49 +0000 (GMT)
Date: Sun, 28 Jun 2020 21:50:47 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v3 3/4] KVM: PPC: Book3S HV: migrate remaining
 normal-GFNs to secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200628162047.GB27215@in.ibm.com>
References: <1592606622-29884-1-git-send-email-linuxram@us.ibm.com>
 <1592606622-29884-4-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592606622-29884-4-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-28_11:2020-06-26,
 2020-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 spamscore=0 suspectscore=5 clxscore=1015
 cotscore=-2147483648 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006280120
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

On Fri, Jun 19, 2020 at 03:43:41PM -0700, Ram Pai wrote:
> H_SVM_INIT_DONE incorrectly assumes that the Ultravisor has explicitly

As noted in the last iteration, can you reword the above please?
I don't see it as an incorrect assumption, but see it as extension of
scope now :-)

> called H_SVM_PAGE_IN for all secure pages. These GFNs continue to be
> normal GFNs associated with normal PFNs; when infact, these GFNs should
> have been secure GFNs, associated with device PFNs.
> 
> Move all the PFNs associated with the SVM's GFNs, to secure-PFNs, in
> H_SVM_INIT_DONE. Skip the GFNs that are already Paged-in or Shared
> through H_SVM_PAGE_IN, or Paged-in followed by a Paged-out through
> UV_PAGE_OUT.
> 
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  Documentation/powerpc/ultravisor.rst        |   2 +
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h |   2 +
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 154 +++++++++++++++++++++++-----
>  3 files changed, 132 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
> index 363736d..3bc8957 100644
> --- a/Documentation/powerpc/ultravisor.rst
> +++ b/Documentation/powerpc/ultravisor.rst
> @@ -933,6 +933,8 @@ Return values
>  	* H_UNSUPPORTED		if called from the wrong context (e.g.
>  				from an SVM or before an H_SVM_INIT_START
>  				hypercall).
> +	* H_STATE		if the hypervisor could not successfully
> +                                transition the VM to Secure VM.
>  
>  Description
>  ~~~~~~~~~~~
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index 5a9834e..b9cd7eb 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -22,6 +22,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
>  unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
>  void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
> +int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> +			const struct kvm_memory_slot *memslot);
>  #else
>  static inline int kvmppc_uvmem_init(void)
>  {
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index c8c0290..449e8a7 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -93,6 +93,7 @@
>  #include <asm/ultravisor.h>
>  #include <asm/mman.h>
>  #include <asm/kvm_ppc.h>
> +#include <asm/kvm_book3s_uvmem.h>
>  
>  static struct dev_pagemap kvmppc_uvmem_pgmap;
>  static unsigned long *kvmppc_uvmem_bitmap;
> @@ -339,6 +340,21 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
>  	return false;
>  }
>  
> +/* return true, if the GFN is a shared-GFN, or a secure-GFN */
> +bool kvmppc_gfn_has_transitioned(unsigned long gfn, struct kvm *kvm)
> +{
> +	struct kvmppc_uvmem_slot *p;
> +
> +	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
> +		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
> +			unsigned long index = gfn - p->base_pfn;
> +
> +			return (p->pfns[index] & KVMPPC_GFN_FLAG_MASK);
> +		}
> +	}
> +	return false;
> +}
> +
>  unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  {
>  	struct kvm_memslots *slots;
> @@ -379,12 +395,31 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  
>  unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
>  {
> +	struct kvm_memslots *slots;
> +	struct kvm_memory_slot *memslot;
> +	int srcu_idx;
> +	long ret = H_SUCCESS;
> +
>  	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
>  		return H_UNSUPPORTED;
>  
> +	/* migrate any unmoved normal pfn to device pfns*/
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slots = kvm_memslots(kvm);
> +	kvm_for_each_memslot(memslot, slots) {
> +		ret = kvmppc_uv_migrate_mem_slot(kvm, memslot);
> +		if (ret) {
> +			ret = H_STATE;
> +			goto out;
> +		}
> +	}
> +
>  	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
>  	pr_info("LPID %d went secure\n", kvm->arch.lpid);
> -	return H_SUCCESS;
> +
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	return ret;
>  }
>  
>  /*
> @@ -505,12 +540,14 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  }
>  
>  /*
> - * Alloc a PFN from private device memory pool and copy page from normal
> - * memory to secure memory using UV_PAGE_IN uvcall.
> + * Alloc a PFN from private device memory pool. If @pagein is true,
> + * copy page from normal memory to secure memory using UV_PAGE_IN uvcall.
>   */
> -static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
> -		   unsigned long end, unsigned long gpa, struct kvm *kvm,
> -		   unsigned long page_shift, bool *downgrade)
> +static int kvmppc_svm_migrate_page(struct vm_area_struct *vma,
> +		unsigned long start,
> +		unsigned long end, unsigned long gpa, struct kvm *kvm,
> +		unsigned long page_shift,
> +		bool pagein)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
>  	struct migrate_vma mig;
> @@ -526,18 +563,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  	mig.src = &src_pfn;
>  	mig.dst = &dst_pfn;
>  
> -	/*
> -	 * We come here with mmap_sem write lock held just for
> -	 * ksm_madvise(), otherwise we only need read mmap_sem.
> -	 * Hence downgrade to read lock once ksm_madvise() is done.
> -	 */

Can you please retain this comment? This explains why we take write lock
and then downgrade.

> -	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> -			  MADV_UNMERGEABLE, &vma->vm_flags);
> -	downgrade_write(&kvm->mm->mmap_sem);
> -	*downgrade = true;

When I introduced this variable, there was a suggestion to rename it
to "downgraded", but we were a bit late then. When you are touching
this now, can you rename it appropriately?

> -	if (ret)
> -		return ret;
> -
>  	ret = migrate_vma_setup(&mig);
>  	if (ret)
>  		return ret;
> @@ -553,11 +578,16 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  		goto out_finalize;
>  	}
>  
> -	pfn = *mig.src >> MIGRATE_PFN_SHIFT;
> -	spage = migrate_pfn_to_page(*mig.src);
> -	if (spage)
> -		uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
> -			   page_shift);
> +	if (pagein) {
> +		pfn = *mig.src >> MIGRATE_PFN_SHIFT;
> +		spage = migrate_pfn_to_page(*mig.src);
> +		if (spage) {
> +			ret = uv_page_in(kvm->arch.lpid, pfn << page_shift,
> +					gpa, 0, page_shift);
> +			if (ret)
> +				goto out_finalize;
> +		}
> +	}
>  
>  	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>  	migrate_vma_pages(&mig);
> @@ -566,6 +596,66 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  	return ret;
>  }
>  
> +int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> +		const struct kvm_memory_slot *memslot)
> +{
> +	unsigned long gfn = memslot->base_gfn;
> +	unsigned long end;
> +	bool downgrade = false;
> +	struct vm_area_struct *vma;
> +	int i, ret = 0;
> +	unsigned long start = gfn_to_hva(kvm, gfn);
> +
> +	if (kvm_is_error_hva(start))
> +		return H_STATE;
> +
> +	end = start + (memslot->npages << PAGE_SHIFT);
> +
> +	down_write(&kvm->mm->mmap_sem);
> +
> +	mutex_lock(&kvm->arch.uvmem_lock);
> +	vma = find_vma_intersection(kvm->mm, start, end);
> +	if (!vma || vma->vm_start > start || vma->vm_end < end) {
> +		ret = H_STATE;
> +		goto out_unlock;
> +	}
> +
> +	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> +			  MADV_UNMERGEABLE, &vma->vm_flags);
> +	downgrade_write(&kvm->mm->mmap_sem);
> +	downgrade = true;
> +	if (ret) {
> +		ret = H_STATE;
> +		goto out_unlock;
> +	}
> +
> +	for (i = 0; i < memslot->npages; i++, ++gfn) {
> +		/*
> +		 * skip GFNs that have already tranistioned.
> +		 * paged-in GFNs, shared GFNs, paged-in GFNs
> +		 * that were later paged-out.
> +		 */
> +		if (kvmppc_gfn_has_transitioned(gfn, kvm))
> +			continue;
> +
> +		start = gfn_to_hva(kvm, gfn);
> +		end = start + (1UL << PAGE_SHIFT);
> +		ret = kvmppc_svm_migrate_page(vma, start, end,
> +			(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
> +

As I said last time, you are assuming that the vma that you obtained
in the beginning actually spans the entire memslot range. This might
be true as you haven't found any issues during testing, but I feel it
is better if there is no such implicit assumption in the code here.

Regards,
Bharata.
