Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADA153299
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 15:15:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CNrM0bWKzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 01:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=exxx++O6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CNnd0HsLzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 01:13:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580911984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y9VUI5/IBa9XUGA62AeVFROjjQbrdeFr4e/QsRz47wE=;
 b=exxx++O6Kwuti1thMMcNhzeYYeBlWd7QkRa2RFGVDaXqurYD+A8/K9SsAA5D818cywmj3o
 U0YMwKfH8nCfBLw1T+uOEnu8bMm9rooWBq1zqgP3TeFOni2LxUKDujs5SWjY+/QryXUDbc
 Q113xjafP9mQsrk5og/sCk8469r6Loo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-C5-J_TlvOiuGYBE4Esvcew-1; Wed, 05 Feb 2020 09:13:02 -0500
X-MC-Unique: C5-J_TlvOiuGYBE4Esvcew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FBB58010F1;
 Wed,  5 Feb 2020 14:13:00 +0000 (UTC)
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB9686C4A;
 Wed,  5 Feb 2020 14:12:57 +0000 (UTC)
Date: Wed, 5 Feb 2020 22:12:54 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205141254.GD8965@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200204142516.GD26758@MiWiFi-R3L-srv>
 <e0006cc4-d448-89c6-38c0-51da7fc08715@redhat.com>
 <20200205124329.GE26758@MiWiFi-R3L-srv>
 <cd353848-301a-025d-dd66-44d76e1bbc44@redhat.com>
 <20200205133442.GC8965@MiWiFi-R3L-srv>
 <2868343a-745b-e2b6-7e78-d5649c00ee31@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2868343a-745b-e2b6-7e78-d5649c00ee31@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Wei Yang <richardw.yang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/05/20 at 02:38pm, David Hildenbrand wrote:
> On 05.02.20 14:34, Baoquan He wrote:
> > On 02/05/20 at 02:20pm, David Hildenbrand wrote:
> >> On 05.02.20 13:43, Baoquan He wrote:
> >>> On 02/04/20 at 03:42pm, David Hildenbrand wrote:
> >>>> On 04.02.20 15:25, Baoquan He wrote:
> >>>>> On 10/06/19 at 10:56am, David Hildenbrand wrote:
> >>>>>> If we have holes, the holes will automatically get detected and removed
> >>>>>> once we remove the next bigger/smaller section. The extra checks can
> >>>>>> go.
> >>>>>>
> >>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>>>> Cc: Michal Hocko <mhocko@suse.com>
> >>>>>> Cc: David Hildenbrand <david@redhat.com>
> >>>>>> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> >>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
> >>>>>> Cc: Wei Yang <richardw.yang@linux.intel.com>
> >>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>>>> ---
> >>>>>>  mm/memory_hotplug.c | 34 +++++++---------------------------
> >>>>>>  1 file changed, 7 insertions(+), 27 deletions(-)
> >>>>>>
> >>>>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >>>>>> index f294918f7211..8dafa1ba8d9f 100644
> >>>>>> --- a/mm/memory_hotplug.c
> >>>>>> +++ b/mm/memory_hotplug.c
> >>>>>> @@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >>>>>>  		if (pfn) {
> >>>>>>  			zone->zone_start_pfn = pfn;
> >>>>>>  			zone->spanned_pages = zone_end_pfn - pfn;
> >>>>>> +		} else {
> >>>>>> +			zone->zone_start_pfn = 0;
> >>>>>> +			zone->spanned_pages = 0;
> >>>>>>  		}
> >>>>>>  	} else if (zone_end_pfn == end_pfn) {
> >>>>>>  		/*
> >>>>>> @@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >>>>>>  					       start_pfn);
> >>>>>>  		if (pfn)
> >>>>>>  			zone->spanned_pages = pfn - zone_start_pfn + 1;
> >>>>>> +		else {
> >>>>>> +			zone->zone_start_pfn = 0;
> >>>>>> +			zone->spanned_pages = 0;
> >>>>>
> >>>>> Thinking in which case (zone_start_pfn != start_pfn) and it comes here.
> >>>>
> >>>> Could only happen in case the zone_start_pfn would have been "out of the
> >>>> zone already". If you ask me: unlikely :)
> >>>
> >>> Yeah, I also think it's unlikely to come here.
> >>>
> >>> The 'if (zone_start_pfn == start_pfn)' checking also covers the case
> >>> (zone_start_pfn == start_pfn && zone_end_pfn == end_pfn). So this
> >>> zone_start_pfn/spanned_pages resetting can be removed to avoid
> >>> confusion.
> >>
> >> At least I would find it more confusing without it (or want a comment
> >> explaining why this does not have to be handled and why the !pfn case is
> >> not possible).
> > 
> > I don't get why being w/o it will be more confusing, but it's OK since
> > it doesn't impact anything. 
> 
> Because we could actually BUG_ON(!pfn) here, right? Only having a "if
> (pfn)" leaves the reader wondering "why is the other case not handled".
> 
> > 
> >>
> >> Anyhow, that patch is already upstream and I don't consider this high
> >> priority. Thanks :)
> > 
> > Yeah, noticed you told Wei the status in another patch thread, I am fine
> > with it, just leave it to you to decide. Thanks.
> 
> I am fairly busy right now. Can you send a patch (double-checking and
> making this eventually unconditional?). Thanks!

Understood, sorry about the noise, David. I will think about this.

