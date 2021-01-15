Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B862F8145
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 17:54:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHS2r6VvBzDsjC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 03:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HrhlcP+3; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRxv3BbbzDsgt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:24 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id g15so6344621pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfjRxN4woMY7XfdobGTFDwQ3AeUfO5nxcq/kr0icYJQ=;
 b=HrhlcP+3T+R20waWerfMNvgzHkNW+eFoaFmt2UPZWh+A/NAS2YYuFvHAWxOFYi7SKv
 qBgDTDAnhxKUt1aFzZiGbbJ26ResWiBnBuyuCqIXsCLwp5VPGkgaQ2urLzEvOXq7EaMN
 KB5euOaWDVfc4OPldY/KNBT+gF2I4n3BOyUDKPugm5AQCkB00z68owfiHqrQUp44VZFA
 lnR+U7ETb/4YQJU9dN2RtQu8uBFu7RHHMbtbi2UCu+QjMeZ6B6Ppej09jFsoiCe85r+H
 ntnZG8P/7238+Oe08RGF1EXAe9zkr2k/xwIRKuvLenavbb3VxzbbXsK17+wFf89QmB/K
 yeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfjRxN4woMY7XfdobGTFDwQ3AeUfO5nxcq/kr0icYJQ=;
 b=XsNf4WQnWB2k2u7rqdVZAUpp47Qu2agM8nhNpogYzoYdABQfNp2BquIu6aWzRD2nzM
 o2PsVEL2NamunTYcLAD4ERXNOYJ7FGCLFk7pehFrAwHAvEI7rfygygtJufGl9b4b/7Hq
 aMgF6QRX2tUJ8DP8Ak84JKalEcRnKhxhHNztnUKGAX6QH5lWU3mfkb0thEg/fpojBcGe
 Y+wo2JDolxQr+Ko7Gg+3HH2AFCV2eebtd/I+9PVtK2iLObXVUKwYmtE6z6Pie+kG3kyP
 Ck9fYFtUiIqlysWAUmiFWDUuxgviFaiqK28VMaS5GyeaLsZpKCte2nrrafyWTqfKympl
 vVsw==
X-Gm-Message-State: AOAM532zWnGwh1wkhVD0xk5Ar7yjmkGUbGeQr6Vvzybb090ZUUtjRQhC
 63CjoAbcbZLa2Yd/x0yu/wJ9HQOdglI=
X-Google-Smtp-Source: ABdhPJzG+6LCHu/Dxadlj8H9S34QSix4ZzjkuWawvIeJW70cEWB+TtMwwpQxW5wp2e+OdJ718GGcpg==
X-Received: by 2002:aa7:9619:0:b029:1ae:33b2:780f with SMTP id
 q25-20020aa796190000b02901ae33b2780fmr13293817pfg.26.1610729420148; 
 Fri, 15 Jan 2021 08:50:20 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 00/39] powerpc: interrupt wrappers
Date: Sat, 16 Jan 2021 02:49:33 +1000
Message-Id: <20210115165012.1260253-1-npiggin@gmail.com>
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

This series is based on upstream plus "powerpc/64s: fix scv entry
fallback flush vs interrupt".

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
  stuff.
- Found a few relatively minor bugs, comment updates, and tidy ups that
  don't really have to be part of this series but might as well be.

Thanks,
Nick

Christophe Leroy (1):
  powerpc/32s: move DABR match out of handle_page_fault

Nicholas Piggin (38):
  KVM: PPC: Book3S HV: Context tracking exit guest context before
    enabling irqs
  powerpc/64s: move DABR match out of handle_page_fault
  powerpc/64s: move the hash fault handling logic to C
  powerpc: remove arguments from fault handler functions
  powerpc: do_break get registers from regs
  powerpc: bad_page_fault get registers from regs
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
  powerpc/fsl_booke/32: CacheLockingException remove args
  powerpc: DebugException remove args
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
 arch/powerpc/include/asm/interrupt.h       | 434 +++++++++++++++++++++
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
 arch/powerpc/kernel/syscall_64.c           |  30 +-
 arch/powerpc/kernel/tau_6xx.c              |   5 +-
 arch/powerpc/kernel/time.c                 |   7 +-
 arch/powerpc/kernel/traps.c                | 263 +++++++------
 arch/powerpc/kernel/watchdog.c             |  15 +-
 arch/powerpc/kvm/book3s_hv.c               |   7 +-
 arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
 arch/powerpc/kvm/booke.c                   |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  96 +++--
 arch/powerpc/mm/book3s64/slb.c             |  40 +-
 arch/powerpc/mm/fault.c                    |  80 ++--
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
 47 files changed, 867 insertions(+), 744 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

-- 
2.23.0

