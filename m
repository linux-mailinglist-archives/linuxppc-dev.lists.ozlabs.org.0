Return-Path: <linuxppc-dev+bounces-7103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B8A64125
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 07:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGPtx0Kxsz2yGN;
	Mon, 17 Mar 2025 17:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742192344;
	cv=none; b=DG4uCy8sFj9+OpBwUEdKt1HJao+dAukITpxkxfjUt03uN+tyipX2+kdOY5ubETh9Kgh+9KndvuWTwjUPLVPnyYRseROpsU+WdPrquXqEAfpBk3iySjD4asLYmf2jxB1LMJAHtKM8YfxjB8V/BpNOZ5rXVigAXnSK1986BVAZ5T9EOT1+oeFX7pBznGUXw8eV23aRdQslaRVkfcBpAc5sAOkuv6NttgBvFLQtBQ4+PGEtsiTMi4G/3c12c6XqKmn2UhWZhFC0l2PiQ/PLrNliKm2JCGI7XGhN8Z7SArgog0dW2MwO+iQsVzHssemCe3C+A99vkr1wmFz83sPdW+Wyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742192344; c=relaxed/relaxed;
	bh=V/eQJqVgbd3UXy9T88/l4rv0D+h5MVbR2tramUFNA08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CUU7XxrajhiftrKQlZ1wud7ujwf53iD9tWoA03Tv6ev0wc+kMbLmj4W9ouV8wFNAwF4jNNFnOOWCUhcmk4gZy0LrUu23sFfgZTsLO2WRN5ZC0IaXw0ErjXwFnx1kWBhtwgMS1kDn2pdaLTDqIcfGJNaRKTywehJSAk/K+qFgeBH1WSRRmxySQ+6927oTr9Mb8UskUFn2FJayuTlh1yx3/UyTVG/n3x2TTWzZuIEq2xgnn13hJtLloBKyv/D+JButk4GHEVwA4Z0BDtPOwyP+vfCGa0BUfIq904sK5hfHgwvqIpQLY8MN+9Rxpu6OthvdwXVXgihFwUq6Pn+LfKojJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGPtv6CG3z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 17:19:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2595E13D5;
	Sun, 16 Mar 2025 23:18:39 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A6203F673;
	Sun, 16 Mar 2025 23:18:23 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
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
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 0/2] mm/ptdump: Drop assumption that pxd_val() is u64
Date: Mon, 17 Mar 2025 11:48:16 +0530
Message-Id: <20250317061818.16244-1-anshuman.khandual@arm.com>
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

This series splits note_page() into individual page table level specific
callbacks which accepts corresponding pxd_t page table entry as an argument
instead and later all subscribing platforms could derive pxd_val() from the
entries as required and proceed as before.

Page table entry's value, mask and protection are represented with pteval_t
not u64 that has been assumed while dumping the page table entries on arm64
platform. Replace such u64 instances with pteval_t instead as expected.

This series has been tested on arm64 platform but it does build on other
relevant platforms (v6.14-rc7).

Changes in V1:

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
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  mm/ptdump: Split note_page() into level specific callbacks
  arm64/ptdump: Replace u64 with pteval_t

 arch/arm64/include/asm/ptdump.h | 24 ++++++++++++----
 arch/arm64/mm/ptdump.c          | 50 ++++++++++++++++++++++++++++++---
 arch/powerpc/mm/ptdump/ptdump.c | 46 ++++++++++++++++++++++++++++--
 arch/riscv/mm/ptdump.c          | 46 ++++++++++++++++++++++++++++--
 arch/s390/mm/dump_pagetables.c  | 46 ++++++++++++++++++++++++++++--
 arch/x86/mm/dump_pagetables.c   | 39 ++++++++++++++++++++++++-
 include/linux/ptdump.h          |  9 ++++--
 mm/ptdump.c                     | 42 ++++++++++++++++++++-------
 8 files changed, 272 insertions(+), 30 deletions(-)

-- 
2.25.1


