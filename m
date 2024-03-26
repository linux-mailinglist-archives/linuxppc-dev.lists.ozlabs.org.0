Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF488BAB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:46:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uKfjQouz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3gLZ46tSz3vb3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 17:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uKfjQouz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3gKr3K3Pz3dwG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 17:45:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DC856103E;
	Tue, 26 Mar 2024 06:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE56CC433C7;
	Tue, 26 Mar 2024 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711435533;
	bh=ulrv7k7ZRJRs0j0UdGjBhPLsD3RfogntRNv4v9/Eono=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKfjQouzCOhBvoDhqXcHLgUMTJFUwVqNgPbgWGKOmhGTJ2nQSmlZE1A6IBDIPQY2A
	 zVpMgtMPeairercXPNLIzgoWtn3Fot5ibnD/lzLoVjSHSxBEC54Stouwo1s7On6811
	 GV3eKVumEycJwcreNVmSqHMaEU3TT7qbMKpzGd0QH1KXh/HcLxTNhvf4wg/wPPgehW
	 o9P9KN2GbpJQ2SiGHHDwXxJkMEoyB7gGG+UVh2qybk2PxPOBC9IrRtKLtb5QTE2OPs
	 8YV0+/1H9qGhY+CBxkf9uGH3nLLndd1kAzYHZhH2awWnGchEcMWzNHZhDmOF0r9nH8
	 uw4bX4TFQ7lqA==
Date: Tue, 26 Mar 2024 08:44:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 2/6] mm/mm_init.c: remove the useless dma_reserve
Message-ID: <ZgJu4z6JFBwo0p1-@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-3-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-3-bhe@redhat.com>
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

On Mon, Mar 25, 2024 at 10:56:42PM +0800, Baoquan He wrote:
> Now nobody calls set_dma_reserve() to set value for dma_reserve, remove
> set_dma_reserve(), global variable dma_reserve and the codes using it.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h |  1 -
>  mm/mm_init.c       | 23 -----------------------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0436b919f1c7..ad19350e1538 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3210,7 +3210,6 @@ static inline int early_pfn_to_nid(unsigned long pfn)
>  extern int __meminit early_pfn_to_nid(unsigned long pfn);
>  #endif
>  
> -extern void set_dma_reserve(unsigned long new_dma_reserve);
>  extern void mem_init(void);
>  extern void __init mmap_init(void);
>  
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 549e76af8f82..153fb2dc666f 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -226,7 +226,6 @@ static unsigned long required_movablecore_percent __initdata;
>  
>  static unsigned long nr_kernel_pages __initdata;
>  static unsigned long nr_all_pages __initdata;
> -static unsigned long dma_reserve __initdata;
>  
>  static bool deferred_struct_pages __meminitdata;
>  
> @@ -1583,12 +1582,6 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>  					zone_names[j], memmap_pages, freesize);
>  		}
>  
> -		/* Account for reserved pages */
> -		if (j == 0 && freesize > dma_reserve) {
> -			freesize -= dma_reserve;
> -			pr_debug("  %s zone: %lu pages reserved\n", zone_names[0], dma_reserve);
> -		}
> -
>  		if (!is_highmem_idx(j))
>  			nr_kernel_pages += freesize;
>  		/* Charge for highmem memmap if there are enough kernel pages */
> @@ -2547,22 +2540,6 @@ void *__init alloc_large_system_hash(const char *tablename,
>  	return table;
>  }
>  
> -/**
> - * set_dma_reserve - set the specified number of pages reserved in the first zone
> - * @new_dma_reserve: The number of pages to mark reserved
> - *
> - * The per-cpu batchsize and zone watermarks are determined by managed_pages.
> - * In the DMA zone, a significant percentage may be consumed by kernel image
> - * and other unfreeable allocations which can skew the watermarks badly. This
> - * function may optionally be used to account for unfreeable pages in the
> - * first zone (e.g., ZONE_DMA). The effect will be lower watermarks and
> - * smaller per-cpu batchsize.
> - */
> -void __init set_dma_reserve(unsigned long new_dma_reserve)
> -{
> -	dma_reserve = new_dma_reserve;
> -}
> -
>  void __init memblock_free_pages(struct page *page, unsigned long pfn,
>  							unsigned int order)
>  {
> -- 
> 2.41.0
> 
> 

-- 
Sincerely yours,
Mike.
