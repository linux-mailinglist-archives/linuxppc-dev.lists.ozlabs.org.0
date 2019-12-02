Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C510E775
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 10:12:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RKBX6Xb3zDqQX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 20:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="JctgQWMo"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RK8D4snjzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 20:10:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575277816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bPkUsTzhkVfJSR03ILlrl/kodSdI4Qx6sX5AFEiswM0=;
 b=JctgQWMolp2c5Vj5zTU6ql2SQjPr5OO4dhkDZO3BywpOZxg70Op1Bb4CzGT23rqBTkoa3N
 /iaZjpXcbZFo0TINmk6EDITfHTGT+hWwwTYFviNE036RVzN3EcBDYgB0uEemqJ3WhTp4d1
 awXkAfjwTyxO8H5IMM8Lgy+cenb2Ytw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-gDO2WDkPO7OKY0q6fsiHtA-1; Mon, 02 Dec 2019 04:10:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD1D1005516;
 Mon,  2 Dec 2019 09:10:05 +0000 (UTC)
Received: from [10.36.117.49] (ovpn-117-49.ams2.redhat.com [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4384A60C05;
 Mon,  2 Dec 2019 09:09:52 +0000 (UTC)
Subject: Re: [PATCH v6 00/10] mm/memory_hotplug: Shrink zones before removing
 memory
To: linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>
References: <20191006085646.5768-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <ac27f0e1-26e9-dfc1-3ee1-cbee7ad847bf@redhat.com>
Date: Mon, 2 Dec 2019 10:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191006085646.5768-1-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gDO2WDkPO7OKY0q6fsiHtA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Pankaj Gupta <pagupta@redhat.com>,
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Wei Yang <richardw.yang@linux.intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve Capper <steve.capper@arm.com>, Mel Gorman <mgorman@techsingularity.net>,
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.10.19 10:56, David Hildenbrand wrote:
> This series fixes the access of uninitialized memmaps when shrinking
> zones/nodes and when removing memory. Also, it contains all fixes for
> crashes that can be triggered when removing certain namespace using
> memunmap_pages() - ZONE_DEVICE, reported by Aneesh.
> 
> We stop trying to shrink ZONE_DEVICE, as it's buggy, fixing it would be
> more involved (we don't have SECTION_IS_ONLINE as an indicator), and
> shrinking is only of limited use (set_zone_contiguous() cannot detect
> the ZONE_DEVICE as contiguous).
> 
> We continue shrinking !ZONE_DEVICE zones, however, I reduced the amount of
> code to a minimum. Shrinking is especially necessary to keep
> zone->contiguous set where possible, especially, on memory unplug of
> DIMMs at zone boundaries.
> 
> --------------------------------------------------------------------------
> 
> Zones are now properly shrunk when offlining memory blocks or when
> onlining failed. This allows to properly shrink zones on memory unplug
> even if the separate memory blocks of a DIMM were onlined to different
> zones or re-onlined to a different zone after offlining.
> 
> Example:
> 
> :/# cat /proc/zoneinfo
> Node 1, zone  Movable
>         spanned  0
>         present  0
>         managed  0
> :/# echo "online_movable" > /sys/devices/system/memory/memory41/state
> :/# echo "online_movable" > /sys/devices/system/memory/memory43/state
> :/# cat /proc/zoneinfo
> Node 1, zone  Movable
>         spanned  98304
>         present  65536
>         managed  65536
> :/# echo 0 > /sys/devices/system/memory/memory43/online
> :/# cat /proc/zoneinfo
> Node 1, zone  Movable
>         spanned  32768
>         present  32768
>         managed  32768
> :/# echo 0 > /sys/devices/system/memory/memory41/online
> :/# cat /proc/zoneinfo
> Node 1, zone  Movable
>         spanned  0
>         present  0
>         managed  0
> 
> --------------------------------------------------------------------------
> 
> I tested this with DIMMs on x86. I didn't test the ZONE_DEVICE part.
> 
> v4 -> v6:
> - "mm/memunmap: Don't access uninitialized memmap in memunmap_pages()"
> -- Minimize code changes, rephrase subject and description
> - "mm/memory_hotplug: Don't access uninitialized memmaps in shrink_zone_span()"
> -- Add ifdef to make it compile without ZONE_DEVICE
> 
> v4 -> v5:
> - "mm/memory_hotplug: Don't access uninitialized memmaps in shrink_zone_span()"
> -- Add more details why ZONE_DEVICE is special
> - Include two patches from Aneesh
> -- "mm/memunmap: Use the correct start and end pfn when removing pages
>     from zone"
> -- "mm/memmap_init: Update variable name in memmap_init_zone"
> 
> v3 -> v4:
> - Drop "mm/memremap: Get rid of memmap_init_zone_device()"
> -- As Alexander noticed, it was messy either way
> - Drop "mm/memory_hotplug: Exit early in __remove_pages() on BUGs"
> - Drop "mm: Exit early in set_zone_contiguous() if already contiguous"
> - Drop "mm/memory_hotplug: Optimize zone shrinking code when checking for
>   holes"
> - Merged "mm/memory_hotplug: Remove pages from a zone before removing
>   memory" and "mm/memory_hotplug: Remove zone parameter from
>   __remove_pages()" into "mm/memory_hotplug: Shrink zones when offlining
>   memory"
> - Added "mm/memory_hotplug: Poison memmap in remove_pfn_range_from_zone()"
> - Stop shrinking ZONE_DEVICE
> - Reshuffle patches, moving all fixes to the front. Add Fixes: tags.
> - Change subject/description of various patches
> - Minor changes (too many to mention)
> 
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michal Hocko <mhocko@suse.com>
> 

So, patch #1-#4 are already upstream. The other patches have been in
-next for quite a long time, and I (+other RH people) ran excessive
tests on them.

Especially patch #5 is a BUG fix I want to see upstream rather sooner
than later (last know "uninitialized memmap" access).

Andrew decided not to send these for 5.5 due to lack of ack/review -
which is unfortunate, but the right thing to do.

@Michal, @Oscar, can some of you at least have a patch #5 now so we can
proceed with that? (the other patches can stay in -next some time longer)

-- 
Thanks,

David / dhildenb

