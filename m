Return-Path: <linuxppc-dev+bounces-10982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF3B26174
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 11:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2gV05BDCz3bTf;
	Thu, 14 Aug 2025 19:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755165048;
	cv=none; b=dYhuKZJK2RuGzB1dlDPGGKouCeBhre8ZgXqi7XNtlX79bbbxgJjWuRgoZXcVg310Pn1ZAgvyp1hIXMrX8MJvldKkezlu3InFC2zwRj90JD9H60RCOtsi8dmuq0NqkhUEb8wkEsYKs5qAM4nZQFiMjTm/B+jHfMRx13QUL5IpXKCKZ96Ip4mcbElmrT9vIoiB3DUhNmuYXrPaZdg2PCH5nPQviextg5prGQcGZcdcZjeFfgmNODd5QEad6q9NKYaFk9krkV7OihDgHvzhRJZ+ig/uw7oq727s4DO1M8Zg5kGF9ScfGVDmOEnSRpmL1nw9tUt0m6vJWmBQGyy1wDSbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755165048; c=relaxed/relaxed;
	bh=wIlwYQni2qIIwnM0SIVj/CB1fG/A16BlOaqLFYL53f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNLbdzx3ZxkaoC0MG9EVP4taFj3ezSaFRxp9AwKKQrkxYFjgJNeSxlONPJl8fKgnMp0oH7v61n8B7bxa2HG9So6hOGmlztbIEK2k3SSiQ820yqafa1QGEG5vKpBc8sjbRQToDkPFrW1PZutS5SEcmwxNiuOSrOGFR8tltPu+Piy0BCkE8fzX6CFyzVl5/DZN6cmZu0l7HpaBB9duph3tIhkCCEQBc6bUjgP53CjxcVcis18QN9J+cz9LitTtbiSYmBlkQyl7PGoauhhEGbRKoGorlsQZ2OJJ4H0kLlyTMSCtDg5IO4L2jCBswHo8LOcNEIrNdwKT9DQa6l0xLGFv9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2gTz6N78z30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:50:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8036443391;
	Thu, 14 Aug 2025 09:50:37 +0000 (UTC)
Message-ID: <1a7d8550-127a-4f72-8b20-5d5898d0a5ef@ghiti.fr>
Date: Thu, 14 Aug 2025 11:50:37 +0200
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
Subject: Re: [PATCH v16 05/13] mm/page_table_check: Provide addr parameter to
 page_table_check_ptes_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-6-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-6-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> To provide support for powerpc platforms, provide an addr parameter to
> the __page_table_check_ptes_set() and page_table_check_ptes_set() routines.
> This parameter is needed on some powerpc platforms which do not encode whether
> a mapping is for user or kernel in the pte. On such platforms, this can be
> inferred from the addr parameter.
>
> [ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/riscv/include/asm/pgtable.h |  2 +-
>   include/linux/page_table_check.h | 12 +++++++-----
>   include/linux/pgtable.h          |  2 +-
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 9fe3af8b4cad..06ea6a4f300b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -706,7 +706,7 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   
>   	switch (pgsize) {
>   	case PAGE_SIZE:
> -		page_table_check_ptes_set(mm, ptep, pte, nr);
> +		page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   		break;
>   	case PMD_SIZE:
>   		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 6e8c3d19f96a..2484c0788012 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -560,7 +560,7 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pteval, unsigned int nr)
>   {
> -	page_table_check_ptes_set(mm, ptep, pteval, nr);
> +	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
>   
>   	for (;;) {
>   		__set_pte_at(mm, ptep, pteval);
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index cf7c28d8d468..66e109238416 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -17,8 +17,8 @@ void __page_table_check_zero(struct page *page, unsigned int order);
>   void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
> -void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> -		unsigned int nr);
> +void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
> +		pte_t *ptep, pte_t pte, unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
>   		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
>   void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> @@ -68,12 +68,13 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> -		pte_t *ptep, pte_t pte, unsigned int nr)
> +					     unsigned long addr, pte_t *ptep,
> +					     pte_t pte, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_ptes_set(mm, ptep, pte, nr);
> +	__page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> @@ -127,7 +128,8 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> -		pte_t *ptep, pte_t pte, unsigned int nr)
> +					     unsigned long addr, pte_t *ptep,
> +					     pte_t pte, unsigned int nr)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..8aab3fa19c85 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -289,7 +289,7 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pte, unsigned int nr)
>   {
> -	page_table_check_ptes_set(mm, ptep, pte, nr);
> +	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   
>   	for (;;) {
>   		set_pte(ptep, pte);
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 09258f2ad93f..0957767a2940 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -193,8 +193,8 @@ static inline void page_table_check_pte_flags(pte_t pte)
>   		WARN_ON_ONCE(swap_cached_writable(pte_to_swp_entry(pte)));
>   }
>   
> -void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> -		unsigned int nr)
> +void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
> +				 pte_t *ptep, pte_t pte, unsigned int nr)
>   {
>   	unsigned int i;
>   

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


