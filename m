Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9102229417
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 10:54:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBTmT4pWvzDqXg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 18:54:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBTkQ3cXmzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 18:52:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M8WucU185680; Wed, 22 Jul 2020 04:52:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn6yhgxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:52:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M8pQBq014533;
 Wed, 22 Jul 2020 08:52:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7mt77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 08:52:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M8qX8E32899554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 08:52:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30254AE053;
 Wed, 22 Jul 2020 08:52:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E813DAE059;
 Wed, 22 Jul 2020 08:52:30 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.3.172])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 08:52:30 +0000 (GMT)
Date: Wed, 22 Jul 2020 14:22:28 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v4 1/5] KVM: PPC: Book3S HV: Disable page merging in
 H_SVM_INIT_START
Message-ID: <20200722085228.GP7902@in.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
 <1594972827-13928-2-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594972827-13928-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=969 adultscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220065
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

On Fri, Jul 17, 2020 at 01:00:23AM -0700, Ram Pai wrote:
> Page-merging of pages in memory-slots associated with a Secure VM,
> is disabled in H_SVM_PAGE_IN handler.
> 
> This operation should have been done much earlier; the moment the VM
> is initiated for secure-transition. Delaying this operation, increases
> the probability for those pages to acquire new references , making it
> impossible to migrate those pages.
> 
> Disable page-migration in H_SVM_INIT_START handling.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

with a few observations below...

> ---
>  Documentation/powerpc/ultravisor.rst |  1 +
>  arch/powerpc/kvm/book3s_hv_uvmem.c   | 98 +++++++++++++++++++++++++++---------
>  2 files changed, 76 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
> index df136c8..a1c8c37 100644
> --- a/Documentation/powerpc/ultravisor.rst
> +++ b/Documentation/powerpc/ultravisor.rst
> @@ -895,6 +895,7 @@ Return values
>      One of the following values:
>  
>  	* H_SUCCESS	 on success.
> +        * H_STATE        if the VM is not in a position to switch to secure.
>  
>  Description
>  ~~~~~~~~~~~
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e6f76bc..0baa293 100644
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
> +
> +	end = start + (memslot->npages << PAGE_SHIFT);
> +
> +	mmap_write_lock(kvm->mm);
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

This should be start = vma->vm_end I believe.

> +	} while (end > vma->vm_end);
> +
> +	mmap_write_unlock(kvm->mm);
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

You walk through all the slots here to issue kvm_madvise, but...

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

... you are walking thro' the same set of slots here anyway. I think
it makes sense to issue merge advices from here itself. That will
help you to share code with kvmppc_memslot_create() in 5/5.

All the below 3 calls are common to both the code paths, I think
they can be carved out into a separate function if you prefer.

kvmppc_uvmem_slot_init
kvmppc_memslot_page_merge
uv_register_mem_slot

Regards,
Bharata.
