Return-Path: <linuxppc-dev+bounces-11864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AAB485B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 09:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzQp1BySz2xQ1;
	Mon,  8 Sep 2025 17:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757317266;
	cv=none; b=fTw8HzuZvtNn7HD4ybucft5ohnDfRBDIuEaPtwJWfvrVGxaOxtsXpfhlxtL+d4zrUtIm3JwebKXVqBxKC1FFvPywpsweRp78Uy71dvMT3UqUaEDYpOeE4u45uZAKBy13F350gXQMhVjrK7k1iHI+sQEnjWG9qmbNyVtqLk2nEvB+HuwEGkeOT1MNiEormbuGzfOc04WwSNPq0hL7w0GEjdvcwECzjRUjv6Ua7fuVRWX5F2E9jg9SgUNQBHsiHFAk5L5fvTiP1J+JRoHfKcsqfO1j+0ErKeSrkMHNEWeLva4XXr5UlzgmF6GW6O9w3OtdV3OsWjgGeyfFID4ZttPeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757317266; c=relaxed/relaxed;
	bh=MFkkO1F/ehQm5F1fclNMPZMJvYctYpk2C79PJc5Is3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzvDVtR04qdqk0LTs89kQ4E3DQ2u34U/AVtnRDTnJOqW2598Or2sgynok5rZc3JgayD9dewWV/BTybP/4UA2+ZR+rvsYigTjSzRCEe3InJMkcM0aYdQfwgqpNh7HeNZRlXGP2OHSgnrdikHOTX87xuvtmIstcrhZoZYlWiSYYfxSODY4k0Kixh1ouchQ9VxnXlZolH9aYNnBmeWmBZVh0bXJRG3r+vI8JKNgdo967jxUZOoC6pNi5KWdZn1aIQRN9Lv0CMXai0ezd8x4l0beqXGeH5muOlxcBY5ahjOoV8iPqsJABGqHHriUyLU/vdH9ceQS30LOzEcNsXkFFpgTFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzQn2R5Lz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:41:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6E91692;
	Mon,  8 Sep 2025 00:40:25 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23BFF3F63F;
	Mon,  8 Sep 2025 00:40:29 -0700 (PDT)
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/7] Nesting support for lazy MMU mode
Date: Mon,  8 Sep 2025 08:39:24 +0100
Message-ID: <20250908073931.4159362-1-kevin.brodsky@arm.com>
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
Changelog

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
 .../include/asm/book3s/64/tlbflush-hash.h     | 22 ++++++++----
 arch/powerpc/mm/book3s64/hash_tlb.c           | 10 +++---
 arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +--
 arch/sparc/include/asm/tlbflush_64.h          |  6 ++--
 arch/sparc/mm/tlb.c                           | 17 +++++++---
 arch/x86/include/asm/paravirt.h               |  8 ++---
 arch/x86/include/asm/paravirt_types.h         |  6 ++--
 arch/x86/include/asm/pgtable.h                |  3 +-
 arch/x86/xen/enlighten_pv.c                   |  2 +-
 arch/x86/xen/mmu_pv.c                         | 13 ++++---
 fs/proc/task_mmu.c                            |  5 +--
 include/linux/mm_types.h                      |  3 ++
 include/linux/pgtable.h                       | 21 +++++++++---
 mm/kasan/shadow.c                             |  4 +--
 mm/madvise.c                                  | 20 ++++++-----
 mm/memory.c                                   | 20 ++++++-----
 mm/migrate_device.c                           |  5 +--
 mm/mprotect.c                                 |  5 +--
 mm/mremap.c                                   |  5 +--
 mm/userfaultfd.c                              |  5 +--
 mm/vmalloc.c                                  | 15 ++++----
 mm/vmscan.c                                   | 15 ++++----
 23 files changed, 148 insertions(+), 101 deletions(-)


base-commit: b024763926d2726978dff6588b81877d000159c1
-- 
2.47.0


