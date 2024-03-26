Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D288C41A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 14:50:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NHSNzpqy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hOnUextn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3rlh3hz9z3vXw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 00:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NHSNzpqy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hOnUextn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3rkw6j1Dz3d3Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 00:49:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711460961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzgh4GVszcwQ5kywfb8L4k+Qo7qZ/xV1p+DuS7SPp54=;
	b=NHSNzpqyBS9it6GnNCJ0rYKZvoDQoECOCHjViA9LtJ1Q+a2OhzeZJ1O0NUd+0lAV34bCVO
	67RG1pt6pbBR94bOprWhIOK6SjN6OuA6IC3ewZIN7D0spiLy2wT/lGKVbmmWtTifG+wHZd
	9TpFQC6/HBO+CZbJH/mXkVSgEfjH/RI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711460962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzgh4GVszcwQ5kywfb8L4k+Qo7qZ/xV1p+DuS7SPp54=;
	b=hOnUextnGmjcSJJnBXhZYWcPEslMwvE0HEWOrauzMCreaXV+XgOTrRi0+iVf3z5mBbkmhp
	IV1AOIWdCfKWzU9XUIwgxUesobuxFQbjKlU4K6So5pw9R643Bil8N0locruRvJPPXzBifH
	T/xFMnSBq5Zs4Y+KldaRG/RCCkgy2XM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-yNP3kpugPDeb38rdMr3mQQ-1; Tue,
 26 Mar 2024 09:49:16 -0400
X-MC-Unique: yNP3kpugPDeb38rdMr3mQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5195C28EC117;
	Tue, 26 Mar 2024 13:49:16 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D083C041F3;
	Tue, 26 Mar 2024 13:49:15 +0000 (UTC)
Date: Tue, 26 Mar 2024 21:49:07 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 3/6] mm/mm_init.c: add new function calc_nr_all_pages()
Message-ID: <ZgLSUx2tC5caoJb/@MiWiFi-R3L-srv>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-4-bhe@redhat.com>
 <ZgJx2RLPAdom1EbE@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgJx2RLPAdom1EbE@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

On 03/26/24 at 08:57am, Mike Rapoport wrote:
> Hi Baoquan,
> 
> On Mon, Mar 25, 2024 at 10:56:43PM +0800, Baoquan He wrote:
> > This is a preparation to calculate nr_kernel_pages and nr_all_pages,
> > both of which will be used later in alloc_large_system_hash().
> > 
> > nr_all_pages counts up all free but not reserved memory in memblock
> > allocator, including HIGHMEM memory. While nr_kernel_pages counts up
> > all free but not reserved low memory in memblock allocator, excluding
> > HIGHMEM memory.
> 
> Sorry I've missed this in the previous review, but I think this patch and
> the patch "remove unneeded calc_memmap_size()" can be merged into "remove
> meaningless calculation of zone->managed_pages in free_area_init_core()"
> with an appropriate update of the commit message.
> 
> With the current patch splitting there will be compilation warning about unused
> function for this and the next patch.

Thanks for careful checking.

We need to make patch bisect-able to not break compiling so that people can
spot the cirminal commit, that's for sure. Do we need care about the
compiling warning from intermediate patch in one series? Not sure about
it. I always suggest people to seperate out this kind of newly added
function to a standalone patch for better reviewing and later checking,
and I saw a lot of commits like this by searching with
'git log --oneline | grep helper'

>  
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/mm_init.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 153fb2dc666f..c57a7fc97a16 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1264,6 +1264,30 @@ static void __init reset_memoryless_node_totalpages(struct pglist_data *pgdat)
> >  	pr_debug("On node %d totalpages: 0\n", pgdat->node_id);
> >  }
> >  
> > +static void __init calc_nr_kernel_pages(void)
> > +{
> > +	unsigned long start_pfn, end_pfn;
> > +	phys_addr_t start_addr, end_addr;
> > +	u64 u;
> > +#ifdef CONFIG_HIGHMEM
> > +	unsigned long high_zone_low = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
> > +#endif
> > +
> > +	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
> > +		start_pfn = PFN_UP(start_addr);
> > +		end_pfn   = PFN_DOWN(end_addr);
> > +
> > +		if (start_pfn < end_pfn) {
> > +			nr_all_pages += end_pfn - start_pfn;
> > +#ifdef CONFIG_HIGHMEM
> > +			start_pfn = clamp(start_pfn, 0, high_zone_low);
> > +			end_pfn = clamp(end_pfn, 0, high_zone_low);
> > +#endif
> > +			nr_kernel_pages += end_pfn - start_pfn;
> > +		}
> > +	}
> > +}
> > +
> >  static void __init calculate_node_totalpages(struct pglist_data *pgdat,
> >  						unsigned long node_start_pfn,
> >  						unsigned long node_end_pfn)
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

