Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697271528DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 11:08:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CHMf4qbVzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 21:08:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richardw.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CHKs4zr2zDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 21:07:12 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 02:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; d="scan'208";a="279328278"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Feb 2020 02:07:06 -0800
Date: Wed, 5 Feb 2020 18:07:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 09/10] mm/memory_hotplug: Drop local variables in
 shrink_zone_span()
Message-ID: <20200205100723.GD24162@richard>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-10-david@redhat.com>
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

On Sun, Oct 06, 2019 at 10:56:45AM +0200, David Hildenbrand wrote:
>Get rid of the unnecessary local variables.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Dan Williams <dan.j.williams@intel.com>
>Cc: Wei Yang <richardw.yang@linux.intel.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Looks reasonable.

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> mm/memory_hotplug.c | 15 ++++++---------
> 1 file changed, 6 insertions(+), 9 deletions(-)
>
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 8dafa1ba8d9f..843481bd507d 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -374,14 +374,11 @@ static unsigned long find_biggest_section_pfn(int nid, struct zone *zone,
> static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 			     unsigned long end_pfn)
> {
>-	unsigned long zone_start_pfn = zone->zone_start_pfn;
>-	unsigned long z = zone_end_pfn(zone); /* zone_end_pfn namespace clash */
>-	unsigned long zone_end_pfn = z;
> 	unsigned long pfn;
> 	int nid = zone_to_nid(zone);
> 
> 	zone_span_writelock(zone);
>-	if (zone_start_pfn == start_pfn) {
>+	if (zone->zone_start_pfn == start_pfn) {
> 		/*
> 		 * If the section is smallest section in the zone, it need
> 		 * shrink zone->zone_start_pfn and zone->zone_spanned_pages.
>@@ -389,25 +386,25 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
> 		 * for shrinking zone.
> 		 */
> 		pfn = find_smallest_section_pfn(nid, zone, end_pfn,
>-						zone_end_pfn);
>+						zone_end_pfn(zone));
> 		if (pfn) {
>+			zone->spanned_pages = zone_end_pfn(zone) - pfn;
> 			zone->zone_start_pfn = pfn;
>-			zone->spanned_pages = zone_end_pfn - pfn;
> 		} else {
> 			zone->zone_start_pfn = 0;
> 			zone->spanned_pages = 0;
> 		}
>-	} else if (zone_end_pfn == end_pfn) {
>+	} else if (zone_end_pfn(zone) == end_pfn) {
> 		/*
> 		 * If the section is biggest section in the zone, it need
> 		 * shrink zone->spanned_pages.
> 		 * In this case, we find second biggest valid mem_section for
> 		 * shrinking zone.
> 		 */
>-		pfn = find_biggest_section_pfn(nid, zone, zone_start_pfn,
>+		pfn = find_biggest_section_pfn(nid, zone, zone->zone_start_pfn,
> 					       start_pfn);
> 		if (pfn)
>-			zone->spanned_pages = pfn - zone_start_pfn + 1;
>+			zone->spanned_pages = pfn - zone->zone_start_pfn + 1;
> 		else {
> 			zone->zone_start_pfn = 0;
> 			zone->spanned_pages = 0;
>-- 
>2.21.0

-- 
Wei Yang
Help you, Help me
