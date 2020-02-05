Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD95153BFA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 00:33:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CdCY35qdzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 10:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=U2Zza9rb; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cd9W07LKzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 10:31:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580945467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SAORMzmA6IqKUOqDqPLoO/v1peidnLsrO16O4cWM3o8=;
 b=U2Zza9rbsdrqyD+4NHJv+GIruJND/YtSy4Z3t0ah6fg1/c8F/HAIsCqC3M0ezDxyU/5WY7
 EkhuKAX1J/Ll3cw97cSBacgWw62VIjBNLqxoj5iMdEhQTc1LEL02qUPLbDVhZ9CHhSOIgg
 Noas+x3GakiwD70GzZWbcPxi7YqS/lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-n0VIlnPnOMSV8JdkF3Atnw-1; Wed, 05 Feb 2020 18:31:00 -0500
X-MC-Unique: n0VIlnPnOMSV8JdkF3Atnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38AF59A1C9;
 Wed,  5 Feb 2020 23:30:58 +0000 (UTC)
Received: from localhost (ovpn-12-19.pek2.redhat.com [10.72.12.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FCE1001920;
 Wed,  5 Feb 2020 23:30:54 +0000 (UTC)
Date: Thu, 6 Feb 2020 07:30:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205233051.GG8965@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200205095924.GC24162@richard>
 <20200205144811.GF26758@MiWiFi-R3L-srv>
 <20200205225633.GA28446@richard>
 <20200205230826.GF8965@MiWiFi-R3L-srv>
 <20200205232620.GC28446@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205232620.GC28446@richard>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/06/20 at 07:26am, Wei Yang wrote:
> On Thu, Feb 06, 2020 at 07:08:26AM +0800, Baoquan He wrote:
> >On 02/06/20 at 06:56am, Wei Yang wrote:
> >> On Wed, Feb 05, 2020 at 10:48:11PM +0800, Baoquan He wrote:
> >> >Hi Wei Yang,
> >> >
> >> >On 02/05/20 at 05:59pm, Wei Yang wrote:
> >> >> >diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >> >> >index f294918f7211..8dafa1ba8d9f 100644
> >> >> >--- a/mm/memory_hotplug.c
> >> >> >+++ b/mm/memory_hotplug.c
> >> >> >@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >> >> > 		if (pfn) {
> >> >> > 			zone->zone_start_pfn = pfn;
> >> >> > 			zone->spanned_pages = zone_end_pfn - pfn;
> >> >> >+		} else {
> >> >> >+			zone->zone_start_pfn = 0;
> >> >> >+			zone->spanned_pages = 0;
> >> >> > 		}
> >> >> > 	} else if (zone_end_pfn == end_pfn) {
> >> >> > 		/*
> >> >> >@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> >> >> > 					       start_pfn);
> >> >> > 		if (pfn)
> >> >> > 			zone->spanned_pages = pfn - zone_start_pfn + 1;
> >> >> >+		else {
> >> >> >+			zone->zone_start_pfn = 0;
> >> >> >+			zone->spanned_pages = 0;
> >> >> >+		}
> >> >> > 	}
> >> >> 
> >> >> If it is me, I would like to take out these two similar logic out.
> >> >
> >> >I also like this style. 
> >> >> 
> >> >> For example:
> >> >> 
> >> >> 	if () {
> >> >> 	} else if () {
> >> >> 	} else {
> >> >> 		goto out;
> >> >Here the last else is unnecessary, right?
> >> >
> >> 
> >> I am afraid not.
> >> 
> >> If the range is not the first or last, we would leave pfn not initialized.
> >
> >Ah, you are right. I forgot that one. Then pfn can be assigned the
> >zone_start_pfn as the old code. Then the following logic is the same
> >as the original code, find_smallest_section_pfn()/find_biggest_section_pfn() 
> >have done the iteration the old for loop was doing.
> >
> >	unsigned long pfn = zone_start_pfn;	
> >	if () {
> >	} else if () {
> >	} 
> >
> >	/* The zone has no valid section */
> >	if (!pfn) {
> >        	zone->zone_start_pfn = 0;
> >        	zone->spanned_pages = 0;
> >	}
> 
> This one look better :-)

Thanks for your confirmation, I will make one patch like this and post.

