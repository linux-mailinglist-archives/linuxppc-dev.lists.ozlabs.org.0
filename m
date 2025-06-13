Return-Path: <linuxppc-dev+bounces-9340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA21AD8988
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 12:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJbLg3L77z30GV;
	Fri, 13 Jun 2025 20:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749810747;
	cv=none; b=b+VI0AWAcYh9ExdoOuC/NcIl9j7xyHv3lwbuJQnyP6z9n5idX7WBOLm9MpChWy38bjBNIbEgA1Mbjsjj0EgEqByJfjTozYi02MAHxE1Hx/QqGEaPG+t03ZhS+Qx1mHPKnMav5LUgL1yMhRAcpzy+k8mgOQzMoq+JdTgomrrVKGLPOvwl+/6OwGsaErCb0AF8IwJ5WLxGxbvuTNq9rFkiz70uRshaeE9EWctPC9+4PlWUfDBh/TDkoTT8vus9euHZQIZX5XSgrX8fh3Ib7DFsZa1uqZV8elXtQ7ty542h/+1/psA94kDHJMSdP6vFqc3+lFrVPi1cR/TKKtN7n8l0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749810747; c=relaxed/relaxed;
	bh=Wu4qJvn4Llwk0tWZQ65fBk0n6CvVyWDwwMQQPjhEpAs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL42SuWHAFHkiF2PigAJ8rYtFGn6crWXj9KtAhyUFxii0rHHJGNJQ8+bl2rvxicmBuDkH7q4FQx2HJasPVZdIPQ1sOax7xXdXvZ4VFD+h4veYSp9K5GVjBmwJltrNsXqg0p0oSvCY3oCDD+UaFGuUoeF/tp6vcr2M5lQCAxOITnJLRDcwe2EJi0PzQLKXbS0qQP3rnRZeF5z5iBjaSdpbBuCyGSYF+oMU+FQPdjkDaoBCXxEFQkdkXKUyb/rkVHLt3vFsa+YuRWFDZLU8aOKtUKdaAYGOKKpYTduwATka0LozM60CrumOY5kzrOkmUOE+/oSxcczg6Vuibo60H8TFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U1dOGKHb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U1dOGKHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJbLf1kl4z30DP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 20:32:25 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b2d60f8caso15498861fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749810742; x=1750415542; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu4qJvn4Llwk0tWZQ65fBk0n6CvVyWDwwMQQPjhEpAs=;
        b=U1dOGKHbKSqDbR/C5IRSFywT/DsIEtRX5LVytN+0uzX2CKR70kcYolaIZ2KvL6/uJY
         Q3jNSfsX5lAno/+uAK7bXqoh8ZKHv0t9wKkx3ENnB3SL1B7AfFqgTm/IvSjKQav8OCJ7
         JeZDtSY/Dk3FJLmqDCcS7aKPqtDQMjx3wRIjAiHlZ7vQ5m9Sd4bSi2aFs5MzojXJfO6y
         B+Hq4nrsMSYlLCt/8hIBNdVB9GzR5oKwNt4EJe6hq/5McOHlqZffQNrgU/yfCHhaQY14
         pJOgdoSJ2c19xtsMVhzoAikXoUib3IROhg9DquFS9T+fS3wW7TG06uOSazNaCbajcd7l
         8GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810742; x=1750415542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu4qJvn4Llwk0tWZQ65fBk0n6CvVyWDwwMQQPjhEpAs=;
        b=IWCevtzZfdqgaxsjz/MvGf9PYd3mwGgiN0xWSk3XkT7q/ttJgNv1SnHLN179JPRQGu
         DGc7AajwbnxG1rD8p1SJLWV2UQaSBlL9WMx3XGE/1OOJyEVGaFC/cQW38R6MsqWLQVzF
         UwA6K+2QazMfYOxwZ1j4AfQ3WVUBQZ9fDcOXhQV4qezybpVCIcVExUQyEyUyQNfES1PD
         dj3wAFZuxmszszFUpilaYBCTfLbwHnwKQPqjoKXCkGDKKlBh5nPhFqDya9QK3lmec9fC
         yDigdvxQiQ/1qSa/g32j9mtMMP/YeXTIYxbxQ5WaioIMz54osxKAi+Zw2ZGHWTdQyiXS
         Xy8g==
X-Forwarded-Encrypted: i=1; AJvYcCVl64dzEBOrurwV/nEy048rYuQbcAKiGfZbf7AB8Na9FZE/1/elvdOrfwIdR0lRhBfuaRpn4SGZk/80nFk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZh9Ca5Vud+qMjE+GKuYE4Hom1ytSfjLPPApkjWzrVmqD5M412
	F5lUkdiET/AlgD1FrRAADx1MESxcQUypGZbFrSlFuoXMLqiyId9KhdQZBq7/wvam
