Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFAEB316
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:45:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473p5T3ctnzF5rK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="I7ppMjOT"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nlv0zDLzF5nK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1vLA2aaSbsVZTqJYFKSssRBFqJQhInsNJX02oeyquPQ=;
 b=I7ppMjOTvHzgHzw2g8uHzAbyfZJOE1jMQQbI7TNF44+SKe/JjJaUcLCX2bLWa18vHVmY4/
 NapkEMhp7Evmp73qcJHZbbHm7X48BOy3ip6mE64HtCqal+eEshcjpKOK+nN055YwQPnlnB
 hpXhPYmt6s1xx6bmB3AEnvj+ScIvAEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-LkKy19_aPp-1GGbtKKuzMQ-1; Thu, 31 Oct 2019 10:29:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B9C800D49;
 Thu, 31 Oct 2019 14:29:45 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB6D15D6D6;
 Thu, 31 Oct 2019 14:29:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/12] powerpc/pseries: CMM: Implement balloon compaction
 and remove isolate notifier
Date: Thu, 31 Oct 2019 15:29:21 +0100
Message-Id: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LkKy19_aPp-1GGbtKKuzMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Pingfan Liu <kernelfans@gmail.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Greg Hackmann <ghackmann@google.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Gao Xiang <xiang@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Brauner <christian@brauner.io>, Oscar Salvador <osalvador@suse.de>,
 Richard Fontana <rfontana@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the follow-up of:
=09https://lkml.org/lkml/2019/9/10/711

We can get rid of the memory isolate notifier by switching to balloon
compaction in powerpc's CMM (Collaborative Memory Management). The memory
isolate notifier was only necessary to allow to offline memory blocks that
contain inflated/"loaned" pages - which also possible when the inflated
pages are movable (via balloon compaction). Having movable pages implies
that memory will also no longer get fragmented when CMM is active.

While I do have access to a LPAR, it does not have CMM active and I have np
clue how to enable it. Instead, I implemented a simple simulation mode. I
did some tests and the whole infrastructure, including page migration,
seems to work fine (e.g., I can still offline memory blocks that contain
inflated pages). Of course, I cannot tell if HW will like the changes,
especially:

1. I now use page_to_phys() to come up with the addresses to report to
   the hypervisor. Hope that's correct.
2. When migrating a page, I first inflate/"loan" the new page and then
   deflate the old page. I have no idea if HW accepts to set pages loaned
   if it didn't request a loan. I assume it does.
3. We might now inflate/deflate pages in parallel (of course, not the
   same page). I have no idea if HW likes that.

It would be good if somebody could either point me at the spec of the
hypervisor interface or verify directly. Also, it would be good if somebody
could test with actual HW that has this feature.

Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Allison Randal <allison@lohutok.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christian Brauner <christian@brauner.io>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: David Howells <dhowells@redhat.com>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Gao Xiang <xiang@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Hackmann <ghackmann@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Qian Cai <cai@lca.pw>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Todd Kjos <tkjos@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Wei Yang <richardw.yang@linux.intel.com>

David Hildenbrand (12):
  powerpc/pseries: CMM: Implement release() function for sysfs device
  powerpc/pseries: CMM: Report errors when registering notifiers fails
  powerpc/pseries: CMM: Cleanup rc handling in cmm_init()
  powerpc/pseries: CMM: Drop page array
  powerpc/pseries: CMM: Use adjust_managed_page_count() insted of
    totalram_pages_*
  powerpc/pseries: CMM: Rip out memory isolate notifier
  powerpc/pseries: CMM: Convert loaned_pages to an atomic_long_t
  powerpc/pseries: CMM: Implement balloon compaction
  powerpc/pseries: CMM: Switch to balloon_page_alloc()
  powerpc/pseries: CMM: Simulation mode
  mm: remove the memory isolate notifier
  mm: remove "count" parameter from has_unmovable_pages()

 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/powerpc/platforms/pseries/cmm.c   | 430 +++++++++++--------------
 drivers/base/memory.c                  |  19 --
 include/linux/memory.h                 |  27 --
 include/linux/page-isolation.h         |   4 +-
 include/uapi/linux/magic.h             |   1 +
 mm/memory_hotplug.c                    |   2 +-
 mm/page_alloc.c                        |  21 +-
 mm/page_isolation.c                    |  27 +-
 9 files changed, 204 insertions(+), 328 deletions(-)

--=20
2.21.0

