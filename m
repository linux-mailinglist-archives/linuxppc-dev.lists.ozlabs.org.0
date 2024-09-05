Return-Path: <linuxppc-dev+bounces-1042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71C96D312
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 11:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzvBP2H2Jz2yps;
	Thu,  5 Sep 2024 19:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725528397;
	cv=none; b=iJon/fUJTnR2E+4O2E/3ZtFhxtaajBdxAX+jl2OyJYBaqXP9OJG6x3wp4xx+tHuOKRN+lac7pM17L6vIacZJ1/H68jd77kh7asS3h30Efh4ajnJ4smlqH1fym7zTe5LjhSrlzAbP4zsUGn3iVbEi4gd1cjLpn+rYHnvQ182bZAf2VPEXmR6qvV6X2i4M6HDSmpstdaYXCkIu7trNTpAkOJqJ9cdA6jDEWyIb8xJ1Wcvaf9kwZDMfXZb36Mu0d/U6pDc+KSyJ4QC9Mi9Ka88ze7b0GDfROdrC0JA8sih9DhaQKWp5vqx4GLKsx/AtVlmUkXnXrLzF1A4GpvcoQ1jNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725528397; c=relaxed/relaxed;
	bh=nRCI2DeauznMxWvt70Qz7zNit5+Q7VEXvujH0nECZ00=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=OVDMlX1tNNdl8L0hsdY6OtDPYKcyY2j+ysmc12iWiLDLCRJ1Y2A4rqQ/VtcGp0yOmedSIRNaRKDs32/NyGoKjhUfaSEEhjNhS8Z2owTpvwp6i8A9Df8btf46BQcoI38vYiZD/k4HsBOS5xFmULsvdoJY6swD+6Wo0Axm1HzWjS3uTbxKokfylU9nxxlR8DA+m2DfLq7Nvw/meB5Mio+Oet/vsNRa8N16d6fxFSwUodZMgPigMS+ub0G80Xt7fwhUS671Wdj8lEQyngiOtT9BMUFtPqidvFZMJuXoDKF6urypxwmw9cfT9LMdi/gRI7qXurNXzv0+Wxz5OUXGDItViw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5FUB6sP; dkim-atps=neutral; spf=pass (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5FUB6sP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzvBM5fMnz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 19:26:33 +1000 (AEST)
Message-ID: <1b03a7de-1278-4e36-8068-885dd1c29742@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725528373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRCI2DeauznMxWvt70Qz7zNit5+Q7VEXvujH0nECZ00=;
	b=c5FUB6sPdqxWX5L5xjOt1q9V2UQS4qiyKBlN6A7HKzXewrgQGG88vVjQ6bDaNQQo3schKq
	YNRZQuDJhFK8TX1j8wy49QWAZ03RWVSuz2vaYOxZxfj/ZHKvWeloeHACU3d7xsCnCQyqgf
	ADgGTiaDgUYLEr5AY+sqdyxdpx8HdTQ=
Date: Thu, 5 Sep 2024 17:25:44 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 09/14] mm: mremap: move_ptes() use
 pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-10-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240904084022.32728-10-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/9/4 16:40, Qi Zheng wrote:
> In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
> convert it to using pte_offset_map_rw_nolock(). Since we may free the PTE
> page in retract_page_tables() without holding the read lock of mmap_lock,
> so we still need to do a pmd_same() check after holding the PTL.

retract_page_tables() and move_ptes() are synchronized with
i_mmap_lock, right?

Muchun,
Thanks.

>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/mremap.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 24712f8dbb6b5..16e54151395ad 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -143,6 +143,7 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
>   	spinlock_t *old_ptl, *new_ptl;
>   	bool force_flush = false;
>   	unsigned long len = old_end - old_addr;
> +	pmd_t pmdval;
>   	int err = 0;
>   
>   	/*
> @@ -175,14 +176,29 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
>   		err = -EAGAIN;
>   		goto out;
>   	}
> -	new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
> +	/*
> +	 * Since we may free the PTE page in retract_page_tables() without
> +	 * holding the read lock of mmap_lock, so we still need to do a
> +	 * pmd_same() check after holding the PTL.
> +	 */
> +	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &pmdval,
> +					   &new_ptl);
>   	if (!new_pte) {
>   		pte_unmap_unlock(old_pte, old_ptl);
>   		err = -EAGAIN;
>   		goto out;
>   	}
> -	if (new_ptl != old_ptl)
> +	if (new_ptl != old_ptl) {
>   		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> +
> +		if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(new_pmd)))) {
> +			pte_unmap_unlock(new_pte, new_ptl);
> +			pte_unmap_unlock(old_pte, old_ptl);
> +			err = -EAGAIN;
> +			goto out;
> +		}
> +	}
> +
>   	flush_tlb_batched_pending(vma->vm_mm);
>   	arch_enter_lazy_mmu_mode();
>   


