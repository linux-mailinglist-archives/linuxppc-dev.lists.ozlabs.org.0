Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 002834D99A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 20:41:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V9dt1npszDqRR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 04:41:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V9Ql2WWjzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 04:32:15 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06634356EA;
 Thu, 20 Jun 2019 18:31:58 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-71.ams2.redhat.com [10.36.116.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACE2819722;
 Thu, 20 Jun 2019 18:31:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] mm: Further memory block device cleanups
Date: Thu, 20 Jun 2019 20:31:33 +0200
Message-Id: <20190620183139.4352-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 20 Jun 2019 18:32:13 +0000 (UTC)
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Neuling <mikey@neuling.org>, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Andrew Banman <andrew.banman@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Johannes Weiner <hannes@cmpxchg.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

@Andrew: Only patch 1, 4 and 6 changed compared to v1.

Some further cleanups around memory block devices. Especially, clean up
and simplify walk_memory_range(). Including some other minor cleanups.

Compiled + tested on x86 with DIMMs under QEMU. Compile-tested on ppc64.

v2 -> v3:
- "mm/memory_hotplug: Rename walk_memory_range() and pass start+size .."
-- Avoid warning on ppc.
- "drivers/base/memory.c: Get rid of find_memory_block_hinted()"
-- Fixup a comment regarding hinted devices.

v1 -> v2:
- "mm: Section numbers use the type "unsigned long""
-- "unsigned long i" -> "unsigned long nr", in one case -> "int i"
- "drivers/base/memory.c: Get rid of find_memory_block_hinted("
-- Fix compilation error
-- Get rid of the "hint" parameter completely

David Hildenbrand (6):
  mm: Section numbers use the type "unsigned long"
  drivers/base/memory: Use "unsigned long" for block ids
  mm: Make register_mem_sect_under_node() static
  mm/memory_hotplug: Rename walk_memory_range() and pass start+size
    instead of pfns
  mm/memory_hotplug: Move and simplify walk_memory_blocks()
  drivers/base/memory.c: Get rid of find_memory_block_hinted()

 arch/powerpc/platforms/powernv/memtrace.c |  23 ++---
 drivers/acpi/acpi_memhotplug.c            |  19 +---
 drivers/base/memory.c                     | 120 +++++++++++++---------
 drivers/base/node.c                       |   8 +-
 include/linux/memory.h                    |   5 +-
 include/linux/memory_hotplug.h            |   2 -
 include/linux/mmzone.h                    |   4 +-
 include/linux/node.h                      |   7 --
 mm/memory_hotplug.c                       |  57 +---------
 mm/sparse.c                               |  12 +--
 10 files changed, 106 insertions(+), 151 deletions(-)

-- 
2.21.0

