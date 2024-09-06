Return-Path: <linuxppc-dev+bounces-1082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C596EBD9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 09:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0SMq4TwZz2x9T;
	Fri,  6 Sep 2024 17:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725607303;
	cv=none; b=cnW7gTKwB9/a8bA555QYB1OxhA3btxCDBQvpJVIrPvxFd/F9MeYlhz+IGdEv3Rbqxy6MrmSbWGbbj0l+HG13lUPapjlT1/KSf1JU4g9VPEcHrk7xXVKLajk0ZCkmpztEvl4JdN21ByLAiivIdjT6u7tFTV3UfZ6o+lsERf4wGmQ0VAPc1kzDoiBtl4IBJxFzzB2grytttJ7v8XO/y40kptzOqz1iKZWHpizyPP1fTBESVNxp43U9FVYERXFwfW49Hblo+eg7ZYdw7MsoZc/s70rlI3piZts4PjbOOAPyT6dnkko/3q9bIiDXNjwHa3uZjwm1VaCS5ApiOuKOjrl99A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725607303; c=relaxed/relaxed;
	bh=zJPCh8PbP6Ph7SJVvvtMaEdy7Om9qiXdVbZwIKJbLac=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To:Content-Type; b=LWnSKvVlNZlVtKJiLMMXAukmQw/1PAx5hOHslk5or3t9WdTXrpnDU1NaokXubhqf+qvbfRuCvcSthl2C9j8dF1EgtWZsMZf4aoXZZQNS85B8aGAKpj9/cMmBCdMfp0QX6Xg5OdVMRehOhUNmSCmEpBHL175bE80MIJHZ+jBYEyQWpcyzwyz7XQW0J7wExUQml5ViXb0e+9M0dhN/rKzmiH9ynqNdbqy8gXcvsErKZrwGgcqcFZ9OR2Y3iemy6V3gwWU2DFTDtW84kKWMi3zPRShDzEsvV9bc40weWknLQbNyXKQGTilODqYar05mnS0DdOIuZNCIWAGqV1cgcHNSWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xNyKdDHP; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xNyKdDHP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [IPv6:2001:41d0:203:375::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0SMm60vcz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 17:21:40 +1000 (AEST)
Message-ID: <d02fe02d-a6c7-4157-bb7d-3fe235f21237@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725607268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJPCh8PbP6Ph7SJVvvtMaEdy7Om9qiXdVbZwIKJbLac=;
	b=xNyKdDHP4ERpm0wvOkIn/jYqCTzwSwzDwa0+P37KJndJaFEiFop/OTDMjIXGU5EDJLKXfQ
	mM7OUatDpyRMqiet5XMBmQKn4oL7VnZRGFdfrUQz1HJqpKUQfoqZxcWhrkQcnK5SFyFKwO
	tEHqWfpnmG0P3LEQRiK/xdTIgCz4fc8=
Date: Fri, 6 Sep 2024 15:20:53 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v3 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-2-zhengqi.arch@bytedance.com>
In-Reply-To: <20240904084022.32728-2-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/9/4 16:40, Qi Zheng wrote:
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
> pmdval when successful. It is applicable for may-write cases where any
> modification operations to the page table may happen after the
> corresponding spinlock is held afterwards. But the users should make sure
> the page table is stable like checking pte_same() or checking pmd_same()
> by using the output pmdval before performing the write operations.
>
> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
> will be read-only/read-write protected.
>
> Subsequent commits will convert pte_offset_map_nolock() into the above
> two functions one by one, and finally completely delete it.
>
> Signed-off-by: Qi Zheng<zhengqi.arch@bytedance.com>
> ---
>   Documentation/mm/split_page_table_lock.rst |  7 +++
>   include/linux/mm.h                         |  5 +++
>   mm/pgtable-generic.c                       | 50 ++++++++++++++++++++++
>   3 files changed, 62 insertions(+)
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
> index a7c74a840249a..1fde9242231c9 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3006,6 +3006,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
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
> index a78a4adf711ac..262b7065a5a2e 100644
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
> +	VM_WARN_ON_ONCE(!pmdvalp);
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
> @@ -356,6 +383,29 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>    * recheck *pmd once the lock is taken; in practice, no callsite needs that -
>    * either the mmap_lock for write, or pte_same() check on contents, is enough.
>    *
> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
> + * but when successful, it also outputs a pointer to the spinlock in ptlp - as
> + * pte_offset_map_lock() does, but in this case without locking it.  This helps
> + * the caller to avoid a later pte_lockptr(mm, *pmd), which might by that time
> + * act on a changed *pmd: pte_offset_map_ro_nolock() provides the correct spinlock
> + * pointer for the page table that it returns. Even after grabbing the spinlock,
> + * we might be looking either at a page table that is still mapped or one that
> + * was unmapped and is about to get freed. But for R/O access this is sufficient.
> + * So it is only applicable for read-only cases where any modification operations
> + * to the page table are not allowed even if the corresponding spinlock is held
> + * afterwards.
> + *
> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
> + * pte_offset_map_ro_nolock(); but when successful, it also outputs the pdmval.
> + * It is applicable for may-write cases where any modification operations to the
> + * page table may happen after the corresponding spinlock is held afterwards.
> + * But the users should make sure the page table is stable like checking pte_same()
> + * or checking pmd_same() by using the output pmdval before performing the write
> + * operations.

Now, we have two options to make sure the stability of PTE for users
of pte_offset_map_rw_nolock(), in order to ease this operation, how
about proposing a new helper (or two, one for pmd_same, another for
pte_same) like pte_lock_stability (I am not good at naming, maybe
you can) which helps users 1) hold the PTL and 2) check if the PTE is
stable and 3) return true if the PTE stable, otherwise return false.

Muchun,
Thanks.

> + *
> + * Note: "RO" / "RW" expresses the intended semantics, not that the *kmap* will
> + * be read-only/read-write protected.
> + *
>    * Note that free_pgtables(), used after unmapping detached vmas, or when
>    * exiting the whole mm, does not take page table lock before freeing a page
>    * table, and may not use RCU at all: "outsiders" like khugepaged should avoid


