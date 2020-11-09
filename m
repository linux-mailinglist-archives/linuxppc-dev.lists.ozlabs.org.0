Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD112AC4F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 20:26:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVLbD1hXBzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 06:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=k55R9YcA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVLTR4ZRrzDqdb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 06:21:45 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 143A5206D8;
 Mon,  9 Nov 2020 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604949702;
 bh=QGTmizEK1UjKs+M3i5taZOyhlQtuke3SF4xVfj8rMZk=;
 h=From:To:Cc:Subject:Date:From;
 b=k55R9YcADr0xJwXvM4j0zAp6vWZk0ETbFSE04MFUnjzJKc9PomPqxRT22PQlapBZi
 2IzNzcdBMaDo6ymAx8eH7285ig9SBc7A4oWYDMyBtditNFHUzd3UvkTqLbh6yvgCrf
 IK7aPEp1dRIjSK4NRfcVZ1/a4WCtbm7eFBu5gmDM=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 0/4] arch, mm: improve robustness of direct map manipulation
Date: Mon,  9 Nov 2020 21:21:24 +0200
Message-Id: <20201109192128.960-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

During recent discussion about KVM protected memory, David raised a concern
about usage of __kernel_map_pages() outside of DEBUG_PAGEALLOC scope [1].

Indeed, for architectures that define CONFIG_ARCH_HAS_SET_DIRECT_MAP it is
possible that __kernel_map_pages() would fail, but since this function is
void, the failure will go unnoticed.

Moreover, there's lack of consistency of __kernel_map_pages() semantics
across architectures as some guard this function with
#ifdef DEBUG_PAGEALLOC, some refuse to update the direct map if page
allocation debugging is disabled at run time and some allow modifying the
direct map regardless of DEBUG_PAGEALLOC settings.

This set straightens this out by restoring dependency of
__kernel_map_pages() on DEBUG_PAGEALLOC and updating the call sites
accordingly. 

Since currently the only user of __kernel_map_pages() outside
DEBUG_PAGEALLOC is hibernation, it is updated to make direct map accesses
there more explicit.

[1] https://lore.kernel.org/lkml/2759b4bf-e1e3-d006-7d86-78a40348269d@redhat.com

v7 changes:
* fix a rebase error that sneaked into v6 after removal of slab changes

v6 changes:
* revert slab changes to avoid redundant check of static key
https://lore.kernel.org/lkml/20201109162415.13764-1-rppt@kernel.org

v5 changes:
* use pairs of _map()/_unmap() functions instead of _map(..., int enable) as
  Vlastimil suggested
https://lore.kernel.org/lkml/20201108065758.1815-1-rppt@kernel.org

v4 changes:
* s/WARN_ON/pr_warn_once/ per David and Kirill
* rebase on v5.10-rc2
* add Acked/Reviewed tags
https://lore.kernel.org/lkml/20201103162057.22916-1-rppt@kernel.org

v3 changes:
* update arm64 changes to avoid regression, per Rick's comments
* fix bisectability
https://lore.kernel.org/lkml/20201101170815.9795-1-rppt@kernel.org

v2 changes:
* Rephrase patch 2 changelog to better describe the change intentions and
implications
* Move removal of kernel_map_pages() from patch 1 to patch 2, per David
https://lore.kernel.org/lkml/20201029161902.19272-1-rppt@kernel.org

v1:
https://lore.kernel.org/lkml/20201025101555.3057-1-rppt@kernel.org

Mike Rapoport (4):
  mm: introduce debug_pagealloc_{map,unmap}_pages() helpers
  PM: hibernate: make direct map manipulations more explicit
  arch, mm: restore dependency of __kernel_map_pages() on DEBUG_PAGEALLOC
  arch, mm: make kernel_page_present() always available

 arch/Kconfig                        |  3 +++
 arch/arm64/Kconfig                  |  4 +--
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/pageattr.c            |  6 +++--
 arch/powerpc/Kconfig                |  5 +---
 arch/riscv/Kconfig                  |  4 +--
 arch/riscv/include/asm/pgtable.h    |  2 --
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/mm/pageattr.c            | 31 ++++++++++++++++++++++
 arch/s390/Kconfig                   |  4 +--
 arch/sparc/Kconfig                  |  4 +--
 arch/x86/Kconfig                    |  4 +--
 arch/x86/include/asm/set_memory.h   |  1 +
 arch/x86/mm/pat/set_memory.c        |  4 +--
 include/linux/mm.h                  | 40 ++++++++++++++---------------
 include/linux/set_memory.h          |  5 ++++
 kernel/power/snapshot.c             | 38 +++++++++++++++++++++++++--
 mm/memory_hotplug.c                 |  3 +--
 mm/page_alloc.c                     |  6 ++---
 19 files changed, 113 insertions(+), 53 deletions(-)

-- 
2.28.0

*** BLURB HERE ***

Mike Rapoport (4):
  mm: introduce debug_pagealloc_{map,unmap}_pages() helpers
  PM: hibernate: make direct map manipulations more explicit
  arch, mm: restore dependency of __kernel_map_pages() on
    DEBUG_PAGEALLOC
  arch, mm: make kernel_page_present() always available

 arch/Kconfig                        |  3 +++
 arch/arm64/Kconfig                  |  4 +--
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/pageattr.c            |  6 +++--
 arch/powerpc/Kconfig                |  5 +---
 arch/riscv/Kconfig                  |  4 +--
 arch/riscv/include/asm/pgtable.h    |  2 --
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/mm/pageattr.c            | 31 ++++++++++++++++++++++
 arch/s390/Kconfig                   |  4 +--
 arch/sparc/Kconfig                  |  4 +--
 arch/x86/Kconfig                    |  4 +--
 arch/x86/include/asm/set_memory.h   |  1 +
 arch/x86/mm/pat/set_memory.c        |  4 +--
 include/linux/mm.h                  | 40 ++++++++++++++---------------
 include/linux/set_memory.h          |  5 ++++
 kernel/power/snapshot.c             | 38 +++++++++++++++++++++++++--
 mm/memory_hotplug.c                 |  3 +--
 mm/page_alloc.c                     |  6 ++---
 mm/slab.c                           |  2 +-
 20 files changed, 114 insertions(+), 54 deletions(-)

-- 
2.28.0

