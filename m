Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F002725D115
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 08:05:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRws3cKHzDr55
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 16:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjRv11RMYzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 16:03:39 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 442511045;
 Thu,  3 Sep 2020 23:03:38 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D4F43F71F;
 Thu,  3 Sep 2020 23:03:36 -0700 (PDT)
Subject: Re: [PATCH v4 11/13] mm/debug_vm_pgtable/pmd_clear: Don't use
 pmd/pud_clear on pte entries
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-12-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <8251b4b6-63ee-cbf8-63dd-c0031a010a4b@arm.com>
Date: Fri, 4 Sep 2020 11:33:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-12-aneesh.kumar@linux.ibm.com>
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



On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
> pmd_clear() should not be used to clear pmd level pte entries.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 26023d990bd0..b53903fdee85 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -196,6 +196,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_young(pmd));
>  
> +	/*  Clear the pte entries  */
> +	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>  	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
>  }
>  
> @@ -319,6 +321,8 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  	pudp_test_and_clear_young(vma, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(pud_young(pud));
> +
> +	pudp_huge_get_and_clear(mm, vaddr, pudp);
>  }
>  
>  static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
> @@ -442,8 +446,6 @@ static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
>  	 * This entry points to next level page table page.
>  	 * Hence this must not qualify as pud_bad().
>  	 */
> -	pmd_clear(pmdp);
> -	pud_clear(pudp);
>  	pud_populate(mm, pudp, pmdp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(pud_bad(pud));
> @@ -575,7 +577,6 @@ static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
>  	 * This entry points to next level page table page.
>  	 * Hence this must not qualify as pmd_bad().
>  	 */
> -	pmd_clear(pmdp);
>  	pmd_populate(mm, pmdp, pgtable);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_bad(pmd));
> 

Why pxxp_huge_get_and_clear() cannot be called inside pxx_populate_tests()
functions itself ? Nonetheless, this does not seem to cause any problem.
