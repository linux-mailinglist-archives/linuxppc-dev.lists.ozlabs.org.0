Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A117788BAD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:58:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ay3TqeCm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3gd82zhmz3dy3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 17:58:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ay3TqeCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3gcP4Jdxz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 17:58:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4B0D61203;
	Tue, 26 Mar 2024 06:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0DFC433F1;
	Tue, 26 Mar 2024 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711436290;
	bh=Oto1Bgx2nEcBajuiq3zg5pa2/Kdk7vuiCcvbsEb1ox4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ay3TqeCmVtCa4qF1OL7AxLUF84qxvhegocKTuLWHsbSzS0UgBlX6f7JYNGb8GsCCe
	 qFmQRDbOM1FkEdIcqkVwhm64D+hPxIJNp6dbf8c0W/FuEw56ogMEjRCM/FOdLWKAbZ
	 0yHansf3kxUb5Lg4jDxjCOL5HNwe/eO/kiY4JrnAhwSZ5dG1adz9keSrXWgyqnlyI1
	 WcvlKvRNMtOCP7F40tIJ1Dvam3LfxDgwCOx6j8B7kc4BEl++YLMZJu715mR4qd56gl
	 FDAxb7ulwHdEUegXRfRWU/qnUO20UzXt3ALdHLqKNdWqmYi24QG6HIL2SjP2TydLZT
	 zKa93/C8jXs1g==
Date: Tue, 26 Mar 2024 08:57:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 3/6] mm/mm_init.c: add new function calc_nr_all_pages()
Message-ID: <ZgJx2RLPAdom1EbE@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-4-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-4-bhe@redhat.com>
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

Hi Baoquan,

On Mon, Mar 25, 2024 at 10:56:43PM +0800, Baoquan He wrote:
> This is a preparation to calculate nr_kernel_pages and nr_all_pages,
> both of which will be used later in alloc_large_system_hash().
> 
> nr_all_pages counts up all free but not reserved memory in memblock
> allocator, including HIGHMEM memory. While nr_kernel_pages counts up
> all free but not reserved low memory in memblock allocator, excluding
> HIGHMEM memory.

Sorry I've missed this in the previous review, but I think this patch and
the patch "remove unneeded calc_memmap_size()" can be merged into "remove
meaningless calculation of zone->managed_pages in free_area_init_core()"
with an appropriate update of the commit message.

With the current patch splitting there will be compilation warning about unused
function for this and the next patch.
 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/mm_init.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 153fb2dc666f..c57a7fc97a16 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1264,6 +1264,30 @@ static void __init reset_memoryless_node_totalpages(struct pglist_data *pgdat)
>  	pr_debug("On node %d totalpages: 0\n", pgdat->node_id);
>  }
>  
> +static void __init calc_nr_kernel_pages(void)
> +{
> +	unsigned long start_pfn, end_pfn;
> +	phys_addr_t start_addr, end_addr;
> +	u64 u;
> +#ifdef CONFIG_HIGHMEM
> +	unsigned long high_zone_low = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
> +#endif
> +
> +	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
> +		start_pfn = PFN_UP(start_addr);
> +		end_pfn   = PFN_DOWN(end_addr);
> +
> +		if (start_pfn < end_pfn) {
> +			nr_all_pages += end_pfn - start_pfn;
> +#ifdef CONFIG_HIGHMEM
> +			start_pfn = clamp(start_pfn, 0, high_zone_low);
> +			end_pfn = clamp(end_pfn, 0, high_zone_low);
> +#endif
> +			nr_kernel_pages += end_pfn - start_pfn;
> +		}
> +	}
> +}
> +
>  static void __init calculate_node_totalpages(struct pglist_data *pgdat,
>  						unsigned long node_start_pfn,
>  						unsigned long node_end_pfn)
> -- 
> 2.41.0
> 

-- 
Sincerely yours,
Mike.
