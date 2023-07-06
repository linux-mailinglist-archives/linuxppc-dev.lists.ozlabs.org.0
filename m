Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16A7493EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:57:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=z5gt+kiV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxLmN13MVz307K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 12:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=z5gt+kiV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxLlS23ZKz3039
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 12:56:35 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-579e212668fso3118197b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 19:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688612191; x=1691204191;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3nLEqHzi8Hc6oHRfk9sxBas5tKnTGGhGpZu6CyABx0=;
        b=z5gt+kiVixwqTAMm+u5imBVFTeat3z/cWHBayx1L2u9luClqY3zqdV1xarjUt/rteY
         Emh6UC7oLgoV2VpzmYVeJzdYNJHbmya5iWkECvyfW+kboUx9UxQps8RfK/k/FDai4wja
         0M/gE+oWYchqb/kd5zGxQxXqFJFrAn7sQbV93Lx2GoyERvwnGtK8ISo7W/LhBHX6d+P5
         CJmrSeqs0yy2gbX0GM1fiOtk+Q/D5+4KD8pf3x7UljrSiZ+xHT6GdNxWR5z6BcHBKaNL
         g8qDmW2ttARkNBn10t8EcZ61/jKHeEK1o+T0hw9oqmUs9RqV3OJ8RWXthHe2Vo5ZPCXs
         LYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688612191; x=1691204191;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3nLEqHzi8Hc6oHRfk9sxBas5tKnTGGhGpZu6CyABx0=;
        b=l4lOpBOKNRI/PZyZOnzLEDBZ/AbK4p/jBBsI0OgYjDA+yvxTLp8cKGm4Nv48JjpDMe
         tw7kA/vKeYJvXITQOzvJbuVjq4NTmldnh/khKwuynol9oDO4ebJtn+le+Ir0gch7fDGb
         mQvCgDhGld0XdgqLhlivoy9GvIFP8bqeqvVNjiJPNgCBkMVlmAz9I9wDJWD+OAno2Dgw
         JO/KQ4ZmXgwJXKmIgGtWoNvGHudupcKwqadfgkJxMS6ngjc0JAtcV67R0oewt4VIEPYv
         uW+RRk1/RCSYB1onHvWVXiESCt0SNCPRuiCRiNU3N1r09ypVMGovcvkT5JqhzYTLR6h8
         YgQQ==
X-Gm-Message-State: ABy/qLY4DLvEkJ9tdgNmRT+zen6xnKCRobt4XKsUCbhsVayMMhAbD/Sh
	UoDNgOqCf1tm1uYtPDS6LTha7A==
X-Google-Smtp-Source: APBJJlFUBHvEbCqerSwRelw2vBCaaJ/mfLdjIuWB4vUWHdlmnN0szJjHSuIA77B2uTnn+efNjfe0nw==
X-Received: by 2002:a0d:dd85:0:b0:56c:e371:aad with SMTP id g127-20020a0ddd85000000b0056ce3710aadmr623709ywe.14.1688612191371;
        Wed, 05 Jul 2023 19:56:31 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j128-20020a0de086000000b005768a634f5bsm73770ywe.99.2023.07.05.19.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 19:56:30 -0700 (PDT)
Date: Wed, 5 Jul 2023 19:56:22 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64/hash/4k: Add pmd_same callback for
 4K page size
In-Reply-To: <20230706022405.798157-1-aneesh.kumar@linux.ibm.com>
Message-ID: <eb28e06e-897d-86e9-71ec-c0a12d94dbdf@google.com>
References: <20230706022405.798157-1-aneesh.kumar@linux.ibm.com>
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
Cc: Hugh Dickins <hughd@google.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jul 2023, Aneesh Kumar K.V wrote:

> With commit 0d940a9b270b ("mm/pgtable: allow pte_offset_map[_lock]() to
> fail") the kernel is now using pmd_same to compare pmd values that are
> pointing to a level 4 page table page. Move the functions out of #ifdef
> CONFIG_TRANSPARENT_HUGEPAGE and add a variant that can work with both 4K
> and 64K page size.
> 
> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:141!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> .....
> NIP [c00000000048aee0] __pte_offset_map_lock+0xf0/0x164
> LR [c00000000048ae78] __pte_offset_map_lock+0x88/0x164
> Call Trace:
>  0xc0003f000009a340 (unreliable)
>  __handle_mm_fault+0x1340/0x1980
>  handle_mm_fault+0xbc/0x380
>  __get_user_pages+0x320/0x550
>  get_user_pages_remote+0x13c/0x520
>  get_arg_page+0x80/0x1d0
>  copy_string_kernel+0xc8/0x250
>  kernel_execve+0x11c/0x270
>  run_init_process+0xe4/0x10c
>  kernel_init+0xbc/0x1a0
>  ret_from_kernel_user_thread+0x14/0x1c
> 
> Cc: Hugh Dickins <hughd@google.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Acked-by: Hugh Dickins <hughd@google.com>

Thanks for rescuing us so quickly!

> ---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  | 6 ------
>  arch/powerpc/include/asm/book3s/64/hash-64k.h | 5 -----
>  arch/powerpc/include/asm/book3s/64/hash.h     | 5 +++++
>  3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> index b6ac4f86c87b..6472b08fa1b0 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> @@ -136,12 +136,6 @@ static inline int hash__pmd_trans_huge(pmd_t pmd)
>  	return 0;
>  }
>  
> -static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
> -{
> -	BUG();
> -	return 0;
> -}
> -
>  static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>  {
>  	BUG();
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> index 338e62fbea0b..0bf6fd0bf42a 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> @@ -263,11 +263,6 @@ static inline int hash__pmd_trans_huge(pmd_t pmd)
>  		  (_PAGE_PTE | H_PAGE_THP_HUGE));
>  }
>  
> -static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
> -{
> -	return (((pmd_raw(pmd_a) ^ pmd_raw(pmd_b)) & ~cpu_to_be64(_PAGE_HPTEFLAGS)) == 0);
> -}
> -
>  static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>  {
>  	return __pmd(pmd_val(pmd) | (_PAGE_PTE | H_PAGE_THP_HUGE));
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index 17e7a778c856..d4a19e6547ac 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -132,6 +132,11 @@ static inline int get_region_id(unsigned long ea)
>  	return region_id;
>  }
>  
> +static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
> +{
> +	return (((pmd_raw(pmd_a) ^ pmd_raw(pmd_b)) & ~cpu_to_be64(_PAGE_HPTEFLAGS)) == 0);
> +}
> +
>  #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
>  #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)
>  static inline int hash__p4d_bad(p4d_t p4d)
> -- 
> 2.41.0
> 
> 
