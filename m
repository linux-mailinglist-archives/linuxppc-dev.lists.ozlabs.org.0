Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF50730397
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 17:21:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpQZOD1H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh8Jr1Mz8z30hJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpQZOD1H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh8HQ3Rnfz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 01:20:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD89F61F65;
	Wed, 14 Jun 2023 15:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DADCC433C8;
	Wed, 14 Jun 2023 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756000;
	bh=pvs0YVME2yJhlMmiS60aNyWkmP4h1eZnbjNjnr8k7aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpQZOD1HFnMrM9fo4KdT8pfiKgkiDnXqITSqdsPxwtYIOIx2PBHkeiXHNgWscAcgu
	 7Ludmi0rX4hJke5WXXLAQEn2uCuzmmwp55/iPdSkzGfbm3/7b6D/ARVdqBcqHg2PuT
	 IpiZPKRPo311M/7dwEqLNTB4eEbaoSqrCh9SmEM/Nh700FMYjNTJ646BJmkGOl+ViX
	 wyn9wHmVrmWWVolNGJf0+VJI/kXJrLoD+WGEjfmqa8ga4rLQqqHlxKBhJuM4wDRcU2
	 FeUYfth8UqkvYnAB19GLBf6adak/YgfNGfdLVnkPWuFE7ylBYlwtenSYSzQgRBwuNz
	 fifauRpCnWIdg==
Date: Wed, 14 Jun 2023 18:19:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 30/34] sh: Convert pte_free_tlb() to use ptdescs
Message-ID: <20230614151921.GC52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-31-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-31-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:04:19PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sh/include/asm/pgalloc.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
> index a9e98233c4d4..5d8577ab1591 100644
> --- a/arch/sh/include/asm/pgalloc.h
> +++ b/arch/sh/include/asm/pgalloc.h
> @@ -2,6 +2,7 @@
>  #ifndef __ASM_SH_PGALLOC_H
>  #define __ASM_SH_PGALLOC_H
>  
> +#include <linux/mm.h>
>  #include <asm/page.h>
>  
>  #define __HAVE_ARCH_PMD_ALLOC_ONE
> @@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>  	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
>  }
>  
> -#define __pte_free_tlb(tlb,pte,addr)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)				\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  } while (0)
>  
>  #endif /* __ASM_SH_PGALLOC_H */
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
