Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8D39EA8F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 02:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVsy4tgsz3073
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 10:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=aXgiVWDs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c36;
 helo=mail-oo1-xc36.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=aXgiVWDs; dkim-atps=neutral
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVsV4zpPz2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 10:06:52 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 d27-20020a4a3c1b0000b029024983ef66dbso1791430ooa.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=Bd5L0/RPBE9zDsj0Ysf0Zjs7T2z0nJBAm/sFA95+0hk=;
 b=aXgiVWDspiCZ+EoqE/VOtnGxSJjzR371qQ+LohuyLiEuG8h5+Ayt2UyEr41d1fuM1g
 Pr+3Qcg18MEKxgperYAB4lSvQ1ycBOBRlXl7vGerBySrplNVKtYVcZ8qY1M1akT59zJq
 WhfTiU94ZyhgXInj5e89hY7Z/EkggHAUyWaI75/d9CZiO/U58CxX4cz1SN2IiQJQlJSU
 KjTXye5tORDo/w7jQogeMwLBsIBOmuBRTCDXZNNIdSQw8IpXXfdMbKR7y3bGpia17tCm
 9HJ6265DMSrfyLUKw8FANuh30yGP2s03/ES6ouLDT3WbyvkT36LN3FMS1yMloCfDVbjN
 w/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=Bd5L0/RPBE9zDsj0Ysf0Zjs7T2z0nJBAm/sFA95+0hk=;
 b=NubxhU2+6bgoxp357KZAXESkXgMFL/SBLU/IYdPyzQmo02U/rRVKWZQpEaJjpyKOgS
 NLZwojbkNTTASSTDwMVrTA2RL6zE2LaLQ6pXgMCqeCO5uWAYuPZpfN3B9QsC6Bx5Y/g7
 aPsNljVrjCpbsDIN9deOTeU3EYf0r30yfnWkIjRh/dIJOmEbViQDAy6fmNKA3VDXcLpB
 dWB4gJvIrQudME8/eTrqXHJ4dx9aEHBwF+RH1FXRZ0TSWMeEuZYrm69RRyxnIHtYrlB2
 iItqkE8EOJAlMnW0ozpT+wk36I6Df2vFkhkY1YiClEOZ7qpCF48Aaaih7Du710XiAaIo
 QRLA==
X-Gm-Message-State: AOAM532S/tXcA+pXToCzsl2+yxhfSsauuozbTiRfo/HEcXn79XxTajQY
 8UUXIAXrGLD/nRVU+9jurqd4hPouZRXLMQ==
X-Google-Smtp-Source: ABdhPJwtNQWc0y6OiSd0xS7Vo8frW9gjk1DExvqYGd2GhK0AZVqHifBjQcBC5o7vd7wj0BtLaQVvcg==
X-Received: by 2002:a4a:d285:: with SMTP id h5mr5554903oos.71.1623110808129;
 Mon, 07 Jun 2021 17:06:48 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id s6sm2681342otk.71.2021.06.07.17.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 17:06:47 -0700 (PDT)
Date: Mon, 7 Jun 2021 17:06:28 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap
 and pageout
In-Reply-To: <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
Message-ID: <f789af6-8924-3b83-6f82-c662175af126@google.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Jun 2021, Aneesh Kumar K.V wrote:

> CPU 1				CPU 2					CPU 3
> 
> mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
> 
> mmap_write_lock_killable()
> 
> 				addr = old_addr
> 				lock(pte_ptl)
> lock(pmd_ptl)
> pmd = *old_pmd
> pmd_clear(old_pmd)
> flush_tlb_range(old_addr)
> 
> *new_pmd = pmd
> 									*new_addr = 10; and fills
> 									TLB with new addr
> 									and old pfn
> 
> unlock(pmd_ptl)
> 				ptep_clear_flush()
> 				old pfn is free.
> 									Stale TLB entry
> 
> Fix this race by holding pmd lock in pageout. This still doesn't handle the race
> between MOVE_PUD and pageout.
> 
> Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
> Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

This seems very wrong to me, to require another level of locking in the
rmap lookup, just to fix some new pagetable games in mremap.

But Linus asked "Am I missing something?": neither of you have mentioned
mremap's take_rmap_locks(), so I hope that already meets your need.  And
if it needs to be called more often than before (see "need_rmap_locks"),
that's probably okay.

Hugh

