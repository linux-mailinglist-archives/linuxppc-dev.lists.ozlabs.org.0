Return-Path: <linuxppc-dev+bounces-4494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657059FD609
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 17:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKWSj2vmHz2yQl;
	Sat, 28 Dec 2024 03:40:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735317621;
	cv=none; b=CZp/YzL8hQwl1aEGE4NgK9y2HNq3AA97/ZxBkmJ5gBMHBy33qHgxBCAXVeQMRG7UgHLe+g2wAg9DUbFTqjlnClwxsAV8ItomJJIynHoDFoSPtgUc+btvcmGMbeS6X7YuvtEap9k60hpqNb93eXdy8tZBHXj1Cp5aNkOQvkiQIIwoa6LBZKhUAI6+nbqAo6RDdxBN4K8bCihcelc87+8qfXQMxLDG/O6qoJqOXtYzgiFxqUs8VJg8FDBHm7RYijJWSt6+XOLjs3O1JyUpSTMFXgqmn8jfbboxOeJQ6NyHIeVpyet7nIBg95MAbs+pg/E10hm5R0wVpRIjFpGRMo6GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735317621; c=relaxed/relaxed;
	bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ekB7dKlNnJzl2sq2k7qwn4aRNp6rI9uPmtLVTZUaVJSzV3TFZjpJwfBPsP/pSVHvHTtNw9+u0j6tOBD1ZMOqyd9wvBYRLiBOEdRl9qD00kjVZSifZqn1CJe8Y/55OSgPLoojmZhThXvItHPjvWcE8BbMYUZw2tFmqn6Ovmi6bOpuJoedIgkjprnG5EYXJDJN7Fno3TCsaN3Axhy5equ33VeSwXO6ybyXjjorCpfb8VzsXCyC2mqiin6N1ChOsOvXAv9K+0NAp89cJXJGzjnNBCjSo3+sUfNEcoYuj+qISsNUNisQxhol8jT3f6DLkilpiqI1lIuzQEDhmS0+ChDBgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cPchSfFk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cPchSfFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKWSg4BNjz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 03:40:18 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21649a7bcdcso89541035ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 08:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1735317614; x=1735922414; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=cPchSfFk+tmoSkmwW05PBLKf/5LVOdbp5ttxYkVzDUfU1k6a8eMRSLqvcD9/zsqTEv
         +hSmTMWIot4P5/k788cfaZw8UrGjV3duXCeO6VYZtd8v2cq9+YyJ1ZXnqP2D3hQDISOv
         RZfEwBPmq0CR/+Fu0e92+yTUaUxJnBnwOEZDoPsCEAMynBVfupE7zUdSyrgBV1nbpuE1
         RF4eajyQQBnYs1lwPp6pgpyIihVZZZOaBmEKGeAm1hrqiEmQXFb1buWsNdWyf5q5mBQc
         m3Zaafk4ryWwRwr76PKxCak6Th/zmNFOqaNKGMs3vZu40+/tqs5KEIa+wVs+J6gzl9Fa
         RZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735317614; x=1735922414;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=YnSeyDprvs7Cn8v6kR3w5nH9IL0mQJa1TdOBXGWmPD8eV/79ALgZHZbvqQpBwGe9JF
         SUndIYzURrGfKU49CZszEB+18vJ0U/qPomDB0Y6+oJ62vkM/BXgRTrL3QqcLp3IWhq66
         YqSnRebcz0APQLVN9Jsn5uM0zl3aZ2tk4Sbcf7tYZP3nbi8xP4Z4Ph/8QnDQBRKzOJY5
         jYFDaWto6awZdD1v+7SDjdAchDYvAMyQ7EqYmXeTKOsPP0Z2LltlITJdYtO67KWLN3Cs
         0F07kwt2j44OGqtcs508SykK9IvUECGL065RTHKfm2DSMwzN4YmJy4tCJutQ0i+j7KxR
         3IBA==
