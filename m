Return-Path: <linuxppc-dev+bounces-10981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1EB26171
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 11:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2gTL228fz30WF;
	Thu, 14 Aug 2025 19:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::227"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755165014;
	cv=none; b=Ry/zh9e9pitUK4ousKwjoc7At9H6ifmjVQ2qNM+sc3u2sh8MaBOz1oGts2DSe4fQVs0E6QHyCNSvEFVLhaGSmIhyGyTw8dNv/q2suCvVjEXqZNeBGL/Jc35AABUO5/sBPEdv+EneBfszFBxigWYsUYQbQMII9CJcM5jdAbBvQ4tiWXZrV02S1yaFykqYOJIFkBEFBWbXaTwyRwN3/XNcUNc5FooPKPT8jAuvJuLq98/kosuW6mvOZevUL83VQmKoJD8WBBMVm6i5GgOCktDy3yoBIQspguuPfha0s0sT7FLYG4wvGvX+mN87b5vZwenHfg+tNJfLSoAUM5Qv09jKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755165014; c=relaxed/relaxed;
	bh=2S1B3uDCP0V6cOw8J5BBf2RKM299o8V1mNT79lVcT6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImMIKuYr5hr7fslK2d2CNv4ENxUc+2rKYVBL4G/x3JL4tP6ERZ+ozLibXrdpRD41YDDZkvk7U4rshdnIzONi/t0UqFLcXtUE/KDK8jbHGvZhjfN4zTt6WnkWHiAQAkiVQY8S6C0GieMJk1L43bbmcoKM221e8rkpHNOMSSUZvXmEymCF3jOrcEDpUQj+hE0RO+/il72NlARlQddieFaH9qsVQjRYwiMoOSsNB39hudhzzHoRFUU4lQNPjoBt3ueQPdeBjPmUs6qi+cs1r9YokxLU9nV5Xr39hJkeXs+KbwwUUf0lopGsWHUoX/pxhMVnc0A2IDayiffh5hKRkIDggQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2gTK1gbKz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:50:12 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8022243214;
	Thu, 14 Aug 2025 09:50:03 +0000 (UTC)
Message-ID: <77670b86-1212-4547-a119-a876e4948b33@ghiti.fr>
Date: Thu, 14 Aug 2025 11:50:03 +0200
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
Subject: Re: [PATCH v16 04/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd[s]_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-5-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-5-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit a3b837130b58 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pmd_set").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Apply this to __page_table_check_pmds_set(), page_table_check_pmd_set(), and
> the page_table_check_pmd_set() wrapper macro.
>
> [ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: remove inaccurate comment on riscv in the commit message
> v14: rebase
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  5 +++--
>   arch/riscv/include/asm/pgtable.h |  4 ++--
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 12 ++++++------
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 8070b653c409..9fe3af8b4cad 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -709,7 +709,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   		page_table_check_ptes_set(mm, ptep, pte, nr);
>   		break;
>   	case PMD_SIZE:
> -		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
> +		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
> +					  pte_pmd(pte), nr);
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> @@ -1514,7 +1515,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
>   }
>   #endif
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 3ed0f5e4879d..6e8c3d19f96a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -805,7 +805,7 @@ static inline pud_t pud_mkspecial(pud_t pud)
>   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   				pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(mm, pmdp, pmd);
> +	page_table_check_pmd_set(mm, addr, pmdp, pmd);
>   	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
>   }
>   
> @@ -876,7 +876,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   				unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>   }
>   
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 0603793acb3a..8ee301b16b50 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1213,7 +1213,7 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
>   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   			      pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(mm, pmdp, pmd);
> +	page_table_check_pmd_set(mm, addr, pmdp, pmd);
>   	set_pmd(pmdp, pmd);
>   }
>   
> @@ -1356,7 +1356,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	if (IS_ENABLED(CONFIG_SMP)) {
>   		return xchg(pmdp, pmd);
>   	} else {
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 0bf18b884a12..cf7c28d8d468 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -19,8 +19,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
>   void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>   		unsigned int nr);
> -void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> -		unsigned int nr);
> +void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
>   void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
>   		pud_t *pudp, pud_t pud, unsigned int nr);
>   void __page_table_check_pte_clear_range(struct mm_struct *mm,
> @@ -77,12 +77,12 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> -		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
> +		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
> +	__page_table_check_pmds_set(mm, addr, pmdp, pmd, nr);
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> @@ -132,7 +132,7 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> -		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
> +		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   }
>   
> @@ -149,7 +149,7 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>   
>   #endif /* CONFIG_PAGE_TABLE_CHECK */
>   
> -#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
> +#define page_table_check_pmd_set(mm, addr, pmdp, pmd)	page_table_check_pmds_set(mm, addr, pmdp, pmd, 1)
>   #define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
>   
>   #endif /* __LINUX_PAGE_TABLE_CHECK_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 3c39e4375886..09258f2ad93f 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -218,8 +218,8 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
>   		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
>   }
>   
> -void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> -		unsigned int nr)
> +void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
>   	unsigned int i;



Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


