Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF741528C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 11:00:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CHBZ2g0PzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 21:00:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richardw.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CH8f6PzszDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 20:59:13 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 01:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; d="scan'208";a="343395725"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 01:59:07 -0800
Date: Wed, 5 Feb 2020 17:59:24 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205095924.GC24162@richard>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-9-david@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
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

On Sun, Oct 06, 2019 at 10:56:44AM +0200, David Hildenbrand wrote:
>If we have holes, the holes will automatically get detected and removed
>once we remove the next bigger/smaller section. The extra checks can
>go.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Dan Williams <dan.j.williams@intel.com>
>Cc: Wei Yang <richardw.yang@linux.intel.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> mm/memory_hotplug.c | 34 +++++++---------------------------
> 1 file changed, 7 insertions(+), 27 deletions(-)
>
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index f294918f7211..8dafa1ba8d9f 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 		if (pfn) {
> 			zone->zone_start_pfn = pfn;
> 			zone->spanned_pages = zone_end_pfn - pfn;
>+		} else {
>+			zone->zone_start_pfn = 0;
>+			zone->spanned_pages = 0;
> 		}
> 	} else if (zone_end_pfn == end_pfn) {
> 		/*
>@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 					       start_pfn);
> 		if (pfn)
> 			zone->spanned_pages = pfn - zone_start_pfn + 1;
>+		else {
>+			zone->zone_start_pfn = 0;
>+			zone->spanned_pages = 0;
>+		}
> 	}

If it is me, I would like to take out these two similar logic out.

For example:

	if () {
	} else if () {
	} else {
		goto out;
	}


	/* The zone has no valid section */
	if (!pfn) {
			zone->zone_start_pfn = 0;
			zone->spanned_pages = 0;
	}

out:
	zone_span_writeunlock(zone);

Well, this is just my personal taste :-)

>-
>-	/*
>-	 * The section is not biggest or smallest mem_section in the zone, it
>-	 * only creates a hole in the zone. So in this case, we need not
>-	 * change the zone. But perhaps, the zone has only hole data. Thus
>-	 * it check the zone has only hole or not.
>-	 */
>-	pfn = zone_start_pfn;
>-	for (; pfn < zone_end_pfn; pfn += PAGES_PER_SUBSECTION) {
>-		if (unlikely(!pfn_to_online_page(pfn)))
>-			continue;
>-
>-		if (page_zone(pfn_to_page(pfn)) != zone)
>-			continue;
>-
>-		/* Skip range to be removed */
>-		if (pfn >= start_pfn && pfn < end_pfn)
>-			continue;
>-
>-		/* If we find valid section, we have nothing to do */
>-		zone_span_writeunlock(zone);
>-		return;
>-	}
>-
>-	/* The zone has no valid section */
>-	zone->zone_start_pfn = 0;
>-	zone->spanned_pages = 0;
> 	zone_span_writeunlock(zone);
> }
> 
>-- 
>2.21.0

-- 
Wei Yang
Help you, Help me
