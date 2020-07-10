Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7521ACCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 03:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2x7M1QmszDrG3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 11:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fMl48jJg; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x4R5lS6zDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:09 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id i14so1815747pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QaZs4PvDZSCQHhg/idOxs9IRE6Ng3ZKb9zz1kieaNAk=;
 b=fMl48jJgG+BPVTWiIow0uenwROVafLRv/Pw6QEkzr+wXpEFWYCCtxcrQ49EcCzDH0d
 At9EdV+FbGfxN1VOcr79ARfZ/roxDFUMJkCpVxmEMokKKDA2KvlLcLlW/ffWvHymX3F2
 S8ZbdTobn5MmrfRiDgkpyfP+HhTC5RlzmE3D4GRIJ+voEiQRevtPCPMHgVrisdkD8eP2
 1jxxnQ21nD4j3VRBOitlqof8nHGFQaev2g82+kKkgb6CdXLxQQsI66/hvBCk9EbpX1og
 z2sy9mDLu0jTdygNIuOzks0ygls5Fp5EVO/7Mc5nrCQdLg9R4c0EYXLztb2rfja9cZPG
 Nkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QaZs4PvDZSCQHhg/idOxs9IRE6Ng3ZKb9zz1kieaNAk=;
 b=hPHZzttoW24oDoZzPlwTr7bB4boih/pLhriVIiRMc3V8/q1uh0TofGZZgIm2khm12k
 j16qA3lkNI5lZKN4fe1lcINyETbwH5FQrohhUc3sb0J5O6OcvXMPVOAsCS5eSspW/B1a
 y105EE9t0tQRD6OGYKnnlKIHPX0/5ClAixYkbgGL1OoTLX0Db07iGed7p9UPyz0Dk5K5
 UmET53uGSXCVC3HUekaiz5UPAdUKSbPz85Osgu+rtwx10/aZ7xjchPy4b7cCATilUa25
 99HuVEChEDozRx1BecK/QVXtCkUSTSVWmEf2lRW3B7OKpd1UDumlwgXzGjW/3o70rXle
 jrvg==
X-Gm-Message-State: AOAM531vKhXbH6PiT+uGPntd/5ThsaM7iw9rWE5pndObBYc4MlKzXCUd
 rFCf2GhcAKeYMHWYfZEKuHs=
X-Google-Smtp-Source: ABdhPJy2ypc+nOy85os0fHi/ZXUU5Gjee6en+B7W1uV4HyKRPCGEGLSUXEPhaRxLWRbIu5BDykA4OA==
X-Received: by 2002:a62:7b0d:: with SMTP id w13mr52660663pfc.160.1594346226667; 
 Thu, 09 Jul 2020 18:57:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 0/7] mmu context cleanup, lazy tlb cleanup,
Date: Fri, 10 Jul 2020 11:56:39 +1000
Message-Id: <20200710015646.2020871-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This blew up a bit bigger than I thought, so I'd like to get some
comments as to whether people agree with the direction it's going.

The patches aren't cleanly split out by arch, but as it is now it's
probably easier to get a quick overview of the changes at a glance
anyway.

So there's a few different things here.

1. Clean up and use asm-generic for no-op mmu context functions (so
   not just for nommu architectures). This should be functionally a
   no-op for everybody. This allows exit_lazy_tlb to easily be added.

2. Add exit_lazy_tlb and use it for x86, so this is x86 and membarrier
   specific changes. I _may_ have spotted a small membarrier / core sync
   bug here when adding exit_lazy_tlb.

3. Tidy up lazy tlb a little bit, have its own refcount function and
   allow it to be selected out. We can audit the nommu archs and
   deselect it for those.

4. Add a non-refcounting lazy mmu mode, to help scalability when the
   same mm is used for a lot of lazy mmu switching.

Comments, questions on anything would be much appreciated.

Thanks,
Nick

Nicholas Piggin (7):
  asm-generic: add generic MMU versions of mmu context functions
  arch: use asm-generic mmu context for no-op implementations
  mm: introduce exit_lazy_tlb
  x86: use exit_lazy_tlb rather than
    membarrier_mm_sync_core_before_usermode
  lazy tlb: introduce lazy mm refcount helper functions
  lazy tlb: allow lazy tlb mm switching to be configurable
  lazy tlb: shoot lazies, a non-refcounting lazy tlb option

 .../membarrier-sync-core/arch-support.txt     |  6 +-
 arch/Kconfig                                  | 23 +++++
 arch/alpha/include/asm/mmu_context.h          | 12 +--
 arch/arc/include/asm/mmu_context.h            | 16 ++--
 arch/arm/include/asm/mmu_context.h            | 26 +-----
 arch/arm64/include/asm/mmu_context.h          |  7 +-
 arch/csky/include/asm/mmu_context.h           |  8 +-
 arch/hexagon/include/asm/mmu_context.h        | 33 ++------
 arch/ia64/include/asm/mmu_context.h           | 17 +---
 arch/m68k/include/asm/mmu_context.h           | 47 ++---------
 arch/microblaze/include/asm/mmu_context.h     |  2 +-
 arch/microblaze/include/asm/mmu_context_mm.h  |  8 +-
 arch/microblaze/include/asm/processor.h       |  3 -
 arch/mips/include/asm/mmu_context.h           | 11 +--
 arch/nds32/include/asm/mmu_context.h          | 10 +--
 arch/nios2/include/asm/mmu_context.h          | 21 +----
 arch/nios2/mm/mmu_context.c                   |  1 +
 arch/openrisc/include/asm/mmu_context.h       |  8 +-
 arch/openrisc/mm/tlb.c                        |  2 +
 arch/parisc/include/asm/mmu_context.h         | 12 +--
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/mmu_context.h        | 22 ++---
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          |  4 +-
 arch/riscv/include/asm/mmu_context.h          | 22 +----
 arch/s390/include/asm/mmu_context.h           |  9 +-
 arch/sh/include/asm/mmu_context.h             |  7 +-
 arch/sh/include/asm/mmu_context_32.h          |  9 --
 arch/sparc/include/asm/mmu_context_32.h       | 10 +--
 arch/sparc/include/asm/mmu_context_64.h       | 10 +--
 arch/um/include/asm/mmu_context.h             | 12 ++-
 arch/unicore32/include/asm/mmu_context.h      | 24 +-----
 arch/x86/include/asm/mmu_context.h            | 41 +++++++++
 arch/x86/include/asm/sync_core.h              | 28 -------
 arch/xtensa/include/asm/mmu_context.h         | 11 +--
 arch/xtensa/include/asm/nommu_context.h       | 26 +-----
 fs/exec.c                                     |  5 +-
 include/asm-generic/mmu_context.h             | 77 +++++++++++++----
 include/asm-generic/nommu_context.h           | 19 +++++
 include/linux/sched/mm.h                      | 35 ++++----
 include/linux/sync_core.h                     | 21 -----
 kernel/cpu.c                                  |  6 +-
 kernel/exit.c                                 |  2 +-
 kernel/fork.c                                 | 39 +++++++++
 kernel/kthread.c                              | 12 ++-
 kernel/sched/core.c                           | 84 ++++++++++++-------
 kernel/sched/sched.h                          |  4 +-
 47 files changed, 388 insertions(+), 427 deletions(-)
 delete mode 100644 arch/x86/include/asm/sync_core.h
 create mode 100644 include/asm-generic/nommu_context.h
 delete mode 100644 include/linux/sync_core.h

-- 
2.23.0

