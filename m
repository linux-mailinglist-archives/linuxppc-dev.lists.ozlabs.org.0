Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7830953D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:13:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZQ2133NzDrS9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:12:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Igsf6IbW; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZKm0LqnzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:14 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id b17so7089040plz.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWBKMsEyXJnICQbTuxfoLjzQo0SN0zJG+FCZ83f5cf8=;
 b=Igsf6IbWNf7TAYerTegJkdEQ412KxDVu+lzaTM6wP0dLkK5/6/S+U2GGMmJ1/Hs6E3
 1IO2EYtbTJFQ4HnGbh66IqMLVewxdpjGdJWz4LpgNu7bvwXpuQzEGND8amaEHYUMaeEl
 vWPmYC8yDC4xrR0yvw7CikjXrAZv3xh7QPVLQ6cJVxIkyMSgbYQRUnYTxWA4ZOA8Tr/R
 fNdC+hs53lzlE6hpvhRkBLUc7kGsRI5avfd2xSdcyLLe7BkektswL3D7+y3BBp6MvJzV
 7lqlcDCCb4zhEfbpPFqxa7ttjgYJJvjsjVt8nfCH+tucjFtMglUwFy/PoRPLgcR5Was5
 Yr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWBKMsEyXJnICQbTuxfoLjzQo0SN0zJG+FCZ83f5cf8=;
 b=SROgPPXAfmkW4HOunxtG+or+srjFL+AqZOq523TPx0ekwF01su5qN+62sOSr+QEqiL
 wBHE56EHZ6h6rBAdV6Cbnx04282Rtkz650isdKXj1BRJFVYhYF+UeHFp6lpvjTz9OXol
 xJ8zPawrRJr8lwq8+dvnFO/CBfk61o11786QCfmpUjo3TxOiYm57NcJQQO3V47maH92w
 jpvkvf9YXf0Xu3rOy6hSHOMpsnzPvuRbki+7XL18BrShk8GY/++KcgH06SWpClO6Gbdu
 fcmrP6Yt3SQBHE1V/VhJkFq0AxOJZ4yQYEVOPtN5B7zBKw8VvPjkrXl3I1qdOaf297eV
 PLdw==
X-Gm-Message-State: AOAM530ea2iqLiyC5Vg9rNdXVsOw/5gNSsda7orA5ATmI/nHc2nUfugN
 gApaN7DAkis12vAqaIu0caYdA26CnmE=
X-Google-Smtp-Source: ABdhPJx3Wk1KcOmLNAP3jjmpPA41qiVwvjY3mMf7CJ8cRtfO60/l/HIfPPfQ1D95hF9TUuwafrWUWQ==
X-Received: by 2002:a17:90a:6589:: with SMTP id
 k9mr8829255pjj.100.1612012150087; 
 Sat, 30 Jan 2021 05:09:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 00/42] powerpc: interrupt wrappers
Date: Sat, 30 Jan 2021 23:08:10 +1000
Message-Id: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds interrupt handler wrapper functions, similar to the
generic / x86 code, and moves several common operations into them
from either asm or open coded in the individual handlers.

This series is based on powerpc fixes-test tree, there's another
unrelated pending fix in patch 1 of the series which clashes a
bit.

This includes more changes and fixes suggested by Christophe,
a few minor bug fixes and compile fix noticed by kbuild, and
some NMI changes Athira asked about -- PMI interrupts don't
block tracing when they are soft-NMI.

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

Since v4:
- Rebased (on top of scv fallback flush fix)
- Rearranged a few changes into different patches from Christophe,
  e.g., the ___do_page_fault change from patch 2 to 10. I didn't
  do everything (e.g., splitting to update __hash_page to drop the
  msr argument before the bulk of patch 2 seemed like churn without
  much improvement), and also other things like removing the new
  ___do_page_fault variant if we can change hash fault context tracking
  I didn't get time to completely investigate and implement. I think
  this shouldn't be a showstopper though we can make more improvements
  as we go.

Since v5:
- Lots of good review suggestions from Christophe, see v5 email threads.
- Major change being do_break is left in asm and selected early as an
  alternate interrupt handler now, which is a smaller step and matches
  other subarchs better.
- Rearranged patches, split, moved things, bug fixes, etc.
- Converted a few more missed exception handlers for debug and ras

Since v6:
- Move related interrupt handler de-argify patches together [Christophe]
- Split do_bad_page_fault patch [Christophe]
- Change do_page_fault cleanup patch [Christophe]
- entry_32.S can't avoid saving r4/r5 until later in the series [Christophe]
- Soft-NMI decrementer and perf don't block ftrace [Athira]
- Rebased on some fixes
- Fixed mismerge / duplicate line in patch 40
- Fix kbuild hash missing declaration bug

