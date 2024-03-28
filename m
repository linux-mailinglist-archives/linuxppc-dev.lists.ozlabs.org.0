Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D565D890238
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 15:47:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Av25BND/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aqqNHXgS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V55x74mx9z3vbV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 01:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Av25BND/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aqqNHXgS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V55wL53ZRz3cWR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 01:46:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711637214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPAuSkYgy+MUhS8KdVZMaOcLOllCqbF/NxocVA82LN4=;
	b=Av25BND/RibwvmfIJu6vQCNmK0zE+/YFiC0pPxmO0BBpwyDzJguegIwixjjFk9+HVq9O3F
	S/4vMLbnb4DMb9bGGOSN2ox0E63C2dPcyTSCpjYktCu7071Acfr+RTxuF/Eay5uE4V0+Cx
	PQAS10CDvf6ExevvMpyD0xnpR4qhrLg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711637215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPAuSkYgy+MUhS8KdVZMaOcLOllCqbF/NxocVA82LN4=;
	b=aqqNHXgS92c3BpXuG/jkXFDM2AQYtjfm4Txd1pJp1mVi29s5x1iE3+cODhAPs1Zb4kM6Gc
	qn9tbTYJ1LL4pUGKQGY4Y4Tq3o00AiGcJkciUnWAxKhgwM1D+7faDdAIvoCqc7aUHuLxxZ
	pIqhvHJPJxnxovZuNPTWEVxrDHQrtoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-PInHT43-PY2c36tojWgsHg-1; Thu, 28 Mar 2024 10:46:50 -0400
X-MC-Unique: PInHT43-PY2c36tojWgsHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E226801906;
	Thu, 28 Mar 2024 14:46:49 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD432024517;
	Thu, 28 Mar 2024 14:46:48 +0000 (UTC)
Date: Thu, 28 Mar 2024 22:46:39 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <ZgWCzx7+OxPgFIaU@MiWiFi-R3L-srv>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-5-bhe@redhat.com>
 <ZgUrJuatQqAT0QA1@MiWiFi-R3L-srv>
 <ZgU9_zpuIOu2b_gT@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgU9_zpuIOu2b_gT@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

On 03/28/24 at 11:53am, Mike Rapoport wrote:
> On Thu, Mar 28, 2024 at 04:32:38PM +0800, Baoquan He wrote:
> > On 03/25/24 at 10:56pm, Baoquan He wrote:
> > >  
> > >  		/*
> > > -		 * Set an approximate value for lowmem here, it will be adjusted
> > > -		 * when the bootmem allocator frees pages into the buddy system.
> > > -		 * And all highmem pages will be managed by the buddy system.
> > > +		 * Initialize zone->managed_pages as 0 , it will be reset
> > > +		 * when memblock allocator frees pages into buddy system.
> > >  		 */
> > > -		zone_init_internals(zone, j, nid, freesize);
> > > +		zone_init_internals(zone, j, nid, 0);
> > 
> > Here, we should initialize zone->managed_pages as zone->present_pages
> > because later page_group_by_mobility_disabled need be set according to
> > zone->managed_pages. Otherwise page_group_by_mobility_disabled will be
> > set to 1 always. I will sent out v3.
> 
> With zone->managed_pages set to zone->present_pages we won't account for
> the reserved memory for initialization of page_group_by_mobility_disabled.

The old zone->managed_pages didn't account for the reserved pages
either. It's calculated by (zone->present_pages - memmap_pages). memmap
pages only is only a very small portion, e.g on x86_64, 4K page size,
assuming size of struct page is 64, then it's 1/64 of system memory.
On arm64, 64K page size, it's 1/1024 of system memory.

And about the setting of page_group_by_mobility_disabled, the compared
value pageblock_nr_pages * MIGRATE_TYPES which is very small. On x86_64,
it's 4M*6=24M; on arm64 with 64K size and 128M*6=768M which should be
the biggest among ARCH-es. 

	if (vm_total_pages < (pageblock_nr_pages * MIGRATE_TYPES)) 
                page_group_by_mobility_disabled = 1;
        else    
                page_group_by_mobility_disabled = 0;

So page_group_by_mobility_disabled could be set to 1 only on system with
very little memory which is very rarely seen. And setting
zone->managed_pages as zone->present_pages is very close to its old
value: (zone->present_pages - memmap_pages). Here we don't need be very
accurate, just a rough value.

> 
> As watermarks are still not initialized at the time build_all_zonelists()
> is called, we may use nr_all_pages - nr_kernel_pages instead of
> nr_free_zone_pages(), IMO.

nr_all_pages should be fine if we take this way. nr_kernel_pages is a
misleading name, it's all low memory pages excluding kernel reserved
apges. nr_all_pages is all memory pages including highmema and exluding
kernel reserved pages.

Both is fine to me. The first one is easier, simply setting
zone->managed_pages as zone->present_pages. The 2nd way is a little more
accurate.

>  
> > From a17b0921b4bd00596330f61ee9ea4b82386a9fed Mon Sep 17 00:00:00 2001
> > From: Baoquan He <bhe@redhat.com>
> > Date: Thu, 28 Mar 2024 16:20:15 +0800
> > Subject: [PATCH] mm/mm_init.c: set zone's ->managed_pages as ->present_pages
> >  for now
> > Content-type: text/plain
> > 
> > Because page_group_by_mobility_disabled need be set according to zone's
> > managed_pages later.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/mm_init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index cc24e7958c0c..dd875f943cbb 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1561,7 +1561,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
> >  		 * Initialize zone->managed_pages as 0 , it will be reset
> >  		 * when memblock allocator frees pages into buddy system.
> >  		 */
> > -		zone_init_internals(zone, j, nid, 0);
> > +		zone_init_internals(zone, j, nid, zone->present_pages);
> >  
> >  		if (!size)
> >  			continue;
> > -- 
> > 2.41.0
> > 
> > 
> > >  
> > >  		if (!size)
> > >  			continue;
> > > @@ -1915,6 +1878,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> > >  		check_for_memory(pgdat);
> > >  	}
> > >  
> > > +	calc_nr_kernel_pages();
> > >  	memmap_init();
> > >  
> > >  	/* disable hash distribution for systems with a single node */
> > > -- 
> > > 2.41.0
> > > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

