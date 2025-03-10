Return-Path: <linuxppc-dev+bounces-6844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA7A5908A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 10:59:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC6p5gZqz305P;
	Mon, 10 Mar 2025 20:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741600786;
	cv=none; b=h4Uprwutlp9Wq2uqDtnTivaDnpFDMZbBeNDeYy1yFI+dFVJbSg/3I14S5c8yvEY328D211B/QGC7kTuw4BYybvtqPkZZzGexzDbUS4kFcOsg01qAFfhZfVhNZG6Ga6xNqMsjxrNJpikQvVWiDIXJJsUXJNd10ABMzjhGVJys+/ne4oGET3IcqUgCtQ4THdeyLcPdMoSoYVS/wipDaOnqucUD3pKRHMD3GEyXMMXg4x2fn7TXAGYXOEfhEmgkEs6g1U+77wUpp2YdFMapEA4Ek9zplYqzsaUpZm/5K17w+/lfnZE5KT1gPbX1fbI9RLscmm4Cgx/jHv/ZHzO5R2k9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741600786; c=relaxed/relaxed;
	bh=usxpGZ2JIapOfM0P0HHDXpsbI77WvhT/gkt231dPbVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nAaUD65948q7bfNXRieoHfqptc61McX6f+jSXCS414M80yznLtq2M6nZYDEGV06DxEHujcxB0Fowe8bJtClw752SLvxq+0P4BT7Ewnnhfp0Qdsv0iMthPUpMe3eZveKUtGh8Fsg/x19ngAIpJ6Igzj2lbfxDuv2uZEVZAKLLJVtd+RAGYmS8FynnDivpRdsk99vj5aiDE7TD0Obkwdl2gJZb7kbKcctfI18LjZdQc9jCVQol2GJ8aYRE38w+Vfk1V3yLXuDW+29lcmQL+8/lrM8I/MUkvQf/L0MptWHqf9xKrtF2X7wEds9z6/WH2wpvmZjgEcVSCGwg3SYfd1aZdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC6n4RpSz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 20:59:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD8515A1;
	Mon, 10 Mar 2025 02:59:23 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 59DE33F673;
	Mon, 10 Mar 2025 02:59:04 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
Subject: [RFC 0/2] mm/ptdump: Drop assumption that pxd_val() is u64
Date: Mon, 10 Mar 2025 15:29:00 +0530
Message-Id: <20250310095902.390664-1-anshuman.khandual@arm.com>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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

This series has been lightly tested on arm64 platform but it does build on
other relevant platforms (v6.14-rc5).

Some questions:

- Is there a better method to address this problem than splitting current
  note_page() into multiple call backs as proposed here ?

- This replaces note_page(st, 0, -1, 0) with note_page_pte(st, 0, pte_zero)
  Is that problematic ? Does level = -1 has got a special meaning ? Should
  level = -1 case be handled differently possibly via a separate callback ?

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
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

 arch/arm64/include/asm/ptdump.h | 22 ++++++++++++-----
 arch/arm64/mm/ptdump.c          | 41 ++++++++++++++++++++++++++++---
 arch/powerpc/mm/ptdump/ptdump.c | 37 ++++++++++++++++++++++++++--
 arch/riscv/mm/ptdump.c          | 37 ++++++++++++++++++++++++++--
 arch/s390/mm/dump_pagetables.c  | 37 ++++++++++++++++++++++++++--
 arch/x86/mm/dump_pagetables.c   | 31 +++++++++++++++++++++++-
 include/linux/ptdump.h          |  7 ++++--
 mm/ptdump.c                     | 43 +++++++++++++++++++++++++--------
 8 files changed, 226 insertions(+), 29 deletions(-)

-- 
2.25.1


