Return-Path: <linuxppc-dev+bounces-11005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D82B26516
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 14:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2kcq5bnGz2yhD;
	Thu, 14 Aug 2025 22:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::223"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755173515;
	cv=none; b=RyybTd/ekKBp6Mjocrqrjg2obKAeQVA5Var+3iu1C9vmyfbGMpeis4UV4W7ANMFEcZwE7aFPqSxXRD4Ex+rAO+snHmzFN63rtV25qLVI7RAleMsrbb8H4Fg0SID5GaCUk7Yo8fw1ANlsNkjUgELiixpu+vQjdvU80g52RJ69TGeUg2b5Q4kln8ZpFmlrleODSIdVwNr+aBqLiSU/Y6EYmaqoUYTq+2CuVFTBWphW5RbumWjOg5yM5bP0y15eyfrq625IYX722eGx6n3DemfXDMsqe+8ogXxjXV4+/XwZuVmf49DcjQ3FbA4BdL8ypjx7oh40BrnhPqnrzS5YD/sggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755173515; c=relaxed/relaxed;
	bh=j7HALERGN5G1JxCktbFRVEITsXgQmzqpouuUe3GDuCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYMGh5A78CPPDXkiozhuZBftn1Lc/Z6YjYpU+wS/HhwxEqfX3bbCfHKyim5VGEkQdDXQGf1mLMFQPzeKLMw9xHMbDJs1MT48THF2womGAwSpwmYfVEeW4MEceZEMuRSTNfEj0YRCiyjFNzJ6oYIpEDM+pHeUZ9WpJ8dVj6ALRN8yNLgwC0syYvZdQCcmy2XCf85l1RNj0eaIGQK7Rdq4NuiWf0CiwFtwd1GTcgGTng1QcCAeb4DEGkndHEd7QjOv3zpImLtJ+fOZPFRN9oQSr89rGZsR/wQEC8gF+3aKUOdVi5cELuaF3Z5siwjxqay38O88AHpgnMQWw88GcTcA5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2kcp40KHz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 22:11:53 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E68F2059F;
	Thu, 14 Aug 2025 12:11:45 +0000 (UTC)
Message-ID: <5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
Date: Thu, 14 Aug 2025 14:11:45 +0200
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
Subject: Re: [PATCH v16 06/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-7-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-7-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduleefrdeffedrheejrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelfedrfeefrdehjedrudelledphhgvlhhopegludelvddrudeikedrvddvrddutddungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrjhgusehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> [ajd@linux.ibm.com: rebase on arm64 changes]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/x86/include/asm/pgtable.h   |  2 +-
>   include/linux/page_table_check.h | 11 +++++++----
>   include/linux/pgtable.h          |  2 +-
>   mm/page_table_check.c            |  5 +++--
>   5 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 06ea6a4f300b..81f06e5e32b2 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1374,7 +1374,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> -		page_table_check_pud_clear(mm, pte_pud(pte));
> +		page_table_check_pud_clear(mm, address, pte_pud(pte));
>   		break;
>   #endif
>   	default:
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 8ee301b16b50..8b45e0c41923 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1329,7 +1329,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
>   {
>   	pud_t pud = native_pudp_get_and_clear(pudp);
>   
> -	page_table_check_pud_clear(mm, pud);
> +	page_table_check_pud_clear(mm, addr, pud);
>   
>   	return pud;
>   }
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 66e109238416..808cc3a48c28 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -16,7 +16,8 @@ extern struct page_ext_operations page_table_check_ops;
>   void __page_table_check_zero(struct page *page, unsigned int order);
>   void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
> -void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
> +void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> +				  pud_t pud);
>   void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pte, unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> @@ -59,12 +60,13 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   	__page_table_check_pmd_clear(mm, pmd);
>   }
>   
> -static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +static inline void page_table_check_pud_clear(struct mm_struct *mm,
> +					      unsigned long addr, pud_t pud)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pud_clear(mm, pud);
> +	__page_table_check_pud_clear(mm, addr, pud);
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> @@ -123,7 +125,8 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   {
>   }
>   
> -static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +static inline void page_table_check_pud_clear(struct mm_struct *mm,
> +					      unsigned long addr, pud_t pud)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8aab3fa19c85..28fcff844b63 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -661,7 +661,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
>   	pud_t pud = *pudp;
>   
>   	pud_clear(pudp);
> -	page_table_check_pud_clear(mm, pud);
> +	page_table_check_pud_clear(mm, address, pud);
>   
>   	return pud;
>   }
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 0957767a2940..bd1242087a35 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -167,7 +167,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   }
>   EXPORT_SYMBOL(__page_table_check_pmd_clear);
>   
> -void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> +				  pud_t pud)
>   {
>   	if (&init_mm == mm)
>   		return;
> @@ -246,7 +247,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
>   		return;
>   
>   	for (i = 0; i < nr; i++)
> -		__page_table_check_pud_clear(mm, *(pudp + i));
> +		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
>   	if (pud_user_accessible_page(pud))
>   		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
>   }


So this made me realize we (riscv) did not implement 
pudp_huge_get_and_clear(), which was a mistake since we support THP PUD. 
I have implemented this function in this patch 
https://lore.kernel.org/all/20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com/T/#u

That's a fix so I'll merge it in 6.17 (at least I'll try) so your 
patchset will break the build on riscv, I'll keep you posted when it 
gets merged!

Thanks,

Alex


