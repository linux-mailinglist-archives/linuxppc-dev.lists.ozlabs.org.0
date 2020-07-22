Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7422959E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:03:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBWHq0kx0zDr4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 20:03:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBWFy0Q1mzDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 20:01:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MA1ESI007524; Wed, 22 Jul 2020 06:01:32 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wkvgs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:01:32 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06MA0hUe015784;
 Wed, 22 Jul 2020 10:01:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq84vhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 10:01:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06MA03w253936472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 10:00:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00EF8A405C;
 Wed, 22 Jul 2020 10:01:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDBDCA405B;
 Wed, 22 Jul 2020 10:01:24 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.3.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 10:01:24 +0000 (GMT)
Date: Wed, 22 Jul 2020 15:31:22 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v4 5/5] KVM: PPC: Book3S HV: migrate hot plugged memory
Message-ID: <20200722100122.GQ7902@in.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
 <1594972827-13928-6-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594972827-13928-6-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_04:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=5 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220072
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

On Fri, Jul 17, 2020 at 01:00:27AM -0700, Ram Pai wrote:
> From: Laurent Dufour <ldufour@linux.ibm.com>
> 
> When a memory slot is hot plugged to a SVM, PFNs associated with the
> GFNs in that slot must be migrated to secure-PFNs, aka device-PFNs.
> 
> Call kvmppc_uv_migrate_mem_slot() to accomplish this.
> Disable page-merge for all pages in the memory slot.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [rearranged the code, and modified the commit log]
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h | 10 ++++++++++
>  arch/powerpc/kvm/book3s_hv.c                | 10 ++--------
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 22 ++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index f229ab5..6f7da00 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -25,6 +25,9 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
>  int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
>  			const struct kvm_memory_slot *memslot);
> +void kvmppc_memslot_create(struct kvm *kvm, const struct kvm_memory_slot *new);
> +void kvmppc_memslot_delete(struct kvm *kvm, const struct kvm_memory_slot *old);

The names look a bit generic, but these functions are specific
to secure guests. May be rename them to kvmppc_uvmem_memslot_[create/delele]?

> +
>  #else
>  static inline int kvmppc_uvmem_init(void)
>  {
> @@ -84,5 +87,12 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
>  static inline void
>  kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			struct kvm *kvm, bool skip_page_out) { }
> +
> +static inline void  kvmppc_memslot_create(struct kvm *kvm,
> +		const struct kvm_memory_slot *new) { }
> +
> +static inline void  kvmppc_memslot_delete(struct kvm *kvm,
> +		const struct kvm_memory_slot *old) { }
> +
>  #endif /* CONFIG_PPC_UV */
>  #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index d331b46..bf3be3b 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4515,16 +4515,10 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
>  
>  	switch (change) {
>  	case KVM_MR_CREATE:
> -		if (kvmppc_uvmem_slot_init(kvm, new))
> -			return;
> -		uv_register_mem_slot(kvm->arch.lpid,
> -				     new->base_gfn << PAGE_SHIFT,
> -				     new->npages * PAGE_SIZE,
> -				     0, new->id);
> +		kvmppc_memslot_create(kvm, new);
>  		break;
>  	case KVM_MR_DELETE:
> -		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
> -		kvmppc_uvmem_slot_free(kvm, old);
> +		kvmppc_memslot_delete(kvm, old);
>  		break;
>  	default:
>  		/* TODO: Handle KVM_MR_MOVE */
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index a206984..a2b4d25 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -1089,6 +1089,28 @@ int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
>  	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
>  }
>  
> +void kvmppc_memslot_create(struct kvm *kvm, const struct kvm_memory_slot *new)
> +{
> +	if (kvmppc_uvmem_slot_init(kvm, new))
> +		return;
> +
> +	if (kvmppc_memslot_page_merge(kvm, new, false))
> +		return;
> +
> +	if (uv_register_mem_slot(kvm->arch.lpid, new->base_gfn << PAGE_SHIFT,
> +			new->npages * PAGE_SIZE, 0, new->id))
> +		return;
> +
> +	kvmppc_uv_migrate_mem_slot(kvm, new);

Quite a few things can return failure here including
kvmppc_uv_migrate_mem_slot() and we are ignoring all of those.
I am wondering if this should be called from prepare_memory_region callback
instead of commit_memory_region. In the prepare phase, we have a way
to back out in case of error. Can you check if moving this call to
prepare callback is feasible?

In the other case in 1/5, the code issues ksm unmerge request on error,
but not here.

Also check if the code for 1st three calls can be shared with similar
code in 1/5.

Regards,
Bharata.
