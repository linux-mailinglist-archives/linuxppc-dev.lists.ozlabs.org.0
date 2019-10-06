Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB5CD154
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 12:44:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46mKwq5V3KzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 21:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mHYF6zVtzDqCD
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2019 19:57:05 +1100 (AEDT)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A81063082E10;
 Sun,  6 Oct 2019 08:57:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-58.ams2.redhat.com [10.36.116.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916B15D772;
 Sun,  6 Oct 2019 08:56:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/10] mm/memory_hotplug: Shrink zones before removing
 memory
Date: Sun,  6 Oct 2019 10:56:36 +0200
Message-Id: <20191006085646.5768-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sun, 06 Oct 2019 08:57:03 +0000 (UTC)
X-Mailman-Approved-At: Sun, 06 Oct 2019 21:42:51 +1100
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
 Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Rich Felker <dalias@libc.org>, Alexander Potapenko <glider@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jun Yao <yaojun8558363@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 Tony Luck <tony.luck@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve Capper <steve.capper@arm.com>, Mel Gorman <mgorman@techsingularity.net>,
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes the access of uninitialized memmaps when shrinking
zones/nodes and when removing memory. Also, it contains all fixes for
crashes that can be triggered when removing certain namespace using
memunmap_pages() - ZONE_DEVICE, reported by Aneesh.

We stop trying to shrink ZONE_DEVICE, as it's buggy, fixing it would be
more involved (we don't have SECTION_IS_ONLINE as an indicator), and
shrinking is only of limited use (set_zone_contiguous() cannot detect
the ZONE_DEVICE as contiguous).

We continue shrinking !ZONE_DEVICE zones, however, I reduced the amount of
code to a minimum. Shrinking is especially necessary to keep
zone->contiguous set where possible, especially, on memory unplug of
DIMMs at zone boundaries.

--------------------------------------------------------------------------

Zones are now properly shrunk when offlining memory blocks or when
onlining failed. This allows to properly shrink zones on memory unplug
even if the separate memory blocks of a DIMM were onlined to different
zones or re-onlined to a different zone after offlining.

Example:

:/# cat /proc/zoneinfo
Node 1, zone  Movable
        spanned  0
        present  0
        managed  0
:/# echo "online_movable" > /sys/devices/system/memory/memory41/state
:/# echo "online_movable" > /sys/devices/system/memory/memory43/state
:/# cat /proc/zoneinfo
Node 1, zone  Movable
        spanned  98304
        present  65536
        managed  65536
:/# echo 0 > /sys/devices/system/memory/memory43/online
:/# cat /proc/zoneinfo
Node 1, zone  Movable
        spanned  32768
        present  32768
        managed  32768
:/# echo 0 > /sys/devices/system/memory/memory41/online
:/# cat /proc/zoneinfo
Node 1, zone  Movable
        spanned  0
        present  0
        managed  0

--------------------------------------------------------------------------

I tested this with DIMMs on x86. I didn't test the ZONE_DEVICE part.

v4 -> v6:
- "mm/memunmap: Don't access uninitialized memmap in memunmap_pages()"
-- Minimize code changes, rephrase subject and description
- "mm/memory_hotplug: Don't access uninitialized memmaps in shrink_zone_span()"
-- Add ifdef to make it compile without ZONE_DEVICE

v4 -> v5:
- "mm/memory_hotplug: Don't access uninitialized memmaps in shrink_zone_span()"
-- Add more details why ZONE_DEVICE is special
- Include two patches from Aneesh
-- "mm/memunmap: Use the correct start and end pfn when removing pages
    from zone"
-- "mm/memmap_init: Update variable name in memmap_init_zone"

v3 -> v4:
- Drop "mm/memremap: Get rid of memmap_init_zone_device()"
-- As Alexander noticed, it was messy either way
- Drop "mm/memory_hotplug: Exit early in __remove_pages() on BUGs"
- Drop "mm: Exit early in set_zone_contiguous() if already contiguous"
- Drop "mm/memory_hotplug: Optimize zone shrinking code when checking for
  holes"
- Merged "mm/memory_hotplug: Remove pages from a zone before removing
  memory" and "mm/memory_hotplug: Remove zone parameter from
  __remove_pages()" into "mm/memory_hotplug: Shrink zones when offlining
  memory"
- Added "mm/memory_hotplug: Poison memmap in remove_pfn_range_from_zone()"
- Stop shrinking ZONE_DEVICE
- Reshuffle patches, moving all fixes to the front. Add Fixes: tags.
- Change subject/description of various patches
- Minor changes (too many to mention)

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michal Hocko <mhocko@suse.com>

Aneesh Kumar K.V (2):
  mm/memunmap: Don't access uninitialized memmap in memunmap_pages()
  mm/memmap_init: Update variable name in memmap_init_zone

David Hildenbrand (8):
  mm/memory_hotplug: Don't access uninitialized memmaps in
    shrink_pgdat_span()
  mm/memory_hotplug: Don't access uninitialized memmaps in
    shrink_zone_span()
  mm/memory_hotplug: Shrink zones when offlining memory
  mm/memory_hotplug: Poison memmap in remove_pfn_range_from_zone()
  mm/memory_hotplug: We always have a zone in
    find_(smallest|biggest)_section_pfn
  mm/memory_hotplug: Don't check for "all holes" in shrink_zone_span()
  mm/memory_hotplug: Drop local variables in shrink_zone_span()
  mm/memory_hotplug: Cleanup __remove_pages()

 arch/arm64/mm/mmu.c            |   4 +-
 arch/ia64/mm/init.c            |   4 +-
 arch/powerpc/mm/mem.c          |   3 +-
 arch/s390/mm/init.c            |   4 +-
 arch/sh/mm/init.c              |   4 +-
 arch/x86/mm/init_32.c          |   4 +-
 arch/x86/mm/init_64.c          |   4 +-
 include/linux/memory_hotplug.h |   7 +-
 mm/memory_hotplug.c            | 186 ++++++++++++---------------------
 mm/memremap.c                  |  13 ++-
 mm/page_alloc.c                |   8 +-
 11 files changed, 90 insertions(+), 151 deletions(-)

-- 
2.21.0

