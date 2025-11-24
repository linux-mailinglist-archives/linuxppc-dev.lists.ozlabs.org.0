Return-Path: <linuxppc-dev+bounces-14441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B63C80B7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 14:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFRN40NVRz2xQs;
	Tue, 25 Nov 2025 00:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763990595;
	cv=none; b=kzh6rFyxw67OPBA8asHkwbm2SQFM/WUkekaqMLdP/dg7Cb4hnHre0ENDFizcKArk0XQfyOQB9r8ju62xNfN0fC2479+KJj1DViNRVuugHI/IXJEPTreG/04PdyeoJy+p4jXbkokl9c68tSFU+kvyO24s9/nhohxzK2QewYVsDNkZ+YKEv5dOm7x8ZsM6YWTYamCuQmTSNAG+PCHGUUqSKR3/Kcor2AN5UGF7RdEPMdPlibKLGHonHgyDqCaXJSbM+LtNd5BJ09mcL1gZYpN/kHQSMbm1Ragi/haWA5xzzLKwLRyjNQq4MzWDFnInvOWn4IvzADiWvk3JhnZt1I761Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763990595; c=relaxed/relaxed;
	bh=EDGbPPsRPziooSK7Hh0RxfwOuXGzBG+EdJKmYVIhHpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SPvCtJxUKa8ZZELcP68QRAfHLt7d0N3y6SMm0XWlK3KWxCmeaqSjmB7UWG1SaEsAewzB95ufoPiQdvoPBqbXCQIt2rS7UwJ7eZvD16F5obC1bEB7cjSMx9wh28z0Ib9Me16Cq3k2FHbAZeWUY6sFSo6UqCAbJZ72puAFwSkkZE74LEOXU0WjYhMVIQ0L+ObirsK6fNRzfZfIPeMS8vW7e9l6AAf40efjfgaOSDYGTYTDr+JLWhBc3cP4dnnv+e29UpPoKyehbmLWK8qmAE+WKQGB2eMj2zXpPKcDcyi47LHktBnsEz39Om1XAGZS+eI2FFbx1oeZ6sglzeRX410PeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFRN24MQBz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 00:23:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433AD497;
	Mon, 24 Nov 2025 05:22:35 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F32D3F73B;
	Mon, 24 Nov 2025 05:22:37 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v5 00/12] Nesting support for lazy MMU mode
Date: Mon, 24 Nov 2025 13:22:16 +0000
Message-ID: <20251124132228.622678-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When the lazy MMU mode was introduced eons ago, it wasn't made clear
whether such a sequence was legal:

	arch_enter_lazy_mmu_mode()
	...
		arch_enter_lazy_mmu_mode()
		...
		arch_leave_lazy_mmu_mode()
	...
	arch_leave_lazy_mmu_mode()

It seems fair to say that nested calls to
arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
architectures never explicitly supported it.

Nesting does in fact occur in certain configurations, and avoiding it
has proved difficult. This series therefore enables lazy_mmu sections to
nest, on all architectures.

Nesting is handled using a counter in task_struct (patch 8), like other
stateless APIs such as pagefault_{disable,enable}(). This is fully
handled in a new generic layer in <linux/pgtable.h>; the arch_* API
remains unchanged. A new pair of calls, lazy_mmu_mode_{pause,resume}(),
is also introduced to allow functions that are called with the lazy MMU
mode enabled to temporarily pause it, regardless of nesting.

An arch now opts in to using the lazy MMU mode by selecting
CONFIG_ARCH_LAZY_MMU; this is more appropriate now that we have a
generic API, especially with state conditionally added to task_struct.

---

Background: Ryan Roberts' series from March [1] attempted to prevent
nesting from ever occurring, and mostly succeeded. Unfortunately, a
corner case (DEBUG_PAGEALLOC) may still cause nesting to occur on arm64.
Ryan proposed [2] to address that corner case at the generic level but
this approach received pushback; [3] then attempted to solve the issue
on arm64 only, but it was deemed too fragile.

It feels generally difficult to guarantee that lazy_mmu sections don't
nest, because callers of various standard mm functions do not know if
the function uses lazy_mmu itself.

The overall approach in v3/v4 is very close to what David Hildenbrand
proposed on v2 [4].

Unlike in v1/v2, no special provision is made for architectures to
save/restore extra state when entering/leaving the mode. Based on the
discussions so far, this does not seem to be required - an arch can
store any relevant state in thread_struct during arch_enter() and
restore it in arch_leave(). Nesting is not a concern as these functions
are only called at the top level, not in nested sections.

The introduction of a generic layer, and tracking of the lazy MMU state
in task_struct, also allows to streamline the arch callbacks - this
series removes 67 lines from arch/.

Patch overview:

* Patch 1: cleanup - avoids having to deal with the powerpc
  context-switching code

* Patch 2-4: prepare arch_flush_lazy_mmu_mode() to be called from the
  generic layer (patch 8)

* Patch 5-6: new API + CONFIG_ARCH_LAZY_MMU

* Patch 7: ensure correctness in interrupt context

* Patch 8: nesting support

* Patch 9-12: replace arch-specific tracking of lazy MMU mode with
  generic API

This series has been tested by running the mm kselftests on arm64 with
DEBUG_VM, DEBUG_PAGEALLOC, KFENCE and KASAN. It was also build-tested on
other architectures (with and without XEN_PV on x86).

- Kevin

