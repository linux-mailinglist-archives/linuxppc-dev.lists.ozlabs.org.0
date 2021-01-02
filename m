Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E572E8745
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:30:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Lnr63TQzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hPOdZ8nF; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lh51QvkzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:21 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id t22so13575758pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZoIrlTYAJOgul9TsNEajLeFA2+6w67TlQMAXuDciaaE=;
 b=hPOdZ8nFwNp8F1iIqR5aWrhrbRa/6d8xMp5wxGD9akEHGVXUf3WqMht+dmaCv4VX8l
 sbUNK4DLj6Bdd64hujDOzvZka3eIKVFDuYApLafConl3EgA0LksgqJk1skLlVhvPG3sJ
 d3HeGqS4LR9M69WsNde53RqDWlJsnmv2Xx1VrYGsm+mVOAXpgQC/HDQZTONJO2v/tDYc
 g9dAfhWru/kHBmH+pWDMH0LdzuuoteWVQM60kyolY2EmASm0SlnjG8hjTHhl69pqX7sG
 pQYlCrN5aD67eoqf/1xq5AbnAoiaT+2QV5K7V7pe29/HuPidhbeuvxfvFAfne+FWr27p
 XKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZoIrlTYAJOgul9TsNEajLeFA2+6w67TlQMAXuDciaaE=;
 b=ZzFK8gwMoIa+2XiZjMRRwtrMJCahvNrTND/q26GQvOSYYhJ+dukAWklv8acG7prsV6
 yHqja/pK6N6oxmOCBTi0OzgwuAtqs8fPdfVJxcnG8TRCadUGiXvchMwMtNeMJAJD6NQy
 GoowqB6Uf/e2szFLwoLkdIs3ofgsNbi87enmh7ev8la6LztQgD/Ra/T//avX5Z3P9QND
 3VHiqkaoZ+hWmh6JAgbWmAyeCzRUsUxwIY4eQbyZfF1c3v92/PGdzQeDZeD8A2Jgf4op
 PYKkPQ5D3Eaxl2ee7QEwRvQOgk5mz+9gp2sloCwDP87tXkENa2t2afkhOBIU81iz+whC
 i1PA==
X-Gm-Message-State: AOAM532lhHzf7S6Da0N3UGgRrUdtTzQIUmXCgs72yvJVeJNyAjBryLPm
 DiQIGrACf2Msi9KFC0Fr/K0MHpR9TdM=
X-Google-Smtp-Source: ABdhPJyC5mmek5bGnRwfb1ssK/YW+JcDXQ0Nw8ELg06TjUvyx+1T5XbXISfP/niiUyJDPyJajdnatA==
X-Received: by 2002:a63:1047:: with SMTP id 7mr56609991pgq.292.1609590316145; 
 Sat, 02 Jan 2021 04:25:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/21] powerpc: interrupt wrappers
Date: Sat,  2 Jan 2021 22:24:47 +1000
Message-Id: <20210102122508.1950592-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds interrupt handler wrapper functions, similar to the
generic / x86 code, and moves several common operations into them
from either asm or open coded in the individual handlers.

Since v1:
- Fixed a couple of compile issues
- Fixed perf weirdness (sometimes NMI, sometimes not)
- Also move irq_enter/exit into wrappers

Since v2:
- Rebased upstream
- Took code in patch 3 from Christophe
- Fixed some compile errors from 0day

Since v3:
- Rebased
- Split Christophe's 32s DABR patch into its own patch
- Fixed missing asm from 32s on patch 3 noticed by Christophe.
- Moved changes around, split out one more patch (patch 9) to make
  changes more logical and atomic.
- Add comments explaining _RAW handlers (SLB, HPTE) interrupts better


Thanks,
Nick

Christophe Leroy (1):
  powerpc/32s: Do DABR match out of handle_page_fault()

Nicholas Piggin (20):
  powerpc/64s: move the last of the page fault handling logic to C
  powerpc: remove arguments from fault handler functions
  powerpc: bad_page_fault, do_break get registers from regs
  powerpc/perf: move perf irq/nmi handling details into traps.c
  powerpc: interrupt handler wrapper functions
  powerpc: add interrupt wrapper entry / exit stub functions
  powerpc: add interrupt_cond_local_irq_enable helper
  powerpc/64: context tracking remove _TIF_NOHZ
  powerpc/64s/hash: improve context tracking of hash faults
  powerpc/64: context tracking move to interrupt wrappers
  powerpc/64: add context tracking to asynchronous interrupts
  powerpc: handle irq_enter/irq_exit in interrupt handler wrappers
  powerpc/64s: move context tracking exit to interrupt exit path
  powerpc/64s: reconcile interrupts in C
  powerpc/64: move account_stolen_time into its own function
  powerpc/64: entry cpu time accounting in C
  powerpc: move NMI entry/exit code into wrapper
  powerpc/64s: move NMI soft-mask handling to C
  powerpc/64s: runlatch interrupt handling in C
  powerpc/64s: power4 nap fixup in C

 arch/powerpc/Kconfig                       |   1 -
 arch/powerpc/include/asm/asm-prototypes.h  |  29 --
 arch/powerpc/include/asm/bug.h             |   7 +-
 arch/powerpc/include/asm/cputime.h         |  15 +
 arch/powerpc/include/asm/debug.h           |   3 +-
 arch/powerpc/include/asm/hw_irq.h          |   9 -
 arch/powerpc/include/asm/interrupt.h       | 418 +++++++++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h         |  24 --
 arch/powerpc/include/asm/processor.h       |   1 +
 arch/powerpc/include/asm/thread_info.h     |  10 +-
 arch/powerpc/include/asm/time.h            |   2 +
 arch/powerpc/kernel/dbell.c                |  15 +-
 arch/powerpc/kernel/entry_32.S             |  24 +-
 arch/powerpc/kernel/exceptions-64e.S       |   6 +-
 arch/powerpc/kernel/exceptions-64s.S       | 307 ++-------------
 arch/powerpc/kernel/head_40x.S             |  10 +-
 arch/powerpc/kernel/head_8xx.S             |  11 +-
 arch/powerpc/kernel/head_book3s_32.S       |  14 +-
 arch/powerpc/kernel/head_booke.h           |   4 +-
 arch/powerpc/kernel/idle_book3s.S          |   4 +
 arch/powerpc/kernel/irq.c                  |   7 +-
 arch/powerpc/kernel/mce.c                  |  16 +-
 arch/powerpc/kernel/process.c              |   7 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |   4 -
 arch/powerpc/kernel/signal.c               |   4 -
 arch/powerpc/kernel/syscall_64.c           |  30 +-
 arch/powerpc/kernel/tau_6xx.c              |   5 +-
 arch/powerpc/kernel/time.c                 |   7 +-
 arch/powerpc/kernel/traps.c                | 231 ++++++------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   1 +
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/kvm/booke.c                   |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  92 +++--
 arch/powerpc/mm/book3s64/slb.c             |  36 +-
 arch/powerpc/mm/fault.c                    |  92 +++--
 arch/powerpc/perf/core-book3s.c            |  35 +-
 arch/powerpc/perf/core-fsl-emb.c           |  25 --
 arch/powerpc/platforms/8xx/machine_check.c |   2 +-
 arch/powerpc/platforms/powernv/idle.c      |   1 +
 40 files changed, 813 insertions(+), 713 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

