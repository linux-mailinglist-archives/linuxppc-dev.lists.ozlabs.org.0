Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9488BADA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:59:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnZXP2hr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3gdx3cJCz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 17:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnZXP2hr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3gct4QNPz3dxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 17:58:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1573DCE1E40;
	Tue, 26 Mar 2024 06:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9A1C433C7;
	Tue, 26 Mar 2024 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711436316;
	bh=2h+xwPao4UQjY5pzAeqIZuJmOnkTkwIZDSMWkOI2/m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnZXP2hrOZj2Z8QDTITPOCDYzWo/RpPKcF0v6NAm2SpxZh0PsXWZuJwc3oEBhKUWv
	 Mi68YOrSG5ih18gIT2PvjY4DobC3VNnhLdVZ4TKV5pulyRNF+tgTqiupcSx4gKxdDF
	 jeh31wT4loBcfFORRnpiYexhmfYOeJ0YRYAbUKlUvrW4KnatdYDaSPrIx66kjajELw
	 ZmEbAEgh75QcmMm4slvb4gY5lIJxBCtvKm1zkNq5n1lycKvAdGz+YzlUO+7hqlJNOw
	 OOI24Tspe9k4/8k5zOe4Nf3ymGckG543nJ0Hn4azqvR6YbgKjAskBkT5tdXk4ZBfMA
	 uifqEFW4HXdvQ==
Date: Tue, 26 Mar 2024 08:57:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 6/6] mm/mm_init.c: remove arch_reserved_kernel_pages()
Message-ID: <ZgJx8wXHkbY4FsuT@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-7-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-7-bhe@redhat.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 10:56:46PM +0800, Baoquan He wrote:
> Since the current calculation of calc_nr_kernel_pages() has taken into
> consideration of kernel reserved memory, no need to have
> arch_reserved_kernel_pages() any more.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/include/asm/mmu.h |  4 ----
>  arch/powerpc/kernel/fadump.c   |  5 -----
>  include/linux/mm.h             |  3 ---
>  mm/mm_init.c                   | 12 ------------
>  4 files changed, 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 3b72c7ed24cf..aa5c0fd5edb1 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -406,9 +406,5 @@ extern void *abatron_pteptrs[2];
>  #include <asm/nohash/mmu.h>
>  #endif
>  
> -#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
> -#define __HAVE_ARCH_RESERVED_KERNEL_PAGES
> -#endif
> -
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_MMU_H_ */
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index d14eda1e8589..ae8c7619e597 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1735,8 +1735,3 @@ static void __init fadump_reserve_crash_area(u64 base)
>  		memblock_reserve(mstart, msize);
>  	}
>  }
> -
> -unsigned long __init arch_reserved_kernel_pages(void)
> -{
> -	return memblock_reserved_size() / PAGE_SIZE;
> -}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ad19350e1538..ab1ba0a31429 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3221,9 +3221,6 @@ static inline void show_mem(void)
>  extern long si_mem_available(void);
>  extern void si_meminfo(struct sysinfo * val);
>  extern void si_meminfo_node(struct sysinfo *val, int nid);
> -#ifdef __HAVE_ARCH_RESERVED_KERNEL_PAGES
> -extern unsigned long arch_reserved_kernel_pages(void);
> -#endif
>  
>  extern __printf(3, 4)
>  void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, ...);
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index e269a724f70e..089dc60159e9 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2373,17 +2373,6 @@ void __init page_alloc_init_late(void)
>  	page_alloc_sysctl_init();
>  }
>  
> -#ifndef __HAVE_ARCH_RESERVED_KERNEL_PAGES
> -/*
> - * Returns the number of pages that arch has reserved but
> - * is not known to alloc_large_system_hash().
> - */
> -static unsigned long __init arch_reserved_kernel_pages(void)
> -{
> -	return 0;
> -}
> -#endif
> -
>  /*
>   * Adaptive scale is meant to reduce sizes of hash tables on large memory
>   * machines. As memory size is increased the scale is also increased but at
> @@ -2426,7 +2415,6 @@ void *__init alloc_large_system_hash(const char *tablename,
>  	if (!numentries) {
>  		/* round applicable memory size up to nearest megabyte */
>  		numentries = nr_kernel_pages;
> -		numentries -= arch_reserved_kernel_pages();
>  
>  		/* It isn't necessary when PAGE_SIZE >= 1MB */
>  		if (PAGE_SIZE < SZ_1M)
> -- 
> 2.41.0
> 

-- 
Sincerely yours,
Mike.
