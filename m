Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03172FFEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:23:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwXP+1Xb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh5hW0KDxz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwXP+1Xb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh5gZ1DFBz30ds
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:22:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A19786175C;
	Wed, 14 Jun 2023 13:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D64C433C0;
	Wed, 14 Jun 2023 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686748935;
	bh=0vqssVcI3AzSm6ZYzSMTFzLW0LK2ArpvNNFnyd0jDMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwXP+1XbNJMc5dDtJjP8fRUbMVOfgYZkiV/CSEiQO+53OUw1mxkM7TNacSN2UVnvq
	 Mwxs/DwA39lzTfMai8ygKMhnw/8A5txEm5g+274q1AspzudJm5ujeZxuL5SlxzV7kr
	 XEeamoxRIjx3hqKKprCq30b101V9LmtVD7C/YrzqjcfWDUt0IERYcZ+YUZAUB1qm6M
	 qU2wy/k+HKKhrQ/qrF2cNssBn4aoQYbJEpcB5m9Vm0+PGaXZfYQhkb0YSbhsS/HNdF
	 f2cI0J/nTygASR5eUp+uYZzIW/J3GUH1QtysQDebu/WsZ8JxpIwHAuYB2k8FX53JGd
	 49yjsQPz5+zOQ==
Date: Wed, 14 Jun 2023 16:21:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 03/34] s390: Use pt_frag_refcount for pagetables
Message-ID: <20230614132137.GB52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-4-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-4-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:03:52PM -0700, Vishal Moola (Oracle) wrote:
> s390 currently uses _refcount to identify fragmented page tables.
> The page table struct already has a member pt_frag_refcount used by
> powerpc, so have s390 use that instead of the _refcount field as well.
> This improves the safety for _refcount and the page table tracking.
> 
> This also allows us to simplify the tracking since we can once again use
> the lower byte of pt_frag_refcount instead of the upper byte of _refcount.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

One nit below, otherwise

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/s390/mm/pgalloc.c | 38 +++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> index 66ab68db9842..6b99932abc66 100644
> --- a/arch/s390/mm/pgalloc.c
> +++ b/arch/s390/mm/pgalloc.c
> @@ -182,20 +182,17 @@ void page_table_free_pgste(struct page *page)
>   * As follows from the above, no unallocated or fully allocated parent
>   * pages are contained in mm_context_t::pgtable_list.
>   *
> - * The upper byte (bits 24-31) of the parent page _refcount is used
> + * The lower byte (bits 0-7) of the parent page pt_frag_refcount is used
>   * for tracking contained 2KB-pgtables and has the following format:
>   *
>   *   PP  AA
> - * 01234567    upper byte (bits 24-31) of struct page::_refcount
> + * 01234567    upper byte (bits 0-7) of struct page::pt_frag_refcount

Nit:              lower

>   *   ||  ||
>   *   ||  |+--- upper 2KB-pgtable is allocated
>   *   ||  +---- lower 2KB-pgtable is allocated
>   *   |+------- upper 2KB-pgtable is pending for removal
>   *   +-------- lower 2KB-pgtable is pending for removal
>   *
> - * (See commit 620b4e903179 ("s390: use _refcount for pgtables") on why
> - * using _refcount is possible).
> - *
>   * When 2KB-pgtable is allocated the corresponding AA bit is set to 1.
>   * The parent page is either:
>   *   - added to mm_context_t::pgtable_list in case the second half of the
> @@ -243,11 +240,12 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  		if (!list_empty(&mm->context.pgtable_list)) {
>  			page = list_first_entry(&mm->context.pgtable_list,
>  						struct page, lru);
> -			mask = atomic_read(&page->_refcount) >> 24;
> +			mask = atomic_read(&page->pt_frag_refcount);
>  			/*
>  			 * The pending removal bits must also be checked.
>  			 * Failure to do so might lead to an impossible
> -			 * value of (i.e 0x13 or 0x23) written to _refcount.
> +			 * value of (i.e 0x13 or 0x23) written to
> +			 * pt_frag_refcount.
>  			 * Such values violate the assumption that pending and
>  			 * allocation bits are mutually exclusive, and the rest
>  			 * of the code unrails as result. That could lead to
> @@ -259,8 +257,8 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  				bit = mask & 1;		/* =1 -> second 2K */
>  				if (bit)
>  					table += PTRS_PER_PTE;
> -				atomic_xor_bits(&page->_refcount,
> -							0x01U << (bit + 24));
> +				atomic_xor_bits(&page->pt_frag_refcount,
> +							0x01U << bit);
>  				list_del(&page->lru);
>  			}
>  		}
> @@ -281,12 +279,12 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  	table = (unsigned long *) page_to_virt(page);
>  	if (mm_alloc_pgste(mm)) {
>  		/* Return 4K page table with PGSTEs */
> -		atomic_xor_bits(&page->_refcount, 0x03U << 24);
> +		atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
>  		memset64((u64 *)table, _PAGE_INVALID, PTRS_PER_PTE);
>  		memset64((u64 *)table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
>  	} else {
>  		/* Return the first 2K fragment of the page */
> -		atomic_xor_bits(&page->_refcount, 0x01U << 24);
> +		atomic_xor_bits(&page->pt_frag_refcount, 0x01U);
>  		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
>  		spin_lock_bh(&mm->context.lock);
>  		list_add(&page->lru, &mm->context.pgtable_list);
> @@ -323,22 +321,19 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>  		 * will happen outside of the critical section from this
>  		 * function or from __tlb_remove_table()
>  		 */
> -		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
> -		mask >>= 24;
> +		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
>  		if (mask & 0x03U)
>  			list_add(&page->lru, &mm->context.pgtable_list);
>  		else
>  			list_del(&page->lru);
>  		spin_unlock_bh(&mm->context.lock);
> -		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
> -		mask >>= 24;
> +		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x10U << bit);
>  		if (mask != 0x00U)
>  			return;
>  		half = 0x01U << bit;
>  	} else {
>  		half = 0x03U;
> -		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
> -		mask >>= 24;
> +		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
>  	}
>  
>  	page_table_release_check(page, table, half, mask);
> @@ -368,8 +363,7 @@ void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
>  	 * outside of the critical section from __tlb_remove_table() or from
>  	 * page_table_free()
>  	 */
> -	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
> -	mask >>= 24;
> +	mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
>  	if (mask & 0x03U)
>  		list_add_tail(&page->lru, &mm->context.pgtable_list);
>  	else
> @@ -391,14 +385,12 @@ void __tlb_remove_table(void *_table)
>  		return;
>  	case 0x01U:	/* lower 2K of a 4K page table */
>  	case 0x02U:	/* higher 2K of a 4K page table */
> -		mask = atomic_xor_bits(&page->_refcount, mask << (4 + 24));
> -		mask >>= 24;
> +		mask = atomic_xor_bits(&page->pt_frag_refcount, mask << 4);
>  		if (mask != 0x00U)
>  			return;
>  		break;
>  	case 0x03U:	/* 4K page table with pgstes */
> -		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
> -		mask >>= 24;
> +		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
>  		break;
>  	}
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
