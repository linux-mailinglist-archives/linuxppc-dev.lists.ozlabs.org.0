Return-Path: <linuxppc-dev+bounces-12882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEDABDD64A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkk94hZ9z3cj7;
	Wed, 15 Oct 2025 19:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516897;
	cv=none; b=i8KB36ozYD5e6MoIRctDxlzrPipYG14iw8C8YO3FngZEOe4U+tXp439yumf7zN4w0MIc0Sc18inmYfNPdSle28IQwCKIDjfM6SlxIPz6FjSCZgsHrL1+4Cm6fLy2o6SsgqzDkqilCYvF4qOs180jYggW/A3FmkYeQLZERsxnKGVfdazQRmyKC9+EI2MnNYg0eshT+h+IS4qK5FXKvw45CGSH8MKaN5Yz/eBPEaex+gfSMTVup+bZypXJ8TczKjFAJ5wbYY5GMFQysZu/rjx3x5Z4qKv8gtel9sdsOCE1INg8E1tecyXPrAP4WtjRguI7/e2Y8Hf/kqfVA5Ut6OcMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516897; c=relaxed/relaxed;
	bh=n1o+GRt+bPeG4Abot8XLg8pth8XmLgkK3uQfydpQZjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Eozxn912pWdsG1tdsVYIfEbtRDXnWx/VjwU4FNLK7XHmF6zk1YjBiCoRerLiAzgAdv84CTqmgj7KXIEycPsmN3gcb9Q7C3LBkPUbU/OG/hvWTK9ezqiGW9EcCMrrRSXjDWC3EKaR1zLZau77qYs77Qf6GWtZi/9ilPamlsS5ysu23v+ckaFDq5RSWMuUGs/VoooJDzWeU2EZficR6xtlRez82kDSBH72t7pdoiVhk9VrurO/7PfbMu6Tqibk2Z5osjpAP3flBJP+cxlg8JbjQ1e8c3+7XzeuArz7xZE2zg1V3NilkZxone4S4mNf6+tkYcIxsjCZMG72iQjOa3VSjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkk83krKz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:28:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A32C41A32;
	Wed, 15 Oct 2025 01:27:34 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0813F66E;
	Wed, 15 Oct 2025 01:27:37 -0700 (PDT)
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
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v3 00/13] Nesting support for lazy MMU mode
Date: Wed, 15 Oct 2025 09:27:14 +0100
Message-ID: <20251015082727.2395128-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
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

Ryan Roberts' series from March [1] attempted to prevent nesting from
ever occurring, and mostly succeeded. Unfortunately, a corner case
(DEBUG_PAGEALLOC) may still cause nesting to occur on arm64. Ryan
proposed [2] to address that corner case at the generic level but this
approach received pushback; [3] then attempted to solve the issue on
arm64 only, but it was deemed too fragile.

It feels generally difficult to guarantee that lazy_mmu sections don't
nest, because callers of various standard mm functions do not know if
the function uses lazy_mmu itself. This series therefore performs a
U-turn and adds support for nested lazy_mmu sections, on all
architectures.

v3 is a full rewrite of the series based on the feedback from David
Hildenbrand on v2. Nesting is now handled using a counter in task_struct
(patch 7), like other APIs such as pagefault_{disable,enable}().
This is fully handled in a new generic layer in <linux/pgtable.h>; the
existing arch_* API remains unchanged. A new pair of calls,
lazy_mmu_mode_{pause,resume}(), is also introduced to allow functions
that are called with the lazy MMU mode enabled to temporarily pause it,
regardless of nesting.

An arch now opts in to using the lazy MMU mode by selecting
CONFIG_ARCH_LAZY_MMU; this is more appropriate now that we have a
generic API, especially with state conditionally added to task_struct.
The overall approach is very close to what David proposed on v2 [4].

