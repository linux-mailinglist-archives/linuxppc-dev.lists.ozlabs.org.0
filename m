Return-Path: <linuxppc-dev+bounces-672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE89624C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:23:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0rB5bDKz2yfj;
	Wed, 28 Aug 2024 20:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724838954;
	cv=none; b=CixuKVCiJQ44ca59h5LSDu1ru9gIXOtDW7bF9gQy9ziw84ga4ZDHZQPKzPdxpkDDXMNUTWn2cVaDilqKsEzXWs8LmOicViZ5IREcXnqGImUWHalnbLv143tNt6cMJV4Y50la8/PAMHzES9t7qvLjV98tgSCWNRjLGwjGVgPBwj9pUVUcQZg9KNa4kUYoeonbxWT2zsQx8bl4Kb2RXquKC17DM8m+QcvyCOHXBvzn3l2JDTNSoEg5793PvqUiuNhnGTclO4//FwE4mDLBVJA/9N9b8shyqp1NNPK2KE6AW5lrPKpXb5kIoxc81W+jqFb/IW6z0uTAnDk/7YsYH4qE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724838954; c=relaxed/relaxed;
	bh=9h63oGvBhtQEIewj2wn7Jmp1aE5e9TuQJjoSjWMO3Mk=;
	h=X-Greylist:Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:
	 Cc:References:X-Report-Abuse:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Migadu-Flow; b=iCciVp2Xczk0cUGmU/X3/3x528sPGWOCvcOMnfwn6qn6PRkEiyg6YcRC3qIRwT7Rr6ddzTuKvBH1V10do+WhV5ppnFFRNx0KDv5veKEt4YVS+gClZnir4qPAjeTEpe8ysM7TnulQotuOKuM0ep+8k00+aNLqYvm0PJMW9YAToOnLIcvqkPUgmo+9Z8GeKVjaTg07/ZU/dH2FSPU99mwSC0aQyUXLx/6o+WqSQRVyM9Xz3xoCvqwLFad+CdMcJkegs7uui0DZsTMDCeDuGfhImz+c2x1jEE7sHoiVbLUhF9dKtoKVUEByf1O9ghtoD9ldQ1iKrR2K9g7kEYMVs8Sg9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sIA4uTt2; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b1; helo=out-177.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sIA4uTt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b1; helo=out-177.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 369 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 19:55:51 AEST
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [IPv6:2001:41d0:203:375::b1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0Cq4Xs1z2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 19:55:51 +1000 (AEST)
Message-ID: <2c3f09dc-aa80-412d-ba85-3cb9aa8cc478@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724838550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9h63oGvBhtQEIewj2wn7Jmp1aE5e9TuQJjoSjWMO3Mk=;
	b=sIA4uTt2sd96Y57FvD7zS3kvg67g9xLilCsoGAk9nEYRxtB3b1iolYsHSu3I9Ql8oFQVmc
	De2qsYmLwylJzl22V/gFDZk5JVyqSrtBactAhSdnX85tb2DIYaN/E2SNYh/5awOngRV2a2
	HR/zCTUUpnWoAp1qsMncajskppAIlno=
Date: Wed, 28 Aug 2024 17:48:59 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/8/22 15:13, Qi Zheng wrote:
> Currently, the usage of pte_offset_map_nolock() can be divided into the
> following two cases:
>
> 1) After acquiring PTL, only read-only operations are performed on the PTE
>     page. In this case, the RCU lock in pte_offset_map_nolock() will ensure
>     that the PTE page will not be freed, and there is no need to worry
>     about whether the pmd entry is modified.
>
> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>     time, we need to ensure that the pmd entry has not been modified
>     concurrently.
>
> To more clearing distinguish between these two cases, this commit
> introduces two new helper functions to replace pte_offset_map_nolock().
> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
> pmdval when successful. This can help the caller recheck *pmd once the PTL
> is taken. In some cases, that is, either the mmap_lock for write, or
> pte_same() check on contents, is also enough to ensure that the pmd entry
> is stable. But in order to prevent the interface from being abused, we
> choose to pass in a dummy local variable instead of NULL.
>
> Subsequent commits will convert pte_offset_map_nolock() into the above
> two functions one by one, and finally completely delete it.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   Documentation/mm/split_page_table_lock.rst |  7 ++++
>   include/linux/mm.h                         |  5 +++
>   mm/pgtable-generic.c                       | 43 ++++++++++++++++++++++
>   3 files changed, 55 insertions(+)
>
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index e4f6972eb6c04..08d0e706a32db 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -19,6 +19,13 @@ There are helpers to lock/unlock a table and other accessor functions:
>    - pte_offset_map_nolock()
>   	maps PTE, returns pointer to PTE with pointer to its PTE table
>   	lock (not taken), or returns NULL if no PTE table;
> + - pte_offset_map_ro_nolock()
> +	maps PTE, returns pointer to PTE with pointer to its PTE table
> +	lock (not taken), or returns NULL if no PTE table;
> + - pte_offset_map_rw_nolock()
> +	maps PTE, returns pointer to PTE with pointer to its PTE table
> +	lock (not taken) and the value of its pmd entry, or returns NULL
> +	if no PTE table;
>    - pte_offset_map()
>   	maps PTE, returns pointer to PTE, or returns NULL if no PTE table;
>    - pte_unmap()
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index da29b066495d6..a00cb35ce065f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2954,6 +2954,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
>   
>   pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>   			unsigned long addr, spinlock_t **ptlp);
> +pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> +				unsigned long addr, spinlock_t **ptlp);
> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
> +				unsigned long addr, pmd_t *pmdvalp,
> +				spinlock_t **ptlp);
>   
>   #define pte_unmap_unlock(pte, ptl)	do {		\
>   	spin_unlock(ptl);				\
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index a78a4adf711ac..9a1666574c959 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -317,6 +317,33 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>   	return pte;
>   }
>   
> +pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> +				unsigned long addr, spinlock_t **ptlp)
> +{
> +	pmd_t pmdval;
> +	pte_t *pte;
> +
> +	pte = __pte_offset_map(pmd, addr, &pmdval);
> +	if (likely(pte))
> +		*ptlp = pte_lockptr(mm, &pmdval);
> +	return pte;
> +}
> +
> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
> +				unsigned long addr, pmd_t *pmdvalp,
> +				spinlock_t **ptlp)
> +{
> +	pmd_t pmdval;
> +	pte_t *pte;
> +
> +	BUG_ON(!pmdvalp);
> +	pte = __pte_offset_map(pmd, addr, &pmdval);
> +	if (likely(pte))
> +		*ptlp = pte_lockptr(mm, &pmdval);
> +	*pmdvalp = pmdval;
> +	return pte;
> +}
> +
>   /*
>    * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
>    * __pte_offset_map_lock() below, is usually called with the pmd pointer for
> @@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>    * recheck *pmd once the lock is taken; in practice, no callsite needs that -
>    * either the mmap_lock for write, or pte_same() check on contents, is enough.
>    *
> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
> + * pte_offset_map(); but when successful, it also outputs a pointer to the
> + * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
> + * locking it.  This helps the caller to avoid a later pte_lockptr(mm, *pmd),
> + * which might by that time act on a changed *pmd: pte_offset_map_ro_nolock()
> + * provides the correct spinlock pointer for the page table that it returns.
> + * For readonly case, the caller does not need to recheck *pmd after the lock is
> + * taken, because the RCU lock will ensure that the PTE page will not be freed.

I'd like to add something like:

"
It is only applicable for read-only cases where any modification 
operations to the PTE page table are not allowed even if the 
corresponding PTL is held afterwards.
"

to explicitly specify its use cases.
> + *
> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
> + * pte_offset_map_ro_nolock(); but when successful, it also outputs the
> + * pdmval. For cases where pte or pmd entries may be modified, that is, maywrite
> + * case, this can help the caller recheck *pmd once the lock is taken. In some
> + * cases, that is, either the mmap_lock for write, or pte_same() check on
> + * contents, is also enough to ensure that the pmd entry is stable.
> + *

I'd like to rewrite some sentences to:

"
It is applicable for may-write cases where any modification operations 
to the PTE page table may happen after the corresponding PTL is held 
afterwards. But the users should make sure the PTE page table is stable 
like holding mmap_lock for write or checking pte_same() or checking 
pmd_same() before performing the write operations.
"

Muchun,
Thanks.

>    * Note that free_pgtables(), used after unmapping detached vmas, or when
>    * exiting the whole mm, does not take page table lock before freeing a page
>    * table, and may not use RCU at all: "outsiders" like khugepaged should avoid