[1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/ef343405-c394-4763-a79f-21381f217b6c@redhat.com/
---
Changelog

v4..v5:

- Rebased on mm-unstable
- Patch 3: added missing radix_enabled() check in arch_flush()
  [Ritesh Harjani]
- Patch 6: declare arch_flush_lazy_mmu_mode() as static inline on x86
  [Ryan Roberts]
- Patch 7 (formerly 12): moved before patch 8 to ensure correctness in
  interrupt context [Ryan]. The diffs in in_lazy_mmu_mode() and
  queue_pte_barriers() are moved to patch 8 and 9 resp.
- Patch 8:
  * Removed all restrictions regarding lazy_mmu_mode_{pause,resume}().
    They may now be called even when lazy MMU isn't enabled, and
    any call to lazy_mmu_mode_* may be made while paused (such calls
    will be ignored). [David, Ryan]
  * lazy_mmu_state.{nesting_level,active} are replaced with
    {enable_count,pause_count} to track arbitrary nesting of both
    enable/disable and pause/resume [Ryan]
  * Added __task_lazy_mmu_mode_active() for use in patch 12 [David]
  * Added documentation for all the functions [Ryan]
- Patch 9: keep existing test + set TIF_LAZY_MMU_PENDING instead of
  atomic RMW [David, Ryan]
- Patch 12: use __task_lazy_mmu_mode_active() instead of accessing
  lazy_mmu_state directly [David]
- Collected R-b/A-b tags

v4: https://lore.kernel.org/all/20251029100909.3381140-1-kevin.brodsky@arm.com/

v3..v4:

- Patch 2: restored ordering of preempt_{disable,enable}() [Dave Hansen]
- Patch 5 onwards: s/ARCH_LAZY_MMU/ARCH_HAS_LAZY_MMU_MODE/ [Mike Rapoport]
- Patch 7: renamed lazy_mmu_state members, removed VM_BUG_ON(),
  reordered writes to lazy_mmu_state members [David Hildenbrand]
- Dropped patch 13 as it doesn't seem justified [David H]
- Various improvements to commit messages [David H]

v3: https://lore.kernel.org/all/20251015082727.2395128-1-kevin.brodsky@arm.com/

v2..v3:

- Full rewrite; dropped all Acked-by/Reviewed-by.
- Rebased on v6.18-rc1.

v2: https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/

v1..v2:
- Rebased on mm-unstable.
- Patch 2: handled new calls to enter()/leave(), clarified how the "flush"
  pattern (leave() followed by enter()) is handled.
- Patch 5,6: removed unnecessary local variable [Alexander Gordeev's
  suggestion].
- Added Mike Rapoport's Acked-by.

v1: https://lore.kernel.org/all/20250904125736.3918646-1-kevin.brodsky@arm.com/
---
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jann Horn <jannh@google.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
---
Alexander Gordeev (1):
  powerpc/64s: Do not re-activate batched TLB flush

Kevin Brodsky (11):
  x86/xen: simplify flush_lazy_mmu()
  powerpc/mm: implement arch_flush_lazy_mmu_mode()
  sparc/mm: implement arch_flush_lazy_mmu_mode()
  mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
  mm: introduce generic lazy_mmu helpers
  mm: bail out of lazy_mmu_mode_* in interrupt context
  mm: enable lazy_mmu sections to nest
  arm64: mm: replace TIF_LAZY_MMU with in_lazy_mmu_mode()
  powerpc/mm: replace batch->active with in_lazy_mmu_mode()
  sparc/mm: replace batch->active with in_lazy_mmu_mode()
  x86/xen: use lazy_mmu_state when context-switching

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/pgtable.h              |  41 +----
 arch/arm64/include/asm/thread_info.h          |   3 +-
 arch/arm64/mm/mmu.c                           |   4 +-
 arch/arm64/mm/pageattr.c                      |   4 +-
 .../include/asm/book3s/64/tlbflush-hash.h     |  20 ++-
 arch/powerpc/include/asm/thread_info.h        |   2 -
 arch/powerpc/kernel/process.c                 |  25 ---
 arch/powerpc/mm/book3s64/hash_tlb.c           |  10 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/include/asm/tlbflush_64.h          |   5 +-
 arch/sparc/mm/tlb.c                           |  14 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/boot/compressed/misc.h               |   1 +
 arch/x86/boot/startup/sme.c                   |   1 +
 arch/x86/include/asm/paravirt.h               |   1 -
 arch/x86/include/asm/pgtable.h                |   1 +
 arch/x86/include/asm/thread_info.h            |   4 +-
 arch/x86/xen/enlighten_pv.c                   |   3 +-
 arch/x86/xen/mmu_pv.c                         |   6 +-
 fs/proc/task_mmu.c                            |   4 +-
 include/linux/mm_types_task.h                 |   5 +
 include/linux/pgtable.h                       | 147 +++++++++++++++++-
 include/linux/sched.h                         |  45 ++++++
 mm/Kconfig                                    |   3 +
 mm/kasan/shadow.c                             |   8 +-
 mm/madvise.c                                  |  18 +--
 mm/memory.c                                   |  16 +-
 mm/migrate_device.c                           |   8 +-
 mm/mprotect.c                                 |   4 +-
 mm/mremap.c                                   |   4 +-
 mm/userfaultfd.c                              |   4 +-
 mm/vmalloc.c                                  |  12 +-
 mm/vmscan.c                                   |  12 +-
 36 files changed, 282 insertions(+), 161 deletions(-)


base-commit: 1f1edd95f9231ba58a1e535b10200cb1eeaf1f67
-- 
2.51.2


