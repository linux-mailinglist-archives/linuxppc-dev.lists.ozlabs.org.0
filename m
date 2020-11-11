Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB12AF42E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:56:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSV72Dm1zDqwH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 01:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UdXRAri0; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Amd18ETl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSR94gCkzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Dr0+pyBqVK3WLFkrmGnVmo0jFKi8+9WQgJ494/SxHE=;
 b=UdXRAri0+tec/hdfVbNqx36hOGU9oAq3eHriUVPZ4Yh3wyZy2wG9C0RzabNRKOKUdufcGe
 9DNjHMzAGHoKNCexXB86CDG7XivEP3Rwu/fDKAcxicFQ7/miJFx0YFTEad/QheVFskEFjh
 fiykEFj82d0Vdasabp7npTiwPm61pHU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Dr0+pyBqVK3WLFkrmGnVmo0jFKi8+9WQgJ494/SxHE=;
 b=Amd18ETlBQR+paU9xX5SikU5yQjgJzoFY03jIdVtE0wMJxh8kUp4e0PLNdfIyKr2x2pMdV
 CjuHUfmRSjVNwZDGYSzXlpzupIlFryAx+wXSkQdspoj3tuOPjVXSGlyDIXGZvCPt9znoq3
 W3JYMlB8ooLDO3FOUOgA9hSxdQqaVyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-bF7ocHOgOXK6oeBoGufIsg-1; Wed, 11 Nov 2020 09:53:33 -0500
X-MC-Unique: bF7ocHOgOXK6oeBoGufIsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5093318CB72A;
 Wed, 11 Nov 2020 14:53:30 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6BDD380;
 Wed, 11 Nov 2020 14:53:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
Date: Wed, 11 Nov 2020 15:53:14 +0100
Message-Id: <20201111145322.15793-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Rashmica Gupta <rashmica.g@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based on latest linux/master

powernv/memtrace is the only in-kernel user that rips out random memory
it never added (doesn't own) in order to allocate memory without a
linear mapping. Let's stop abusing memory hot(un)plug infrastructure for
that - use alloc_contig_pages() for allocating memory and remove the
linear mapping manually.

The original idea was discussed in:
 https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com

I only tested via QEMU TCG with a single NUMA node- see patch #8 for more
details.

Error handling and cleanup handling in memtrace code is a mess - that
should definitely get cleaned up sooner or later. Once we have __GFP_ZERO
support for alloc_contig_pages(), we can drop manual clearing. I added
a TODO for now, so this series can go via the powerpc tree - the __GFP_ZERO
change is then better suited via the mm tree, along with support for
__GFP_ZERO.

v1 -> v2:
- Tweaks to patch descriptions
- "powernv/memtrace: don't leak kernel memory to user space"
-- Added. Reported by Michael.
- "powernv/memtrace: fix crashing the kernel when enabling concurrently"
-- Added, discovered while testing.
- "powerpc/mm: protect linear mapping modifications by a mutex"
-- Added. Although we currently won't have concurrency, this is cleaner and
   future-proof.
- "powerepc/book3s64/hash: drop WARN_ON in hash__remove_section_mapping"
-- Added. Suggested by Oscar
- "powernv/memtrace: don't abuse memory hot(un)plug infrastructure for
   memory allocations"
-- Reshuffle the code to make review easier.
-- Add a TODO regarding __GFP_ZERO. Adapt to changed page clearing code.
-- Use GFP_KERNEL | __GFP_THISNODE | __GFP_NOWARN for allocations.


David Hildenbrand (8):
  powernv/memtrace: don't leak kernel memory to user space
  powernv/memtrace: fix crashing the kernel when enabling concurrently
  powerpc/mm: factor out creating/removing linear mapping
  powerpc/mm: protect linear mapping modifications by a mutex
  powerpc/mm: print warning in arch_remove_linear_mapping()
  powerepc/book3s64/hash: drop WARN_ON in hash__remove_section_mapping
  powerpc/mm: remove linear mapping if __add_pages() fails in
    arch_add_memory()
  powernv/memtrace: don't abuse memory hot(un)plug infrastructure for
    memory allocations

 arch/powerpc/mm/book3s64/hash_utils.c     |   1 -
 arch/powerpc/mm/mem.c                     |  53 +++++--
 arch/powerpc/platforms/powernv/Kconfig    |   8 +-
 arch/powerpc/platforms/powernv/memtrace.c | 175 ++++++++++------------
 include/linux/memory_hotplug.h            |   3 +
 5 files changed, 125 insertions(+), 115 deletions(-)

-- 
2.26.2

