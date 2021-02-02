Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198C30B784
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 06:58:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVDdn4QxTzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 16:58:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVDcF0cp0zDq99
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 16:57:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DVDbz4HQMz9v0wk;
 Tue,  2 Feb 2021 06:57:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ISR5CcXtFGoh; Tue,  2 Feb 2021 06:57:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DVDbz2kR7z9v0wj;
 Tue,  2 Feb 2021 06:57:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A02E8B7AC;
 Tue,  2 Feb 2021 06:57:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UbV4aElDzUOH; Tue,  2 Feb 2021 06:57:20 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A32F58B75B;
 Tue,  2 Feb 2021 06:57:19 +0100 (CET)
Subject: Re: [PATCH v7 00/42] powerpc: interrupt wrappers
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c2f36abd-c9e9-25af-d0c0-48d02c49f5b7@csgroup.eu>
Date: Tue, 2 Feb 2021 06:57:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/01/2021 à 14:08, Nicholas Piggin a écrit :
> This adds interrupt handler wrapper functions, similar to the
> generic / x86 code, and moves several common operations into them
> from either asm or open coded in the individual handlers.
> 
> This series is based on powerpc fixes-test tree, there's another
> unrelated pending fix in patch 1 of the series which clashes a
> bit.

This series trivialy conflicts with 
https://github.com/linuxppc/linux/commit/11f9c1d2fb497f69f83d4fab6fb7fc8a6884eded on powerpc next tree.

