Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB7361CD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 11:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM9s13ZrNz3c45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 19:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FM9rg6wcsz30hc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 19:29:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E41111396;
 Fri, 16 Apr 2021 02:29:03 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9EB3FA35;
 Fri, 16 Apr 2021 02:29:01 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
From: Steven Price <steven.price@arm.com>
Message-ID: <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
Date: Fri, 16 Apr 2021 10:28:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/04/2021 18:18, Christophe Leroy wrote:
> In order to support large pages on powerpc, notepage()
> needs to know the page size of the page.
> 
> Add a page_size argument to notepage().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/arm64/mm/ptdump.c         |  2 +-
>   arch/riscv/mm/ptdump.c         |  2 +-
>   arch/s390/mm/dump_pagetables.c |  3 ++-
>   arch/x86/mm/dump_pagetables.c  |  2 +-
>   include/linux/ptdump.h         |  2 +-
>   mm/ptdump.c                    | 16 ++++++++--------
>   6 files changed, 14 insertions(+), 13 deletions(-)
>
[...]
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index da751448d0e4..61cd16afb1c8 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -17,7 +17,7 @@ static inline int note_kasan_page_table(struct mm_walk *walk,
>   {
>   	struct ptdump_state *st = walk->private;
>   
> -	st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]));
> +	st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]), PAGE_SIZE);

I'm not completely sure what the page_size is going to be used for, but 
note that KASAN presents an interesting case here. We short-cut by 
detecting it's a KASAN region at a high level (PGD/P4D/PUD/PMD) and 
instead of walking the tree down just call note_page() *once* but with 
level==4 because we know KASAN sets up the page table like that.

However the one call actually covers a much larger region - so while 
PAGE_SIZE matches the level it doesn't match the region covered. AFAICT 
this will lead to odd results if you enable KASAN on powerpc.

To be honest I don't fully understand why powerpc requires the page_size 
- it appears to be using it purely to find "holes" in the calls to 
note_page(), but I haven't worked out why such holes would occur.

Steve

>   
>   	walk->action = ACTION_CONTINUE;
>   
> @@ -41,7 +41,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>   		st->effective_prot(st, 0, pgd_val(val));
>   
>   	if (pgd_leaf(val))
> -		st->note_page(st, addr, 0, pgd_val(val));
> +		st->note_page(st, addr, 0, pgd_val(val), PGDIR_SIZE);
>   
>   	return 0;
>   }
> @@ -62,7 +62,7 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
>   		st->effective_prot(st, 1, p4d_val(val));
>   
>   	if (p4d_leaf(val))
> -		st->note_page(st, addr, 1, p4d_val(val));
> +		st->note_page(st, addr, 1, p4d_val(val), P4D_SIZE);
>   
>   	return 0;
>   }
> @@ -83,7 +83,7 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
>   		st->effective_prot(st, 2, pud_val(val));
>   
>   	if (pud_leaf(val))
> -		st->note_page(st, addr, 2, pud_val(val));
> +		st->note_page(st, addr, 2, pud_val(val), PUD_SIZE);
>   
>   	return 0;
>   }
> @@ -102,7 +102,7 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
>   	if (st->effective_prot)
>   		st->effective_prot(st, 3, pmd_val(val));
>   	if (pmd_leaf(val))
> -		st->note_page(st, addr, 3, pmd_val(val));
> +		st->note_page(st, addr, 3, pmd_val(val), PMD_SIZE);
>   
>   	return 0;
>   }
> @@ -116,7 +116,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
>   	if (st->effective_prot)
>   		st->effective_prot(st, 4, pte_val(val));
>   
> -	st->note_page(st, addr, 4, pte_val(val));
> +	st->note_page(st, addr, 4, pte_val(val), PAGE_SIZE);
>   
>   	return 0;
>   }
> @@ -126,7 +126,7 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
>   {
>   	struct ptdump_state *st = walk->private;
>   
> -	st->note_page(st, addr, depth, 0);
> +	st->note_page(st, addr, depth, 0, 0);
>   
>   	return 0;
>   }
> @@ -153,5 +153,5 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>   	mmap_read_unlock(mm);
>   
>   	/* Flush out the last page */
> -	st->note_page(st, 0, -1, 0);
> +	st->note_page(st, 0, -1, 0, 0);
>   }
> 