X-Forwarded-Encrypted: i=1; AJvYcCUEh4LjtjyYYjB0UEmH1gM5HwHQ13uUXVRJMsU5lqhiSQFpzFUQaCj06HQZ/2lTQANSx4Cl96SBZkEc2kk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIvyANIkgeuL65mg2uzML+7U8LGZgqGnzXSAQQsU/rAM8/tDyv
	TWLpLiPof8k4FUXHJ7r7vvMKXAnboW0k3A38pcnJ9LeKqFb6eBHJtn7LYKAimlw=
X-Gm-Gg: ASbGncsnlfUqTxHpu7hNpFZq00vqqK/K2m3eSwyzmzG+KdAJACn8+w0wY/fHxYczVOs
	8sxBIu8kuAes14h1r1BH1i7Do1T59TuKOQW/qI/KfoJFWPKOxct2L+uPZCt1uA88w/xvQFog6Wq
	djBpVPnGpSG5cIUos9GxhoURHUxiKm5W29d8hq4185xaDwf8oBizqP6BFvOccjrpYr8oFKJu0sk
	nbrOAxq0wfjCKgt6GA76i5l7AQE9rUlD7KY47czdd2L4W/eaA==
X-Google-Smtp-Source: AGHT+IGj5bTxRBL/TPC4rp9UNK8vWD764vaF6GBCxeBJ0bzTi0HACd7gUMrcV8Bcwh/Ub684hrsLqw==
X-Received: by 2002:a17:902:f645:b0:216:5556:8b46 with SMTP id d9443c01a7336-219e70dbcf8mr427204505ad.49.1735317614352;
        Fri, 27 Dec 2024 08:40:14 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-89eaa1c4fdfsm7512714a12.60.2024.12.27.08.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:40:13 -0800 (PST)
Date: Fri, 27 Dec 2024 08:40:13 -0800 (PST)
X-Google-Original-Date: Fri, 27 Dec 2024 08:40:12 PST (-0800)
Subject:     Re: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
In-Reply-To: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
CC: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
  tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
  willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
  akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com, Arnd Bergmann <arnd@arndb.de>,
  Will Deacon <will@kernel.org>, aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
  rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
  linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
  linux-sh@vger.kernel.org, linux-um@lists.infradead.org, zhengqi.arch@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhengqi.arch@bytedance.com
Message-ID: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
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
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 23 Dec 2024 01:40:48 PST (-0800), zhengqi.arch@bytedance.com wrote:
> From: Kevin Brodsky <kevin.brodsky@arm.com>
>
> {pmd,pud,p4d}_alloc_one() is never called if the corresponding page
> table level is folded, as {pmd,pud,p4d}_alloc() already does the
> required check. We can therefore remove the runtime page table level
> checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
> the generic version, so we remove it altogether.
>
> This is consistent with the way arm64 and x86 handle this situation
> (runtime check in p4d_free() only).
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index f52264304f772..8ad0bbe838a24 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -12,7 +12,6 @@
>  #include <asm/tlb.h>
>
>  #ifdef CONFIG_MMU
> -#define __HAVE_ARCH_PUD_ALLOC_ONE
>  #define __HAVE_ARCH_PUD_FREE
>  #include <asm-generic/pgalloc.h>
>
> @@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
>  	}
>  }
>
> -#define pud_alloc_one pud_alloc_one
> -static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> -{
> -	if (pgtable_l4_enabled)
> -		return __pud_alloc_one(mm, addr);
> -
> -	return NULL;
> -}
> -
>  #define pud_free pud_free
>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>  {
> @@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  #define p4d_alloc_one p4d_alloc_one
>  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
>  {
> -	if (pgtable_l5_enabled) {
> -		gfp_t gfp = GFP_PGTABLE_USER;
> -
> -		if (mm == &init_mm)
> -			gfp = GFP_PGTABLE_KERNEL;
> -		return (p4d_t *)get_zeroed_page(gfp);
> -	}
> +	gfp_t gfp = GFP_PGTABLE_USER;
>
> -	return NULL;
> +	if (mm == &init_mm)
> +		gfp = GFP_PGTABLE_KERNEL;
> +	return (p4d_t *)get_zeroed_page(gfp);
>  }
>
>  static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Are you trying to keep these together, or do you want me to try and pick 
up the RISC-V bits on their own?

