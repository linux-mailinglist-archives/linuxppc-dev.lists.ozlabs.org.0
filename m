Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3F1F9E06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 19:03:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lyMV3JN1zDqX1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 03:03:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lyK10ZPNzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 03:01:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FGe5dF036264; Mon, 15 Jun 2020 13:01:00 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n45crqve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 13:00:56 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FGp464031120;
 Mon, 15 Jun 2020 17:00:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 31mpe81k4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 17:00:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FH0YOf55378048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 17:00:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE66D4C06F;
 Mon, 15 Jun 2020 17:00:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 333514C059;
 Mon, 15 Jun 2020 17:00:34 +0000 (GMT)
Received: from pomme.local (unknown [9.145.23.244])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 17:00:34 +0000 (GMT)
Subject: Re: [PATCH v1 4/4] KVM: PPC: Book3S HV: migrate hot plugged memory
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
 <1590892071-25549-5-git-send-email-linuxram@us.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <bac0b1d2-b572-2b67-7160-7a9e3882efcf@linux.ibm.com>
Date: Mon, 15 Jun 2020 19:00:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1590892071-25549-5-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=2 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 clxscore=1015 cotscore=-2147483648 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150111
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
Cc: cclaudio@linux.ibm.com, bharata@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 31/05/2020 à 04:27, Ram Pai a écrit :
> From: Laurent Dufour <ldufour@linux.ibm.com>
> 
> When a memory slot is hot plugged to a SVM, GFNs associated with that
> memory slot automatically default to secure GFN. Hence migrate the
> PFNs associated with these GFNs to device-PFNs.
> 
> uv_migrate_mem_slot() is called to achieve that. It will not call
> UV_PAGE_IN since this request is ignored by the Ultravisor.
> NOTE: Ultravisor does not trust any page content provided by
> the Hypervisor, ones the VM turns secure.
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
> 	(fixed merge conflicts. Modified the commit message)
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/kvm_book3s_uvmem.h |  4 ++++
>   arch/powerpc/kvm/book3s_hv.c                | 11 +++++++----
>   arch/powerpc/kvm/book3s_hv_uvmem.c          |  3 +--
>   3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index f0c5708..2ec2e5afb 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -23,6 +23,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
>   void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>   			     struct kvm *kvm, bool skip_page_out,
>   			     bool purge_gfn);
> +int uv_migrate_mem_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot);
>   #else
>   static inline int kvmppc_uvmem_init(void)
>   {
> @@ -78,5 +79,8 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
>   kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>   			struct kvm *kvm, bool skip_page_out,
>   			bool purge_gfn) { }
> +
> +static int uv_migrate_mem_slot(struct kvm *kvm,
> +		const struct kvm_memory_slot *memslot);
>   #endif /* CONFIG_PPC_UV */
>   #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 4c62bfe..604d062 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4516,13 +4516,16 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
>   	case KVM_MR_CREATE:
>   		if (kvmppc_uvmem_slot_init(kvm, new))
>   			return;
> -		uv_register_mem_slot(kvm->arch.lpid,
> -				     new->base_gfn << PAGE_SHIFT,
> -				     new->npages * PAGE_SIZE,
> -				     0, new->id);
> +		if (uv_register_mem_slot(kvm->arch.lpid,
> +					 new->base_gfn << PAGE_SHIFT,
> +					 new->npages * PAGE_SIZE,
> +					 0, new->id))
> +			return;
> +		uv_migrate_mem_slot(kvm, new);
>   		break;
>   	case KVM_MR_DELETE:
>   		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
> +		kvmppc_uvmem_drop_pages(old, kvm, true, true);

My mistake, kvmppc_radix_flush_memslot() called just before is already 
triggering the call to kvmppc_uvmem_drop_pages(), so that call is useless.

You should remove it in your v2.

>   		kvmppc_uvmem_slot_free(kvm, old);
>   		break;
>   	default:
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 36dda1d..1fa5f2a 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -377,8 +377,7 @@ static int kvmppc_svm_migrate_page(struct vm_area_struct *vma,
>   	return ret;
>   }
>   
> -static int uv_migrate_mem_slot(struct kvm *kvm,
> -		const struct kvm_memory_slot *memslot)
> +int uv_migrate_mem_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot)
>   {
>   	unsigned long gfn = memslot->base_gfn;
>   	unsigned long end;
> 