Christophe Leroy (1):
  powerpc/32s: move DABR match out of handle_page_fault

Nicholas Piggin (41):
  powerpc/64s: interrupt exit improve bounding of interrupt recursion
  KVM: PPC: Book3S HV: Context tracking exit guest context before
    enabling irqs
  powerpc/64s: move DABR match out of handle_page_fault
  powerpc/64s: move the hash fault handling logic to C
  powerpc: remove arguments from fault handler functions
  powerpc/fsl_booke/32: CacheLockingException remove args
  powerpc: do_break get registers from regs
  powerpc: DebugException remove args
  powerpc/32: transfer can avoid saving r4/r5 over trace call
  powerpc: bad_page_fault get registers from regs
  powerpc/64s: add do_bad_page_fault_segv handler
  powerpc: rearrange do_page_fault error case to be inside
    exception_enter
  powerpc/64s: move bad_page_fault handling to C
  powerpc/64s: split do_hash_fault
  powerpc/mm: Remove stale do_page_fault comment referring to SLB faults
  powerpc/64s: slb comment update
  powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
  powerpc/perf: move perf irq/nmi handling details into traps.c
  powerpc/time: move timer_broadcast_interrupt prototype to asm/time.h
  powerpc: add and use unknown_async_exception
  powerpc/cell: tidy up pervasive declarations
  powerpc: introduce die_mce
  powerpc/mce: ensure machine check handler always tests RI
  powerpc: improve handling of unrecoverable system reset
  powerpc: interrupt handler wrapper functions
  powerpc: add interrupt wrapper entry / exit stub functions
  powerpc: convert interrupt handlers to use wrappers
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
 arch/powerpc/include/asm/bug.h             |   9 +-
 arch/powerpc/include/asm/cputime.h         |  14 +
 arch/powerpc/include/asm/debug.h           |   4 -
 arch/powerpc/include/asm/hw_irq.h          |   9 -
 arch/powerpc/include/asm/interrupt.h       | 437 +++++++++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h         |  24 --
 arch/powerpc/include/asm/processor.h       |   1 +
 arch/powerpc/include/asm/thread_info.h     |  10 +-
 arch/powerpc/include/asm/time.h            |   2 +
 arch/powerpc/kernel/dbell.c                |   9 +-
 arch/powerpc/kernel/entry_32.S             |  25 +-
 arch/powerpc/kernel/exceptions-64e.S       |   8 +-
 arch/powerpc/kernel/exceptions-64s.S       | 310 ++-------------
 arch/powerpc/kernel/head_40x.S             |  11 +-
 arch/powerpc/kernel/head_8xx.S             |  11 +-
 arch/powerpc/kernel/head_book3s_32.S       |  14 +-
 arch/powerpc/kernel/head_booke.h           |   6 +-
 arch/powerpc/kernel/head_fsl_booke.S       |   6 +-
 arch/powerpc/kernel/idle_book3s.S          |   4 +
 arch/powerpc/kernel/irq.c                  |   7 +-
 arch/powerpc/kernel/mce.c                  |  16 +-
 arch/powerpc/kernel/process.c              |   8 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |   4 -
 arch/powerpc/kernel/signal.c               |   4 -
 arch/powerpc/kernel/syscall_64.c           |  90 +++--
 arch/powerpc/kernel/tau_6xx.c              |   5 +-
 arch/powerpc/kernel/time.c                 |   7 +-
 arch/powerpc/kernel/traps.c                | 265 ++++++-------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   7 +-
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/kvm/booke.c                   |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  97 +++--
 arch/powerpc/mm/book3s64/slb.c             |  40 +-
 arch/powerpc/mm/fault.c                    |  76 ++--
 arch/powerpc/perf/core-book3s.c            |  35 +-
 arch/powerpc/perf/core-fsl-emb.c           |  25 --
 arch/powerpc/platforms/8xx/machine_check.c |   2 +-
 arch/powerpc/platforms/cell/pervasive.c    |   1 +
 arch/powerpc/platforms/cell/pervasive.h    |   3 -
 arch/powerpc/platforms/cell/ras.c          |   6 +-
 arch/powerpc/platforms/cell/ras.h          |   9 +-
 arch/powerpc/platforms/powernv/idle.c      |   1 +
 arch/powerpc/platforms/powernv/opal.c      |   2 +-
 arch/powerpc/platforms/pseries/ras.c       |   2 +-
 47 files changed, 914 insertions(+), 759 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

