Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7405B882
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 11:59:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cjWj5jrtzDqGm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 19:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45cjTY1ClfzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 19:57:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCC92B;
 Mon,  1 Jul 2019 02:57:14 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8156A3F718;
 Mon,  1 Jul 2019 02:57:10 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] arm64: mm: Add p?d_large() definitions
To: Nicholas Piggin <npiggin@gmail.com>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>
References: <20190701064026.970-1-npiggin@gmail.com>
 <20190701064026.970-2-npiggin@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <0a3e0833-908d-b7eb-e6e7-6413b2e37094@arm.com>
Date: Mon, 1 Jul 2019 10:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701064026.970-2-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel @ lists . infradead . org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/07/2019 07:40, Nicholas Piggin wrote:
> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information will be provided by the
> p?d_large() functions/macros.
> 
> For arm64, we already have p?d_sect() macros which we can reuse for
> p?d_large().
> 
> pud_sect() is defined as a dummy function when CONFIG_PGTABLE_LEVELS < 3
> or CONFIG_ARM64_64K_PAGES is defined. However when the kernel is
> configured this way then architecturally it isn't allowed to have a
> large page that this level, and any code using these page walking macros
> is implicitly relying on the page size/number of levels being the same as
> the kernel. So it is safe to reuse this for p?d_large() as it is an
> architectural restriction.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Hi Nicolas,

This appears to my patch which I originally posted as part of converting
x86/arm64 to use a generic page walk code[1]. I'm not sure that this
patch makes much sense on its own, in particular it was working up to
having a generic macro[2] which means the _large() macros could be used
across all architectures.

Also as a matter of courtesy please can you ensure the authorship
information is preserved when posting other people's patches (there
should be a From: line with my name on). You should also include your
own Signed-off-by: line (see submitting-patches[3]) after mine.

Apologies to anyone that has been following my patch series, I've been
on holiday so not actively working on it. My aim is to combine the
series with a generic ptdump implementation[4] which should improve the
diff state. I should be able to post that in the next few weeks.

Thanks,

Steve

[1] Series: https://patchwork.kernel.org/cover/10883885/
    Last posting of this patch:
	https://patchwork.kernel.org/patch/10883899/

[2] https://patchwork.kernel.org/patch/10883965/

[3]
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

[4] RFC version here:
https://lore.kernel.org/lkml/20190417143423.26665-1-steven.price@arm.com/

> ---
>  arch/arm64/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index fca26759081a..0e973201bc16 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -417,6 +417,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
>  				 PMD_TYPE_TABLE)
>  #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
>  				 PMD_TYPE_SECT)
> +#define pmd_large(pmd)		pmd_sect(pmd)
>  
>  #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
>  #define pud_sect(pud)		(0)
> @@ -499,6 +500,7 @@ static inline void pte_unmap(pte_t *pte) { }
>  #define pud_none(pud)		(!pud_val(pud))
>  #define pud_bad(pud)		(!(pud_val(pud) & PUD_TABLE_BIT))
>  #define pud_present(pud)	pte_present(pud_pte(pud))
> +#define pud_large(pud)		pud_sect(pud)
>  #define pud_valid(pud)		pte_valid(pud_pte(pud))
>  
>  static inline void set_pud(pud_t *pudp, pud_t pud)
> 

