Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D22BCF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 03:48:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CcFZ3fG7zDqKS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 11:48:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CDp8034CzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 21:12:14 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F158C88317;
 Mon, 27 May 2019 11:12:09 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-89.ams2.redhat.com [10.36.117.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B2952AA81;
 Mon, 27 May 2019 11:11:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 00/11] mm/memory_hotplug: Factor out memory block
 devicehandling
Date: Mon, 27 May 2019 13:11:41 +0200
Message-Id: <20190527111152.16324-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 27 May 2019 11:12:11 +0000 (UTC)
X-Mailman-Approved-At: Tue, 28 May 2019 11:47:52 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Oscar Salvador <osalvador@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, Rich Felker <dalias@libc.org>,
 Arun KS <arunks@codeaurora.org>, Chintan Pandya <cpandya@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>,
 Baoquan He <bhe@redhat.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jun Yao <yaojun8558363@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Banman <andrew.banman@hpe.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We only want memory block devices for memory to be onlined/offlined
(add/remove from the buddy). This is required so user space can
online/offline memory and kdump gets notified about newly onlined memory.

Let's factor out creation/removal of memory block devices. This helps
to further cleanup arch_add_memory/arch_remove_memory() and to make
implementation of new features easier - especially sub-section
memory hot add from Dan.

Anshuman Khandual is currently working on arch_remove_memory(). I added
a temporary solution via "arm64/mm: Add temporary arch_remove_memory()
implementation", that is sufficient as a firsts tep in the context of
this series. (we don't cleanup page tables in case anything goes
wrong already)

Did a quick sanity test with DIMM plug/unplug, making sure all devices
and sysfs links properly get added/removed. Compile tested on s390x and
x86-64.

Based on next/master.

Next refactoring on my list will be making sure that remove_memory()
will never deal with zones / access "struct pages". Any kind of zone
handling will have to be done when offlining system memory / before
removing device memory. I am thinking about remove_pfn_range_from_zone()",
du undo everything "move_pfn_range_to_zone()" did.

v2 -> v3:
- Add "s390x/mm: Fail when an altmap is used for arch_add_memory()"
- Add "arm64/mm: Add temporary arch_remove_memory() implementation"
- Add "drivers/base/memory: Pass a block_id to init_memory_block()"
- Various changes to "mm/memory_hotplug: Create memory block devices
  after arch_add_memory()" and "mm/memory_hotplug: Create memory block
  devices after arch_add_memory()" due to switching from sections to
  block_id's.

v1 -> v2:
- s390x/mm: Implement arch_remove_memory()
-- remove mapping after "__remove_pages"

David Hildenbrand (11):
  mm/memory_hotplug: Simplify and fix check_hotplug_memory_range()
  s390x/mm: Fail when an altmap is used for arch_add_memory()
  s390x/mm: Implement arch_remove_memory()
  arm64/mm: Add temporary arch_remove_memory() implementation
  drivers/base/memory: Pass a block_id to init_memory_block()
  mm/memory_hotplug: Allow arch_remove_pages() without
    CONFIG_MEMORY_HOTREMOVE
  mm/memory_hotplug: Create memory block devices after arch_add_memory()
  mm/memory_hotplug: Drop MHP_MEMBLOCK_API
  mm/memory_hotplug: Remove memory block devices before
    arch_remove_memory()
  mm/memory_hotplug: Make unregister_memory_block_under_nodes() never
    fail
  mm/memory_hotplug: Remove "zone" parameter from
    sparse_remove_one_section

 arch/arm64/mm/mmu.c            |  17 +++++
 arch/ia64/mm/init.c            |   2 -
 arch/powerpc/mm/mem.c          |   2 -
 arch/s390/mm/init.c            |  18 +++--
 arch/sh/mm/init.c              |   2 -
 arch/x86/mm/init_32.c          |   2 -
 arch/x86/mm/init_64.c          |   2 -
 drivers/base/memory.c          | 134 +++++++++++++++++++--------------
 drivers/base/node.c            |  27 +++----
 include/linux/memory.h         |   6 +-
 include/linux/memory_hotplug.h |  12 +--
 include/linux/node.h           |   7 +-
 mm/memory_hotplug.c            |  44 +++++------
 mm/sparse.c                    |  10 +--
 14 files changed, 140 insertions(+), 145 deletions(-)

-- 
2.20.1