> ---
>  include/linux/rmap.h |  9 ++++++---
>  mm/page_vma_mapped.c | 36 ++++++++++++++++++------------------
>  2 files changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index def5c62c93b3..272ab0c2b60b 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -207,7 +207,8 @@ struct page_vma_mapped_walk {
>  	unsigned long address;
>  	pmd_t *pmd;
>  	pte_t *pte;
> -	spinlock_t *ptl;
> +	spinlock_t *pte_ptl;
> +	spinlock_t *pmd_ptl;
>  	unsigned int flags;
>  };
>  
> @@ -216,8 +217,10 @@ static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
>  	/* HugeTLB pte is set to the relevant page table entry without pte_mapped. */
>  	if (pvmw->pte && !PageHuge(pvmw->page))
>  		pte_unmap(pvmw->pte);
> -	if (pvmw->ptl)
> -		spin_unlock(pvmw->ptl);
> +	if (pvmw->pte_ptl)
> +		spin_unlock(pvmw->pte_ptl);
> +	if (pvmw->pmd_ptl)
> +		spin_unlock(pvmw->pmd_ptl);
>  }
>  
>  bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 2cf01d933f13..87a2c94c7e27 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -47,8 +47,10 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
>  				return false;
>  		}
>  	}
> -	pvmw->ptl = pte_lockptr(pvmw->vma->vm_mm, pvmw->pmd);
> -	spin_lock(pvmw->ptl);
> +	if (USE_SPLIT_PTE_PTLOCKS) {
> +		pvmw->pte_ptl = pte_lockptr(pvmw->vma->vm_mm, pvmw->pmd);
> +		spin_lock(pvmw->pte_ptl);
> +	}
>  	return true;
>  }
>  
> @@ -162,8 +164,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  		if (!pvmw->pte)
>  			return false;
>  
> -		pvmw->ptl = huge_pte_lockptr(page_hstate(page), mm, pvmw->pte);
> -		spin_lock(pvmw->ptl);
> +		pvmw->pte_ptl = huge_pte_lockptr(page_hstate(page), mm, pvmw->pte);
> +		spin_lock(pvmw->pte_ptl);
>  		if (!check_pte(pvmw))
>  			return not_found(pvmw);
>  		return true;
> @@ -179,6 +181,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  	if (!pud_present(*pud))
>  		return false;
>  	pvmw->pmd = pmd_offset(pud, pvmw->address);
> +	pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
>  	/*
>  	 * Make sure the pmd value isn't cached in a register by the
>  	 * compiler and used as a stale value after we've observed a
> @@ -186,7 +189,6 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  	 */
>  	pmde = READ_ONCE(*pvmw->pmd);
>  	if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde)) {
> -		pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>  		if (likely(pmd_trans_huge(*pvmw->pmd))) {
>  			if (pvmw->flags & PVMW_MIGRATION)
>  				return not_found(pvmw);
> @@ -206,14 +208,10 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  				}
>  			}
>  			return not_found(pvmw);
> -		} else {
> -			/* THP pmd was split under us: handle on pte level */
> -			spin_unlock(pvmw->ptl);
> -			pvmw->ptl = NULL;
>  		}
> -	} else if (!pmd_present(pmde)) {
> -		return false;
> -	}
> +	} else if (!pmd_present(pmde))
> +		return not_found(pvmw);
> +
>  	if (!map_pte(pvmw))
>  		goto next_pte;
>  	while (1) {
> @@ -233,19 +231,21 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			/* Did we cross page table boundary? */
>  			if (pvmw->address % PMD_SIZE == 0) {
>  				pte_unmap(pvmw->pte);
> -				if (pvmw->ptl) {
> -					spin_unlock(pvmw->ptl);
> -					pvmw->ptl = NULL;
> +				if (pvmw->pte_ptl) {
> +					spin_unlock(pvmw->pte_ptl);
> +					pvmw->pte_ptl = NULL;
>  				}
> +				spin_unlock(pvmw->pmd_ptl);
> +				pvmw->pmd_ptl = NULL;
>  				goto restart;
>  			} else {
>  				pvmw->pte++;
>  			}
>  		} while (pte_none(*pvmw->pte));
>  
> -		if (!pvmw->ptl) {
> -			pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
> -			spin_lock(pvmw->ptl);
> +		if (USE_SPLIT_PTE_PTLOCKS && !pvmw->pte_ptl) {
> +			pvmw->pte_ptl = pte_lockptr(mm, pvmw->pmd);
> +			spin_lock(pvmw->pte_ptl);
>  		}
>  	}
>  }
> -- 
> 2.31.1
