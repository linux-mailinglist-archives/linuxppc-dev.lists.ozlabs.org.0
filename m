Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A373F412
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 07:48:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CKCXCuWl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqv0B5wKKz3bVp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 15:48:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CKCXCuWl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqtzJ2bCRz2yy1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 15:47:54 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55767141512so1767488a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 22:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687844871; x=1690436871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjTPMlxWt9nC/sXrGsrew1h8LID7KP4FRrxfXfknacs=;
        b=CKCXCuWl0gYpQ4q8YGqBYIHt4kiR1AhHpEiDPYQrq6u+C1EcCN199Rf+TEI2yZgN+R
         yHF4vksLQaZZNCW1AKLUCeBUhO/zz1T+Q9/6Dn0kQ15ZW6K5TqPmtUB9rSpHUKgxZgiA
         HSTUVKDZ4xM6L9+zGQEVzY8EH5rZJBCsvXHjcbbzvbKrE2StJxwwReSDEN5b3GfPvLfH
         eqtt0xPcEOboGwjNakJZJtyOpw0n8CltvqJLvaWUUnjMuBH5yNe38AlJDiG6mzZTOhDy
         hB/teSyin+eBzVwUgFatWumtP7LykGuBvZNNj+IJUNFfPVWNZBZUcFVQKEBMH4tHKOww
         HTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844871; x=1690436871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjTPMlxWt9nC/sXrGsrew1h8LID7KP4FRrxfXfknacs=;
        b=a3gdwaqR9Sq8OeHCBPhK34KA0rPTRwtNGGjXjjDezEY8Ebkd/X8myy+8LuHdb5bDHK
         4c+L+/96v496WFkA9OoTC3GjUTglhXQhajMfI9G9eJy0YKsErOsIBGRlCcMrFS8sV60y
         3m3CGQqatlHmZ/0DopgelXh5QL1y3anXdIwgLtaUKzXnNLOEiyJ7fgE9bhpLrkXoI2Gc
         YCVBmSzDmdmeLx8La+FjPojsnbCgD5LHjbR4m0rxrs5RVxqz7S2wAg8Zu65KfBS0DZ0/
         dcmSFhY9tqIRmFGi8msPhJVEY7YUrQudgoJrJmTIEMm62Fnlq1cYpfu1mZ9mKp8yJlp8
         lQBg==
X-Gm-Message-State: AC+VfDxOzMGfuL5JGfOQgwfPCf+aUYSx1P3OJ8XxwgiAjChlS65h6360
	/LJ+RR7rejjH0O7xPCKnbvg=
X-Google-Smtp-Source: ACHHUZ7JjW8b6fgOe+JthCsQbs9/NjABXgCew6ba8g3n2m02um8mxuD9LeyNll8XOwuywhMwRgh5kw==
X-Received: by 2002:a05:6a20:7491:b0:126:8ddd:d786 with SMTP id p17-20020a056a20749100b001268dddd786mr5575003pzd.46.1687844870738;
        Mon, 26 Jun 2023 22:47:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id je5-20020a170903264500b001b8004ff609sm3033756plb.270.2023.06.26.22.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:47:50 -0700 (PDT)
Date: Mon, 26 Jun 2023 22:47:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Message-ID: <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622205745.79707-27-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

This patch causes all nios2 builds to fail.

Building nios2:allnoconfig ... failed
--------------
Error log:
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
In file included from mm/memory.c:85:
mm/memory.c: In function 'free_pte_range':
arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of function 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=implicit-function-declaration]
   33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
      |                 ^~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);
      |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
   33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
      |                                    ^~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);
      |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of function 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Werror=implicit-function-declaration]
   34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
      |                 ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);

> ---
>  arch/nios2/include/asm/pgalloc.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
> index ecd1657bb2ce..ce6bb8e74271 100644
> --- a/arch/nios2/include/asm/pgalloc.h
> +++ b/arch/nios2/include/asm/pgalloc.h
> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>  
>  extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
> -#define __pte_free_tlb(tlb, pte, addr)				\
> -	do {							\
> -		pgtable_pte_page_dtor(pte);			\
> -		tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)					\
> +	do {								\
> +		pagetable_pte_dtor(page_ptdesc(pte));			\
> +		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  	} while (0)
>  
>  #endif /* _ASM_NIOS2_PGALLOC_H */
> -- 
> 2.40.1
> 
> 
