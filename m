Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8282E50291
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 08:54:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XKll4TG5zDqWd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45XKjl4lFDzDqB9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 16:52:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C6152B;
 Sun, 23 Jun 2019 23:52:38 -0700 (PDT)
Received: from [10.162.41.123] (p8cg001049571a15.blr.arm.com [10.162.41.123])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 61E2B3F246; Sun, 23 Jun 2019 23:54:24 -0700 (PDT)
Subject: Re: [PATCH 3/3] mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
References: <20190623094446.28722-1-npiggin@gmail.com>
 <20190623094446.28722-4-npiggin@gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <8668f76d-faad-4e57-2f7b-f2b8969b1026@arm.com>
Date: Mon, 24 Jun 2019 12:22:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190623094446.28722-4-npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/23/2019 03:14 PM, Nicholas Piggin wrote:
> vmalloc_to_page returns NULL for addresses mapped by larger pages[*].
> Whether or not a vmap is huge depends on the architecture details,
> alignments, boot options, etc., which the caller can not be expected
> to know. Therefore HUGE_VMAP is a regression for vmalloc_to_page.
> 
> This change teaches vmalloc_to_page about larger pages, and returns
> the struct page that corresponds to the offset within the large page.
> This makes the API agnostic to mapping implementation details.
> 
> [*] As explained by commit 029c54b095995 ("mm/vmalloc.c: huge-vmap:
>     fail gracefully on unexpected huge vmap mappings")
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/asm-generic/4level-fixup.h |  1 +
>  include/asm-generic/5level-fixup.h |  1 +
>  mm/vmalloc.c                       | 37 +++++++++++++++++++-----------
>  3 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/include/asm-generic/4level-fixup.h b/include/asm-generic/4level-fixup.h
> index e3667c9a33a5..3cc65a4dd093 100644
> --- a/include/asm-generic/4level-fixup.h
> +++ b/include/asm-generic/4level-fixup.h
> @@ -20,6 +20,7 @@
>  #define pud_none(pud)			0
>  #define pud_bad(pud)			0
>  #define pud_present(pud)		1
> +#define pud_large(pud)			0
>  #define pud_ERROR(pud)			do { } while (0)
>  #define pud_clear(pud)			pgd_clear(pud)
>  #define pud_val(pud)			pgd_val(pud)
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index bb6cb347018c..c4377db09a4f 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -22,6 +22,7 @@
>  #define p4d_none(p4d)			0
>  #define p4d_bad(p4d)			0
>  #define p4d_present(p4d)		1
> +#define p4d_large(p4d)			0
>  #define p4d_ERROR(p4d)			do { } while (0)
>  #define p4d_clear(p4d)			pgd_clear(p4d)
>  #define p4d_val(p4d)			pgd_val(p4d)
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 4c9e150e5ad3..4be98f700862 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -36,6 +36,7 @@
>  #include <linux/rbtree_augmented.h>
>  
>  #include <linux/uaccess.h>
> +#include <asm/pgtable.h>
>  #include <asm/tlbflush.h>
>  #include <asm/shmparam.h>
>  
> @@ -284,26 +285,36 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
>  
>  	if (pgd_none(*pgd))
>  		return NULL;
> +
>  	p4d = p4d_offset(pgd, addr);
>  	if (p4d_none(*p4d))
>  		return NULL;
> -	pud = pud_offset(p4d, addr);
> +	if (WARN_ON_ONCE(p4d_bad(*p4d)))
> +		return NULL;

The warning here is a required addition but it needs to be moved after p4d_large()
check. Please see the next comment below.

> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (p4d_large(*p4d))
> +		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
> +#endif
>  
> -	/*
> -	 * Don't dereference bad PUD or PMD (below) entries. This will also
> -	 * identify huge mappings, which we may encounter on architectures
> -	 * that define CONFIG_HAVE_ARCH_HUGE_VMAP=y. Such regions will be
> -	 * identified as vmalloc addresses by is_vmalloc_addr(), but are
> -	 * not [unambiguously] associated with a struct page, so there is
> -	 * no correct value to return for them.
> -	 */
> -	WARN_ON_ONCE(pud_bad(*pud));
> -	if (pud_none(*pud) || pud_bad(*pud))
> +	pud = pud_offset(p4d, addr);
> +	if (pud_none(*pud))
> +		return NULL;
> +	if (WARN_ON_ONCE(pud_bad(*pud)))
>  		return NULL;
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (pud_large(*pud))
> +		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> +#endif
> +

pud_bad() on arm64 returns true when the PUD does not point to a next page
table page implying the fact that it might be a large/huge entry. I am not
sure if the semantics holds good for other architectures too. But on arm64
if pud_large() is true, then pud_bad() will be true as well. So pud_bad()
check must happen after pud_large() check. So the sequence here should be

1. pud_none()	--> Nothing is in here, return NULL
2. pud_large()	--> Return offset page address from the huge page mapping
3. pud_bad()	--> Return NULL as there is no more page table level left

Checking pud_bad() first can return NULL for a valid huge mapping.

>  	pmd = pmd_offset(pud, addr);
> -	WARN_ON_ONCE(pmd_bad(*pmd));
> -	if (pmd_none(*pmd) || pmd_bad(*pmd))
> +	if (pmd_none(*pmd))
> +		return NULL;
> +	if (WARN_ON_ONCE(pmd_bad(*pmd)))
>  		return NULL;
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (pmd_large(*pmd))
> +		return pmd_page(*pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> +#endif

Ditto.

I see that your previous proposal had this right which got changed in this
manner after my comments. Sorry about it.

It was recently when I learned (correctly) that expected semantics of pxx_bad()
is that - It does not point to the next page table page.  Hence I wonder why is
this not renamed as pxx_table() instead to make it absolutely clear.
