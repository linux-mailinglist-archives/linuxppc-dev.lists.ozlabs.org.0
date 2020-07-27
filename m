Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E614522E492
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:57:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFQxC2cLzzF0k7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 13:57:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFQvQ3fHWzDsNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 13:55:46 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R3X7jh111156; Sun, 26 Jul 2020 23:55:40 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gf29h1p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 23:55:40 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R3qbZH014797;
 Mon, 27 Jul 2020 03:55:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqghrv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:55:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R3tZIs28180856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 03:55:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DF7D4203F;
 Mon, 27 Jul 2020 03:55:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44AF242041;
 Mon, 27 Jul 2020 03:55:32 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.81.241])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jul 2020 03:55:32 +0000 (GMT)
Date: Mon, 27 Jul 2020 09:25:29 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v5 5/7] KVM: PPC: Book3S HV: migrate hot plugged memory
Message-ID: <20200727035529.GH1082478@in.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
 <1595534844-16188-6-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595534844-16188-6-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-24,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 suspectscore=5 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270023
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

On Thu, Jul 23, 2020 at 01:07:22PM -0700, Ram Pai wrote:
> From: Laurent Dufour <ldufour@linux.ibm.com>
> 
> When a memory slot is hot plugged to a SVM, PFNs associated with the
> GFNs in that slot must be migrated to the secure-PFNs, aka device-PFNs.
> 
> Call kvmppc_uv_migrate_mem_slot() to accomplish this.
> Disable page-merge for all pages in the memory slot.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [rearranged the code, and modified the commit log]
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h | 14 ++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c                | 10 ++--------
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 23 +++++++++++++++++++----
>  3 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index f229ab5..59c17ca 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -25,6 +25,10 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
>  int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
>  			const struct kvm_memory_slot *memslot);
> +int kvmppc_uvmem_memslot_create(struct kvm *kvm,
> +		const struct kvm_memory_slot *new);
> +void kvmppc_uvmem_memslot_delete(struct kvm *kvm,
> +		const struct kvm_memory_slot *old);
>  #else
>  static inline int kvmppc_uvmem_init(void)
>  {
> @@ -84,5 +88,15 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
>  static inline void
>  kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			struct kvm *kvm, bool skip_page_out) { }
> +
> +static inline int  kvmppc_uvmem_memslot_create(struct kvm *kvm,
> +		const struct kvm_memory_slot *new)
> +{
> +	return H_UNSUPPORTED;
> +}
> +
> +static inline void  kvmppc_uvmem_memslot_delete(struct kvm *kvm,
> +		const struct kvm_memory_slot *old) { }
> +
>  #endif /* CONFIG_PPC_UV */
>  #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index d331b46..b1485ca 100644
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
> +		kvmppc_uvmem_memslot_create(kvm, new);

Only concern is that kvmppc_uvmem_memslot_create() can fail due
to multiple reasons but we ignore them and go ahead with memory
hotplug.

May be this hasn't been observed in reality but if we can note this
as a TODO in the comments to dig further and explore the possibility
of recovering from here, then

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

Regards,
Bharata.
