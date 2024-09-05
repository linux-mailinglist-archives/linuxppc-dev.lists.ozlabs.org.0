Return-Path: <linuxppc-dev+bounces-1052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75E96D7E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:07:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzymM3C88z2ytQ;
	Thu,  5 Sep 2024 22:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725538067;
	cv=none; b=c2wz/56gV5lErmYYx9Cz3i02Y7ai4PTrDtSRXRASXS/1FvSkNib2HuTcDTDfbw1C5zgL3eQqCulng8Vkiq3eQf2NEdEHyRvmJq8+OBvkxaiX6CPIXoBRHlpOLIyrAa/BfEBqXkCwYBmZ95tM0F/qoo+Ev0ktUBA+fMfYQyfdL3HqL8/SNTJMic8BVpqnNjeFDVZ3xqt2cDsC6OOk4LamtwB1mL4cSir9JMQ94EBtqDK072YXvBjhck16qM2lwc6yXUn88uybaeHCmFgOy2HOKGcHBpTCd8idtCb9nBytjdWbSEnUjLZfjhMMmyRomNbxNQO6fweXs/iUe89nRKtL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725538067; c=relaxed/relaxed;
	bh=HPUN+LftKuZr9srXj9cbq7IzfWnEz1/nVI7Ulrm9sGw=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=RcRGtZvWj7Wk54Z/WzuPzq4IZudlL4YmtpVP/odlJ2iHGQ27NrL3mEEni8VUvh8p9tVs80fzTIC3ifxdG7twEKqNE9Neru2E4rK0wlmbGKHJlDgjki5P2hge7T2jidni7XAtSKR9iwCCdZjVEFmG/0ISCzFiAK2Uh2bFBD0gRrCp6YmJJD6BiUv2/0Mnq+3YM2HYfpRuiw8HhNuCUWrI9eCRUH6Zrz/B5U3YT1TWgV0TmFcZUe4Zdhn5zmJ+Y4uh+7g0PmpAVbn6CRGfiJoOnSjhvORNgPLV5Xr9ukf+/1yfcyZiPydBETIlPeLEcpJzbx8pXRmgLZGhTvRmxCPqMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JFyaLw6V; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JFyaLw6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzymK2Y7Jz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:07:42 +1000 (AEST)
Message-ID: <d373689b-a3f2-4c45-b291-85c58289f044@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725538034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPUN+LftKuZr9srXj9cbq7IzfWnEz1/nVI7Ulrm9sGw=;
	b=JFyaLw6VOQxfB3bon8tNTAbaoyQOjbkkFr9E7c5BXZrhpSY87szyM6HhPhLdhveialXUBU
	DqzRCadpsUll9LREIS1K/RXRPcaIokvVnVnPDzXmSVZJ2/ObX6ocR1K2ZGP/5TkdOHxCq1
	ELIYL97JJZy+oNEpgveNV8ZUXppn1Vk=
Date: Thu, 5 Sep 2024 20:07:00 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 10/14] mm: page_vma_mapped_walk: map_pte() use
 pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-11-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240904084022.32728-11-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/9/4 16:40, Qi Zheng wrote:
> In the caller of map_pte(), we may modify the pvmw->pte after acquiring
> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the pte_same() check is not performed after the pvmw->ptl held,
> so we should get pmdval and do pmd_same() check to ensure the stability of
> pvmw->pmd.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/page_vma_mapped.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index ae5cc42aa2087..f1d73fd448708 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -13,9 +13,11 @@ static inline bool not_found(struct page_vma_mapped_walk *pvmw)
>   	return false;
>   }
>   
> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
> +		    spinlock_t **ptlp)
>   {
>   	pte_t ptent;
> +	pmd_t pmdval;
>   
>   	if (pvmw->flags & PVMW_SYNC) {
>   		/* Use the stricter lookup */
> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>   		return !!pvmw->pte;
>   	}
>   
> +again:
>   	/*
>   	 * It is important to return the ptl corresponding to pte,
>   	 * in case *pvmw->pmd changes underneath us; so we need to
> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>   	 * proceeds to loop over next ptes, and finds a match later.
>   	 * Though, in most cases, page lock already protects this.
>   	 */
> -	pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
> -					  pvmw->address, ptlp);
> +	pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
> +					     pvmw->address, &pmdval, ptlp);
>   	if (!pvmw->pte)
>   		return false;
> +	*pmdvalp = pmdval;
>   
>   	ptent = ptep_get(pvmw->pte);
>   
> @@ -69,6 +73,12 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>   	}
>   	pvmw->ptl = *ptlp;
>   	spin_lock(pvmw->ptl);
> +
> +	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
> +		spin_unlock(pvmw->ptl);

Forgot to clear pvmw->ptl? Or how about moving the assignment for it
to the place where the pmd_same check is successful?

> +		goto again;
> +	}
> +

Maybe here is the right place to assign pvmw->ptl.

Muchun,
Thanks.

>   	return true;
>   }
>   
> @@ -278,7 +288,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   			step_forward(pvmw, PMD_SIZE);
>   			continue;
>   		}
> -		if (!map_pte(pvmw, &ptl)) {
> +		if (!map_pte(pvmw, &pmde, &ptl)) {
>   			if (!pvmw->pte)
>   				goto restart;
>   			goto next_pte;
> @@ -307,6 +317,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   		if (!pvmw->ptl) {
>   			pvmw->ptl = ptl;
>   			spin_lock(pvmw->ptl);
> +			if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
> +				pte_unmap_unlock(pvmw->pte, pvmw->ptl);
> +				pvmw->ptl = NULL;
> +				pvmw->pte = NULL;
> +				goto restart;
> +			}
>   		}
>   		goto this_pte;
>   	} while (pvmw->address < end);


