Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16539242645
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 09:48:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRMJT6J8yzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 17:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRMGn1mCQzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 17:46:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08DAD6E;
 Wed, 12 Aug 2020 00:46:51 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 280943F22E;
 Wed, 12 Aug 2020 00:46:49 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 01/16] powerpc/mm: Add DEBUG_VM WARN for pmd_clear
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
Message-ID: <8b951ede-d779-d18f-b2b8-d09f94af6822@arm.com>
Date: Wed, 12 Aug 2020 13:16:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
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
> With the hash page table, the kernel should not use pmd_clear for clearing
> huge pte entries. Add a DEBUG_VM WARN to catch the wrong usage.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

This particular change is very much powerpc specific. Hence please drop it from
the series which otherwise changes the page table test. Also, this series which
is not a RFC, still lacks a proper cover letter with diff stats, tree/tag on
which this applies, summary about the proposal etc. All those information will
be helpful in reviewing this series better. For now, assuming that this applies
cleanly on current master branch. But again, please do include a cover letter
in the next version.

> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 6de56c3b33c4..079211968987 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -868,6 +868,13 @@ static inline bool pte_ci(pte_t pte)
>  
>  static inline void pmd_clear(pmd_t *pmdp)
>  {
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
> +		/*
> +		 * Don't use this if we can possibly have a hash page table
> +		 * entry mapping this.
> +		 */
> +		WARN_ON((pmd_val(*pmdp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
> +	}
>  	*pmdp = __pmd(0);
>  }
>  
> @@ -916,6 +923,13 @@ static inline int pmd_bad(pmd_t pmd)
>  
>  static inline void pud_clear(pud_t *pudp)
>  {
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
> +		/*
> +		 * Don't use this if we can possibly have a hash page table
> +		 * entry mapping this.
> +		 */
> +		WARN_ON((pud_val(*pudp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
> +	}
>  	*pudp = __pud(0);
>  }
>  
> 
