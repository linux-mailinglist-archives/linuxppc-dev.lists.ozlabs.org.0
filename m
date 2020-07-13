Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D892821D31E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 11:47:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4zMW3v2qzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4zKK74MJzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 19:45:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06D9WbWY097639; Mon, 13 Jul 2020 05:45:17 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tn94nt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 05:45:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D9cX1K028677;
 Mon, 13 Jul 2020 09:45:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 327527h1eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 09:45:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06D9jCql65208658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 09:45:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B8C14C040;
 Mon, 13 Jul 2020 09:45:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 429F34C04E;
 Mon, 13 Jul 2020 09:45:09 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.58.151])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jul 2020 09:45:09 +0000 (GMT)
Date: Mon, 13 Jul 2020 15:15:06 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v3 3/5] KVM: PPC: Book3S HV: migrate remaining normal-GFNs to
 secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200713094506.GG7902@in.ibm.com>
References: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
 <1594458827-31866-4-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594458827-31866-4-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_04:2020-07-10,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=5 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130071
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

On Sat, Jul 11, 2020 at 02:13:45AM -0700, Ram Pai wrote:
> The Ultravisor is expected to explicitly call H_SVM_PAGE_IN for all the pages
> of the SVM before calling H_SVM_INIT_DONE. This causes a huge delay in
> tranistioning the VM to SVM. The Ultravisor is interested in the pages that
> contain the kernel, initrd and other important data structures. The rest of the
> pages contain throw-away content. Hence requesting just the necessary and
> sufficient pages from the Hypervisor is sufficient.
> 
> However if not all pages are requested by the Ultravisor, the Hypervisor
> continues to consider the GFNs corresponding to the non-requested pages as
> normal GFNs. This can lead to data-corruption and undefined behavior.
> 
> Move all the PFNs associated with the SVM's GFNs to secure-PFNs, in
> H_SVM_INIT_DONE. Skip the GFNs that are already Paged-in or Shared or
> Paged-in followed by a Paged-out.
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
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 166 +++++++++++++++++++++++++---
>  3 files changed, 156 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
> index df136c8..d98fc85 100644
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
> index 9cb7d8b..f229ab5 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -23,6 +23,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
>  unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
>  void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
> +int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> +			const struct kvm_memory_slot *memslot);
>  #else
>  static inline int kvmppc_uvmem_init(void)
>  {
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 6d6c256..12ed52a 100644
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
> @@ -348,6 +349,43 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
>  	return false;
>  }
>  
> +/*
> + * starting from *gfn search for the next available GFN that is not yet
> + * transitioned to a secure GFN.  return the value of that GFN in *gfn.  If a
> + * GFN is found, return true, else return false
> + */
> +static bool kvmppc_next_nontransitioned_gfn(const struct kvm_memory_slot *memslot,
> +		struct kvm *kvm, unsigned long *gfn)
> +{
> +	struct kvmppc_uvmem_slot *p;
> +	bool ret = false;
> +	unsigned long i;
> +
> +	mutex_lock(&kvm->arch.uvmem_lock);
> +
> +	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list)
> +		if (*gfn >= p->base_pfn && *gfn < p->base_pfn + p->nr_pfns)
> +			break;
> +	if (!p)
> +		goto out;
> +	/*
> +	 * The code below assumes, one to one correspondence between
> +	 * kvmppc_uvmem_slot and memslot.
> +	 */
> +	for (i = *gfn; i < p->base_pfn + p->nr_pfns; i++) {
> +		unsigned long index = i - p->base_pfn;
> +
> +		if (!(p->pfns[index] & KVMPPC_GFN_FLAG_MASK)) {
> +			*gfn = i;
> +			ret = true;
> +			break;
> +		}
> +	}
> +out:
> +	mutex_unlock(&kvm->arch.uvmem_lock);
> +	return ret;
> +}
> +
>  static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  		struct kvm_memory_slot *memslot, bool merge)
>  {
> @@ -461,12 +499,31 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
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
> @@ -587,12 +644,14 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
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
> -		   unsigned long page_shift)
> +static int kvmppc_svm_migrate_page(struct vm_area_struct *vma,
> +		unsigned long start,
> +		unsigned long end, unsigned long gpa, struct kvm *kvm,
> +		unsigned long page_shift,
> +		bool pagein)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
>  	struct migrate_vma mig;
> @@ -613,7 +672,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  		return ret;
>  
>  	if (!(*mig.src & MIGRATE_PFN_MIGRATE)) {
> -		ret = -1;
> +		ret = -2;

migrate_vma_setup() has marked that this pfn can't be migrated. What
transient errors are you observing which will disappear within 10
retries?

Also till now when UV used to pull in all the pages, we never seemed to
have hit these transient errors. But now when HV is pushing the same
pages, we see these errors which are disappearing after 10 retries.
Can you explain this more please? What sort of pages are these?

>  		goto out_finalize;
>  	}
>  
> @@ -623,11 +682,16 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
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
> @@ -637,6 +701,77 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  }
>  
>  /*
> + * return 1, if some page migration failed because of transient error,
> + * while the remaining pages migrated successfully.
> + * The caller can use this as a hint to retry.
> + *
> + * return 0 otherwise. *ret indicates the success status
> + * of this call.
> + */
> +static int __kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> +		const struct kvm_memory_slot *memslot, int *ret)
> +{
> +	unsigned long gfn = memslot->base_gfn;
> +	struct vm_area_struct *vma;
> +	unsigned long start, end;
> +	bool retry = 0;
> +
> +	*ret = 0;
> +	while (kvmppc_next_nontransitioned_gfn(memslot, kvm, &gfn)) {
> +
> +		down_write(&kvm->mm->mmap_sem);

Acquiring and releasing mmap_sem in a loop? Any reason?

Now that you have moved ksm_madvise() calls to init time, any specific
reason to take write mmap_sem here?

> +		start = gfn_to_hva(kvm, gfn);
> +		if (kvm_is_error_hva(start)) {
> +			*ret = H_STATE;
> +			goto next;
> +		}
> +
> +		end = start + (1UL << PAGE_SHIFT);
> +		vma = find_vma_intersection(kvm->mm, start, end);
> +		if (!vma || vma->vm_start > start || vma->vm_end < end) {
> +			*ret = H_STATE;
> +			goto next;
> +		}
> +
> +		mutex_lock(&kvm->arch.uvmem_lock);
> +		*ret = kvmppc_svm_migrate_page(vma, start, end,
> +				(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
> +		mutex_unlock(&kvm->arch.uvmem_lock);
> +
> +next:
> +		up_write(&kvm->mm->mmap_sem);
> +
> +		if (*ret == -2) {
> +			retry = 1;

Using true or false assignment makes it easy to understand the intention
of this 'retry' variable.

> +			continue;
> +		}
> +
> +		if (*ret)
> +			return 0;
> +	}
> +	return retry;

The function is supposed to return an int, but you are returning a bool.

Regards,
Bharata.