Unlike in v1/v2, no special provision is made for architectures to
save/restore extra state when entering/leaving the mode. Based on the
discussions so far, this does not seem to be required - an arch can
store any relevant state in thread_struct during arch_enter() and
restore it in arch_leave(). Nesting is not a concern as these functions
are only called at the top level, not in nested sections.

The introduction of a generic layer, and tracking of the lazy MMU state
in task_struct, also allows to streamline the arch callbacks - this
series removes 72 lines from arch/.

Patch overview:

* Patch 1: cleanup - avoids having to deal with the powerpc
  context-switching code

* Patch 2-4: prepare arch_flush_lazy_mmu_mode() to be called from the
  generic layer (patch 7)

* Patch 5-6: new API + CONFIG_ARCH_LAZY_MMU

* Patch 7: nesting support

* Patch 8-13: move as much handling as possible to the generic layer

This series has been tested by running the mm kselfetsts on arm64 with
DEBUG_VM, DEBUG_PAGEALLOC and KFENCE. It was also build-tested on other
architectures (with and without XEN_PV on x86).

- Kevin

[1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/ef343405-c394-4763-a79f-21381f217b6c@redhat.com/
---
Changelog

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
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
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

Kevin Brodsky (12):
  x86/xen: simplify flush_lazy_mmu()
  powerpc/mm: implement arch_flush_lazy_mmu_mode()
  sparc/mm: implement arch_flush_lazy_mmu_mode()
  mm: introduce CONFIG_ARCH_LAZY_MMU
  mm: introduce generic lazy_mmu helpers
  mm: enable lazy_mmu sections to nest
  arm64: mm: replace TIF_LAZY_MMU with in_lazy_mmu_mode()
  powerpc/mm: replace batch->active with in_lazy_mmu_mode()
  sparc/mm: replace batch->active with in_lazy_mmu_mode()
  x86/xen: use lazy_mmu_state when context-switching
  mm: bail out of lazy_mmu_mode_* in interrupt context
  mm: introduce arch_wants_lazy_mmu_mode()

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/pgtable.h              |  46 +------
 arch/arm64/include/asm/thread_info.h          |   3 +-
 arch/arm64/mm/mmu.c                           |   4 +-
 arch/arm64/mm/pageattr.c                      |   4 +-
 .../include/asm/book3s/64/tlbflush-hash.h     |  25 ++--
 arch/powerpc/include/asm/thread_info.h        |   2 -
 arch/powerpc/kernel/process.c                 |  25 ----
 arch/powerpc/mm/book3s64/hash_tlb.c           |  10 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/include/asm/tlbflush_64.h          |   5 +-
 arch/sparc/mm/tlb.c                           |  14 +--
 arch/x86/Kconfig                              |   1 +
 arch/x86/boot/compressed/misc.h               |   1 +
 arch/x86/boot/startup/sme.c                   |   1 +
 arch/x86/include/asm/paravirt.h               |   1 -
 arch/x86/include/asm/pgtable.h                |   3 +-
 arch/x86/include/asm/thread_info.h            |   4 +-
 arch/x86/xen/enlighten_pv.c                   |   3 +-
 arch/x86/xen/mmu_pv.c                         |   9 +-
 fs/proc/task_mmu.c                            |   4 +-
 include/linux/mm_types_task.h                 |   5 +
 include/linux/pgtable.h                       | 114 +++++++++++++++++-
 include/linux/sched.h                         |  19 +++
 mm/Kconfig                                    |   3 +
 mm/kasan/shadow.c                             |   8 +-
 mm/madvise.c                                  |  18 +--
 mm/memory.c                                   |  16 +--
 mm/migrate_device.c                           |   4 +-
 mm/mprotect.c                                 |   4 +-
 mm/mremap.c                                   |   4 +-
 mm/userfaultfd.c                              |   4 +-
 mm/vmalloc.c                                  |  12 +-
 mm/vmscan.c                                   |  12 +-
 36 files changed, 226 insertions(+), 169 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.47.0


