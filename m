Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC515335C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 15:50:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CPc53zQczDqVL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 01:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=csholPkl; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CPZY4qQmzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 01:48:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580914113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95aJqeVITxcGTfX0TCyAquXczebVTrMMk8jxCMfrdaA=;
 b=csholPklvLJoEHzFfu9LFT9gxzMrcpncGEy7oe69ILdvOfG3/gp7OjkeegT5nqAxbQTmtN
 6BycIpZyO/+3LB+OH97P3R56TU7Hi4xdLVn9jzu7bM0emW4dMZuM0EwzJov31UXAnLWedV
 JRHRNiFNRhAoU4/TI1vNC298FpIqJlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-CRKct6xKO9GNNI26yrfXjA-1; Wed, 05 Feb 2020 09:48:20 -0500
X-MC-Unique: CRKct6xKO9GNNI26yrfXjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C1E51083E81;
 Wed,  5 Feb 2020 14:48:18 +0000 (UTC)
Received: from localhost (ovpn-12-38.pek2.redhat.com [10.72.12.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC77F87B00;
 Wed,  5 Feb 2020 14:48:14 +0000 (UTC)
Date: Wed, 5 Feb 2020 22:48:11 +0800
From: Baoquan He <bhe@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205144811.GF26758@MiWiFi-R3L-srv>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200205095924.GC24162@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205095924.GC24162@richard>
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

Hi Wei Yang,

On 02/05/20 at 05:59pm, Wei Yang wrote:
> >diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >index f294918f7211..8dafa1ba8d9f 100644
> >--- a/mm/memory_hotplug.c
> >+++ b/mm/memory_hotplug.c
> >@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> > 		if (pfn) {
> > 			zone->zone_start_pfn = pfn;
> > 			zone->spanned_pages = zone_end_pfn - pfn;
> >+		} else {
> >+			zone->zone_start_pfn = 0;
> >+			zone->spanned_pages = 0;
> > 		}
> > 	} else if (zone_end_pfn == end_pfn) {
> > 		/*
> >@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> > 					       start_pfn);
> > 		if (pfn)
> > 			zone->spanned_pages = pfn - zone_start_pfn + 1;
> >+		else {
> >+			zone->zone_start_pfn = 0;
> >+			zone->spanned_pages = 0;
> >+		}
> > 	}
> 
> If it is me, I would like to take out these two similar logic out.

I also like this style. 
> 
> For example:
> 
> 	if () {
> 	} else if () {
> 	} else {
> 		goto out;
Here the last else is unnecessary, right?

> 	}
> 
> 

Like this, I believe both David and I will be satisfactory. Even though
I still think his 2nd resetting is not needed :-)

> 	/* The zone has no valid section */
> 	if (!pfn) {
> 			zone->zone_start_pfn = 0;
> 			zone->spanned_pages = 0;
> 	}
> 
> out:
> 	zone_span_writeunlock(zone);
> 
> Well, this is just my personal taste :-)
> 
> >-
> >-	/*
> >-	 * The section is not biggest or smallest mem_section in the zone, it
> >-	 * only creates a hole in the zone. So in this case, we need not
> >-	 * change the zone. But perhaps, the zone has only hole data. Thus
> >-	 * it check the zone has only hole or not.
> >-	 */
> >-	pfn = zone_start_pfn;
> >-	for (; pfn < zone_end_pfn; pfn += PAGES_PER_SUBSECTION) {
> >-		if (unlikely(!pfn_to_online_page(pfn)))
> >-			continue;
> >-
> >-		if (page_zone(pfn_to_page(pfn)) != zone)
> >-			continue;
> >-
> >-		/* Skip range to be removed */
> >-		if (pfn >= start_pfn && pfn < end_pfn)
> >-			continue;
> >-
> >-		/* If we find valid section, we have nothing to do */
> >-		zone_span_writeunlock(zone);
> >-		return;
> >-	}
> >-
> >-	/* The zone has no valid section */
> >-	zone->zone_start_pfn = 0;
> >-	zone->spanned_pages = 0;
> > 	zone_span_writeunlock(zone);
> > }
> > 
> >-- 
> >2.21.0
> 
> -- 
> Wei Yang
> Help you, Help me
> 

