Return-Path: <linuxppc-dev+bounces-10984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92984B261AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 12:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2gj52NG3z30WY;
	Thu, 14 Aug 2025 20:00:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.199
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755165625;
	cv=none; b=UO+bsH1MKhH7ibnjCmPt+VOt02+BITRZkpHdOp4j3I7tOBeM5RiwETg3b36MYXSzY7rdAeLguGI0WlPifyRds7XrL2KJ92b9isCAUXzERCTb6Oz+UKd8FJHGegLLyJdG+cLMrTkvY8gdH+xRHRek6U8lfL0XjYKUj3DWzUxxGhe4pOrYXq13Uy5Py4fiqZTvANOpBofYsjnT/PQEORidFf3AEWAgTz8uEl1IABgs2sfL9AoAoUVZZ7b8TEjBHlS4ckS1+p5ai/KYlyikXFlci6fKbHrCJ7hmxQOR7WsR8aRhda7UBP/hmgmiYPOcd+q2iY4nF0I7m3PI5QZj0W6gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755165625; c=relaxed/relaxed;
	bh=/AFXCAHPRQumX4StFM3HBjOpTzzyNsm4CK0xTxitAPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVmbtAyi7XpyTwcS4R7YGPDYh0t8tZTzMZDxe9De2j+vyeYaZ9t1hiG4WyreAWFzAtnnxg2uT6jzp7BvBlGYUagO2rFEYtZhZfa1+y0KCWT7FG+UcoyH2jOh70GzOtXkw/9aaEAZUtCjWahJJAWiE5hQ3Av9BSklJ8QSLeePfYcwyIggsckz9o0+xrlXqIx2/g3Mf9t8ti5abkPZ/AZgkMWVuoOWUG/HpF7/aaqAubHe+keZUhHIDYXIlRQ488xxob6Gpx8gRZdg18sSKXIHDbdv3HjuBlKVlJibXZVd/RPPf6XT6f2b/lip3wTo7cUwaHAgBHaMEq4MRQGfAnUxrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2gj35Zh9z30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 20:00:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C73B432BC;
	Thu, 14 Aug 2025 10:00:16 +0000 (UTC)
Message-ID: <10fd7e8b-90ae-40e7-836a-23aedcafc822@ghiti.fr>
Date: Thu, 14 Aug 2025 12:00:16 +0200
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
Subject: Re: [PATCH v16 08/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pte_clear()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-9-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-9-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit aa232204c468 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pte_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> [ajd@linux.ibm.com: rebase, fix additional occurrence and loop handling]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: fix an additional occurrence
> v15: rebase, fix loop handling
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/riscv/include/asm/pgtable.h |  2 +-
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 11 +++++++----
>   include/linux/pgtable.h          |  4 ++--
>   mm/page_table_check.c            |  7 ++++---
>   6 files changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index dfcdf051b114..2203ebac81d9 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1367,7 +1367,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>   
>   	switch (pgsize) {
>   	case PAGE_SIZE:
> -		page_table_check_pte_clear(mm, pte);
> +		page_table_check_pte_clear(mm, address, pte);
>   		break;
>   	case PMD_SIZE:
>   		page_table_check_pmd_clear(mm, address, pte_pmd(pte));
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d11fc6333606..d60e1604852d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -591,7 +591,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>   {
>   	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
>   
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, address, pte);
>   
>   	return pte;
>   }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index b68bea15f32d..63350b76c0c6 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1251,7 +1251,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>   				       pte_t *ptep)
>   {
>   	pte_t pte = native_ptep_get_and_clear(ptep);
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, addr, pte);
>   	return pte;
>   }
>   
> @@ -1267,7 +1267,7 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
>   		 * care about updates and native needs no locking
>   		 */
>   		pte = native_local_ptep_get_and_clear(ptep);
> -		page_table_check_pte_clear(mm, pte);
> +		page_table_check_pte_clear(mm, addr, pte);
>   	} else {
>   		pte = ptep_get_and_clear(mm, addr, ptep);
>   	}
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 3973b69ae294..12268a32e8be 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -14,7 +14,8 @@ extern struct static_key_true page_table_check_disabled;
>   extern struct page_ext_operations page_table_check_ops;
>   
>   void __page_table_check_zero(struct page *page, unsigned int order);
> -void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
> +void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
> +				  pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
>   				  pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> @@ -45,12 +46,13 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
>   	__page_table_check_zero(page, order);
>   }
>   
> -static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +static inline void page_table_check_pte_clear(struct mm_struct *mm,
> +					      unsigned long addr, pte_t pte)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pte_clear(mm, pte);
> +	__page_table_check_pte_clear(mm, addr, pte);
>   }
>   
>   static inline void page_table_check_pmd_clear(struct mm_struct *mm,
> @@ -119,7 +121,8 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
>   {
>   }
>   
> -static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +static inline void page_table_check_pte_clear(struct mm_struct *mm,
> +					      unsigned long addr, pte_t pte)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index d97f40f1365d..c85e0e1c1f97 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -494,7 +494,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>   {
>   	pte_t pte = ptep_get(ptep);
>   	pte_clear(mm, address, ptep);
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, address, pte);
>   	return pte;
>   }
>   #endif
> @@ -553,7 +553,7 @@ static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
>   	 * No need for ptep_get_and_clear(): page table check doesn't care about
>   	 * any bits that could have been set by HW concurrently.
>   	 */
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, addr, pte);
>   }
>   
>   #ifdef CONFIG_GUP_GET_PXX_LOW_HIGH
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index e8c26b616aed..1c33439b9c0b 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -145,7 +145,8 @@ void __page_table_check_zero(struct page *page, unsigned int order)
>   	rcu_read_unlock();
>   }
>   
> -void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
> +				  pte_t pte)
>   {
>   	if (&init_mm == mm)
>   		return;
> @@ -206,7 +207,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
>   	page_table_check_pte_flags(pte);
>   
>   	for (i = 0; i < nr; i++)
> -		__page_table_check_pte_clear(mm, ptep_get(ptep + i));
> +		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
>   	if (pte_user_accessible_page(pte))
>   		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
>   }
> @@ -268,7 +269,7 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
>   		if (WARN_ON(!ptep))
>   			return;
>   		for (i = 0; i < PTRS_PER_PTE; i++) {
> -			__page_table_check_pte_clear(mm, ptep_get(ptep));
> +			__page_table_check_pte_clear(mm, addr, ptep_get(ptep));
>   			addr += PAGE_SIZE;
>   			ptep++;
>   		}


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


