Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C642288FC32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 10:54:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U8iqTLUC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4zQs3y9gz3vZR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 20:54:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U8iqTLUC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4zQ76CD7z3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 20:53:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D48761773;
	Thu, 28 Mar 2024 09:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB673C433F1;
	Thu, 28 Mar 2024 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711619627;
	bh=Wm6m/5NnyZXHRXMhf1wtzYJHCSsEEotxxLtlnt6uvfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8iqTLUC1Z26MKdfJFwiRCqyZ18YCrF2/CkvVqkztwWhlapXzOnK8juK0WNjLR9iW
	 HXOGboOQdgVSPZXdvbkhoq+lPLuwkOIHMdoKUwjQa4SEpGeppm7+4A/tlFYKA16FrZ
	 sXBSBnlfAWKvrEz12xKLtOd06KdMUKIN7XUImcuBCySQQiUKQx4Dj9YgG9RN7pbUf9
	 QojdrgaTUPDnRwZxkQ2dkXCTfUq30Iz4R9ZcF+P9QIpdq6Ao4G9EM6TPWC4kZlZXcY
	 QRX8PzVwyBv3YFaWCmk4d/KiMNzCOMYaGEMNmqXYiEJZ8fRQEA0npvcQ7ezBAo/DG2
	 EnoyUzrQaXCzw==
Date: Thu, 28 Mar 2024 11:53:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <ZgU9_zpuIOu2b_gT@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-5-bhe@redhat.com>
 <ZgUrJuatQqAT0QA1@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgUrJuatQqAT0QA1@MiWiFi-R3L-srv>
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

On Thu, Mar 28, 2024 at 04:32:38PM +0800, Baoquan He wrote:
> On 03/25/24 at 10:56pm, Baoquan He wrote:
> >  
> >  		/*
> > -		 * Set an approximate value for lowmem here, it will be adjusted
> > -		 * when the bootmem allocator frees pages into the buddy system.
> > -		 * And all highmem pages will be managed by the buddy system.
> > +		 * Initialize zone->managed_pages as 0 , it will be reset
> > +		 * when memblock allocator frees pages into buddy system.
> >  		 */
> > -		zone_init_internals(zone, j, nid, freesize);
> > +		zone_init_internals(zone, j, nid, 0);
> 
> Here, we should initialize zone->managed_pages as zone->present_pages
> because later page_group_by_mobility_disabled need be set according to
> zone->managed_pages. Otherwise page_group_by_mobility_disabled will be
> set to 1 always. I will sent out v3.

With zone->managed_pages set to zone->present_pages we won't account for
the reserved memory for initialization of page_group_by_mobility_disabled.

As watermarks are still not initialized at the time build_all_zonelists()
is called, we may use nr_all_pages - nr_kernel_pages instead of
nr_free_zone_pages(), IMO.
 
> From a17b0921b4bd00596330f61ee9ea4b82386a9fed Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Thu, 28 Mar 2024 16:20:15 +0800
> Subject: [PATCH] mm/mm_init.c: set zone's ->managed_pages as ->present_pages
>  for now
> Content-type: text/plain
> 
> Because page_group_by_mobility_disabled need be set according to zone's
> managed_pages later.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index cc24e7958c0c..dd875f943cbb 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1561,7 +1561,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>  		 * Initialize zone->managed_pages as 0 , it will be reset
>  		 * when memblock allocator frees pages into buddy system.
>  		 */
> -		zone_init_internals(zone, j, nid, 0);
> +		zone_init_internals(zone, j, nid, zone->present_pages);
>  
>  		if (!size)
>  			continue;
> -- 
> 2.41.0
> 
> 
> >  
> >  		if (!size)
> >  			continue;
> > @@ -1915,6 +1878,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> >  		check_for_memory(pgdat);
> >  	}
> >  
> > +	calc_nr_kernel_pages();
> >  	memmap_init();
> >  
> >  	/* disable hash distribution for systems with a single node */
> > -- 
> > 2.41.0
> > 
> 

-- 
Sincerely yours,
Mike.
