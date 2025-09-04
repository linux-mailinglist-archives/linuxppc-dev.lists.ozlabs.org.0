Return-Path: <linuxppc-dev+bounces-11727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B31B43C40
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 14:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgM6l2Lz2xd6;
	Thu,  4 Sep 2025 22:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756990735;
	cv=none; b=YoGMW/yfgFIuYTliBFZLAaleX3WzQ35jnL/ypVDYWlapNHttibWEn07kZI/pxDL9grkjuk70kBm26k8Y7Ps039zongHTx+6zuDesbmrrjSyJ0pexLwpRw5RGhj71mxRc1MbEYXplywIcNiYjezqCoIdvAU6MLnaeBfAaONeiMXI8bOzrAFM+j5NMbKXQZfUb+5JgfDjFsjCKh1FSX8r0fPOVNOvItquuL9pWiFjWif2UCd5U+TdyuKFA+UV3xtp0T+s1AMjaA0SQ0wfHCDQPLiLBIiMEc6TaKJxVwA0grm/gowaJ2jrY0+CTbu4ZRSSrd8KSvDiMD9t1Fwm4C15olw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756990735; c=relaxed/relaxed;
	bh=xx3k/xCeAHwbrVKHW5t7t/1u791QzLoKUDcVcEFFHzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4dbJ7jY3g85T9bqH3oX12dBolU9rAgVQhlz98nRGc+R+xn0OL5eWFQdc0Bf2BOoD5nR4i4SWUfVAcxLugheMBEUWF3KcKnkXgY3joHlQAxfZUyQtie9OnPNphHqm8hyoddmKObahDyhJRm7AgWzdL7vsrOvUy9eHujDeaZyXHdCaPB+d3IldhsDj6TvGDDqEOZUfMdOfCO93e8rQOvZ+YGjp7Ysiu2CLHkYgxPlgcf1v9zInMaDeCaZcaHHZTrV2BqJMP5uSzxoW639474APrhksvDfwaBCc5XGIWSuGdBx/67ptEKEirMonjbmLt+iZzPcd8D2gjJhZNJkVTrcOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgL53ncz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 22:58:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F7181756;
	Thu,  4 Sep 2025 05:58:12 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684763F6A8;
	Thu,  4 Sep 2025 05:58:16 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/7] Nesting support for lazy MMU mode
Date: Thu,  4 Sep 2025 13:57:29 +0100
Message-ID: <20250904125736.3918646-1-kevin.brodsky@arm.com>
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

It feels generally fragile to rely on lazy_mmu sections not to nest,
because callers of various standard mm functions do not know if the
function uses lazy_mmu itself. This series therefore performs a U-turn
and adds support for nested lazy_mmu sections, on all architectures.

The main change enabling nesting is patch 2, following the approach
suggested by Catalin Marinas [4]: have enter() return some state and
the matching leave() take that state. In this series, the state is only
used to handle nesting, but it could be used for other purposes such as
restoring context modified by enter(); the proposed kpkeys framework
would be an immediate user [5].

Patch overview:

* Patch 1: general cleanup - not directly related, but avoids any doubt
  regarding the expected behaviour of arch_flush_lazy_mmu_mode() outside
  x86

* Patch 2: main API change, no functional change

* Patch 3-6: nesting support for all architectures that support lazy_mmu

* Patch 7: clarification that nesting is supported in the documentation

Patch 4-6 are technically not required at this stage since nesting is
only observed on arm64, but they ensure future correctness in case
nesting is (re)introduced in generic paths. For instance, it could be
beneficial in some configurations to enter lazy_mmu set_ptes() once
again.

This series has been tested by running the mm kselfetsts on arm64 with
DEBUG_PAGEALLOC and KFENCE. It was also build-tested on other
architectures (with and without XEN_PV on x86).

- Kevin

[1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/
[5] https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/
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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
---
Kevin Brodsky (7):
  mm: remove arch_flush_lazy_mmu_mode()
  mm: introduce local state for lazy_mmu sections
  arm64: mm: fully support nested lazy_mmu sections
  x86/xen: support nested lazy_mmu sections (again)
  powerpc/mm: support nested lazy_mmu sections
  sparc/mm: support nested lazy_mmu sections
  mm: update lazy_mmu documentation

 arch/arm64/include/asm/pgtable.h              | 34 ++++++-------------
 .../include/asm/book3s/64/tlbflush-hash.h     | 24 +++++++++----
 arch/powerpc/mm/book3s64/hash_tlb.c           | 10 +++---
 arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +--
 arch/sparc/include/asm/tlbflush_64.h          |  6 ++--
 arch/sparc/mm/tlb.c                           | 19 ++++++++---
 arch/x86/include/asm/paravirt.h               |  8 ++---
 arch/x86/include/asm/paravirt_types.h         |  6 ++--
 arch/x86/include/asm/pgtable.h                |  3 +-
 arch/x86/xen/enlighten_pv.c                   |  2 +-
 arch/x86/xen/mmu_pv.c                         | 13 ++++---
 fs/proc/task_mmu.c                            |  5 +--
 include/linux/mm_types.h                      |  3 ++
 include/linux/pgtable.h                       | 21 +++++++++---
 mm/madvise.c                                  | 20 ++++++-----
 mm/memory.c                                   | 20 ++++++-----
 mm/migrate_device.c                           |  5 +--
 mm/mprotect.c                                 |  5 +--
 mm/mremap.c                                   |  5 +--
 mm/vmalloc.c                                  | 15 ++++----
 mm/vmscan.c                                   | 15 ++++----
 21 files changed, 147 insertions(+), 97 deletions(-)


base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.47.0


