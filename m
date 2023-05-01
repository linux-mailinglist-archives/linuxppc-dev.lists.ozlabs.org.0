Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CB6F3985
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 23:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9FwJ71L1z3cLr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 07:00:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=dhuoKYDm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=dhuoKYDm;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9FvQ0QFCz3bmL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 06:59:27 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso2242519b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682974766; x=1685566766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56zwdsQPzBA4Fq57F7zZq8xm3cbpRSpnOmcnA0Dh+zY=;
        b=dhuoKYDmXvVL9rcvID9l7RqV772Z8lTC+U0WXQUi0tYJbLE9a48GrmSzQs7bEghGbC
         JAz8rXoL1w4B9KKuEwX7POjH3Ox3r6V4zpIxvsvZpSsylQJD8ptmZ7+Vz+V8jAHJj04w
         T6FV37TSFDDCD7el69cwAEuuEXi6g8EgNvIcALlfkGBQgAio2kQ2a6bJAUGpYJRLsZzz
         ZNQyL545JSX++O1LCUyCJsybjwMgrDioUAedrjXfVSqEM2lGIt3XAkC5ujMjWrYDbKAU
         lx6fFu18ULaY/km5rliSpJC6ISEyi513He8uKlna726VX+0Zf3a2zrJJ6SJgvgEWorgq
         velw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974766; x=1685566766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56zwdsQPzBA4Fq57F7zZq8xm3cbpRSpnOmcnA0Dh+zY=;
        b=Zf1fIgcejRI8pImSSmj4T7CxVOUP/958HRL/Y8vYz9mdJNAkVd4Z/oy095CPjVv5KG
         4uHnvBjZLPYjylvyQzvv9Re1cUmRjsNqa51/kHY5PLHATbvrns7tWDHchw9l7qEoRP5B
         KXVQo661kAiTuhjuyHlhwWLNgdpmv+kLvbEoJbPTeFxRQsHKIZJba/9ivqyTT0A4rgFz
         Z7po9G752qVlMPyeqYG3s2FLBYxedFUHLAO8Ts1ia6rYQxDgZnQbLybXj9fmdjD3/tix
         +QOVCRSonEs3UmWkTNwi9FH+XEqVMApSBPOHFNtC81uaKEuCECVVuMuDogZUS0IOtTgK
         yPJw==
X-Gm-Message-State: AC+VfDzd3pbxC1Zf6bZpIT86rXYS/SGvR86Xy5eld1nj2FqkIYA2svXQ
	d2I6ByXgAoGyRidAUudc2yJrcQ==
X-Google-Smtp-Source: ACHHUZ7NRh0XptQx7EX4B/2U8oMa1VyQthNvjC4nK5qetnlZ9yiAEbyNISqPVXEejwWKpBkEgu1KUQ==
X-Received: by 2002:a05:6a00:1301:b0:63d:27a1:d578 with SMTP id j1-20020a056a00130100b0063d27a1d578mr19620776pfu.20.1682974765524;
        Mon, 01 May 2023 13:59:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x3-20020a628603000000b0063d666566d1sm20322681pfd.72.2023.05.01.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:59:24 -0700 (PDT)
Date: Mon, 01 May 2023 13:59:24 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 13:59:09 PDT (-0700)
Subject: Re: [PATCH v2 29/34] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
In-Reply-To: <20230501192829.17086-30-vishal.moola@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vishal.moola@gmail.com
Message-ID: <mhng-e6f12727-9abe-4a93-a361-15a6cd333f51@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, vishal.moola@gmail.com, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, willy@infradead.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 May 2023 12:28:24 PDT (-0700), vishal.moola@gmail.com wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use ptdesc_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/riscv/include/asm/pgalloc.h |  8 ++++----
>  arch/riscv/mm/init.c             | 16 ++++++----------
>  2 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 59dc12b5b7e8..cb5536403bd8 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>
>  #endif /* __PAGETABLE_PMD_FOLDED */
>
> -#define __pte_free_tlb(tlb, pte, buf)   \
> -do {                                    \
> -	pgtable_pte_page_dtor(pte);     \
> -	tlb_remove_page((tlb), pte);    \
> +#define __pte_free_tlb(tlb, pte, buf)			\
> +do {							\
> +	ptdesc_pte_dtor(page_ptdesc(pte));		\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
>  } while (0)
>  #endif /* CONFIG_MMU */
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index eb8173a91ce3..8f1982664687 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -353,12 +353,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
>
>  static phys_addr_t __init alloc_pte_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
> +	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
>
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !ptdesc_pte_ctor(ptdesc));
> +	return __pa((pte_t *)ptdesc_address(ptdesc));
>  }
>
>  static void __init create_pte_mapping(pte_t *ptep,
> @@ -436,12 +434,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
>
>  static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
> +	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
>
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !ptdesc_pmd_ctor(ptdesc));
> +	return __pa((pmd_t *)ptdesc_address(ptdesc));
>  }
>
>  static void __init create_pmd_mapping(pmd_t *pmdp,

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
