Return-Path: <linuxppc-dev+bounces-10980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E04B2616C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 11:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2gSX6bWSz2yhD;
	Thu, 14 Aug 2025 19:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755164972;
	cv=none; b=XTe77VEcbRqpApQGR6BI8qrTJs6DrHMFJxAR1tlztTct6XPU4SZdWFyoxNUOj8mnYK8JRh4uO081wRB/5CF/xCN689dGp0exbQb2Whg42T9EbvKK7RT3hi3TOlUmkjkDOuNmyaz3oDKRmHSCwCEXSQlXL+MUfqDkP7jDfhctFzIJ//OjEvkrksnwGnwTrlmj9ClL7RvcZOyZTY9XhwObQE5vw+K4b8ASaf80efr95oNihB5Umjru6/jVbin6Q/ujENwIwqvorlbjm216K+SD3hpBBq+UOvta7Wd3YibeBdNc2nIuYFHauGf6xS4/UlgdmDMwN7EAborEJgBhnt3xdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755164972; c=relaxed/relaxed;
	bh=frhBgKzGaeGY6bSaVivBjRAP80vw7xY6RF99St5utxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2gcTFfSxyxbmsJH0c4gKwNh/PwgqL8Hs/YcjphBn7ejUDOo616+FUDIiqgSawLmxAE6y+UK7E55cpmaWZUMBsXYziUlX1510GpIqHnW4901nO7AxWbyWGUtFBjAR20vtlxlq/LvkyxzAQbnaxzEcL9vOLtLg0vWtykuhdlwwT4WG5OXwcLLvgyPJWn2AP0vuXdxctRMEIKp+LIvvLkOkPaP3uCzoPEmTTCttWskHFyIUhxirrdpK0oLplnA+oCk5cbRtDXXsozL+gZor6YLN/RmO7VK0DENps6PwdJhhAFwwVUHnii1M5sYDlkr1Zkq5IFbiWqMbMDhLGKRhwKatQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::236; helo=relay16.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::236; helo=relay16.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [IPv6:2001:4b98:dc4:8::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2gSW5rhJz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:49:30 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AD454495A;
	Thu, 14 Aug 2025 09:49:20 +0000 (UTC)
Message-ID: <debb39ce-5d6d-447e-9b03-62c3c951292e@ghiti.fr>
Date: Thu, 14 Aug 2025 11:49:19 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 03/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud[s]_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-4-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-4-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew,

On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_set").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Apply this to __page_table_check_puds_set(), page_table_check_puds_set() and
> the page_table_check_pud_set() wrapper macro.
>
> [ajd@linux.ibm.com: rebase on riscv + arm64 changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: remove inaccurate comment on riscv in the commit message
> v14: fix an x86 usage I missed (found by akpm)
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  3 ++-
>   arch/riscv/include/asm/pgtable.h |  4 ++--
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 12 ++++++------
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 66b5309fcad8..8070b653c409 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -713,7 +713,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> -		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
> +		page_table_check_puds_set(mm, addr, (pud_t *)ptep,
> +					  pte_pud(pte), nr);
>   		break;
>   #endif
>   	default:
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..3ed0f5e4879d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -812,7 +812,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>   				pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(mm, pudp, pud);
> +	page_table_check_pud_set(mm, addr, pudp, pud);
>   	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
>   }
>   
> @@ -958,7 +958,7 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
>   static inline pud_t pudp_establish(struct vm_area_struct *vma,
>   				   unsigned long address, pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> +	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
>   	return __pud(atomic_long_xchg((atomic_long_t *)pudp, pud_val(pud)));
>   }
>   
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e33df3da6980..0603793acb3a 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1220,7 +1220,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>   			      pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(mm, pudp, pud);
> +	page_table_check_pud_set(mm, addr, pudp, pud);
>   	native_set_pud(pudp, pud);
>   }
>   
> @@ -1371,7 +1371,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   static inline pud_t pudp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> +	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
>   	if (IS_ENABLED(CONFIG_SMP)) {
>   		return xchg(pudp, pud);
>   	} else {
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 289620d4aad3..0bf18b884a12 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -21,8 +21,8 @@ void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>   		unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>   		unsigned int nr);
> -void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> -		unsigned int nr);
> +void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> +		pud_t *pudp, pud_t pud, unsigned int nr);
>   void __page_table_check_pte_clear_range(struct mm_struct *mm,
>   					unsigned long addr,
>   					pmd_t pmd);
> @@ -86,12 +86,12 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> -		pud_t *pudp, pud_t pud, unsigned int nr)
> +		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_puds_set(mm, pudp, pud, nr);
> +	__page_table_check_puds_set(mm, addr, pudp, pud, nr);
>   }
>   
>   static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
> @@ -137,7 +137,7 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> -		pud_t *pudp, pud_t pud, unsigned int nr)
> +		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
>   {
>   }
>   
> @@ -150,6 +150,6 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>   #endif /* CONFIG_PAGE_TABLE_CHECK */
>   
>   #define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
> -#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
> +#define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
>   
>   #endif /* __LINUX_PAGE_TABLE_CHECK_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 4eeca782b888..3c39e4375886 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -236,8 +236,8 @@ void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>   }
>   EXPORT_SYMBOL(__page_table_check_pmds_set);
>   
> -void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> -		unsigned int nr)
> +void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> +		pud_t *pudp, pud_t pud,	unsigned int nr)
>   {
>   	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
>   	unsigned int i;


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


