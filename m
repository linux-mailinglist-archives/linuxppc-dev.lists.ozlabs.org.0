Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09C2433A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 07:33:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRwFs5dGqzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 15:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRwD331tJzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 15:31:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D06DD6E;
 Wed, 12 Aug 2020 22:31:29 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D84A3F6CF;
 Wed, 12 Aug 2020 22:31:27 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 16/16] debug_vm_pgtable/ppc64: Add a variant of pfn_pte/pmd
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-16-aneesh.kumar@linux.ibm.com>
Message-ID: <fe7beb39-97e6-dd7c-59d4-e1a72bab3d71@arm.com>
Date: Thu, 13 Aug 2020 11:00:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-16-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
> The tests do expect _PAGE_PTE bit set by different page table accessors.
> This is not true for the kernel. Within the kernel, _PAGE_PTE bits are
> usually set by set_pte_at(). To make the below tests work correctly add test
> specific pfn_pte/pmd helpers that set _PAGE_PTE bit.
> 
> pte_t pte = pfn_pte(pfn, prot);
> WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
> WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 65 +++++++++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index eea62d5e503b..153c925b5273 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -31,6 +31,23 @@
>  #include <asm/pgalloc.h>
>  #include <asm/tlbflush.h>
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
> +static inline pte_t debug_vm_pfn_pte(unsigned long pfn, pgprot_t pgprot)
> +{
> +	pte_t pte = pfn_pte(pfn, pgprot);
> +	return __pte(pte_val(pte) | _PAGE_PTE);
> +
> +}
> +static inline pmd_t debug_vm_pfn_pmd(unsigned long pfn, pgprot_t pgprot)
> +{
> +	pmd_t pmd = pfn_pmd(pfn, pgprot);
> +	return __pmd(pmd_val(pmd) | _PAGE_PTE);
> +}
> +#else
> +#define debug_vm_pfn_pte(pfn, pgprot) pfn_pte(pfn, pgprot)
> +#define debug_vm_pfn_pmd(pfn, pgprot) pfn_pmd(pfn, pgprot)
> +#endif

Again, no platform specific constructs please. This defeats the whole purpose of
this test. If __PAGE_PTE is required for the helpers, then pfn_pmd/pte() could
be modified to accommodate that. We dont see similar issues on other platforms,
hence could you please explain why ppc64 is different here.
