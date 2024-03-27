Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502588E977
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:42:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y7y9hYHu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WBN0CN2z3vmW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y7y9hYHu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4W955ts9z3vqB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:40:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCADD615C6;
	Wed, 27 Mar 2024 15:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEBEC433A6;
	Wed, 27 Mar 2024 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554055;
	bh=HNlX16yEhkMKnQYWOX4sU3T+8rc8JG5/hnyo+cviw3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7y9hYHuRLtHvFLwO8Y4NO0itC/fk4QqmGjSusGf91p3QG5DF6iyq1cxHOvvstzI0
	 edCWgqhb/0nQbxWRTgf8biJg0d5OeT9/fbxX6E/GjmojuvotpQOzjJ0fTSE+bjk13Z
	 21wIMYhkIy7dr+27z0Yzz2IZdMF9m0HoRyEgdrtyqkn7d/Lxic2MM5TmmEfclHRjaG
	 TMc7uLg0ymzMNuHxyfmESWSNzMzcnrRwnwI18Zrdq9w7rmLyzP1CQ4DRxYinYyq+xY
	 P3tSh6w6HlL+vOS/Flq9BgOvcdfVDQyD20LMrIQR5rBkNZ0rl1e+G4RbiPKlwZFoGN
	 dI6A4osqTA2Qg==
Date: Wed, 27 Mar 2024 17:40:12 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 3/6] mm/mm_init.c: add new function calc_nr_all_pages()
Message-ID: <ZgQ93KOEfzr2_OVx@kernel.org>
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

On Mon, Mar 25, 2024 at 10:56:43PM +0800, Baoquan He wrote:
> This is a preparation to calculate nr_kernel_pages and nr_all_pages,
> both of which will be used later in alloc_large_system_hash().
> 
> nr_all_pages counts up all free but not reserved memory in memblock
> allocator, including HIGHMEM memory. While nr_kernel_pages counts up
> all free but not reserved low memory in memblock allocator, excluding
> HIGHMEM memory.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

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
