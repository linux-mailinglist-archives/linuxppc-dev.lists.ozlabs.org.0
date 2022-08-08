Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257D58C955
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1cPj3YZfz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SViGSJ2x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SViGSJ2x;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1cNy4cq2z2xHS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:24:17 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278DIsEr007424;
	Mon, 8 Aug 2022 13:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NB2eeb6uHVBA0VwmpQrVg0Xi9QMNg/6PkwLEEekgtnE=;
 b=SViGSJ2xm3tCTCj6W/bs+g564HPXtKEsSyxfbnzzXcmv/ytnV4lpuOf9fEbRql/tJvYR
 jKAGcSRjRHEsYUuzCvpsUdlDecV10OROaAiKgfYo2VyzsLTrT0P6u5gS7nFGf6XGNzRG
 6rMW5laBZPZAvnt496TB7iJIFEAM7gl8TJJdQVk/DvJI6SRc/c1kOHEZ2bOEyFbFKtL8
 a6SwXmqphqvA7bzM2sMShA62PiAFvs5Inqn+W2dA/Effqg2qXak//L+nV4BYvd8yDWFu
 WHcRD0GPPg7hdjYIUu4C/bfjcyMbOJKaPju/oDZWQi2pgBL+n+E+d7B7hrhcxVgWVtQt Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu38q86sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 13:24:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278DJRv0012841;
	Mon, 8 Aug 2022 13:24:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu38q86qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 13:24:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278DK4Uk022197;
	Mon, 8 Aug 2022 13:24:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3hsfx8j6va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 13:24:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278DO3eW18547124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 13:24:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C27C34203F;
	Mon,  8 Aug 2022 13:24:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3379942045;
	Mon,  8 Aug 2022 13:24:02 +0000 (GMT)
Received: from [9.43.19.76] (unknown [9.43.19.76])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 13:24:01 +0000 (GMT)
Message-ID: <7adba348-00c4-e5f8-adbb-b0e403ec89bf@linux.ibm.com>
Date: Mon, 8 Aug 2022 18:54:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] powerpc/mm: Support execute-only memory on the
 Radix MMU
Content-Language: en-US
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20220808130109.30738-1-ruscur@russell.cc>
 <20220808130109.30738-2-ruscur@russell.cc>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220808130109.30738-2-ruscur@russell.cc>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HVU_vksHb7hj9JzHehRrnhyBtRgzEblW
X-Proofpoint-ORIG-GUID: 5n7TwaHa57O6wZjbfL0uw08-0LZK0sBc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_09,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080065
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, anshuman.khandual@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/22 6:31 PM, Russell Currey wrote:
> The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
> through the execute-only pkey.  A PROT_EXEC-only mapping will actually
> map to RX, and then the pkey will be applied on top of it.
> 
> Radix doesn't have pkeys, but it does have execute permissions built-in
> to the MMU, so all we have to do to support XOM is expose it.
> 
> That's not possible with protection_map being const, so make it RO after
> init instead.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v2: Make protection_map __ro_after_init and set it in an initcall
> (v1 didn't work, I tested before rebasing on Anshuman's patches)
> 
> basic test: https://raw.githubusercontent.com/ruscur/junkcode/main/mmap_test.c
> 
>  arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
>  arch/powerpc/include/asm/pgtable.h         |  1 -
>  arch/powerpc/mm/fault.c                    | 10 ++++++++++
>  arch/powerpc/mm/pgtable.c                  | 16 +++++++++++++++-
>  4 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 686001eda936..bf316b773d73 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -19,6 +19,9 @@
>  #include <asm/cpu_has_feature.h>
>  #endif
>  
> +/* Execute-only page protections, Hash can use RX + execute-only pkey */
> +#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
> +
>  /* An empty PTE can still have a R or C writeback */
>  #define RADIX_PTE_NONE_MASK		(_PAGE_DIRTY | _PAGE_ACCESSED)
>  
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 33f4bf8d22b0..3cbb6de20f9d 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -60,7 +60,6 @@ extern void paging_init(void);
>  void poking_init(void);
>  
>  extern unsigned long ioremap_bot;
> -extern const pgprot_t protection_map[16];
>  
>  /*
>   * kern_addr_valid is intended to indicate whether an address is a valid
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 014005428687..887c0cc45ca6 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -270,6 +270,16 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
>  		return false;
>  	}
>  
> +	if (unlikely(!(vma->vm_flags & VM_READ))) {
> +		/*
> +		 * If we're on Radix, then this could be a read attempt on
> +		 * execute-only memory.  On other MMUs, an "exec-only" page
> +		 * will be given RX flags, so this might be redundant.
> +		 */
> +		if (radix_enabled())
> +			return true;
> +	}
> +
>  	if (unlikely(!vma_is_accessible(vma)))
>  		return true;
>  	/*
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 0b2bbde5fb65..6e1a6a999c3c 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -475,7 +475,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>  EXPORT_SYMBOL_GPL(__find_linux_pte);
>  
>  /* Note due to the way vm flags are laid out, the bits are XWR */
> -const pgprot_t protection_map[16] = {
> +static pgprot_t protection_map[16] __ro_after_init = {
>  	[VM_NONE]					= PAGE_NONE,
>  	[VM_READ]					= PAGE_READONLY,
>  	[VM_WRITE]					= PAGE_COPY,
> @@ -494,6 +494,20 @@ const pgprot_t protection_map[16] = {
>  	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
>  };
>  
> +#ifdef CONFIG_PPC_RADIX_MMU
> +static int __init radix_update_protection_map(void)
> +{
> +	if (early_radix_enabled()) {
> +		/* Radix directly supports execute-only page protections */
> +		protection_map[VM_EXEC] = PAGE_EXECONLY;
> +		protection_map[VM_EXEC | VM_SHARED] = PAGE_EXECONLY;
> +	}
> +
> +	return 0;
> +}
> +arch_initcall(radix_update_protection_map);

Instead of this can we do this in vm_get_page_prot() ?

	/* EXEC only shared or non shared mapping ? */
	if (radix_enabled() && ((vm_flags & (VM_READ | VM_WRITE | VM_EXEC)) == VM_EXEC))
		prot = PAGE_EXECONLY; 


> +#endif /* CONFIG_PPC_RADIX_MMU */
> +
>  #ifdef CONFIG_PPC_BOOK3S_64
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {

