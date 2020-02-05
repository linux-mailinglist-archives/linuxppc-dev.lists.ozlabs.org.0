Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5E153BDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 00:28:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cd5y6x30zDqM1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 10:28:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richardw.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cd3k46WpzDqHj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 10:26:09 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 15:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="264402948"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 15:26:03 -0800
Date: Thu, 6 Feb 2020 07:26:20 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v6 08/10] mm/memory_hotplug: Don't check for "all holes"
 in shrink_zone_span()
Message-ID: <20200205232620.GC28446@richard>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-9-david@redhat.com>
 <20200205095924.GC24162@richard>
 <20200205144811.GF26758@MiWiFi-R3L-srv>
 <20200205225633.GA28446@richard>
 <20200205230826.GF8965@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205230826.GF8965@MiWiFi-R3L-srv>
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Wei Yang <richardw.yang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 06, 2020 at 07:08:26AM +0800, Baoquan He wrote:
>On 02/06/20 at 06:56am, Wei Yang wrote:
>> On Wed, Feb 05, 2020 at 10:48:11PM +0800, Baoquan He wrote:
>> >Hi Wei Yang,
>> >
>> >On 02/05/20 at 05:59pm, Wei Yang wrote:
>> >> >diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> >> >index f294918f7211..8dafa1ba8d9f 100644
>> >> >--- a/mm/memory_hotplug.c
>> >> >+++ b/mm/memory_hotplug.c
>> >> >@@ -393,6 +393,9 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>> >> > 		if (pfn) {
>> >> > 			zone->zone_start_pfn = pfn;
>> >> > 			zone->spanned_pages = zone_end_pfn - pfn;
>> >> >+		} else {
>> >> >+			zone->zone_start_pfn = 0;
>> >> >+			zone->spanned_pages = 0;
>> >> > 		}
>> >> > 	} else if (zone_end_pfn == end_pfn) {
>> >> > 		/*
>> >> >@@ -405,34 +408,11 @@ static void shrink_zone_span(struct zone *zone, unsigned long start_pfn,
>> >> > 					       start_pfn);
>> >> > 		if (pfn)
>> >> > 			zone->spanned_pages = pfn - zone_start_pfn + 1;
>> >> >+		else {
>> >> >+			zone->zone_start_pfn = 0;
>> >> >+			zone->spanned_pages = 0;
>> >> >+		}
>> >> > 	}
>> >> 
>> >> If it is me, I would like to take out these two similar logic out.
>> >
>> >I also like this style. 
>> >> 
>> >> For example:
>> >> 
>> >> 	if () {
>> >> 	} else if () {
>> >> 	} else {
>> >> 		goto out;
>> >Here the last else is unnecessary, right?
>> >
>> 
>> I am afraid not.
>> 
>> If the range is not the first or last, we would leave pfn not initialized.
>
>Ah, you are right. I forgot that one. Then pfn can be assigned the
>zone_start_pfn as the old code. Then the following logic is the same
>as the original code, find_smallest_section_pfn()/find_biggest_section_pfn() 
>have done the iteration the old for loop was doing.
>
>	unsigned long pfn = zone_start_pfn;	
>	if () {
>	} else if () {
>	} 
>
>	/* The zone has no valid section */
>	if (!pfn) {
>        	zone->zone_start_pfn = 0;
>        	zone->spanned_pages = 0;
>	}

This one look better :-)

Thanks

-- 
Wei Yang
Help you, Help me
