Return-Path: <linuxppc-dev+bounces-731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3E963E18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 10:11:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvYrN21F1z2yst;
	Thu, 29 Aug 2024 18:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724919060;
	cv=none; b=M5zbsFI5BoiE2pcQr/afkiI4hxg1d6qhdaVXjt96uF+aAtUd3xn70TMwQBmom5XaGSiTyV4Zc+4HN9dREfaAdVip6V02lGprpBT8RFZCkbMuQRX6dktbIIIbwoh1Ck40KpK4+cm7b74xPSdjS/oqOx2ghjLTld0XLOg4V5lmXI7v8sQacMZthzplsO9kA2yU/BVd5A+p47hMQPtfsAXTLIW29E0Ambtv1VSCOyRyVQPEys0eZ1aaIGTNzKZYDh3X8OveDnDAaiRNRXzslZr5bk6z9vPim0pkvS/9xOR8MhGjl1MD+X7o5+z3yKtpTEtKYHVA00Zbdfn5n3bMU0z4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724919060; c=relaxed/relaxed;
	bh=YVz/wFUOYpNbyYNUc2eYBCHKhOCPnySMmezJns0Oe5E=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:Cc:
	 References:X-Report-Abuse:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Migadu-Flow; b=hZcc7I0jWdHJBzeiq6neQzElOw4TtLdaOWGKF0qk1XDXIALx+uoGoaa7OxEVNYlIIG8BOUyKHAjs4su7EfFgtHKRKFG9gCQfYCW+RjnOB+FvVcpxBulTuBcPUOZaKTLNkdM/tNmuDCvGPxnoYq5Sb1AArsi14ZXB+lgjrKF/nugPPyV4kHGr7KLKlYnjILS2G4liI4BKL+tbrmYf4CZtmitrefur6tfEPXii7yfv/gJkTrzIamXjl43liFzuyeQt2GilxkwAASd/4TGA9Fb0rZyNavtNJoyiRj1sbYNSTOKk9sfhz+Xfd09QNh1MC8x1ycvuzNdyFJfzYEkUf09Row==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JkCWo6T4; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JkCWo6T4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvYrL4PMkz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:10:55 +1000 (AEST)
Message-ID: <24be821f-a95f-47f1-879a-c392a79072cc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724919034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVz/wFUOYpNbyYNUc2eYBCHKhOCPnySMmezJns0Oe5E=;
	b=JkCWo6T4DGdgbCAXphgbiqn76m/Hac2NMrto05Yqg228sV/hYwhh5QOjkkT+QTr9iK+es3
	yl+P+qiEt9/MYTwMaSb44oBxw8VTe8/XNgUfCPzt0xGIsf1QGsxN2NaKK+INRn1DpE166Q
	U+w6BKUd0BaNIni7PN6uCd8i6zXapyE=
Date: Thu, 29 Aug 2024 16:10:22 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/14] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, david@redhat.com,
 hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/8/22 15:13, Qi Zheng wrote:
> In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the write lock of mmap_lock is not held, and the pte_same()
> check is not performed after the PTL held. So we should get pgt_pmd and do
> pmd_same() check after the ptl held.
>
> For the case where the ptl is released first and then the pml is acquired,
> the PTE page may have been freed, so we must do pmd_same() check before
> reacquiring the ptl.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/khugepaged.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 53bfa7f4b7f82..15d3f7f3c65f2 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1604,7 +1604,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>   		pml = pmd_lock(mm, pmd);
>   
> -	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
> +	start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
>   	if (!start_pte)		/* mmap_lock + page lock should prevent this */
>   		goto abort;
>   	if (!pml)
> @@ -1612,6 +1612,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   	else if (ptl != pml)
>   		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>   
> +	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
> +		goto abort;
> +
>   	/* step 2: clear page table and adjust rmap */
>   	for (i = 0, addr = haddr, pte = start_pte;
>   	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> @@ -1657,6 +1660,16 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   	/* step 4: remove empty page table */
>   	if (!pml) {
>   		pml = pmd_lock(mm, pmd);
> +		/*
> +		 * We called pte_unmap() and release the ptl before acquiring
> +		 * the pml, which means we left the RCU critical section, so the
> +		 * PTE page may have been freed, so we must do pmd_same() check
> +		 * before reacquiring the ptl.
> +		 */
> +		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
> +			spin_unlock(pml);
> +			goto pmd_change;

Seems we forget to flush TLB since we've cleared some pte entry?

> +		}
>   		if (ptl != pml)
>   			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>   	}
> @@ -1688,6 +1701,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   		pte_unmap_unlock(start_pte, ptl);
>   	if (pml && pml != ptl)
>   		spin_unlock(pml);
> +pmd_change:
>   	if (notified)
>   		mmu_notifier_invalidate_range_end(&range);
>   drop_folio:


