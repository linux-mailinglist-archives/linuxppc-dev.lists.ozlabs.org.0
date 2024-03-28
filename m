Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFB88F487
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:25:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aWhJziMX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfEhpr+P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4m6x3JGJz3vZB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 12:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aWhJziMX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfEhpr+P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4m6D48gdz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:24:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711589055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LilcHusgSvqim2+d+06wj9NkX9jRJyVASh1CxKYlBM4=;
	b=aWhJziMXpJtWBO8AoeJC1NE3ah5lez7dAXJLLXxxI+nyiQhSnSu+zENml67itiIvflrSFZ
	Dntftqp7Pnpg4ZzgVyRwQyv191kvPhqtwn70gmO/IiHbCLlmX3QYPQJyBZYl3lGG+uwA9h
	/T+wnRTNZfX5nO992p6OrLgW/0jaA7o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711589056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LilcHusgSvqim2+d+06wj9NkX9jRJyVASh1CxKYlBM4=;
	b=UfEhpr+P38FVOpX14G6f60qCqfqdXF/7WqR7DQFQ/9CY3GpWoQQfL2/CLoKRfHE75vQYwJ
	4rh3NzuQgIWoOKjeipUVhZ486wKC4XvOCv1LtN2Ppw8bmsUQej895zhzSM7L/uPHXVA+VR
	KumkBoyVZYRRfn1cPDIu8z4XcMcEhVw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-pbODCuinOoimN5IXwG6ifw-1; Wed,
 27 Mar 2024 21:24:10 -0400
X-MC-Unique: pbODCuinOoimN5IXwG6ifw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 238DA3C0EABF;
	Thu, 28 Mar 2024 01:24:10 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5369217A9D;
	Thu, 28 Mar 2024 01:24:08 +0000 (UTC)
Date: Thu, 28 Mar 2024 09:24:01 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 5/6] mm/mm_init.c: remove unneeded calc_memmap_size()
Message-ID: <ZgTGsY/nQlKZd8jh@MiWiFi-R3L-srv>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-6-bhe@redhat.com>
 <ZgRHgL1zbQc2DJlc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgRHgL1zbQc2DJlc@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

On 03/27/24 at 06:21pm, Mike Rapoport wrote:
> On Mon, Mar 25, 2024 at 10:56:45PM +0800, Baoquan He wrote:
> > Nobody calls calc_memmap_size() now.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> 
> Looks like I replied to patch 6/6 twice by mistake and missed this one.

Thanks for your careful reviewing.

> 
> > ---
> >  mm/mm_init.c | 20 --------------------
> >  1 file changed, 20 deletions(-)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 7f71e56e83f3..e269a724f70e 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1331,26 +1331,6 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
> >  	pr_debug("On node %d totalpages: %lu\n", pgdat->node_id, realtotalpages);
> >  }
> >  
> > -static unsigned long __init calc_memmap_size(unsigned long spanned_pages,
> > -						unsigned long present_pages)
> > -{
> > -	unsigned long pages = spanned_pages;
> > -
> > -	/*
> > -	 * Provide a more accurate estimation if there are holes within
> > -	 * the zone and SPARSEMEM is in use. If there are holes within the
> > -	 * zone, each populated memory region may cost us one or two extra
> > -	 * memmap pages due to alignment because memmap pages for each
> > -	 * populated regions may not be naturally aligned on page boundary.
> > -	 * So the (present_pages >> 4) heuristic is a tradeoff for that.
> > -	 */
> > -	if (spanned_pages > present_pages + (present_pages >> 4) &&
> > -	    IS_ENABLED(CONFIG_SPARSEMEM))
> > -		pages = present_pages;
> > -
> > -	return PAGE_ALIGN(pages * sizeof(struct page)) >> PAGE_SHIFT;
> > -}
> > -
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  static void pgdat_init_split_queue(struct pglist_data *pgdat)
> >  {
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