X-Gm-Gg: ASbGnctgX7IezBzI5oghmLZXDAuYk9GLw1SCzpmoHbsx6u6w5ufTgVdFWZpcUTZioc5
	6tkH3RSBVifkUy+XPpEfPrTgGa+xvRs/MgHBujId65RCNcCkI5GSTi5mFkmmKKOmpVGK6nalF6F
	Jt9K0m1uZUE3qsvcYESd9BK7zH1oWfE/OSk5j9bT911QJHVvFVKbSEfQpCjJY7tpfFPCsFzRr/t
	wHmUxG/e4L6blV+7MaSoO+tpIPT/iNM5QTp9+Kgr4O0N0RmnQH0uOX8DRlugzv31I7vNSUVSqNX
	HR8gsolokJW1n1IwqkZn5CZO52G2SBda0BuhgsAhwAproFfEp1JfuAA3oBZNTLtZm7CQ4N+dmrE
	g5xRzW4uw3Js=
X-Google-Smtp-Source: AGHT+IH9UJ7uFj1fdsdkfO2A9iWrTLeLn4U5mol1YXw4WzFM5kRsgurhm6wsyckaQjO11Dn5eJdcbA==
X-Received: by 2002:a05:6512:3b06:b0:553:a3e7:812e with SMTP id 2adb3069b0e04-553af90817dmr681078e87.20.1749810730193;
        Fri, 13 Jun 2025 03:32:10 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dc3absm402194e87.197.2025.06.13.03.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:32:09 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 13 Jun 2025 12:32:06 +0200
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <aEv-JjY4lUPNqyjZ@pc636>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 12, 2025 at 07:36:09PM +0200, Alexander Gordeev wrote:
> As a follow-up to commit 691ee97e1a9d ("mm: fix lazy mmu docs and
> usage") take a step forward and protect with a lock not only user,
> but also kernel mappings before entering the lazy MMU mode. With
> that the semantics of arch_enter|leave_lazy_mmu_mode() callbacks
> is consolidated, which allows further simplifications.
> 
> The effect of this consolidation is not fully preemptible (Real-Time)
> kernels can not enter the context switch while the lazy MMU mode is
> active - which is easier to comprehend.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  include/linux/pgtable.h | 12 ++++++------
>  mm/kasan/shadow.c       |  5 -----
>  mm/memory.c             |  5 ++++-
>  mm/vmalloc.c            |  6 ++++++
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 0b6e1f781d86..33bf2b13c219 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -224,12 +224,12 @@ static inline int pmd_dirty(pmd_t pmd)
>   * a raw PTE pointer after it has been modified are not guaranteed to be
>   * up to date.
>   *
> - * In the general case, no lock is guaranteed to be held between entry and exit
> - * of the lazy mode. So the implementation must assume preemption may be enabled
> - * and cpu migration is possible; it must take steps to be robust against this.
> - * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * For PREEMPT_RT kernels implementation must assume that preemption may
> + * be enabled and cpu migration is possible between entry and exit of the
> + * lazy MMU mode; it must take steps to be robust against this. There is
> + * no such assumption for non-PREEMPT_RT kernels, since both kernel and
> + * user page tables are protected with a spinlock while in lazy MMU mode.
> + * Nesting is not permitted and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  #define arch_enter_lazy_mmu_mode()	do {} while (0)
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d2c70cd2afb1..45115bd770a9 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -313,12 +313,10 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	__memset(page_to_virt(page), KASAN_VMALLOC_INVALID, PAGE_SIZE);
>  	pte = pfn_pte(page_to_pfn(page), PAGE_KERNEL);
>  
> -	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pte_none(ptep_get(ptep)))) {
>  		set_pte_at(&init_mm, addr, ptep, pte);
>  		data->pages[index] = NULL;
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> @@ -465,13 +463,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  
>  	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
>  
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	if (likely(!pte_none(ptep_get(ptep)))) {
>  		pte_clear(&init_mm, addr, ptep);
>  		free_page(page);
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index 71b3d3f98999..1ddc532b1f13 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3017,6 +3017,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			pte = pte_offset_kernel(pmd, addr);
>  		if (!pte)
>  			return err;
> +		spin_lock(&init_mm.page_table_lock);
>  	} else {
>  		if (create)
>  			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
> @@ -3042,7 +3043,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  
>  	arch_leave_lazy_mmu_mode();
>  
> -	if (mm != &init_mm)
> +	if (mm == &init_mm)
> +		spin_unlock(&init_mm.page_table_lock);
> +	else
>  		pte_unmap_unlock(mapped_pte, ptl);
>  
>  	*mask |= PGTBL_PTE_MODIFIED;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ab986dd09b6a..57b11000ae36 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -105,6 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>  
> +	spin_lock(&init_mm.page_table_lock);
>
This is not good. We introduce another bottle-neck.

--
Uladzislau Rezki

