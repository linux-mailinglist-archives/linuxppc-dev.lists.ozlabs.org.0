Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD3880D8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 09:48:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aLZJSJL/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aLZJSJL/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V02L81zLLz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 19:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aLZJSJL/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aLZJSJL/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V02KQ500fz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 19:47:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710924454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rFk7i7r/Rth0uc1ovX1/w3IsN+7Z5+mbDrMRpvOVhNM=;
	b=aLZJSJL/+MqwPyu3Lmi2IhilGxKPkVXp4xOmgmjsEQnELPYq2ufbDm/xqVh+/BdVvxKcQt
	RZhLQzYeBJQNaKZICG8qThr4eRDHV8nTfDtMz+ypZoV/+GPzAdTwlZ0J5corqiZwo5tjs+
	LnueiNCt+OoMrMyCk5sCj5qAmFSDYvg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710924454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rFk7i7r/Rth0uc1ovX1/w3IsN+7Z5+mbDrMRpvOVhNM=;
	b=aLZJSJL/+MqwPyu3Lmi2IhilGxKPkVXp4xOmgmjsEQnELPYq2ufbDm/xqVh+/BdVvxKcQt
	RZhLQzYeBJQNaKZICG8qThr4eRDHV8nTfDtMz+ypZoV/+GPzAdTwlZ0J5corqiZwo5tjs+
	LnueiNCt+OoMrMyCk5sCj5qAmFSDYvg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-iyzdhYmPMSuJGahHdL-Mxg-1; Wed,
 20 Mar 2024 04:47:30 -0400
X-MC-Unique: iyzdhYmPMSuJGahHdL-Mxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409D02806044;
	Wed, 20 Mar 2024 08:47:30 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AFA810E47;
	Wed, 20 Mar 2024 08:47:29 +0000 (UTC)
Date: Wed, 20 Mar 2024 16:47:22 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <ZfqimkC+L3M/3AYf@MiWiFi-R3L-srv>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-5-bhe@redhat.com>
 <Zfm6gzhKUehLwM5-@kernel.org>
 <ZfqbygfNmFKpBCfR@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfqbygfNmFKpBCfR@MiWiFi-R3L-srv>
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

On 03/20/24 at 04:18pm, Baoquan He wrote:
> On 03/19/24 at 06:17pm, Mike Rapoport wrote:
> > On Mon, Mar 18, 2024 at 10:21:36PM +0800, Baoquan He wrote:
> > > Currently, in free_area_init_core(), when initialize zone's field, a
> > > rough value is set to zone->managed_pages. That value is calculated by
> > > (zone->present_pages - memmap_pages).
> > > 
> > > In the meantime, add the value to nr_all_pages and nr_kernel_pages which
> > > represent all free pages of system (only low memory or including HIGHMEM
> > > memory separately). Both of them are gonna be used in
> > > alloc_large_system_hash().
> > > 
> > > However, the rough calculation and setting of zone->managed_pages is
> > > meaningless because
> > >   a) memmap pages are allocated on units of node in sparse_init() or
> > >      alloc_node_mem_map(pgdat); The simple (zone->present_pages -
> > >      memmap_pages) is too rough to make sense for zone;
> > >   b) the set zone->managed_pages will be zeroed out and reset with
> > >      acutal value in mem_init() via memblock_free_all(). Before the
> > >      resetting, no buddy allocation request is issued.
> > > 
> > > Here, remove the meaningless and complicated calculation of
> > > (zone->present_pages - memmap_pages), directly set zone->present_pages to
> > > zone->managed_pages. It will be adjusted in mem_init().
> > 
> > Do you mean "set zone->managed_pages to zone->present_pages"?
> 
> Hmm, maybe 'set zone->managed_pages as zone->present_pages'
>             or 
>            'assign zone->present_pages to zone->managed_pages'
> which is more precise.
> 
> Wwill update.
> 
> > 
> > I think we can just set zone->managed_pages to 0 in free_area_init_core().
> > Anyway it will be reset before the first use.

Rethink about this, it's better to set zone->managed_pages to 0 because
there isn't any page added to buddy. Will update.

> 
> Yeah, setting to 0 is also fine. I thougt of 0 ever. Considering
> zone->present_pages is closer value to actual zone->managed_pages
> than 0, and it may be needed in the future in some way before
> mem_init(). If no strong objection, I will keep the assigning
> 'zone->present_pages' to 'zone->managed_pages'.
> 
> Thanks again for careful reviewing.
> 

