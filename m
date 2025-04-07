Return-Path: <linuxppc-dev+bounces-7473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A6A7D38E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 07:32:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHrx4hN7z2ynf;
	Mon,  7 Apr 2025 15:32:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744003921;
	cv=none; b=l6Cks2blR+lVSKMYKVbihnxuH8D8iAIU0H7q7TtSX1/v+EaukkJG5PP/Chm9qs89N3VHgFV3T1DO0Jx80zAVogOzUminN/hHYBkII9XW6toZlOi6Df0yGb+bvn4MLt4dmemS/pm6j39DQ3Fk+1wqs8aNEl8xLE+wrn3xxoOSab0XwgFNdUeScnMbQg3nwTpdVvaI/VKYzfG5zZHS99IAHe0RVqa/wV6vYyaPOrfoHPLSvHJJgf3+NIpWK1QA4zVyn8C0Fe/P9J1Yc0YVI0QGRzyC6Njhuwn51VoIgMUImHjXWURgz/1jqBms0BIT4vw7OcaSq+ox07kqN2EfamiZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744003921; c=relaxed/relaxed;
	bh=uKEsnQRm4iZkdbgqRHGKxOdH3c1QC+bpFfLwfztEk/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HcBy2Od+tuGnmx582ptVas44QtUp4EqLZNGqHxyRAmn9AE8fxGdziEfcfjlPIkdo1wVUYR8ZNUT2GWLp4vlOTl8IF0aDeXyM7SGYIEpl4R/FvBWLkl4LPc2Vt54RKysOGXvxMFpX7/exXAQxZnGOFsLIXhnmEglpQkUocEu++3GNFznT37+uWG5brgU8xNgdZI9oKGYgTpcsvA4nYHvWyvIomPwruPUCpTKc0lRoYWO93Cv5ZPx6TmV6eNBpBvrX8uWr136gkpG5qkfPnxWoAXLa+WRZSB3CH+SGW51Di//NDU3wzvxy0VFM629DHf3DacW2c4bXSbT4bLlWZQg+ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHrv57fvz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 15:31:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B171F106F;
	Sun,  6 Apr 2025 22:31:26 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 527C93F6A8;
	Sun,  6 Apr 2025 22:31:18 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: mark.rutland@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2 0/3] mm/ptdump: Drop assumption that pxd_val() is u64
Date: Mon,  7 Apr 2025 11:01:10 +0530
Message-Id: <20250407053113.746295-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Last argument passed down in note_page() is u64 assuming pxd_val() returned
value (all page table levels) is 64 bit - which might not be the case going
ahead when D128 page tables is enabled on arm64 platform. Besides pxd_val()
is very platform specific and its type should not be assumed in generic MM.
A similar problem exists for effective_prot(), although it is restricted to
x86 platform.

This series splits note_page() and effective_prot() into individual page
table level specific callbacks which accepts corresponding pxd_t page table
entry as an argument instead and later on all subscribing platforms could
derive pxd_val() from the table entries as required and proceed as before.

Define ptdesc_t type which describes the basic page table descriptor layout
on arm64 platform. Subsequently all level specific pxxval_t descriptors are
derived from ptdesc_t thus establishing a common original format, which can
also be appropriate for page table entries, masks and protection values etc
which are used at all page table levels.

This series has been tested on arm64 platform but it does build on other
relevant platforms (v6.15-rc1).

Changes in V2:

- Added a patch to split effective_prot() callback per Alexander
- Added a patch to define ptdesc_t data type on arm64 platform per Ryan

Changes in V1:

https://lore.kernel.org/all/20250317061818.16244-1-anshuman.khandual@arm.com/

- Added note_page_flush() callback and implemented the same on all
  subscribing platforms
- Moved note_page() argument change from u64 to pteval_t on arm64 platform
  from second patch to the first patch instead

Changes in RFC:

https://lore.kernel.org/all/20250310095902.390664-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (3):
  mm/ptdump: Split note_page() into level specific callbacks
  mm/ptdump: Split effective_prot() into level specific callbacks
  arm64/mm: Define ptdesc_t

 arch/arm64/include/asm/pgtable-types.h | 20 +++++---
 arch/arm64/include/asm/ptdump.h        | 24 ++++++---
 arch/arm64/kernel/efi.c                |  4 +-
 arch/arm64/kernel/pi/map_kernel.c      |  2 +-
 arch/arm64/kernel/pi/map_range.c       |  4 +-
 arch/arm64/kernel/pi/pi.h              |  2 +-
 arch/arm64/mm/mmap.c                   |  2 +-
 arch/arm64/mm/ptdump.c                 | 50 ++++++++++++++++--
 arch/powerpc/mm/ptdump/ptdump.c        | 46 ++++++++++++++++-
 arch/riscv/mm/ptdump.c                 | 46 ++++++++++++++++-
 arch/s390/mm/dump_pagetables.c         | 46 ++++++++++++++++-
 arch/x86/mm/dump_pagetables.c          | 71 +++++++++++++++++++++++++-
 include/linux/ptdump.h                 | 15 ++++--
 mm/ptdump.c                            | 62 ++++++++++++++--------
 14 files changed, 339 insertions(+), 55 deletions(-)

-- 
2.25.1


