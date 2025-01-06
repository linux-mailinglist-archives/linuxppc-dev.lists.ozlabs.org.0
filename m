Return-Path: <linuxppc-dev+bounces-4701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD7A02470
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 12:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRXL02n9Rz305S;
	Mon,  6 Jan 2025 22:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736163624;
	cv=none; b=XK0pbUIStyMwbVjhAudhVYi+GOgO2kT1wx4VZi+2Pk+tkMjQBlZWOzG5r0YZIoJ+y6aP8qp5kzYxPr9PKNu0rDuld49J4S5w8KJrXZ0USEKG179pzsG+Dn2GCy2B7ZfqwK5Pu+tdEGAsXAZeLcP4joPQfD2rDzMbAnHprcDSamoCuw9IX5zgr8nq7BwXtRjdp6wbT+hvIwNwY7tPD46uOq8msIs4M73Fnq59i3HlZx68RwqWxXG8aijObeb3m0moGhUiUBGeJxpBdTAHk5XxrT4yjUBs4DXmOIabfTYYwuofObDq8dvx8zBR5yD//ZSdlezaLtLYsInVxYaBbIwrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736163624; c=relaxed/relaxed;
	bh=gbnGba0XgaYQ3YbWwwCWE5sjMU6aeE4fPYKtBAQDkOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kei81ORGYHgYwn76toewFhK/Y1pIfcvr7OXpdXaFqPXNxcdSUOzhhG8jnTs4M7WiFxJpbTmq2KvNfGyGDALKWGJ9Kl54KjWR131L0JnpfXVHIILU7EdBkJXszx1hAoTJUu4fOqlwkK89hmRzDcDFfDXFyAaCRKa4i++wXoN3al22Od6OpgQVWzM8k3NU3ev5gmRWnAI4UREBu969eqwC1W5FmQtu0Q6QBLSgGy0aJhD0LHXbe0RdRVwOCjF9VX4/hpDMQTRjAhjeE9A927Y6GPYVaNFa2dPA+lRDFXD8pjfq3z3cxtkThyvvDSNR/MMJYFfsO79bDeGUyAxO0mwsLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1179 seconds by postgrey-1.37 at boromir; Mon, 06 Jan 2025 22:40:22 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRXKy3gWXz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 22:40:20 +1100 (AEDT)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2C26AC20C5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 11:20:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C7924000A;
	Mon,  6 Jan 2025 11:20:09 +0000 (UTC)
Message-ID: <1e4e1d6c-671a-4c62-a8ca-597689395cf7@ghiti.fr>
Date: Mon, 6 Jan 2025 12:20:09 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] riscv: mm: Skip pgtable level check in
 {pud,p4d}_alloc_one
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Qi,

On 30/12/2024 10:07, Qi Zheng wrote:
> From: Kevin Brodsky <kevin.brodsky@arm.com>
>
> {pmd,pud,p4d}_alloc_one() is never called if the corresponding page
> table level is folded, as {pmd,pud,p4d}_alloc() already does the
> required check. We can therefore remove the runtime page table level
> checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
> the generic version, so we remove it altogether.
>
> This is consistent with the way arm64 and x86 handle this situation
> (runtime check in p4d_free() only).
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index f52264304f772..8ad0bbe838a24 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -12,7 +12,6 @@
>   #include <asm/tlb.h>
>   
>   #ifdef CONFIG_MMU
> -#define __HAVE_ARCH_PUD_ALLOC_ONE
>   #define __HAVE_ARCH_PUD_FREE
>   #include <asm-generic/pgalloc.h>
>   
> @@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
>   	}
>   }
>   
> -#define pud_alloc_one pud_alloc_one
> -static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> -{
> -	if (pgtable_l4_enabled)
> -		return __pud_alloc_one(mm, addr);
> -
> -	return NULL;
> -}
> -
>   #define pud_free pud_free
>   static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>   {
> @@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>   #define p4d_alloc_one p4d_alloc_one
>   static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
>   {
> -	if (pgtable_l5_enabled) {
> -		gfp_t gfp = GFP_PGTABLE_USER;
> -
> -		if (mm == &init_mm)
> -			gfp = GFP_PGTABLE_KERNEL;
> -		return (p4d_t *)get_zeroed_page(gfp);
> -	}
> +	gfp_t gfp = GFP_PGTABLE_USER;
>   
> -	return NULL;
> +	if (mm == &init_mm)
> +		gfp = GFP_PGTABLE_KERNEL;
> +	return (p4d_t *)get_zeroed_page(gfp);
>   }
>   
>   static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