> 
> This includes more changes and fixes suggested by Christophe,
> a few minor bug fixes and compile fix noticed by kbuild, and
> some NMI changes Athira asked about -- PMI interrupts don't
> block tracing when they are soft-NMI.
> 
> Since v1:
> - Fixed a couple of compile issues
> - Fixed perf weirdness (sometimes NMI, sometimes not)
> - Also move irq_enter/exit into wrappers
> 
> Since v2:
> - Rebased upstream
> - Took code in patch 3 from Christophe
> - Fixed some compile errors from 0day
> 
> Since v3:
> - Rebased
> - Split Christophe's 32s DABR patch into its own patch
> - Fixed missing asm from 32s on patch 3 noticed by Christophe.
> - Moved changes around, split out one more patch (patch 9) to make
>    changes more logical and atomic.
> - Add comments explaining _RAW handlers (SLB, HPTE) interrupts better
> 
> Since v4:
> - Rebased (on top of scv fallback flush fix)
> - Rearranged a few changes into different patches from Christophe,
>    e.g., the ___do_page_fault change from patch 2 to 10. I didn't
>    do everything (e.g., splitting to update __hash_page to drop the
>    msr argument before the bulk of patch 2 seemed like churn without
>    much improvement), and also other things like removing the new
>    ___do_page_fault variant if we can change hash fault context tracking
>    I didn't get time to completely investigate and implement. I think
>    this shouldn't be a showstopper though we can make more improvements
>    as we go.
> 
> Since v5:
> - Lots of good review suggestions from Christophe, see v5 email threads.
> - Major change being do_break is left in asm and selected early as an
>    alternate interrupt handler now, which is a smaller step and matches
>    other subarchs better.
> - Rearranged patches, split, moved things, bug fixes, etc.
> - Converted a few more missed exception handlers for debug and ras
> 
> Since v6:
> - Move related interrupt handler de-argify patches together [Christophe]
> - Split do_bad_page_fault patch [Christophe]
> - Change do_page_fault cleanup patch [Christophe]
> - entry_32.S can't avoid saving r4/r5 until later in the series [Christophe]
> - Soft-NMI decrementer and perf don't block ftrace [Athira]
> - Rebased on some fixes
> - Fixed mismerge / duplicate line in patch 40
> - Fix kbuild hash missing declaration bug
> 
> Christophe Leroy (1):
>    powerpc/32s: move DABR match out of handle_page_fault
> 
> Nicholas Piggin (41):
>    powerpc/64s: interrupt exit improve bounding of interrupt recursion
>    KVM: PPC: Book3S HV: Context tracking exit guest context before
>      enabling irqs
>    powerpc/64s: move DABR match out of handle_page_fault
>    powerpc/64s: move the hash fault handling logic to C
>    powerpc: remove arguments from fault handler functions
>    powerpc/fsl_booke/32: CacheLockingException remove args
>    powerpc: do_break get registers from regs
>    powerpc: DebugException remove args
>    powerpc/32: transfer can avoid saving r4/r5 over trace call
>    powerpc: bad_page_fault get registers from regs
>    powerpc/64s: add do_bad_page_fault_segv handler
>    powerpc: rearrange do_page_fault error case to be inside
>      exception_enter
>    powerpc/64s: move bad_page_fault handling to C
>    powerpc/64s: split do_hash_fault
>    powerpc/mm: Remove stale do_page_fault comment referring to SLB faults
>    powerpc/64s: slb comment update
>    powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
>    powerpc/perf: move perf irq/nmi handling details into traps.c
>    powerpc/time: move timer_broadcast_interrupt prototype to asm/time.h
>    powerpc: add and use unknown_async_exception
>    powerpc/cell: tidy up pervasive declarations
>    powerpc: introduce die_mce
>    powerpc/mce: ensure machine check handler always tests RI
>    powerpc: improve handling of unrecoverable system reset
>    powerpc: interrupt handler wrapper functions
>    powerpc: add interrupt wrapper entry / exit stub functions
>    powerpc: convert interrupt handlers to use wrappers
>    powerpc: add interrupt_cond_local_irq_enable helper
>    powerpc/64: context tracking remove _TIF_NOHZ
>    powerpc/64s/hash: improve context tracking of hash faults
>    powerpc/64: context tracking move to interrupt wrappers
>    powerpc/64: add context tracking to asynchronous interrupts
>    powerpc: handle irq_enter/irq_exit in interrupt handler wrappers
>    powerpc/64s: move context tracking exit to interrupt exit path
>    powerpc/64s: reconcile interrupts in C
>    powerpc/64: move account_stolen_time into its own function
>    powerpc/64: entry cpu time accounting in C
>    powerpc: move NMI entry/exit code into wrapper
>    powerpc/64s: move NMI soft-mask handling to C
>    powerpc/64s: runlatch interrupt handling in C
>    powerpc/64s: power4 nap fixup in C
> 
>   arch/powerpc/Kconfig                       |   1 -
>   arch/powerpc/include/asm/asm-prototypes.h  |  29 --
>   arch/powerpc/include/asm/bug.h             |   9 +-
>   arch/powerpc/include/asm/cputime.h         |  14 +
>   arch/powerpc/include/asm/debug.h           |   4 -
>   arch/powerpc/include/asm/hw_irq.h          |   9 -
>   arch/powerpc/include/asm/interrupt.h       | 437 +++++++++++++++++++++
>   arch/powerpc/include/asm/ppc_asm.h         |  24 --
>   arch/powerpc/include/asm/processor.h       |   1 +
>   arch/powerpc/include/asm/thread_info.h     |  10 +-
>   arch/powerpc/include/asm/time.h            |   2 +
>   arch/powerpc/kernel/dbell.c                |   9 +-
>   arch/powerpc/kernel/entry_32.S             |  25 +-
>   arch/powerpc/kernel/exceptions-64e.S       |   8 +-
>   arch/powerpc/kernel/exceptions-64s.S       | 310 ++-------------
>   arch/powerpc/kernel/head_40x.S             |  11 +-
>   arch/powerpc/kernel/head_8xx.S             |  11 +-
>   arch/powerpc/kernel/head_book3s_32.S       |  14 +-
>   arch/powerpc/kernel/head_booke.h           |   6 +-
>   arch/powerpc/kernel/head_fsl_booke.S       |   6 +-
>   arch/powerpc/kernel/idle_book3s.S          |   4 +
>   arch/powerpc/kernel/irq.c                  |   7 +-
>   arch/powerpc/kernel/mce.c                  |  16 +-
>   arch/powerpc/kernel/process.c              |   8 +-
>   arch/powerpc/kernel/ptrace/ptrace.c        |   4 -
>   arch/powerpc/kernel/signal.c               |   4 -
>   arch/powerpc/kernel/syscall_64.c           |  90 +++--
>   arch/powerpc/kernel/tau_6xx.c              |   5 +-
>   arch/powerpc/kernel/time.c                 |   7 +-
>   arch/powerpc/kernel/traps.c                | 265 ++++++-------
>   arch/powerpc/kernel/watchdog.c             |  15 +-
>   arch/powerpc/kvm/book3s_hv.c               |   7 +-
>   arch/powerpc/kvm/book3s_hv_builtin.c       |   1 +
>   arch/powerpc/kvm/booke.c                   |   1 +
>   arch/powerpc/mm/book3s64/hash_utils.c      |  97 +++--
>   arch/powerpc/mm/book3s64/slb.c             |  40 +-
>   arch/powerpc/mm/fault.c                    |  76 ++--
>   arch/powerpc/perf/core-book3s.c            |  35 +-
>   arch/powerpc/perf/core-fsl-emb.c           |  25 --
>   arch/powerpc/platforms/8xx/machine_check.c |   2 +-
>   arch/powerpc/platforms/cell/pervasive.c    |   1 +
>   arch/powerpc/platforms/cell/pervasive.h    |   3 -
>   arch/powerpc/platforms/cell/ras.c          |   6 +-
>   arch/powerpc/platforms/cell/ras.h          |   9 +-
>   arch/powerpc/platforms/powernv/idle.c      |   1 +
>   arch/powerpc/platforms/powernv/opal.c      |   2 +-
>   arch/powerpc/platforms/pseries/ras.c       |   2 +-
>   47 files changed, 914 insertions(+), 759 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/interrupt.h
> 
