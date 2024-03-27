Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8A88EB0E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 17:22:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IavBJGsz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4X5H5Xrtz3vbq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 03:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IavBJGsz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4X4Z4zcnz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:22:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6DFD615F0;
	Wed, 27 Mar 2024 16:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE561C433C7;
	Wed, 27 Mar 2024 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711556524;
	bh=/HwfEIPp2rgEplQNov6HPpeEoXKzTzryrZH4IYBxJHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IavBJGszFmAlc2pEn+zfe6ZTmvjuzS8OniqKBl3fq326ok4Z1/lQIFhubB5J3YlF+
	 UJ7cH6fmsukvoIbMe+qb0s38Dpb5PZkO6MeQepUNQjTYesXIsI7Tt6Okk8maBGjSOE
	 2ZjVJLDIGgdH9xzzcM3kKRi0rqL4LQ0EAJjGeovCvCD4A6h/kwamy8QttJ8EIgV/zp
	 IzQAw0jKezVA3KsiiT8nk7Tn7rm+KI1haka80NRE9CgIVAe6TudWIlsqAq3Su1BT8/
	 j2oRBxYxdj1bTB2sEPjNeWwA+TXigfhS5Lc9NBty0edAy6fDSDCpgqHNsZ1UG/5piz
	 SSHvZMjybuQKQ==
Date: Wed, 27 Mar 2024 18:21:20 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 5/6] mm/mm_init.c: remove unneeded calc_memmap_size()
Message-ID: <ZgRHgL1zbQc2DJlc@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-6-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-6-bhe@redhat.com>
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

On Mon, Mar 25, 2024 at 10:56:45PM +0800, Baoquan He wrote:
> Nobody calls calc_memmap_size() now.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

Looks like I replied to patch 6/6 twice by mistake and missed this one.

> ---
>  mm/mm_init.c | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 7f71e56e83f3..e269a724f70e 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1331,26 +1331,6 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
>  	pr_debug("On node %d totalpages: %lu\n", pgdat->node_id, realtotalpages);
>  }
>  
> -static unsigned long __init calc_memmap_size(unsigned long spanned_pages,
> -						unsigned long present_pages)
> -{
> -	unsigned long pages = spanned_pages;
> -
> -	/*
> -	 * Provide a more accurate estimation if there are holes within
> -	 * the zone and SPARSEMEM is in use. If there are holes within the
> -	 * zone, each populated memory region may cost us one or two extra
> -	 * memmap pages due to alignment because memmap pages for each
> -	 * populated regions may not be naturally aligned on page boundary.
> -	 * So the (present_pages >> 4) heuristic is a tradeoff for that.
> -	 */
> -	if (spanned_pages > present_pages + (present_pages >> 4) &&
> -	    IS_ENABLED(CONFIG_SPARSEMEM))
> -		pages = present_pages;
> -
> -	return PAGE_ALIGN(pages * sizeof(struct page)) >> PAGE_SHIFT;
> -}
> -
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  static void pgdat_init_split_queue(struct pglist_data *pgdat)
>  {
> -- 
> 2.41.0
> 

-- 
Sincerely yours,
Mike.
